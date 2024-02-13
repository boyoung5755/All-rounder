package kr.or.ddit.groupware.board.kim.service;

import java.util.List;

import kr.or.ddit.vo.PaginationInfo;
import kr.or.ddit.vo.groupware.BoardVO;

public interface KimBoardService {

	/**
	 * 게시판 목록페이징
	 * @param paging
	 */
	public List<BoardVO> retrieveBoardList(PaginationInfo<BoardVO> paging);

}
