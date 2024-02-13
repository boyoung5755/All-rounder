<%--
* [[개정이력(Modification Information)]]
* 수정일           수정자      수정내용
* ----------  ---------  -----------------
* 2023. 11. 11.  전수진      최초작성
* Copyright (c) ${year} by DDIT All right reserved
 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>  
<script src="<c:url value='/resources/js/ckeditor/ckeditor.js'/>"></script>

<div class="d-flex flex-wrap justify-content-between align-items-center mb-3">
	<div class="d-flex flex-column justify-content-center">
		<h4 class="mb-1 mt-3">공지사항 등록</h4>
		<p class="text-muted">Add a New Notice Board</p>
	</div>
</div>

<div class="card-body">
 
<form:form  enctype="multipart/form-data" modelAttribute="boardVO">
	<div class="mb-3">	
		<label class="form-label" for="bbsSj">제목</label>
		<form:input type="text" path="bbsSj" class="form-control" required="true" placeholder="제목을 입력하세요!" />
		<form:errors path="bbsSj" element="span" cssClass="error" />
		
	</div>			
	<div class="mb-3">	
		<label class="form-label" for="bbsCn">내용</label>
		<form:textarea path="bbsCn" class="form-control" required="true" />
		<form:errors path="bbsCn" element="span" cssClass="error" />
	</div>
	<div class="mb-3">
		<label class="form-label">첨부파일</label>
		<input type="file" class="form-control" name ="boFile" />
	</div>	
	    
	<button type="submit" class="btn btn-primary me-1" id="addBtn">등록</button>
	<button type="reset" class="btn btn-label-secondary me-1" id="reset">취소</button>
	<button type="button" class="btn btn-label-secondary me-1" onclick="location.href='<c:url value='/notice' />'">목록</button>
</form:form>
</div>

<script>
 	let csrfparam = $("meta[name='_csrf_parameter']").attr("content");
 	let csrf = $("meta[name='_csrf']").attr("content");
 	
    CKEDITOR.replace('bbsCn',{
        filebrowserImageUploadUrl:`<c:url value='/notice/image?type=image'/>&\${csrfparam}=\${csrf}`
    });
    
    $("input:checkbox").click(function() {
        if (this.checked) {
            $(this).val('Y');
        } else {
            $(this).val('N');
        }
    });
    
</script>
