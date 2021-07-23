package com.it.every.common;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

/**
 * 검색 정보를 담고있는 Bean
 * 페이징 처리 관련 변수 포함
*/

@Getter
@Setter
@ToString
public class SearchVO {
	/** 검색조건 */
	private String searchCondition = "";
	
	/** 검색키워드 */
	private String searchKeyword = "";
    
	/** 검색 사용여부 */
	private String searchUseYn = "";
	
	/** 현재 페이지 */
	private int currentPage = 1;
	
	/** 동 */
	private String dong = "";
    
	//년도 이건 검색조건
	private String searchYear = "";
	//학기 검색조건
	private String searchSemester = "";

	
	
    /**블럭당 보여질 페이지 수,  페이지 사이즈 */
    private int blockSize; // properties에서 설정
    
    /** 시작 인덱스 0,5,10,15,...*/
    private int firstRecordIndex = 1;
    
    /** 끝 인덱스 */
    private int lastRecordIndex = 1;
    
    /**페이지 별 레코드 갯수 (pageSize) */
    private int recordCountPerPage; 

	
}
 