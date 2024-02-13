package kr.or.ddit.groupware.board.kim.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.vo.PaginationInfo;
import kr.or.ddit.vo.groupware.BoardVO;

@Mapper
public interface KimBoardDAO {

	public List<BoardVO> selectBoardList(PaginationInfo<BoardVO> paging);

	public int selectTotalRecord(PaginationInfo<BoardVO> paging);


}
