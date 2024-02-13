package kr.or.ddit.pms.gantt.dao;

import static org.junit.jupiter.api.Assertions.*;

import java.util.List;

import javax.inject.Inject;

import org.junit.jupiter.api.Test;
import org.springframework.test.context.junit.jupiter.web.SpringJUnitWebConfig;

import kr.or.ddit.vo.pms.PjobVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@SpringJUnitWebConfig(locations = "file:src/main/resources/kr/or/ddit/spring/*-context.xml") 
class GanttDAOTest {

	@Inject
	private GanttDAO ganttDAO;
	
	@Test
	void testSelectPjobList() {
		//테스트할 대상 PjobVO 객체 생성
		PjobVO pj = new PjobVO();
		//테스트하기위한 selectGanttchoice 메서드 호출
		List<PjobVO> res = ganttDAO.selectGanttchoice(pj); 
		//결과 로그 
		log.info("{}",res);
	}

}
 