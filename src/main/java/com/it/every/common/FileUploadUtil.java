package com.it.every.common;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

@Component
public class FileUploadUtil {

   private static final Logger logger
      = LoggerFactory.getLogger(FileUploadUtil.class);
   
   //private MultipartFile 
   
   public  List<Map<String, Object>>  fileUpload(HttpServletRequest request,
         int pathFlag) throws IllegalStateException, IOException {
      
      MultipartHttpServletRequest multiRequest
         = (MultipartHttpServletRequest)request;
      
      //결과를 저장할 list
      
      List<Map<String, Object>> list 
         = new ArrayList<>();
         
      Map<String, MultipartFile> filesMap = multiRequest.getFileMap();
      
      Iterator<String> iter = filesMap.keySet().iterator();
       
       while(iter.hasNext()) {
          String key = iter.next();
          MultipartFile tempFile = filesMap.get(key);
          
          
          if(!tempFile.isEmpty()) {
             
            long fileSize = tempFile.getSize();
             
            String originFileName = tempFile.getOriginalFilename();
            
            //변경된 파일 이름
            String fileName = getUniqueFileName(originFileName);
            
            //업로드 경로
            
            String uploadPath = getUploadPath(request,pathFlag);
            
            
            //업로드 처리하기 - 업로드 경로에 업로드 파일 저장
            
            File file = new  File(uploadPath ,fileName);
            
            tempFile.transferTo(file);
            
            Map<String, Object> map = new HashMap<>();
            
            map.put("fileName", fileName);
            map.put("fileSize", fileSize);
            map.put("originalFileName", originFileName);
            
            list.add(map);
             
          }//if
       }//while
       
       return list;
       
   }//fileUpload
   
   
   public String getUploadPath(HttpServletRequest request,int pathFlag) {
      
      //업로드 경로 구하기
      String path="";
      if(ConstUtil.FILE_UPLOAD_TYPE.equals("test")) {
         
         if(pathFlag==ConstUtil.UPLOAD_SYLLABUS_FLAG) {
            path=ConstUtil.SYLLABUS_FILE_UPLOAD_PATH_TEST; //강의계획서
         }else if(pathFlag==ConstUtil.UPLOAD_ASSIGNMENT_FLAG) { //학생이 과제 제출하는거 
            path=ConstUtil.ASSIGNMENT_FILE_UPLOAD_PATH_TEST; //학생이 과제 제출했을때 다운로드 폴더 경로
         }else if(pathFlag==ConstUtil.UPLOAD_JUNGGO_FLAG) { //중고거래
             path=ConstUtil.JUNGGO_FILE_UPLOAD_PATH_TEST; //중고거래 다운
          }
         
      }else { //deploy
         if(pathFlag==ConstUtil.UPLOAD_SYLLABUS_FLAG) {
            path=ConstUtil.SYLLABUS_FILE_UPLOAD_PATH_TEST; //psd_syllabus
         }else if(pathFlag==ConstUtil.UPLOAD_ASSIGNMENT_FLAG) {
            path=ConstUtil.ASSIGNMENT_FILE_UPLOAD_PATH_TEST; //pds_assignment
         }else if(pathFlag==ConstUtil.UPLOAD_ASSIGNMENT_FLAG) {
             path=ConstUtil.JUNGGO_FILE_UPLOAD_PATH_TEST; //pds_junggo
          }
         //실제 물리적인 경로 구하기
         path = request.getSession().getServletContext().getRealPath(path);
      } 
      
      logger.info("업로드 경로 : {}" , path);
      
      return path;
      
   }//getUploadPath
   
   
   public String getUniqueFileName(String fileName) {
      //업로드한 파일명이 중복될 경우 파일 이름 변경하기 - 현재시간(밀리초까지)추가
      //ab.txt => ab_20210630155820123.txt /년월일/시분초/밀리초
      
      //순수파일명만 구하기
      int idx = fileName.lastIndexOf(".");
      
      String fName = fileName.substring(0, idx); //ad
      
      //확장자 구하기
      String ext = fileName.substring(idx); //.txt
      
      String result = fName + "_" + getTimeStamp() + ext;
       
      logger.info("변경된 파일명:{}", result);
      
      return result; 
      
   }//getUniqueFileName
   
   
   public String getTimeStamp() {
      Date d = new Date();
      SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmssSSS");
      
      String str = sdf.format(d);
      
      return str;
   }//getTimeStamp
   
}
