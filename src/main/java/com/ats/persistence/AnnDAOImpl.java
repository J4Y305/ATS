package com.ats.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.ats.domain.AnnFileVO;
import com.ats.domain.AnnImageVO;
import com.ats.domain.AnnVO;
import com.ats.domain.SearchCriteria;

@Repository
public class AnnDAOImpl implements AnnDAO {

	@Inject
	private SqlSession sqlSession;

	private static String namespace = "com.ats.mapper.AnnMapper";

	@Override
	public int create(AnnVO vo) throws Exception {
		sqlSession.insert(namespace + ".create", vo);
		return vo.getAnnNum();
	}

	@Override
	public AnnVO read(int annNum) throws Exception {
		return sqlSession.selectOne(namespace + ".read", annNum);
	}

	@Override
	public void update(AnnVO vo) throws Exception {
		sqlSession.update(namespace + ".update", vo);
	}

	@Override
	public void delete(int annNum) throws Exception {
		sqlSession.delete(namespace + ".delete", annNum);
	}

	@Override
	public List<AnnVO> listSearch(SearchCriteria cri) throws Exception {
		return sqlSession.selectList(namespace + ".listSearch", cri);
	}

	@Override
	public int listSearchCount(SearchCriteria cri) throws Exception {
		return sqlSession.selectOne(namespace + ".listSearchCount", cri);
	}

	@Override
	public void insertImage(AnnImageVO vo) throws Exception {
		sqlSession.insert(namespace + ".insertImage", vo);
	}

	@Override
	public void deleteImage(int annNum) throws Exception {
		sqlSession.delete(namespace + ".deleteImage", annNum);
	}

	@Override
	public List<AnnImageVO> imageList(int annNum) throws Exception {
		return sqlSession.selectList(namespace + ".imageList", annNum);
	}

	@Override
	public void insertFile(AnnFileVO vo) throws Exception {
		sqlSession.insert(namespace + ".insertFile", vo);
	}

	@Override
	public void deleteFile(int annNum) throws Exception {
		sqlSession.delete(namespace + ".deleteFile", annNum);
	}

	@Override
	public List<AnnFileVO> fileList(int annNum) throws Exception {
		return sqlSession.selectList(namespace + ".fileList", annNum);
	}

	@Override
	public List<AnnVO> listIngSearch(SearchCriteria cri) throws Exception {
		return sqlSession.selectList(namespace + ".listIngSearch", cri);

	}

	@Override
	public List<AnnVO> listEndSearch(SearchCriteria cri) throws Exception {
		return sqlSession.selectList(namespace + ".listEndSearch", cri);
	}

	@Override
	public int listIngSearchCount(SearchCriteria cri) throws Exception {
		return sqlSession.selectOne(namespace + ".listIngSearchCount", cri);
	}

	@Override
	public int listEndSearchCount(SearchCriteria cri) throws Exception {
		return sqlSession.selectOne(namespace + ".listEndSearchCount", cri);
	}

	@Override
	public List<AnnVO> listIESearch(SearchCriteria cri) throws Exception {
		return sqlSession.selectList(namespace + ".listIESearch", cri);
	}

	@Override
	public int listIESearchCount(SearchCriteria cri) throws Exception {
		return sqlSession.selectOne(namespace + ".listIESearchCount", cri);
	}

	@Override
	public List<AnnVO> listSearchResult(SearchCriteria cri) throws Exception {
		return sqlSession.selectList(namespace + ".listSearchResult", cri);
	}

	@Override
	public int listSearchCountResult(SearchCriteria cri) throws Exception {
		return sqlSession.selectOne(namespace + ".listSearchCountResult", cri);
	}

	@Override
	public void deadLineUpdate() throws Exception {
		sqlSession.update(namespace + ".deadLineUpdate");
		System.out.println("업데이트 실행");
	}

}
