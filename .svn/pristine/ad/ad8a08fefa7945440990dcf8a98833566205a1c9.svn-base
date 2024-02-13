<%--
* [[개정이력(Modification Information)]]
* 수정일                 수정자      수정내용
* ----------  ---------  -----------------
* 2023. 11. 15.      작성자명      최초작성
* Copyright (c) 2023 by DDIT All right reserved
 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security"%>
  <link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
 <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
 <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
 
<h1 class="page-header" data-maxno="${selectMaxNo}" data-maxzindex="${selectMaxZindex }">메모 <button onclick="insertOpenModal()" class="btn btn-danger round_btn " data-bs-toggle="modal" data-bs-target="#enableOTP" _msttexthash="15070224" _msthash="286"><span class="glyphicon glyphicon-plus"> 
    <i class="tf-icons navbar-icon bx bx-plus"></i></span></button>
</h1>


<div class="card-header py-3">
	<ul class="nav nav-pills" role="tablist">
		<li class="nav-item" role="presentation">
			
		</li>

	</ul>
</div>


<script src="${pageContext.request.contextPath }/resources/js/app/memo/memo.js"></script>

<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/memo/memo.css">


    <!-- 모달 영역 밖으로 빼어 놓는게 좋음-->
<div id="openMemo" class="modal-dialog modal-lg modal-simple modal-add-new-address" _mstvisible="1">
	<div class="modal-content p-3 p-md-5" _mstvisible="2">
		<div class="modal-body" _mstvisible="3">
			<button onclick="fMClose()" type="button" class="btn-close" data-bs-dismiss="modal" aria-label="닫다" _mstaria-label="59709" _msthash="363" _mstvisible="4"></button>
				<div class="text-center mb-4" _mstvisible="4">
					<h3 class="address-title" _msttexthash="28777372" _msthash="364" _mstvisible="5">메모</h3>
					<p class="address-subtitle" _msttexthash="97182306" _msthash="365" _mstvisible="5">( 추가 )</p>
				</div>
			<form method="post" id="addNewAddressForm" class="row g-3 fv-plugins-bootstrap5 fv-plugins-framework" onsubmit="return false" novalidate="novalidate" _mstvisible="4">
				<div class="col-12 col-md-6 fv-plugins-icon-container" _mstvisible="5">
					
					색상<select id="memoBColor" name="memoBColor">
					    <option value="https://t1.daumcdn.net/cfile/tistory/99CFEA355BCF1E8106?original" style='background:#f3ef6f' selected>노랑</option>
					    <option value="https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Ft1.daumcdn.net%2Fcfile%2Ftistory%2F994BCD355BCF1E8228" style='background:#b4f1ee'>파랑</option>
					    <option value="https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Ft1.daumcdn.net%2Fcfile%2Ftistory%2F995BAE355BCF1E830C" style='background:#f1b4e9'>분홍</option>
					    <option value="https://t1.daumcdn.net/cfile/tistory/990F92355BCF1E8404?original" style='background:#b4f1d5'>초록</option>
					    <option value="https://t1.daumcdn.net/cfile/tistory/990F72355BCF1E8404?original" style='background:#d1b4f1'>보라</option>
					    <option value="https://t1.daumcdn.net/cfile/tistory/99A923355BCF1E8531?original" style='background:#ebc595'>주황</option>
					</select><br/>
					메모 <textarea name="memoContent" id="memoContent" cols="25" rows="8" ></textarea><br>
					즐겨찾기 <input type="checkbox" id="memoCheck" name="memoCheck"><br>
					<div class="fv-plugins-message-container fv-plugins-message-container--enabled invalid-feedback" _mstvisible="6"></div>
				</div>
			
				<input type="button" id="addMemo" class="btn btn-primary" value="등록" />
				<security:csrfInput/>
			</form>
		</div>
	</div>
</div>
