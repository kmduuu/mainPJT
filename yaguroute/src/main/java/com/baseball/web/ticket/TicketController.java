package com.baseball.web.ticket;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.baseball.common.domain.Page;
import com.baseball.common.domain.Search;
import com.baseball.common.domain.Team;
import com.baseball.service.domain.Game;
import com.baseball.service.domain.Ticket;
import com.baseball.service.domain.Transaction;
import com.baseball.service.domain.User;
import com.baseball.service.game.GameService;
import com.baseball.service.ticket.TicketService;
import com.baseball.service.transaction.TransactionService;
import com.baseball.service.user.UserService;

@Controller
@RequestMapping("/ticket/*")
public class TicketController {
	@Autowired
	@Qualifier("ticketServiceImpl")
	private TicketService ticketService;
	
	@Autowired
	@Qualifier("gameServiceImpl")
	private GameService gameService;
	
	@Autowired
	@Qualifier("transactionServiceImpl")
	private TransactionService transactionService;
	
	@Autowired
	@Qualifier("userServiceImpl")
	private UserService userService;
	
	@Value("${commonProperties.pageUnit}")
	int pageUnit;
	
	// @Value("${commonProperties.pageSize}") 
	int pageSize = 10;
	
	public TicketController() {
		System.out.println(this.getClass());
	}
	
	//GameList 현재로부터 2주치 경기스케줄 get
	@GetMapping("getGameList2w")
	public String getGameList2w(@RequestParam("teamCode") String teamCode,Model model) throws Exception{
		System.out.println("/ticket/getGameList2w : GET START");
		System.out.println("넘어온 데이터?"+teamCode);
		if(teamCode == null || teamCode.equals("ALL")) {
			teamCode ="HH";
		}
		List<Game> list = gameService.getGameListTwoWeeks(teamCode); //현재시간부터 14일이내 경기 리스트 가져옴.
		for(Game game:list) {
			System.out.println(game);
		}
		//모든Team 정보 조회
		List<Team> allTeam = gameService.getAllTeam();
		allTeam.remove(0); //All 팀 삭제
		Team team = gameService.getTeamInfo(teamCode);

		model.addAttribute("team", team);
		model.addAttribute("allTeam", allTeam);
		model.addAttribute("gameList", list);
		
		return "forward:/ticket/listGameTwoWeeks.jsp";
	}
	
	//해당 게임 총 판매 티켓 수
	@GetMapping("getStadium")
	public String getStadium(@RequestParam("gameCode") String gameCode,Model model) throws Exception{
		System.out.println("/ticket/getStadium : GET START");
		System.out.println("넘어온 데이터?"+gameCode);
		Game game = gameService.getGameInfo(gameCode); //game에 대한 정보 (stadium 이미지 및 해당 경기 정보출력위함)
		int salesTicket = 60 - ticketService.getSalesTicket(gameCode); // 현재 판매된 티켓 수
		
		System.out.println("넘겨주는 데이터?"+game+"//"+salesTicket);
		model.addAttribute("salesTicket", salesTicket);
		model.addAttribute("game", game);
		return "forward:/ticket/getStadium.jsp";
	}
	
	//해당 game의 티켓 정보 모두 get (60개) -> 좌석선택위함
	@GetMapping("getSeats")
	public String getSeats(@RequestParam("gameCode") String gameCode,Model model) throws Exception{
		System.out.println("/ticket/getSeats : GET START");
		System.out.println("넘어온 데이터?"+gameCode);
		List<Ticket> list = ticketService.getTickets(gameCode); //60장 정보
		for(Ticket ticket:list) {
			System.out.println("tickets ? "+ticket);
		}
		Game game = gameService.getGameInfo(gameCode);
		model.addAttribute("game", game);
		model.addAttribute("ticketList", list);
		return "forward:/ticket/getSeats.jsp";
	}
	
	
	
	//tranNo로 티켓 결제 내역 출력
	@GetMapping("getTicketPurchaseDetail")
	public String getTicketPurchaseDetail(@RequestParam("tranNo") int tranNo,
											Model model,HttpSession session) throws Exception{
		System.out.println("/ticket/getTicketPurchaseDetail : GET START");
		System.out.println("넘어온 데이터?"+tranNo);
		
		Transaction transaction2 = transactionService.getTransaction(tranNo);//결제번호로 해당 결제정보 가져옴
		List<Ticket> listTicket = ticketService.getTicketPurchaseList(tranNo); //결제번호로 해당 티켓 정보들 가져옴+티켓에 game 정보도 있음
		////////game 정보(화면에 어느 경기를 예매한건지 경기정보 출력해주기 위함/////
	 		
		//형식 변환
	 		String gameDate = listTicket.get(0).getGame().getGameDate();
	 		String gameTime = listTicket.get(0).getGame().getGameTime();
	 		String gameDateTime = gameDate.concat(" ").concat(gameTime);
	 		System.out.println("gameDateTime"+gameDateTime);
	 		SimpleDateFormat inputFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm");
	 		SimpleDateFormat outputFormat = new SimpleDateFormat("yyyy년 MM월 dd일 HH시 mm분");
            Date date = inputFormat.parse(gameDateTime);
            String formattedDate = outputFormat.format(date);
            System.out.println("형식변경한 gameDate ? " +formattedDate);  // 출력: 2023년 06월 21일 18시 30분
            listTicket.get(0).getGame().setGameDate(formattedDate);
		System.out.println("보내주는 listTicket?"+listTicket);
		System.out.println("보내주는 transaction2"+transaction2);
		model.addAttribute("ticketList", listTicket);//티켓정보+게임정보
		model.addAttribute("transaction", transaction2); //결제정보+유저정보
		return "forward:/ticket/getTicket.jsp";
	}
	
	//userId로 ticket 결제내역 List get
	@GetMapping("getTicketPurchaseList")
	public String getTicketPurchaseList(@RequestParam(value="userId", required = false) String userId,
										@RequestParam(value="currentPage", required = false) Integer currentPage ,
										@RequestParam(value="daysValue", required = false) Integer daysValue,
										Model model,HttpSession session) throws Exception{
		System.out.println("/ticket/getTicketPurchaseList : GET START");
		User user = (User)session.getAttribute("user");
		if (userId == null) { 
			userId = user.getUserId();
		}
		
		//7or15or1month
		int days = 0; 
		if(daysValue != null) {
			days = daysValue.intValue();
		}
		
		Search search = new Search();
		currentPage = (currentPage == null) ? 1 : currentPage;
		search.setCurrentPage(currentPage);
		search.setPageSize(pageSize);
		search.setDays(days);
		String tranType = "t";
		
		System.out.println("search??"+search);
		//transaction 결제정보
		Map<String, Object> map = transactionService.getTransactionList(search, userId, tranType);
		List<Transaction> list = (List<Transaction>)map.get("list");
		
		Integer totalCount = ((Integer)map.get("totalCount")).intValue();
		Page resultPage = new Page(search.getCurrentPage(),totalCount,pageUnit, pageSize);
		System.out.println("Transaction TotalCount//resultPage::= "+totalCount+"//"+resultPage);
		////////결제내역list 정보///////
		
		////////game 정보(화면에 어느 경기를 예매한건지 경기정보 출력해주기 위함/////
		List<Game> gamelist = new ArrayList<>();
		for(Transaction tran:list) { //결제내역List에서 tranNo뽑아내서 게임정보불러온 다음 다시 list화
	 	Game game=gameService.getGameInfo(ticketService.getGameCode(tran.getTranNo()));
	 		//형식 변환
	 		String gameDate = game.getGameDate();
	 		String gameTime = game.getGameTime();
	 		String gameDateTime = gameDate.concat(" ").concat(gameTime);
	 		SimpleDateFormat inputFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm");
	 		SimpleDateFormat outputFormat = new SimpleDateFormat("yyyy년 MM월 dd일 HH시 mm분");
            Date date = inputFormat.parse(gameDateTime);
            String formattedDate = outputFormat.format(date);
            System.out.println("형식변경한 gameDate ? " +formattedDate);  // 출력: 2023년 06월 21일 18시 30분
            game.setGameDate(formattedDate);
            gamelist.add(game);
		}
		System.out.println("game정보 불러온 것 :: " +gamelist);
		
		Team team = gameService.getTeamInfo(user.getTeamCode()); //상단바 출력위한 팀정보
		//모든Team 정보 조회
		List<Team> allTeam = gameService.getAllTeam();
		
		model.addAttribute("allTeam", allTeam);
		model.addAttribute("resultPage", resultPage);
		model.addAttribute("team", team);
		model.addAttribute("transaction", list);//transaction 결제내역 리스트 (gamelist와 1:1)
		model.addAttribute("game", gamelist); //결제내역에 해당하는 게임 정보 리스트
		return "forward:/ticket/listTicketPurchase.jsp";
	}
	
	@GetMapping("getSalesList")
	public String getSalesList(@RequestParam("month") int month,Model model) throws Exception {
		System.out.println("/ticket/getSalesList : GET START");
		System.out.println("넘어온 month ?"+month); 
		Map<String, Object> map = new HashMap<>();
		List<Game> list = ticketService.getGameListByMonth(month);
		List<Transaction> transactionList = new ArrayList<Transaction>();
		for(Game game:list) {
			game.setSalesTicket(ticketService.getSalesTicket(game.getGameCode()));
			transactionList = transactionService.getSalesList(game.getGameCode());
			map.put(game.getGameCode(), transactionList);
		}
		model.addAttribute("gameList", list);
		model.addAttribute("map", map); //map에 gameCode:list 1:다 관계
		return "forward:/ticket/listSales.jsp";
	}
	

	
}