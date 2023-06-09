package com.baseball.web.ticket;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.baseball.service.domain.Game;
import com.baseball.service.domain.Ticket;
import com.baseball.service.domain.Transaction;
import com.baseball.service.domain.User;
import com.baseball.service.game.GameService;
import com.baseball.service.importAPI.ImportAPIRestService;
import com.baseball.service.ticket.TicketService;
import com.baseball.service.transaction.TransactionService;
import com.baseball.service.user.UserService;

@RestController
@RequestMapping("/ticket/rest/*")
public class TicketRestController {
	
	///Field
	@Autowired
	@Qualifier("ticketServiceImpl")
	private TicketService ticketService;
	
	@Autowired
	@Qualifier("transactionServiceImpl")
	private TransactionService transactionService;
	
	@Autowired
	@Qualifier("userServiceImpl")
	private UserService userService;
	
	@Autowired
	@Qualifier("gameServiceImpl")
	private GameService gameService;
	
	@Autowired
	@Qualifier("importAPIRestServiceImpl")
	private ImportAPIRestService importAPIRestService;
	
	@RequestMapping( value="sendSMS/{gameCode}", method=RequestMethod.GET )
	public String sendSMS(@PathVariable String gameCode, HttpSession session) throws Exception{
		System.out.println(":: /ticket/rest/sendSMS START");
		System.out.println("넘어온 gameCode?"+gameCode);
		User user = (User)session.getAttribute("user");
		Game game = gameService.getGameInfo(gameCode); // 게임 정보
		String userPhone = user.getUserPhone(); //수신자 번호
		String contents; //메세지 내용
		contents = user.getUserName()+"님 "+
				game.getGameDate()+" "+game.getGameTime()+" "+
				game.getAwayTeam().getTeamNickName()+" vs "+
				game.getHomeTeam().getTeamNickName()+" 경기가 예매되었습니다. \n *결제취소는 경기시작 하루 전 23시까지 가능합니다. \n -야구루트-";
		
		String result = importAPIRestService.sendSMS(contents, userPhone); //번호와 내용을 변수로 보내줄 것
		System.out.println("SMS전송 요청 결과는?"+result);
		return result;
	}
	
	
	@RequestMapping( value="refund/{tranNo}", method=RequestMethod.GET )
	public String refund(@PathVariable int tranNo, HttpSession session) throws Exception{
		System.out.println(":: /ticket/rest/refund START");
		System.out.println("넘어온 tranNo?"+tranNo);
		String resultData;
		User user = (User)session.getAttribute("user");
		String userPhone = user.getUserPhone(); //수신자 번호
		String contents; //메세지 내용
		Transaction transaction = transactionService.getTransaction(tranNo);
		String merchantNo = transaction.getMerchantNo();
		
		String result = importAPIRestService.importRefund(merchantNo, 0); //환불 요청 rest
		if(result.equals("success")) {
			System.out.println("환불 성공");
			ticketService.getTicketPurchaseList(tranNo);
			ticketService.updateRefundStatus(tranNo); // transaction의 refund_status를 0->1 변경 & tranDate 취소시각으로 update
			transaction = transactionService.getTransaction(tranNo); //update된 transaction
			String gameCode = ticketService.getGameCode(tranNo); //tranNo로 gameCode하나 가져오기
			Game game = gameService.getGameInfo(gameCode); // gameCode로 게임 정보 가져오기
			
			contents = user.getUserName()+"님 "+
						game.getGameDate()+" "+game.getGameTime()+" "+
						game.getAwayTeam().getTeamNickName()+" vs "+
						game.getHomeTeam().getTeamNickName()+" 경기의 예매 내역이 취소되었습니다. \n"+
						"[취소 내역] \n 취소 금액:"+transaction.getTranTotalPrice()+"원"+
						"\n결제취소시각:"+transaction.getTranDate()+"\n -야구루트-"; 
			result = importAPIRestService.sendSMS(contents, userPhone); //번호와 내용을 변수로 보내줄 것
			System.out.println("SMS전송 요청 결과는?"+result);
			resultData = "success";
		} else {
			System.out.println("환불 요청 실패...");
			resultData = "fail";
		}
		return resultData;
	}
	
	//좌석 클릭 시 좌석 상태 check
	@RequestMapping( value="checkStatus/{ticketNoList}", method=RequestMethod.GET )
	public List<String> checkSeat(@PathVariable String ticketNoList, HttpSession session) throws Exception{
		System.out.println(":: /ticket/rest/checkStatus START");
		System.out.println("넘어온 ticketNoList?"+ticketNoList);
		List<String> list = new ArrayList<>();
		String regex = "(?<=\\G.{21})"; //문자 21개 기준으로 파싱
		String[] array = ticketNoList.split(regex);
		for(String ticketNo:array) {
			Ticket ticket = ticketService.getTicketInfo(ticketNo);
			if(ticket.getTicketStatus() ==1) {
				String seatCode = ticketNo.substring(18);
				list.add(seatCode); //판매완료된 ticket이면 좌석번호만 따서 list에 담음
			}
		}
		System.out.println("결과는 ?"+list);
		return list;
	}
	
	//결제하기 클릭 시 좌석상태코드 1(판매완료)로 변경
	@RequestMapping( value="updateTicketStatus1/{ticketNoList}", method=RequestMethod.GET )
	public String updateTicketStatus1(@PathVariable String ticketNoList, HttpSession session) throws Exception{
		System.out.println(":: /ticket/rest/updateTicketStatus1 START");
		System.out.println("넘어온 ticketNoList?"+ticketNoList);
		String regex = "(?<=\\G.{21})";
		String[] array = ticketNoList.split(regex);
		
		for(String ticketNo:array) {
			Ticket ticket = ticketService.getTicketInfo(ticketNo);
			ticket.setTicketStatus(1);
			ticketService.updateTicketStatus(ticket);
		}
		
		System.out.println(ticketNoList+"의 ticketStatus를 1로 변경완료");
		return "success";
	}
	//결제 취소혹은 실패 시 좌석상태코드 0(판매중)로 변경
	@RequestMapping( value="updateTicketStatus0/{ticketNoList}", method=RequestMethod.GET )
	public String updateTicketStatus0(@PathVariable String ticketNoList, HttpSession session) throws Exception{
		System.out.println(":: /ticket/rest/updateTicketStatus0 START");
		System.out.println("넘어온 ticketNo?"+ticketNoList);
		String regex = "(?<=\\G.{21})"; //문자 21개 기준으로 파싱
		String[] array = ticketNoList.split(regex);
		
		for(String ticketNo:array) {
			Ticket ticket = ticketService.getTicketInfo(ticketNo);
			ticket.setTicketStatus(0);
			ticketService.updateTicketStatus(ticket);
		}
		
		System.out.println(ticketNoList+"의 ticketStatus를 0으로 변경완료");
		return "success";
	}
	
	
	//티켓 결제 후 해당 정보(transaction add + ticket update)
	@PostMapping("addTicketPurchase")
	public String addTicketPurchase(@ModelAttribute("transaction") Transaction transaction,
									@ModelAttribute("ticket") String ticket,
									Model model,HttpSession session) throws Exception{
		System.out.println("/ticket/rest/addTicketPurchase : POST START");
		System.out.println("넘어온 데이터?"+transaction+"//"+ticket);
		
		//리스트형태로 ticketNo 넘어온거 파싱 
		String regex = "(?<=\\G.{21})";
		String[] split = ticket.split(regex);
		User user = (User)session.getAttribute("user");
		transaction.setBuyer(user);
		transaction.setTranType("T");
		//refundableDate -> 전날 23시로 세팅
		String dateString = ticketService.getTicketInfo(split[0]).getGame().getGameDate();//ticketNo로 해당 티켓 정보가져옴(gameDate get위함)// 기존 날짜 및 시간
		System.out.println("dateString"+dateString);
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
		LocalDate localDate = LocalDate.parse(dateString, formatter);
		LocalDate refundDate = localDate.minusDays(1);
		LocalDateTime refundDateTime = refundDate.atTime(23, 0, 0);
		System.out.println("refundDateTime??"+refundDateTime); 
		transaction.setRefundableDate(refundDateTime);
		//결제수단 저장
		if(transaction.getTranPaymentOption().equals("card")) {
			transaction.setTranPaymentOption("신용카드");
		} else if(transaction.getTranPaymentOption().equals("trans")){
			transaction.setTranPaymentOption("실시간계좌이체");
		} else if(transaction.getTranPaymentOption().equals("vbank")){
			transaction.setTranPaymentOption("가상계좌");
		} else if(transaction.getTranPaymentOption().equals("phone")){
			transaction.setTranPaymentOption("휴대폰소액결제");
		} else if(transaction.getTranPaymentOption().equals("samsung")){
			transaction.setTranPaymentOption("삼성페이");
		} else if(transaction.getTranPaymentOption().equals("kpay")){
			transaction.setTranPaymentOption("KPay앱");
		} else if(transaction.getTranPaymentOption().equals("kakaopay")){
			transaction.setTranPaymentOption("카카오페이");
		} else if(transaction.getTranPaymentOption().equals("payco")){
			transaction.setTranPaymentOption("페이코");
		} else if(transaction.getTranPaymentOption().equals("lpay")){
			transaction.setTranPaymentOption("LPAY");
		} else if(transaction.getTranPaymentOption().equals("ssgpay")){
			transaction.setTranPaymentOption("토스간편결제");
		} else if(transaction.getTranPaymentOption().equals("cultureland")){
			transaction.setTranPaymentOption("문화상품권");
		} else if(transaction.getTranPaymentOption().equals("smartculture")){
			transaction.setTranPaymentOption("스마트문상");
		} else if(transaction.getTranPaymentOption().equals("happymoney")){
			transaction.setTranPaymentOption("해피머니");
		} else if(transaction.getTranPaymentOption().equals("booknlife")){
			transaction.setTranPaymentOption("도서문화상품권");
		} else if(transaction.getTranPaymentOption().equals("wechat")){
			transaction.setTranPaymentOption("위쳇페이");
		}  else if(transaction.getTranPaymentOption().equals("alipay")){
			transaction.setTranPaymentOption("알리페이");
		}  else if(transaction.getTranPaymentOption().equals("unionpay")){
			transaction.setTranPaymentOption("유니온페이");
		}  else if(transaction.getTranPaymentOption().equals("tenpay")){
			transaction.setTranPaymentOption("텐페이");
		}
		
		System.out.println(":: transaction add 하기 위한 setting? "+transaction);
		int tranNo = transactionService.addTransaction(transaction);  //transaction add 하면서 tran_no 생성하고 그 tran_no 바로 리턴해줌
		
		List<String> list = new ArrayList<>(); //각 ticketNo를 list에 넣어주기
		for(String splitTicket:split) {
			list.add(splitTicket);
		}
		Map<String, Object> map = new HashMap<>(); // Mapper에 map 객체 보내주기 위함
		map.put("tranNo", tranNo);
		map.put("list", list);
		ticketService.addTicketPurchase(map); //각 ticket에 tranNo 업데이트해줌
		
		/*
		 * Transaction transaction2 = transactionService.getTransaction(tranNo);//결제번호로
		 * 해당 결제정보 가져옴 List<Ticket> listTicket =
		 * ticketService.getTicketPurchaseList(tranNo); //결제번호로 해당 티켓 정보들 가져옴+티켓에 game
		 * 정보도 있음 model.addAttribute("ticketList", listTicket);//티켓정보+게임정보
		 * model.addAttribute("transaction", transaction2); //결제정보+유저정보
		 */		
		System.out.println("addTicketPurchase 종료");
		return "success";
	}
}