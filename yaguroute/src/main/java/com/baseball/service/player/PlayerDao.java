package com.baseball.service.player;

import java.util.List;


import com.baseball.common.domain.Search;
import com.baseball.common.domain.Team;
import com.baseball.service.domain.Player;

public interface PlayerDao {

	public void addPlayer(Player player) throws Exception;
	
	public Player getPlayer(String playerId) throws Exception;
	
	public List<Player> getPlayerList(Search search) throws Exception;
	
	public int getTotalCount(Search search) throws Exception;
	
	public void deletePlayer();
	
	public void dropForeignKey();
	
	public void addForeignKey();
	
	public List<Team> getAllTeam();
	
	public List<Player> getAllPlayer();
}
