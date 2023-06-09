package com.baseball.service.transaction;

import java.util.List;
import java.util.Map;

import com.baseball.common.domain.Search;
import com.baseball.service.domain.Transaction;

public interface TransactionService {
	
	public int addTransaction(Transaction transaction) throws Exception;

	public Transaction getTransaction(int tranNo) throws Exception;

	public void updateTransaction(Transaction transaction) throws Exception;
	
	public Map<String, Object> getTransactionList(Search search, String userId, String tranType) throws Exception;

	public List<Transaction> getSalesList(String gameCode) throws Exception;
}
