package com.it.every.board.model;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.it.every.category.model.categoryVO;
import com.it.every.department.model.DepartmentVO;
import com.it.every.register.model.registerVO;
import com.it.every.subjType.model.SubjTypeVO;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class BoardServiceImpl implements BoardService {
   private final BoardDAO boardDao;

   @Override
   public List<categoryVO> selectcategory(registerVO vo) {
      return boardDao.selectcategory(vo);
   }

   @Override
   public List<Map<String, Object>> proselectoption(String prof_no) {
      return boardDao.proselectoption(prof_no);
   }

   @Override
   public List<DepartmentVO> professordeptname(String prof_name) {
      return boardDao.professordeptname(prof_name);
   }

   @Override
   public List<SubjTypeVO> subjtype(customVO vo) {
      return boardDao.subjtype(vo);
   }

   @Override
   public List<customVO> subjname(customVO vo) {
      return boardDao.subjname(vo);
   }

   @Override
   public int insertboard(customVO vo) {
      return boardDao.insertboard(vo);
   }

   @Override
   public String adminfound(String emp_no) {
      return boardDao.adminfound(emp_no);
   }

   @Override
   public String categorycode(String category_code) {
      return boardDao.categorycode(category_code);
   }

   @Override
   public List<DepartmentVO> adminsubjname() {
      return boardDao.adminsubjname();
   }

   @Override
   public List<customVO> customlist(customVO vo) {
      return boardDao.customlist(vo);
   }

   @Override
   public int deleteboard(String bd_name) {
      return boardDao.deleteboard(bd_name);
   }

   @Override
   public int checkall(customVO vo) {
      return boardDao.checkall(vo);
   }

   @Override
   public int category(String name) {
      return boardDao.category(name);
   }

   @Override
   public int updateboard(customVO vo) {
      return boardDao.updateboard(vo);
   }

   @Override
   public String professorcalom(String no) {
      return boardDao.professorcalom(no);
   }

   @Override
   public int checkBdCode(String openSubCode) {
      return boardDao.checkBdCode(openSubCode);
   }

   
}
