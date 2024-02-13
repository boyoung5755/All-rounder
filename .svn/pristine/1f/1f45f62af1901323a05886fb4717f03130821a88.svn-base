<%--
* [[개정이력(Modification Information)]]
* 수정일       		수정자        수정내용
* ---------- 		---------  -----------------
* 2023. 11. 10.     김보영        최초작성
* 2023. 11. 14.     김보영        일감리스트
* Copyright (c) 2023 by DDIT All right reserved
--%>



<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>        



<h1 class="mb-0">프로젝트명</h1><br>
<!-- Layout wrapper -->
<div class="layout-wrapper layout-content-navbar">
  <div class="layout-container">
    <!-- Layout container -->
    <div class="layout-page">
      <!-- Content wrapper -->
      <div>
        <!-- Content -->
        <!-- navbar -->
        
        <div class="col-md-7 col-lg-7">
			<ul class="nav nav-pills mb-3 nav-fill" role="tablist">
			  <li class="nav-item" role="presentation">
			    <a class="nav-link dropdown-toggle" href="javascript:void(0);" data-bs-toggle="dropdown"
                    aria-expanded="false" data-trigger="hover">
                    <i class='bx bxs-copy-alt'></i>
                    　프로젝트</a>
                  <div class="dropdown-menu">
                    <c:forEach items="${proj}" var="proj">
                      <c:if test="${proj.proSttus == 1}">
                        <a class="dropdown-item" href="#">${proj.proNm}</a>
                      </c:if>
                    </c:forEach>
                  </div>
			  </li>
			  <li class="nav-item" role="presentation">
			    <a class="nav-item nav-link active" href="javascript:void(0)">
			    	<i class='bx bx-edit'></i>
			    　일감</a>
			  </li>
			  <li class="nav-item" role="presentation">
			    <a class="nav-item nav-link" href="/issue/${proSn}/home">
			    	<i class='bx bx-calendar-exclamation' ></i>
			    　이슈</a>
			  </li>
			  <li class="nav-item" role="presentation">
			   <a class="nav-item nav-link" href="/pms/gantt/${proSn}">
			   		<i class='bx bx-chart'></i>
			   　간트차트</a>
			  </li>
			  <li class="nav-item" role="presentation">
			    <a class="nav-item nav-link disabled" href="javascript:void(0)">
			    	<i class='bx bxs-doughnut-chart'></i>
			    　리더통계</a>
			  </li>
			</ul>
		</div>
        <!-- /navbar -->

        <!-- 일감 진행상태 -->
        <div class="card mb-4">
          <div class="card-widget-separator-wrapper">
            <div class="card-body card-widget-separator">
              <div class="row gy-4 gy-sm-1">
                <div class="col-sm-20 col-lg-20" style="width: 20%;">
                  <div class="d-flex justify-content-between align-items-start card-widget-1 border-end pb-3 pb-sm-0">
                    <div>
                      <h3 class="mb-2">${jobCnt.aaCnt}</h3>
                      <p class="mb-0">진행</p>
                    </div>
                    <div class="avatar me-sm-4">
                      <span class="avatar-initial rounded bg-label-secondary">
                        <i class="bx bx-calendar bx-sm"></i>
                      </span>
                    </div>
                  </div>
                  <hr class="d-none d-sm-block d-lg-none me-4">
                </div>
                <div class="col-sm-20 col-lg-20" style="width: 20%;">
                  <div class="d-flex justify-content-between align-items-start card-widget-2 border-end pb-3 pb-sm-0">
                    <div>
                      <h3 class="mb-2">${jobCnt.bbCnt}</h3>
                      <p class="mb-0">요청</p>
                    </div>
                    <div class="avatar me-lg-4">
                      <span class="avatar-initial rounded bg-label-secondary">
                        <i class="bx bx-check-double bx-sm"></i>
                      </span>
                    </div>
                  </div>
                  <hr class="d-none d-sm-block d-lg-none">
                </div>
                <div class="col-sm-20 col-lg-20" style="width: 20%;">
                  <div class="d-flex justify-content-between align-items-start card-widget-2 border-end pb-3 pb-sm-0">
                    <div>
                      <h3 class="mb-2">${jobCnt.ccCnt}</h3>
                      <p class="mb-0">피드백</p>
                    </div>
                    <div class="avatar me-lg-4">
                      <span class="avatar-initial rounded bg-label-secondary">
                        <i class="bx bx-check-double bx-sm"></i>
                      </span>
                    </div>
                  </div>
                  <hr class="d-none d-sm-block d-lg-none">
                </div>
                <div class="col-sm-20 col-lg-20" style="width: 20%;">
                  <div class="d-flex justify-content-between align-items-start border-end pb-3 pb-sm-0 card-widget-3">
                    <div>
                      <h3 class="mb-2">${jobCnt.ddCnt}</h3>
                      <p class="mb-0">보류</p>
                    </div>
                    <div class="avatar me-sm-4">
                      <span class="avatar-initial rounded bg-label-secondary">
                        <i class="bx bx-wallet bx-sm"></i>
                      </span>
                    </div>
                  </div>
                </div>
                <div class="col-sm-20 col-lg-20" style="width: 20%;">
                  <div class="d-flex justify-content-between align-items-start">
                    <div>
                      <h3 class="mb-2">${jobCnt.eeCnt}</h3>
                      <p class="mb-0">완료</p>
                    </div>
                    <div class="avatar">
                      <span class="avatar-initial rounded bg-label-secondary">
                        <i class="bx bx-error-alt bx-sm"></i>
                      </span>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
        <!-- /일감 진행상태 -->

        <!--차트와 참여자-->
        <div class="row mb-5">
          <div class="col-md-3 col-lg-3">
            <div class="card mb-3">
              <div class="card-body">
                <h6 class="card-title">내 일감 상태</h6>
                <div>
                  <canvas id="jobChart" style="height:400px"></canvas>
                </div>
              </div>
            </div>
          </div>
          
          <div class="col-md-5 col-lg-5">
            <div class="card  mb-3">
              <div class="card-body">
                <h6 class="card-title">내 일감</h6>
                <div class="overflow-hidden ag-theme-alpine" style="height:400px;">
                	<!-- 해당 프로젝트의 나의 일감 비동기 출력 -->
                	<table class="table card-table">
		              <thead>
		               <tr>
		                 <th>일감명</th>
		                 <th>진행도</th>
		                 <th>마감일</th>
		                 <th>우선순위</th>
		                 <th>상태</th>
		               </tr>
		             </thead>
		             <tbody id="myJob" class="table-border-bottom-0">
						<!-- 일감리스트 비동기출력 -->
		             </tbody>
		           </table>
                </div>
              </div>
            </div>
          </div>
          <div class="col-md-4 col-lg-4">
            <div class="card  mb-3">
              <div class="card-body">
                <h6 class="card-title">참여자</h6>
                <div id="pMemberList" class="ag-theme-alpine" style="height:400px">
                </div>
              </div>
            </div>
          </div>
          
          <div class="col-xl-12 col-12" style="text-align: left;">
            <div class="card-body">
              <div class="block-ui-btn demo-inline-spacing">
                <button type="button" class="btn rounded-pill btn-label-primary" data-bs-toggle="modal"
                  data-bs-target="#backDropModal">
                  <span class="tf-icons bx bx-paper-plane me-1"></span>일감등록
                </button>
              </div>
            </div>
          </div>

          <!--일감테이블-->

        
         <hr class="my-0 mb-3 mt-2">
         <input type="hidden" class="divider-text" data-pro-sn="${proSn}"/> 
          <div class="table-responsive text-nowrap">
            <table class="table card-table">
              <thead>
                <tr>
                  <th>일감명</th>
                  <th>작성자</th>
                  <th>진행도</th>
                  <th>담당자</th>
                  <th>상태</th>
                  <th>마감일</th>
                </tr>
              </thead>
              <tbody id="jobList" class="table-border-bottom-0">
				<!-- 일감리스트 비동기출력 -->
              </tbody>
              <tfoot id="jobPaging">
              </tfoot>
            </table>
          </div>
        </div>
      </div>
      <!-- /Content -->
    </div>
    <!-- /Content wrapper -->
  </div>
  <!-- /Layout container -->
</div>
<!-- /Layout wrapper -->
<%-- <form method="get" id="searchForm" class="border" >
	<hidden name="searchType" readonly="readonly" placeholder="searchType"/>
	<hidden name="searchWord" readonly="readonly" placeholder="searchWord"/>
	<input type="hidden" name="page" readonly="readonly" placeholder="page"/>
</form> --%>

<!-- 일감등록 -->
<div class="modal fade" id="backDropModal" data-bs-backdrop="static" tabindex="-1" style="display: none;"
  aria-hidden="true">

  <div class="modal-dialog">
    <form action="/job/${proSn}/insert" id="jobInsertForm" class="modal-content" method="POST"  enctype="multipart/form-data">
      <security:csrfInput/>
      <input type="hidden" id="tempProSn" value='<c:out value="${proSn}"/>'/>
      <div class="modal-header">
        <h5 class="modal-title" id="backDropModalTitle">일감등록</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
        <hr>
      </div>
      <div class="modal-body">
        <div class="row">
          <div class="col mb-3">
            <label  class="form-label">상위일감 선택</label>
            <select   name ="jobuSn" class="form-select"  tabindex="0" id="roleEx4" required="required">
		        <c:if test="${role eq 'leader'}">
                  <option value="">(선택)</option>
				</c:if>
              <c:forEach items="${jobList}" var="uJob">
                  <option value="${uJob.jobSn}">${uJob.jobSj}</option>
              </c:forEach>
            </select>
          </div>
        </div>
        <div class="row">
          <div class="col mb-3">
            <label for="nameBackdrop" class="form-label">일감명</label>
            <input name="jobSj"  type="text" id="nameBackdrop" class="form-control" placeholder="일감제목을 입력하세요" required />
          </div>
        </div>
        <div class="row g-2" style="text-align: center;">
        <input id="jobStcd" type="hidden" name="jobStcd" value=""/>
          <div class="col mb-3">
          <button onclick="fn_jobStcd('1', this)" type="button" class="btn-jobStcd btn rounded-pill btn-label-success">요청</button>
        </div>
        <div class="col mb-3">
          <button onclick="fn_jobStcd('2', this)" type="button" class="btn-jobStcd btn rounded-pill btn-label-primary">진행</button>
        </div>
        <div class="col mb-3">
          <button onclick="fn_jobStcd('3', this)" type="button"  class="btn-jobStcd btn rounded-pill btn-label-danger">피드백</button>
        </div>
        <div class="col mb-3">
          <button onclick="fn_jobStcd('4', this)" type="button" class="btn-jobStcd btn rounded-pill btn-label-warning">보류</button>
        </div>
        <div class="col mb-3">
          <button onclick="fn_jobStcd('5', this)" type="button" class="btn-jobStcd btn rounded-pill btn-label-info">완료</button>
        </div>
        </div>
        <div class="row g-2">
          <div class="col mb-3">
            <label for="dobBackdrop" class="form-label">시작일</label>
            <input name="jobBdate" type="date" id="dobBackdrop" class="form-control" required>
          </div>
          <div class="col mb-3">
            <label for="dobBackdrop" class="form-label">종료일</label>
            <input name="jobEdate" type="date" id="dobBackdrop" class="form-control" required>
          </div>
        </div>
        <div class="row g-2">
          <div class="col mb-3">
            <label for="dobBackdrop" class="form-label">내용</label>
            <textarea name="jobCn" rows="5" cols="20" id="document-Status" class="form-control" ></textarea>
          </div>
        </div>
        <div class="row g-2">
          <div class="col mb-3">
            <label for="dobBackdrop" class="form-label">첨부파일</label>
            <input type="file" class="form-control" name ="jobFile" />
          </div>
        </div>
        <div class="row g-2">
	      	<div class="col mb-3">
	            <label for="nameBackdrop" class="form-label d-block" >담당자</label>
	             <c:if test="${not empty proM }">
	                <c:forEach items="${proM}" var="proM" varStatus="i">
	                  <div class=" col mx-2 form-check custom-option custom-option-basic mb-3 checked d-inline-block">
                         <label class="form-check-label custom-option-content" for="proM${i.index }">
                           <input class="form-check-input" type="checkbox" id="proM${i.index }" name="tempEmpCd" value="${proM.emp.empCd}">
                           <span class="custom-option-header pb-0">
                             <span class="fw-medium">${proM.emp.empName}</span>
                           </span>
                         </label>
                       </div>
	                </c:forEach>
	              </c:if>
	          </div>
        </div>
        <div class="row g-2">
          <div class="col mb-3">
            <label for="nameBackdrop" class="form-label">진행도</label>
            <select name ="jobProgrs" class="form-select" tabindex="0" id="roleEx4">
                <c:forEach begin="0" end="100" step="10" var="percentage" varStatus="loop">
                  <option value="${percentage}">${percentage}%</option>
                </c:forEach>
            </select>
          </div>
          <div class="col mb-3">
            <label for="nameBackdrop" class="form-label">우선순위</label>
            <select name ="jobPriort" class="form-select" tabindex="0" id="roleEx4">
              <option value="1">긴급</option>
              <option value="2" >높음</option>
              <option value="3"selected>보통</option>
              <option value="4">낮음</option>
            </select>
            <input type="hidden" value="${proSn }" name="proSn"> 
            <input type="hidden" value="" name="jobSn"> 
          </div>
        </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-label-secondary" data-bs-dismiss="modal">
          Close 
        </button>
        <button type="button" onclick="fn_jobInsert()" class="btn btn-primary">Save</button>
      </div>
    </form>
  </div>
</div>




<button style="display:none;" id="btnJobDetailModal" class="btn btn-primary hide" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasBoth" aria-controls="offcanvasBoth"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">
                          스크롤과 배경화면 모두 활성화
                        </font></font></button>
                        
                        
<!-- 오프캔버스-상세 -->  
<div class="offcanvas offcanvas-end " data-bs-scroll="true" tabindex="-1" id="offcanvasBoth"
  aria-labelledby="offcanvasBothLabel" aria-modal="true" role="dialog" style="width: 600px;">
  <div class="offcanvas-header">
    <h5 id="offcanvasBothLabel" class="offcanvas-title">
      <font style="vertical-align: inherit;">
        <font style="vertical-align: inherit;">일감 상세보기</font>
      </font>
    </h5>
    <button type="button" class="btn-close text-reset" data-bs-dismiss="offcanvas" aria-label="닫다"></button>
  </div>
  <div class="offcanvas-body my-auto mx-0 flex-grow-0">
    <!--내용-->
    <div class="card-body">
      <h6>상위 <span class="text-muted">일감번호</span></h6>
      <div class="mb-3 row">
        <label for="html5-text-input" class="col-md-2 col-form-label">프로젝트명</label>
        <div class="col-md-10">
          <input class=" bybo-none form-control" readonly type="text" value="Sneat" id="html5-text-input">
        </div>
      </div>
      <div class="mb-3 row">
        <label for="html5-search-input" class="col-md-2 col-form-label">작성자</label>
        <div class="col-md-10">
          <input class="bybo-none form-control" readonly type="search" value="Search ..." id="html5-search-input">
        </div>
      </div>
      <div class="mb-3 row">
        <label for="html5-date-input" class="col-md-2 col-form-label">작성일</label>
        <div class="col-md-10">
          <input class=" bybo-none form-control" readonly type="date" value="2021-06-18" id="html5-date-input">
        </div>
      </div>
      <div class="mb-3 row">
        <label for="html5-date-input" class="col-md-2 col-form-label">시작일</label>
        <div class="col-md-10">
          <input class=" bybo-none form-control" readonly  type="date" value="2021-06-18" id="html5-date-input">
        </div>
      </div>
      <div class="mb-3 row">
        <label for="html5-date-input" class="col-md-2 col-form-label">종료일</label>
        <div class="col-md-10">
          <input class=" bybo-none form-control" readonly  type="date" value="2021-06-18" id="html5-date-input">
        </div>
      </div>
      <div class="row g-2" style="text-align: center;">
        <input id="jobStcd" type="hidden" name="jobStcd" value=""/>
        <div class="col mb-3">
          <button onclick="fn_jobStcd('1')" type="button" class="btnJobStcd btn-jobStcd btn rounded-pill btn-label-success">요청</button>
        </div>
        <div class="col mb-3">
          <button onclick="fn_jobStcd('2')" type="button" class="btnJobStcd btn-jobStcd btn rounded-pill btn-label-primary">진행</button>
        </div>
        <div class="col mb-3">
          <button onclick="fn_jobStcd('3')" type="button"  class="btnJobStcd btn-jobStcd btn rounded-pill btn-label-danger">피드백</button>
        </div>
        <div class="col mb-3">
          <button onclick="fn_jobStcd('4')" type="button" class="btnJobStcd btn-jobStcd btn rounded-pill btn-label-warning">보류</button>
        </div>
        <div class="col mb-3">
          <button onclick="fn_jobStcd('5', this)" type="button" class="btn-jobStcd btn rounded-pill btn-label-info">완료</button>
        </div>
      </div>
      <div class="mb-3 row">
        <label for="html5-url-input" class="col-md-2 col-form-label">우선순위</label>
        <div class="col-md-10">
          <select name ="jobPriort" class="form-select bybo-none"  disabled tabindex="0" id="roleEx4">
              <option value="1">긴급</option>
              <option value="2" >높음</option>
              <option value="3"selected>보통</option>
              <option value="4">낮음</option>
            </select>
        </div>
      </div>
      <div class="mb-3 row">
        <label for="html5-password-input" class="col-md-2 col-form-label">담당자</label>
        <div class="col-md-10">
          <input class=" bybo-none form-control" readonly type="password" value="password" id="html5-password-input">
        </div>
      </div>
      <div class="mb-3 row">
        <label for="html5-tel-input" class="col-md-2 col-form-label">내용</label>
        <div class="col-md-10">
          <textarea name="jobCn"  readonly rows="5" cols="20" id="document-Status" class="bybo-none form-control"></textarea>
        </div>
      </div>
      <div class="mb-3 row">
        <label for="html5-number-input" class="col-md-2 col-form-label">첨부파일</label>
        <div class="col-md-10">
          <input class="form-control"  type="file" value="18" id="html5-number-input">
          <input class=" bybo-none form-control" readonly type="text" value="첨부파일이름" id="html5-password-input">
        </div>
      </div>
      <div class="mb-3 row">
        <label for="html5-datetime-local-input" class="col-md-2 col-form-label">history</label>
        <div class="col-md-10">
          <input class=" bybo-none form-control" readonly type="text" value="로그" id="html5-password-input">
        </div>
      </div>
      <div class="btn-group" role="group" aria-label="Basic example">
        <button type="button" class="btn btn-label-primary" data-bs-toggle="offcanvas" data-bs-target="#offcanvasBoth2" aria-controls="offcanvasBoth">수정</button>
        <button type="button" class="btn btn-label-danger">삭제</button>
        <button type="button" class="btn btn-label-info">닫기</button>
      </div>
    </div>
    <!--/내용-->
  </div>
</div>


<!-- 오프캔버스-수정,삭제 -->  
<div class="offcanvas offcanvas-end " data-bs-scroll="true" tabindex="-1" id="offcanvasBoth2"
  aria-labelledby="offcanvasBothLabel" aria-modal="true" role="dialog" style="width: 600px;">
  <div class="offcanvas-header">
    <h5 id="offcanvasBothLabel" class="offcanvas-title">
      <font style="vertical-align: inherit;">
        <font style="vertical-align: inherit;">수정</font>
      </font>
    </h5>
    <button type="button" class="btn-close text-reset" data-bs-dismiss="offcanvas" aria-label="닫다"></button>
  </div>
  <div class="offcanvas-body my-auto mx-0 flex-grow-0">
    <!--내용-->
    <div class="card-body">
      <h6>상위 <span class="text-muted">일감번호</span></h6>
      <div class="mb-3 row">
        <label for="html5-text-input" class="col-md-2 col-form-label">프로젝트명</label>
        <div class="col-md-10">
          <input class=" bybo-none form-control" readonly type="text" value="Sneat" id="html5-text-input">
        </div>
      </div>
      <div class="mb-3 row">
        <label for="html5-search-input" class="col-md-2 col-form-label">작성자</label>
        <div class="col-md-10">
          <input class="bybo-none form-control" readonly type="search" value="Search ..." id="html5-search-input">
        </div>
      </div>
      <div class="mb-3 row">
        <label for="html5-date-input" class="col-md-2 col-form-label">작성일</label>
        <div class="col-md-10">
          <input class=" bybo-none form-control" readonly type="date" value="2021-06-18" id="html5-date-input">
        </div>
      </div>
      <div class="mb-3 row">
        <label for="html5-date-input" class="col-md-2 col-form-label">시작일</label>
        <div class="col-md-10">
          <input class=" bybo-none form-control" readonly  type="date" value="2021-06-18" id="html5-date-input">
        </div>
      </div>
      <div class="mb-3 row">
        <label for="html5-date-input" class="col-md-2 col-form-label">종료일</label>
        <div class="col-md-10">
          <input class=" bybo-none form-control" readonly  type="date" value="2021-06-18" id="html5-date-input">
        </div>
      </div>
      <div class="row g-2" style="text-align: center;">
        <input id="jobStcd" type="hidden" name="jobStcd" value=""/>
        <div class="col mb-3">
          <button onclick="fn_jobStcd('1', this)" type="button" class="btn-jobStcd btn rounded-pill btn-label-success">요청</button>
        </div>
        <div class="col mb-3">
          <button onclick="fn_jobStcd('2', this)" type="button" class="btn-jobStcd btn rounded-pill btn-label-primary">진행</button>
        </div>
        <div class="col mb-3">
          <button onclick="fn_jobStcd('3', this)" type="button"  class="btn-jobStcd btn rounded-pill btn-label-danger">피드백</button>
        </div>
        <div class="col mb-3">
          <button onclick="fn_jobStcd('4', this)" type="button" class="btn-jobStcd btn rounded-pill btn-label-warning">보류</button>
        </div>
        <div class="col mb-3">
          <button onclick="fn_jobStcd('5', this)" type="button" class="btn-jobStcd btn rounded-pill btn-label-info">완료</button>
        </div>
      </div>
      <div class="mb-3 row">
        <label for="html5-url-input" class="col-md-2 col-form-label">우선순위</label>
        <div class="col-md-10">
          <select name ="jobPriort" class="form-select bybo-none"  disabled tabindex="0" id="roleEx4">
              <option value="1">긴급</option>
              <option value="2" >높음</option>
              <option value="3"selected>보통</option>
              <option value="4">낮음</option>
            </select>
        </div>
      </div>
      <div class="mb-3 row">
        <label for="html5-password-input" class="col-md-2 col-form-label">담당자</label>
        <div class="col-md-10">
          <input class=" bybo-none form-control" readonly type="password" value="password" id="html5-password-input">
        </div>
      </div>
      <div class="mb-3 row">
        <label for="html5-tel-input" class="col-md-2 col-form-label">내용</label>
        <div class="col-md-10">
          <textarea name="jobCn"  readonly rows="5" cols="20" id="document-Status" class="bybo-none form-control"></textarea>
        </div>
      </div>
      <div class="mb-3 row">
        <label for="html5-number-input" class="col-md-2 col-form-label">첨부파일</label>
        <div class="col-md-10">
          <input class="form-control"  type="file" value="18" id="html5-number-input">
          <input class=" bybo-none form-control" readonly type="text" value="첨부파일이름" id="html5-password-input">
        </div>
      </div>
      <div class="mb-3 row">
        <label for="html5-datetime-local-input" class="col-md-2 col-form-label">history</label>
        <div class="col-md-10">
          <input class=" bybo-none form-control" readonly type="text" value="로그" id="html5-password-input">
        </div>
      </div>
      <div class="btn-group" role="group" aria-label="Basic example">
        <button type="button" class="btn btn-label-primary">수정</button>
        <button type="button" class="btn btn-label-danger">삭제</button>
        <button type="button" class="btn btn-label-info">닫기</button>
      </div>
    </div>
    <!--/내용-->
  </div>
</div>















                        



<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script>var __basePath = './';</script>
<script src="https://cdn.jsdelivr.net/npm/ag-grid-community@30.2.1/dist/ag-grid-community.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/app/job/job.js"></script>

<script>

	
	
  /*chart.js  */
  document.addEventListener("DOMContentLoaded", function () {

    const ctx = document.querySelector('#jobChart');
    const data = {
      labels: [
        '요청',
        '진행',
        '피드백',
        '보류',
        '완료'
      ],
      datasets: [{
        label: '내 일감 상태',
        data: [${ jobCnt.aaCnt }, ${ jobCnt.bbCnt }, ${ jobCnt.ccCnt }, ${ jobCnt.ddCnt }, ${ jobCnt.eeCnt }],
        backgroundColor: [
          'rgb(232, 250, 223)',
          'rgb(231, 231, 255)',
          'rgb(255, 224, 219)',
          'rgb(255, 242, 214)',
          'rgb(215, 245, 252)'
        ],
        hoverOffset: 4
      }]
    };

    const jobChart = new Chart(ctx, {
      type: 'doughnut',
      data: data
    });
  })



  /* 참여자 AG-GRID */
  const gridOptions = {
    // define grid columns
    columnDefs: [
      { 
    	  field: 'empProfileImg', headerName: '사진'
  			, cellRenderer: function (row) {
  				if (row.data.empProfileImg != null) {
  					return "<img src='" + row.data.empProfileImg + "' style='height: 80%;'/>";
  				}else{
  					return "<img src='/resources/images/basic.png' style='height: 80%;'/>";
  				}
  			}  
      },
      { field: 'proLeader', headerName: '구분' },
      { field: 'deptName', headerName: '부서' },
      { field: 'empName', headerName: '이름' },
    ],
    rowHeight: 50,
    defaultColDef: {
      sortable: true,
      resizable: true,
      filter: true,
      width: 90,
    },
    pagination: true,
    paginationAutoPageSize: false,
    paginationPageSize: 5
  };

  document.addEventListener('DOMContentLoaded', function () {
    var gridDiv = document.querySelector("#pMemberList");
    new agGrid.Grid(gridDiv, gridOptions);


    const httpRequest = new XMLHttpRequest();
    httpRequest.open('GET', '/job/${proSn}/pMemberList');
    httpRequest.send();

    httpRequest.onreadystatechange = function () {
      if (httpRequest.readyState === 4 && httpRequest.status === 200) {
        httpResult = JSON.parse(httpRequest.responseText);

        var json = [];
        for (var i = 0; i < httpResult.proM.length; i++) {
          var obj = new Object();
          obj.empProfileImg = httpResult.proM[i].emp.empProfileImg;
          obj.proLeader = (httpResult.proM[i].proLeader === 'N') ? '팀원' : '리더';
          obj.deptName = httpResult.proM[i].emp.dept.deptName;
          obj.empName = httpResult.proM[i].emp.empName;
          json.push(obj);
        }

        gridOptions.api.setRowData(json);
      }
    };
  });
  

</script>