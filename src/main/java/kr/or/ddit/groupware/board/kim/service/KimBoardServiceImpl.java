package kr.or.ddit.groupware.board.kim.service;

import java.util.List;

import org.springframework.stereotype.Service;

import kr.or.ddit.groupware.board.kim.dao.KimBoardDAO;
import kr.or.ddit.vo.PaginationInfo;
import kr.or.ddit.vo.groupware.BoardVO;
import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class KimBoardServiceImpl implements KimBoardService{
	
	private final KimBoardDAO dao;

	@Override
	public List<BoardVO> retrieveBoardList(PaginationInfo<BoardVO> paging) {
		
		int totalRecord = dao.selectTotalRecord(paging);
		paging.setTotalRecord(totalRecord);
		List<BoardVO> dataList = dao.selectBoardList(paging);
		paging.setDataList(dataList);
		
		return dataList;
		
	}
	
	
	
	

}
