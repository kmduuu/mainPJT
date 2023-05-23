package com.baseball.service.game.impl;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.baseball.common.domain.Team;
import com.baseball.service.domain.Game;
import com.baseball.service.game.GameDao;
import com.baseball.service.game.GameService;

@Service
public class GameServiceImpl implements GameService {

	public GameServiceImpl() {
		// TODO Auto-generated constructor stub
	}
	
	@Autowired
	@Qualifier("gameDao")
	private GameDao gameDao;
	
	//팀 이름으로 팀 정보 검색
	public Team getTeamInfoByTeamName(String teamName) {
		return gameDao.getTeamInfoByTeamName(teamName);
	}
	
	//팀 코드(teamCode = HH)로 팀 정보 검색
	public Team getTeamInfo(String teamCode) {
		return gameDao.getTeamInfo(teamCode);
	}
	
	//gameCode로 한경기 정보 검색
	public Game getGameInfo(String gameCode) {
		return gameDao.getGameInfo(gameCode);
	}

	// 한달기준 경기 검색(Like '2023-05%')
	public List<Game> getGameListByMonthly(String date,String teamCode){
		return gameDao.getGameListByMonthly(date,teamCode);
	}
	
	//날짜 기준(date = "2023-05-22")으로 경기 검색
	public List<Game> getGameListByDate(String date) {
		return gameDao.getGameListByDate(date);
	}
	
	// 경기 시작(gameStatus = "1") => gameState만 변경
	// 경기 끝(gameStatus = "2") => winningTeamCode != null이면 winningTeam, game_score까지 업데이트
	// 경기 취소(gameStatus = "3")
	public void updateGameState(List<Game> game) {
		for(Game gametmp : game) {
			gameDao.updateGameState(gametmp);
		}
	}
	
	// 크롤링 데이터 하나씩 db에 저장
	public void addThisYearGameSchedule(Game game) {
		gameDao.addGame(game);
	}
	
	//티켓예매를 위한 다음날부터 2주동안의 경기 결과 출력
	//game_date BETWEEN now() AND DATE_ADD(NOW(), INTERVAL 14 DAY)
	public List<Game> getGameListTwoWeeks(){
		return gameDao.getGameListTwoWeeks();
	}
	
	//끝난 경기의 배당정보 업데이트(gameCode, winningTeamAllocation 필수)
	public void updateGamePredAllocation(Game game) {
		gameDao.updateGamePredAllocation(game);
	}

}
