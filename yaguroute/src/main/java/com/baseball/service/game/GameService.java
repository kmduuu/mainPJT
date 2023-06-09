package com.baseball.service.game;

import java.util.List;
import java.util.Map;

import com.baseball.common.domain.Team;
import com.baseball.service.domain.Game;
import com.baseball.service.domain.GamePreview;
import com.baseball.service.domain.GameRecord;
import com.baseball.service.domain.Player;


public interface GameService {
	
	public Team getTeamInfoByTeamName(String teamName);
	
	public Team getTeamInfo(String teamCode);
	
	public List<Team> getAllTeam();
	
	public void updateTeamInfo(Team team);
	
	public Game getGameInfo(String gameCode);
	
	public List<Game> getGameListByDate(String date);
	
	public void updateGameState(List<Game> game);
	
	public List<Game> getGameListByMonthly(String date,String teamCode); 
	
	public void addGame(Game game);
	
	public List<Game> getGameListTwoWeeks(String teamCode);
	
	public List<Team> getAllTeamRanking();
	
	public void updateTodayGameSchedule() throws Exception;
	
	public void updateGamePredAllocation(Game game);
	
	public void updateGameVideo(Game game);
	
	public GameRecord getGameRecord(Game game) throws Exception;
	
	public GamePreview getGamePreview(Game game) throws Exception;
	
	public Map<String, List<Player>> getGameCrawlingLineup(Game game) throws Exception;

}
