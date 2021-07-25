package com.it.every.chitchat.outbox.model;

import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class OutboxServiceImpl implements OutboxService {
	private final OutboxDAO outboxDao;
	
	@Override
	public int sendMessage(OutboxVO vo) {
		return outboxDao.sendMessage(vo);
	}

	@Override
	public int deleteMessage(int msgNo) {
		return outboxDao.deleteMessage(msgNo);
	}

}
