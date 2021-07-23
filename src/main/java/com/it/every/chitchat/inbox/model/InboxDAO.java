package com.it.every.chitchat.inbox.model;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface InboxDAO {
	int receiveMessage(String msgNo, String receiveNo);
}
