package com.it.every.common;

public interface ConstUtil {
   //여기에는 상수만 넣는다
   
   //페이징 처리 관련 상수
   public static final int BLOCK_SIZE=10; //블럭 크기
   int RECORD_COUNT =5; //한 페이지에 보여줄 레코드 개수
   
   //우편번호 페이징 처리 상수
   public static final int ZIPCODE_SIZE=5; //블럭 크기
   int ZIPCODE_COUNT =20; //한 페이지에 보여줄 레코드 개수
   
   
   
   
   
   //파일 업로드 처리 관련 상수
   String FILE_UPLOAD_TYPE="test";
   
   //String FILE_UPLOAD_TYPE="deploy";
   
   //자료실 - 파일 저장 경로
   String FILE_UPLOAD_PATH="pds_upload";
   //String FILE_UPLOAD_PATH_TEST="E:\\workspace_list\\spboot_WS\\springherb\\src\\main\\webapp\\pds_upload";
   String FILE_UPLOAD_PATH_TEST="C:\\Users\\yeongrim kim\\OneDrive - ikw.kr\\문서\\GitHub\\every\\src\\main\\webapp\\WEB-INF\\pds_upload";
   
   
   //과제업로드
   String ASSIGNMENT_FILE_UPLOAD_PATH_TEST= "C:\\Users\\yeongrim kim\\OneDrive - ikw.kr\\문서\\GitHub\\every\\src\\main\\webapp\\WEB-INF\\pds_assignment";
    
   //강의계획서 업로드
   String SYLLABUS_FILE_UPLOAD_PATH_TEST="F:\\lecture\\project\\final\\every\\src\\main\\webapp\\pds_syllabus";
   
   //강의계획서 업로드인지,  과제업로드
   int UPLOAD_SYLLABUS_FLAG=1; //강의계획서 업로드
   
   int UPLOAD_ASSIGNMENT_FLAG=2; //과제 업로드
   
   
   
   
   
   
   
}