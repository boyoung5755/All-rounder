<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>  
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>  
<security:csrfInput/>
<div class="layout-wrapper layout-content-navbar">
	<div class="layout-container">
		<!-- Layout container -->
		<div class="layout-page">

			<!-- Content wrapper -->
			<div>
				<!-- Content -->
				<div class="row mb-5">
						<div class="card mb-4" style="width: 68%; ">
							<div class="card-body">
								<!--이부분에서 작업-->
							</div>
						</div>
						<div class="card mb-4" style="width: 30%; margin-left:2%;">
							<div class="card-body">
								<!--이부분에서 작업-->
							</div>
						</div>
						<div class="card mb-4" style="width: 38%; margin-right:2%; text-align: center;">
							<div class="card-body" style="backgroung-color:white;">
								<!--이부분에서 작업-->
								<button onclick="updLog(this)" id="work" value="N">근무</button>
								<button onclick="updLog(this)" id="meeting" value="M">회의</button>
								<button onclick="updLog(this)" id="externalWork" value="E">외근</button>
								<button onclick="updLog(this)" id="businessTrip" value="B">출장</button>
								<button onclick="updLog(this)" id="outing" value="O">외출</button>
							</div>
						</div>
						<div class="card mb-4" id="attendanceStart" style="width: 18%; margin-right:2%; margin-bottom: 0%;">
							<div class="card-body" id="attendanceLog">
								<!--이부분에서 작업-->
							</div>
						</div>
						<div class="card mb-4" style="width: 40%;">
							<div class="card-body">
								<!--이부분에서 작업-->
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

<script src="/resources/js/app/attebdabce/attendanceLog.js"></script>