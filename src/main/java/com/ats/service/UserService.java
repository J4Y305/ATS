package com.ats.service;

import java.util.List;

import com.ats.domain.AnnVO;
import com.ats.domain.SearchCriteria;
import com.ats.domain.UserVO;
import com.ats.dto.UserLoginDTO;

public interface UserService {
	
   public UserVO login(UserLoginDTO dto) throws Exception;
   
   public void register(UserVO vo) throws Exception;
   
   public UserVO read(String userId) throws Exception;
   
   public void modify(UserVO vo) throws Exception;
   
   public void remove(String userId) throws Exception;
   
   public int pwdc(UserVO vo) throws Exception;
   
   public int idc(String userId) throws Exception;
   
   // 페이징, 검색할 수 있는 list
   public List<UserVO> listSearch(SearchCriteria cri) throws Exception;
   
   // 페이징, 검색하기 위한 게시물 수 반환
   public int listSearchCount(SearchCriteria cri) throws Exception;
}
