package com.it.every.chitchat.inbox.model;

import java.util.List;
import java.util.Map;

public interface InboxService {
	int receiveMessage(InboxVO vo);
	List<Map<String, Object>> chitchatAll(String no);
	Map<String, Object> chitchatDetail(int msgNo);
	int storeMessage(InboxVO vo);
	int updateReadDate(int msgNo);
}
