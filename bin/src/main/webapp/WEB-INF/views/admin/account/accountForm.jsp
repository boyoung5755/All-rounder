<%--
* 계정생성폼
* [[개정이력(Modification Information)]]
* 수정일       수정자        수정내용
* ----------  ---------  -----------------
* 2023. 11. 19.      김보영        최초작성
* Copyright (c) 2023 by DDIT All right reserved
 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>   


<h4 class="py-3 mb-4"><span class="text-muted fw-light"><i class='bx bxs-universal-access'></i>직원계정관리</span></h4>

<div class="row fv-plugins-icon-container">
  <div class="col-md-12">
    <ul class="nav nav-pills flex-column flex-md-row mb-3">
      <li class="nav-item">
        <a class="nav-link active" href="/account/form"><i class="bx bx-user me-1"></i> 생성</a>
      </li>
      <li class="nav-item">
        <a class="nav-link " href="/account/home"><i class="bx bx-user me-1"></i> 수정</a>
      </li>
      <li class="nav-item">
        <a class="nav-link " href="/account/home"><i class="bx bx-user me-1"></i> 목록</a>
      </li>
    </ul>
    <div class="card mb-4">
      <div class="card-body">
        <form action="/account/insert"  enctype="multipart/form-data" id="formAccountSettings" method="POST" 
          class="fv-plugins-bootstrap5 fv-plugins-framework" >
          <security:csrfInput/>
          <div class="row">
            <h5 class="card-header">프로필 사진</h5>
            <!-- Account -->
            <div class="card-body">
              <div class="d-flex align-items-start align-items-sm-center gap-4">
                <img src="/resources/images/basic.png" alt="user-avatar" class="d-block rounded" height="100"
                  width="100" id="uploadedAvatar">
                <div>
                  <label class="btn btn-primary mb-3 p-2 rounded" for="input-file">
                    Upload
                  </label>
                  <input type="file" id="input-file" name="empProfileImage" style="display:none;" />
                </div>
              </div>
            </div>
            <hr class="my-0 mb-3">
            <div class="mb-3 col-md-6 fv-plugins-icon-container">
              <label for="firstName" class="form-label">이름</label>
              <input class="form-control" type="text" id="empName" name="empName" value="" autofocus="autofocus" required>
            </div>
            <div class="mb-3 col-md-6 fv-plugins-icon-container">
              <label for="lastName" class="form-label">비밀번호</label>
              <input class="form-control" type="text" name="empPw" id="empPw" value="" required>
            </div>
            <div class="mb-3 col-md-6 fv-plugins-icon-container">
              <label for="lastName" class="form-label">주민번호</label>
              <div class="row">
                <div class="mb-6 col-md-6 ">
                  <input class="form-control" type="text" name="empSsn1" id="empSsn1"  maxlength="6" value="" required>
                </div>
                <div class="mb-6 col-md-1" style="text-align: center;">
                  <H4>-</H4>
                </div>
                <div class="mb-6 col-md-5 ">
                  <input class="form-control" type="password" name="empSsn2" id="empSsn2" value="" maxlength="7" required>
                </div>
              </div>
            </div>
            <div class="mb-3 col-md-6">
              <label for="email" class="form-label">입사일</label>
              <input class="form-control" type="date" id="empHiredate" name="empHiredate" value="" required>
            </div>
            <div class="mb-3 col-md-6">
              <label for="email" class="form-label">E-mail</label>
              <input class="form-control" type="email" id="empMail" name="empMail" value="" required>
            </div>
            <div class="mb-3 col-md-6 ">
              <label for="lastName" class="form-label">부서명</label>
              <select id="deptCd" class="form-select" tabindex="0" name="deptCd" required>
	                <option value="">선택</option>
	              	<c:forEach items="${deptList}" var="dept">
		                <option value="${dept.deptCd }">${dept.deptName }</option>
	              	</c:forEach>
              </select>
            </div>
            <div class="mb-3 col-md-6 ">
              <label for="lastName" class="form-label">상급자</label>
              <select id="empSuprr" class="form-select" tabindex="0" name="empSuprr" required>
                <!-- 비동기 -->
              </select>
            </div>
            <div class="mb-3 col-md-6 ">
              <label for="lastName" class="form-label">직급</label>
              <select id="empRank" class="form-select" tabindex="0" name="empRank" required>
                <option value="">선택</option>
	              	<c:forEach items="${rankList}" var="rank">
		                <option value="${rank.commonCodeCd}">${rank.commonCodeSj }</option>
	              	</c:forEach>
              </select>
            </div>
            <div class="mb-3 col-md-6 ">
              <label for="lastName" class="form-label">직책</label>
              <select id="empPosition" class="form-select" tabindex="0" name="empPosition" required>
                <option selected value="팀원">팀원</option>
                <option value="팀장">팀장</option>
              </select>
            </div>
            <div class="mb-3 col-md-6">
              <label class="form-label" for="phoneNumber">휴대전화</label>
              <div class="input-group input-group-merge">
                <span class="input-group-text">010</span>
                <input type="text" id="empTelno" name="empTelno" class="form-control" required>
              </div>
            </div>
            <div class="mb-3 col-md-6">
              <label class="form-label" for="phoneNumber">내선전화</label>
              <div class="input-group input-group-merge">
                <span class="input-group-text">070</span>
                <input type="text" id="empExtension" name="empExtension" class="form-control" >
              </div>
            </div>
            <div class="mb-3 col-md-6">
              <label for="address" class="form-label">우편번호</label>
              <div class="row">
                <div class="mb-6 col-md-9">
                  <input class="form-control" type="text" name="empZip" id="empZip" maxlength="5" required>
                </div>
                <div class="mb-6 col-md-3 ">
                  <button class="btn btn-primary" onclick="execDaumPostcode()">검색</button>
                </div>
              </div>
            </div>
            <div class="mb-3 col-md-6">
              <label for="state" class="form-label">도로명주소</label>
              <input class="form-control" type="text" id="empAdres" name="empAdres"  required>
            </div>
            <div class="mb-3 col-md-6">
              <label for="zipCode" class="form-label">상세주소</label>
              <input type="text" class="form-control" id="empAdresDetail" name="empAdresDetail" required>
            </div>
            <div class="mb-3 col-md-6">
              <label for="empSignImg" class="form-label">서명이미지</label>
              <input type="file" class="form-control" id="empSignImage" name="empSignImage" >
            </div>
            <div class="mb-3 col-md-6">
              <label for="empQr" class="form-label">QR이미지</label>
              <input type="file" class="form-control" id="empQrImage" name="empQrImage">
            </div>
          </div>
          <div class="mt-2">
            <button type="button" onclick="fn_insertEmp()" class="btn btn-primary me-2">등록</button>
            <button type="button" onclick="fn_goList()" class="btn btn-label-secondary">취소</button>
            <button type="button" class="btn btn-label-secondary">시연용</button>
          </div>
        </form>
      </div>
      <!-- /Account -->
    </div>
  </div>
</div>

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/app/admin/account/account.js"></script>