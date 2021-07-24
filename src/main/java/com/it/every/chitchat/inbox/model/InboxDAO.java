package com.it.every.chitchat.inbox.model;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface InboxDAO {
	int receiveMessage(InboxVO vo);
	List<Map<String, Object>> chitchatAll(String no);
	int storeMessage(InboxVO vo);
}
