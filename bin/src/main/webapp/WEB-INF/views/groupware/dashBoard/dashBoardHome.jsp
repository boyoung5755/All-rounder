<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>

<%--
* [[개정이력(Modification Information)]]
* 수정일                 수정자      수정내용
* ----------  ---------  -----------------
* ${date}      작성자명      최초작성
	2023-11-16	권도윤	근태 수정
* Copyright (c) ${year} by DDIT All right reserved
 --%>

<!-- Layout wrapper -->
<security:csrfInput/>
<div class="layout-wrapper layout-content-navbar">
	<div class="layout-container">
		<!-- Layout container -->
		<div class="layout-page">

			<!-- Content wrapper -->
			<div>
				<!-- Content -->
				<h3 class="pb-1 mb-4 text-muted">${emp}님안녕하세요</h3>

				<div class="row mb-5">
					<div class="col-md-6 col-lg-4">
						<h6 class="mt-2 text-muted">날씨</h6>
						<div class="card mb-4">
							<div class="card-body" id="weather">
								<!--이부분에서 작업-->

							</div>
						</div>
						<h6 class="mt-2 text-muted">프로필</h6>
						<div class="card mb-4">
							<div class="card-body">
								<!--이부분에서 작업-->
							</div>
						</div>
						<h6 class="mt-2 text-muted">근태</h6>
						<div class="card mb-4" style="text-align: center;">
							<div class="card-body">
								<button onclick="commute()" id="commute"></button>
							</div>
						</div>
					</div>
					<div class="col-md-6 col-lg-4">
						<h6 class="mt-2 text-muted">근태현황</h6>
						<div class="card mb-4">
							<div class="card-body">
								<!--이부분에서 작업-->
							</div>
						</div>
						<h6 class="mt-2 text-muted">내결재</h6>
						<div class="card mb-4">
							<div class="card-body">
								<!--이부분에서 작업-->
							</div>
						</div>
					</div>
					<div class="col-md-6 col-lg-4">
						<h6 class="mt-2 text-muted">공지사항</h6>
						<div class="card mb-4">
							<div class="card-body">
								<!--이부분에서 작업-->
							</div>
						</div>
						<h6 class="mt-2 text-muted">내 일감</h6>
						<div class="card mb-4">
							<div class="card-body">
								<!--이부분에서 작업-->
							</div>
						</div>
						<h6 class="mt-2 text-muted">오늘의 연차자</h6>
						<div class="card mb-4">
							<div class="card-body">
								<!--이부분에서 작업-->
							</div>
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
</div>

<script src="/resources/js/app/weather/weather.js"></script>
<script src="/resources/js/app/attebdabce/attendance.js"></script>
