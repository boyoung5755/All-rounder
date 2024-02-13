<%--
* [[개정이력(Modification Information)]]
* 수정일           수정자      수정내용
* ----------  ---------  -----------------
* 2023. 11. 15.  전수진      최초작성
* 2023. 11. 16.  전수진      결재선 조직도 추가
* 2023. 11. 18.  전수진      결재라인즐겨찾기 ajax 추가
* Copyright (c) ${year} by DDIT All right reserved
 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<script src="${pageContext.request.contextPath }/resources/js/ckeditor/ckeditor.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jstree/3.2.1/jstree.min.js"></script>

<style>
	.card-header {
		text-align: center;
		font-weight: 800;
		background-color: #fff;
	}
	.first {
		height: 450px;
	}
</style>

<div class="content-wrapper">
<!-- Content -->
	<div class="container-xxl flex-grow-1 container-p-y">
		<button >결재상신</button> <button>임시저장</button>
		<div class="row">
		<!-- User Content -->
			<div class="col-xl-8 col-lg-7 col-md-7 order-1 order-md-0">
				<div class="card mb-4">
					<div class="card-body">
						<h2 class="card-header">${formSet.formNm }</h2>
							<div class="table-responsive mb-3">
								<form:form id="sanctionForm" modelAttribute="newSanction" >
								<table style="border-collapse: collapse; height: 30x; width: 100%">
									<tbody>
										<tr>
											<td style="background-color: #e2e2e2; border-color: black; border-style: solid; border-width: 1px; height: 25px; text-align: center; width: 15%;">
												<strong><span style="font-size: 11px">제목(필수*)</span></strong>
											</td>
											<td style="border-color: black;	border-style: solid; border-width: 1px; height: 30px;">
												<form:input type="text" path="sanctnSj" style="width: 100%"  required="true" />
												<form:errors path="sanctnSj" element="span" cssClass="error" />
											</td>
										</tr>
										<tr>
											<td style="background-color: #e2e2e2; border-color: black; border-style: solid;	border-width: 1px; height: 25px; text-align: center; width: 15%;">
												<strong><span style="font-size: 11px">작성일자</span></strong>
											</td>
											<td style="border-color: black;	border-style: solid; border-width: 1px;	height: 30px;">
												<input type="text"	name="sanctnDate" id="sanctnDate" style="width: 100%" placeholder="자동생성" readonly/>
											</td>
										</tr>
										<tr>
											<td	style="background-color: #e2e2e2; border-color: black; border-style: solid;	border-width: 1px; height: 25px; text-align: center; width: 15%;">
												<strong><span style="font-size: 11px">작성부서</span></strong>
											</td>
											<td	style="border-color: black;	border-style: solid; border-width: 1px;	height: 30px;">
												<input type="text" style="width: 100%" value="${empVo.dept.deptName }" readonly/>
											</td>
										</tr>
										<tr>
											<td	style="	background-color: #e2e2e2; border-color: black;	border-style: solid; border-width: 1px;	height: 25px; text-align: center; width: 15%;">
												<strong><span style="font-size: 11px">작성자</span></strong>
											</td>
											<td	style="border-color: black;	border-style: solid; border-width: 1px;	height: 30px;">
												<input type="text"	name="drafter" id="drafter" style="width: 100%"	value="${empVo.empName }" readonly/>
											</td>
										</tr>
										<tr>
											<td style="background-color: #e2e2e2; border-color: black; border-style: solid;	border-width: 1px; height: 25px; text-align: center; width: 15%;">
												<strong><span style="font-size: 11px">수신자</span></strong>
											</td>
											<td	style="border-color: black;	border-style: solid; border-width: 1px; height: 30px;">
												<select
				                                class="select2 select-email-contacts form-select"
				                                name="sanctnRcyer" id="sanctnRcyer">
				<!--                                 <option data-avatar="1.png" value="Jane Foster">Jane Foster</option> -->
				<!--                                 <option data-avatar="3.png" value="Donna Frank">Donna Frank</option> -->
				<!--                                 <option data-avatar="5.png" value="Gabrielle Robertson">Gabrielle Robertson</option> -->
				<!--                                 <option data-avatar="7.png" value="Lori Spears">Lori Spears</option> -->
				<!--                                 <option data-avatar="9.png" value="Sandy Vega">Sandy Vega</option> -->
				<!--                                 <option data-avatar="11.png" value="Cheryl May">Cheryl May</option> -->
				                              </select>
											
											</td>
										</tr>
									</tbody>
								</table>
								<br />
								<div class="mb-3">
									<textarea rows="20"	cols="50" name="sanctnSourc" id="sanctnSourc">${formSet.formSourc }</textarea>
								</div>
							</form:form>
						</div>
					</div>
				</div>
			</div>

			<div class="col-xl-4 col-lg-5 col-md-5 order-0 order-md-1">
				<div class="card mb-4">
					<div class="card-body first">
						<div class="d-flex justify-content-center pt-3">
							<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#addLine">결재선추가</button>

							<div class="btn-group">
								<button type="button" id="bookmarkList" class="btn btn-primary btn-icon rounded-pill dropdown-toggle hide-arrow" data-bs-toggle="dropdown" aria-expanded="false">
									<i class="bx bx-star"></i>
								</button>
								<ul id="dropdownMenu" class="dropdown-menu dropdown-menu-end" style=""></ul>
							</div>
						</div>
						<h5 class="pb-2 border-bottom mb-4">결재선</h5>
						${empVo.empName } ${empVo.common.commonCodeSj }
						<form>
							<div class="info-container" id="sanctionLine">
							</div>
						</form>
					</div>
				</div>
				<div class="card mb-4">
					<div class="card-body second">
						<div class="mb-3">
							<label class="form-label">첨부파일</label>
							<input type="file" name="attaches" class=" form-control" form="sanctionForm" id="attaches" multiple />
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<!-- Modal 띄우기 -->
<!-- Large Modal -->
<div class="modal fade" id="addLine" tabindex="-1" aria-hidden="true">
	<div class="modal-dialog modal-lg" role="document">
		<div class="modal-content">
			<div class="modal-header pb-2 border-bottom mb-4">
				<h5 class="modal-title" id="exampleModalLabel3">결재선 지정</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			</div>
			
			<div class="modal-body">
				<div class="row">
					<div class="col mb-3">
						제1영역
						<div id="orgTreeContainer"></div>
						사원, 부서 검색영역
					</div>
					<div class="col mb-0">제2영역
						<button type="button" id="remove">비우기</button>
						<br />
						즐겨찾기 버튼(옵셔널 느낌) <br /> 현재 선택된 결재선을 즐겨찾기하고 싶을 경우 사용 <br />
						<input type="text" id="bookmark" /><button type="button" id="saveBtn">저장</button>
						<div id="orgTreeResult"></div>
					</div>
				</div>
			</div>
			
			<div class="modal-footer">
				<button type="button" id="closeBtn" class="btn btn-label-secondary" data-bs-dismiss="modal">닫기</button>
				<button type="button" id="addBtn" class="btn btn-primary" >확인</button>
			</div>
		</div>
	</div>
</div>
<script type="text/javascript">
	$(function () {
		CKEDITOR.replace("sanctnSourc");
	});
</script>
<script src="${pageContext.request.contextPath }/resources/js/app/sanction/sanctionDoc.js"></script>
