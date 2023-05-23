package com.baseball.test.game;

import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.junit.jupiter.api.Test;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.chrome.ChromeOptions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.boot.test.context.SpringBootTest;

import com.baseball.common.domain.Team;
import com.baseball.service.domain.Game;
import com.baseball.service.domain.GameRecord;
import com.baseball.service.game.GameService;

@SpringBootTest
public class GameTests {

	public GameTests() {
		// TODO Auto-generated constructor stub
	}
	
	@Autowired
	@Qualifier("gameServiceImpl")
	private GameService gameService;
	
	//@Test
	public void getTeamInfoByTeamName() throws Exception{
		String teamName = "두산";
		Team testTeam = gameService.getTeamInfoByTeamName(teamName);
		
		System.out.println(testTeam);
	}
	

	//@Test
	public void getTeamInfo() throws Exception{
		Team team = gameService.getTeamInfo("SK");
		System.out.println(team);
	}
	
	//@Test
	public void getGameInfo() throws Exception{
		
		Game game =  gameService.getGameInfo("20230313HTHH02023");
		System.out.println(game);
	}
	
	//@Test
	public void getGameScheduleList() throws Exception{
		
		String date = "2023-06";
		String teamCode = "OB";
		List<Game> list = gameService.getGameListByMonthly(date,teamCode);
		for(Game tmp : list) {
			System.out.println(tmp);
		}
	}
		
	//@Test
	public void updateGameState() throws Exception{
		String date = "2008.3.29";
		Game game = new Game();
		List<Game> tmpGame = gameService.getGameListByDate(date);
		for(Game gametmp : tmpGame) {
			gametmp.setGameStatusCode("2");
		}
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy.MM.dd");
		game.setGameDate(dateFormat.format(dateFormat.parse(date)));
		gameService.updateGameState(tmpGame);
		
	}
	
	//@Test
	public void addGame() throws Exception{
		Game game = new Game();
		game.setGameCode("20100731SKSS02010");
		
		Team homeTeam = new Team();
		homeTeam.setTeamCode("SS");
		game.setHomeTeam(homeTeam);
		
		Team awayTeam = new Team();
		awayTeam.setTeamCode("SK");
		game.setAwayTeam(awayTeam);
		
		game.setGameDate("7.31");
		game.setGameTime("18:30");
		game.setGameStatusCode("2");
		game.setGameScore("4:8");
		
		gameService.addGame(game);
	}
	
	@Test
	public void getGameRecord() throws Exception{
		Game game = gameService.getGameInfo("20210903OBSK02021");
		GameRecord gameRecord = gameService.getGameRecord(game);
		System.out.println(gameRecord);
	}

}
