package com.it.every.chitchat.inbox.model;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class InboxServiceImpl implements InboxService {
	private final Logger logger
		= LoggerFactory.getLogger(InboxServiceImpl.class);
	
	private final InboxDAO inboxDao;

	@Override
	public int receiveMessage(InboxVO vo) {
		return inboxDao.receiveMessage(vo);
	}

	@Override
	public List<Map<String, Object>> chitchatAll(String no) {
		return inboxDao.chitchatAll(no);
	}

	@Override
	public int storeMessage(InboxVO vo) {
		return inboxDao.storeMessage(vo);
	}
}
