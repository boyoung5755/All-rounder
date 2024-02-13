<%--
* [[개정이력(Modification Information)]]
* 수정일       수정자        수정내용
* ----------  ---------  -----------------
* 2024. 1. 21.      김보영        최초작성
* Copyright (c) 2024 by DDIT All right reserved
 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>        
 
 
<!-- Layout wrapper -->
<div class="layout-wrapper layout-content-navbar">
  <div class="layout-container">
    <!-- Layout container -->
    <div class="layout-page">
      <!-- Content wrapper -->
      <div>
        <!-- Content -->
        <!--게시판테이블-->
        <div class="card">
          <div class="table-responsive text-nowrap card-body">
            <h5 class="card-title"><i class='bx bx-book-heart bx-md mb-1'></i>게시판연습</h5>
            <hr>
            <table class="table card-table">
              <colgroup>
			   	<col width="10%" />
			   	<col width="45%" />
			   	<col width="10%" />
			   	<col width="20%" />
			   	<col width="15%" />
 	  		</colgroup>
              <thead>
                <tr>
                  <th>NO</th>
                  <th>제목</th>
                  <th>작성자</th>
                  <th>작성일</th>
                  <th>조회수</th>
                </tr>
              </thead>
              <tbody id="boardList" class="table-border-bottom-0">
                <!-- 게시판 비동기 -->
              </tbody>
              <tfoot id="boardPaging">
              </tfoot>
            </table>
          </div>
        </div>
      </div>
    </div>
    <!-- /Content -->
  </div>
  <!-- /Content wrapper -->
</div>
<!-- /Layout container -->


<script type="text/javascript">

$(function(){

  fn_boardPaging();

});


function fn_boardPaging(){
	
	let formData = $('#searchForm').serialize();
	
	let settings = {
		url : '/kim/boardList',
		contentType : 'application/json',
		method : 'get',
		data : formData,
		dataType: 'json'
	};
	
	let trTag='';
	
	$.ajax(settings).done(function (resp){
		
		let pagingBoardList = resp.paging.dataList;
		let simpleCondition = resp.paging.simpleCondition;
		
		if(pagingBoardList[0] != null){
			
			$.each(pagingBoardList, function(i,v){

        if(v.bbsNo != null){
          trTag +=`
            <tr>
              <td>\${v.rnum}</td>
              <td>\${v.bbsSj}</td>
              <td>\${v.writer}</td>
              <td>\${v.bbsRdate}</td>
              <td>\${v.bbsRdcnt}</td>
            </tr> 
          `;
        }else{
          trTag +=`
            <tr>
              <td colspan='5'>내역 없음</td>
            </tr>  
          `;
        }

        $('#boardList').html(trTag);
      });

      trTag = `
				<tr>
					<td colspan="6">
							<hr class="my-0 mb-3 mt-2">
						\${resp.paging.pagingHTML}
						<form id="searchForm">
							<div id ="searchUI" class="row g-3 d-flex justify-content-center">
								<input type="hidden" name="page" readonly="readonly"/>
								<div class="col-auto">
									<select name="searchType" class="form-select"> 
										<option value="" >전체</option>
										<option value="title" \${simpleCondition.searchType == "title" ? 'selected' : ''} >제목</option>
										<option value="writer" \${simpleCondition.searchType == "writer" ? 'selected' : ''}>작성자</option>
									</select>
								</div>
								<div class="col-auto">
									<input name="searchWord" placeholder="입력하세요" class="form-control" 
										value="\${simpleCondition.searchWord != null ? simpleCondition.searchWord :''}"/>
								</div>
								<div class="col-auto">
									<input type="button" value="검색" id="searchBtn" class="btn btn-primary" />
								</div>
							</div>
						</form>
					</td>
				</tr>
				`;
        $('#boardPaging').html(trTag);
		}
		
	});
}



function fn_paging(page){
  searchForm.page.value = page ;
  fn_boardPaging();
}


$(document).on('click','#searchBtn', function(){

  fn_boardPaging();

})


</script>
