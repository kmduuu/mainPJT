package com.baseball.service.transaction;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.baseball.common.domain.Search;
import com.baseball.service.domain.Transaction;

@Mapper
public interface TransactionDao {

	public void addTransaction(Transaction transaction) throws Exception;

	public Transaction getTransaction(int tranNo) throws Exception;

	public void updateTransaction(Transaction transaction) throws Exception;

	public List<Transaction> getTransactionList(Search search, String userId, String tranType) throws Exception; 							
	
	public int getTotalCount(String userId, String tranType) throws Exception;

	public int getLastTranNo() throws Exception;

	public List<Transaction> getSalesList(String gameCode) throws Exception;

}
