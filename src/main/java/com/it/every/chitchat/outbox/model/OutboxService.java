package com.it.every.chitchat.outbox.model;

public interface OutboxService {
	int sendMessage(OutboxVO vo);
	int deleteMessage(int msgNo);
	int deleteSent(int msgNo);
}
