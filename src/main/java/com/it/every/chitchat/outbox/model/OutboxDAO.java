package com.it.every.chitchat.outbox.model;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface OutboxDAO {
	int sendMessage(OutboxVO vo);
	int deleteMessage(int msgNo);
}
