package kr.or.ddit.groupware.board.kim.controller;

import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.groupware.board.kim.service.KimBoardService;
import kr.or.ddit.vo.PaginationInfo;
import kr.or.ddit.vo.SearchVO;
import kr.or.ddit.vo.groupware.BoardVO;

@Controller
@RequestMapping("/kim")
public class KimBoardController {
	
	@Inject
	private KimBoardService service;
	
	@GetMapping("home")
	public String kimBoardHome() {
		
		return "kim/boardHome";
	}
	
	
	@GetMapping("boardList")
	@ResponseBody
	public Map<String,PaginationInfo<BoardVO>> boardList(
			@RequestParam(value = "page", required = false, defaultValue = "1") int currentPage
			, @ModelAttribute("simpleCondition") SearchVO simpleCondition	
		){
		
		Map<String, PaginationInfo<BoardVO>> map = new HashMap<String, PaginationInfo<BoardVO>>();
		
		
		BoardVO board = new BoardVO();
		
		//페이지
		PaginationInfo<BoardVO> paging = new PaginationInfo<BoardVO>(5,3);
		paging.setDetailCondition(board);	//키워드 검색 조건
		paging.setSimpleCondition(simpleCondition);
		
		paging.setCurrentPage(currentPage);
		service.retrieveBoardList(paging);
		
		map.put("paging", paging);
		
		return map;
	}

}
