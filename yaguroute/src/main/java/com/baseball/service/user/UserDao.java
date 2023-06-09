package com.baseball.service.user;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.baseball.common.domain.Search;
import com.baseball.common.domain.Team;
import com.baseball.service.domain.User;

@Mapper
public interface UserDao {
	/**/
	public void addUser(User user)throws Exception;
	
	public User getUser(String userId) throws Exception;
	
	public List<User> getUserList(Search search) throws Exception;
	
	public int getTotalCount(Search search) throws Exception;
	
	public void updateUser(User user) throws Exception;
	
	public void withDraw(User user) throws Exception;
	
	public void updatePoint(User user) throws Exception;
	
	public int userIdCheck(String userId) throws Exception;
	
	public int userNickNameCheck(String userNickName) throws Exception;
	
	public boolean phoneCheck(String userPhone) throws Exception;
	
	public List<User> findUserId(String userPhone) throws Exception;
	
	public Team getTeamEmblem(String teamCode) throws Exception;
	
	}
