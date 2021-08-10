package com.it.every.board.model;

import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class BoardServiceImpl implements BoardService {
	private final BoardDAO boardDao;

	@Override
	public int checkBdCode(String openSubCode) {
		return boardDao.checkBdCode(openSubCode);
	}

}
