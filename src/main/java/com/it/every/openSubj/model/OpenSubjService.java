package com.it.every.openSubj.model;

import java.util.List;

public interface OpenSubjService {
	List<OpenSubjVO> selectByProfNo(String profNo);
}
