/**
 * <pre>
 * 
 * </pre>
 * @author 작성자명
 * @since 2023. 11. 10.
 * @version 1.0
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일        	수정자       수정내용
 * --------     	--------    ----------------------
 * 2023. 11. 10.    김보영       최초작성
 * 2023. 11. 14.    김보영       일감목록 비동기
 * 2023. 11. 16.    김보영       일감삭제
 * Copyright (c) 2023 by DDIT All right reserved
 * </pre>
 */


//일감등록
function fn_jobInsert(){

	/*
	저장할때
	상위일감이 없으면 -> 상위일감
	담당자가 여려명이어도 상관없이 저장
	
	상위일감이 선택되어 있으면 -> 하위일감
	담당자 체크박스에 체크된 갯수 확인 후 하나 보다 많으면 알림창으로 한명만 선택하라고 알림 필요
	*/
	
	fn_swalConfirm("등록하시겠습니까?", function(){
		//비동기
		var data = new FormData($("#jobInsertForm")[0]);
		var proSn = $("#tempProSn").val();
	
		$.ajax({
			type: "POST",
			enctype: 'multipart/form-data',
			url: "/job/"+proSn+"/insert",
			data: data,
			processData: false,
			contentType: false,
			cache: false,
			success: function (data) {
				var text;
				var icon;
				if (data.success == "Y") {
					text = "등록이 완료되었습니다.";
					icon = "success";
				} else {
					text = "등록이 실패되었습니다.";
					icon = "warning";
				}
				//모달창열기
				fn_swalComplete(text, icon, "/job/"+proSn+"/home", data.success);
			},
			error: function () {
				fn_swalError();
			}
		});
	});

}





/*일감상태버튼 이벤트*/
function fn_jobStcd(jobStcd){
		
		document.getElementById("jobStcd").value = jobStcd;
		
		var elements = document.querySelectorAll('.btn-jobStcd');
	    elements.forEach(function(element) {
	        element.classList.remove('active');
	    });
	    
	    //제이쿼리 사용법
// 	    $(".btn-jobStcd").each(function(i, ele){
// 	    $.each(".btn-jobStcd", function(i, ele){
// 	    	$(ele).removeClass("active");
// 	    })
	    
	   
	    
	    $(".btnJobStcd").eq(jobStcd-1).addClass("active");
		//$("#jobStcd").val(jobStcd);
		
	}

	




/*일감목록 비동기*/

$(function () {

	fn_jobPaging();

});

//일감 목록 페이징
function fn_jobPaging(){

	let proSn = $('.divider-text').data('pro-sn');
	let formData = $("#searchForm").serialize();
	let settings = {

		url: '/job/' + proSn + '/jobList',
		contentType: 'application/json',
		method: "get",
		data : formData,
		dataType: "json"
	};

	let trTag = "";


	$.ajax(settings)
		.done(function (resp) {
			let pagingJobList = resp.paging.dataList;
			if (pagingJobList[0] != null) {
				$.each(pagingJobList, function (i, v) {

					if (v.jobSn != null) {
						trTag += `
								<tr onclick="fn_jobDetail('${v.proSn}', '${v.jobSn}')" style="cursor: pointer;">							
								  <td>
									<div>
										<i class="fab  text-info me-3">${v.rnum}</i>
										<span class="fw-medium">${v.jobSj}</span>
									</div>
								  </td>
								  <td id="writter" data-writter="${v.jobWriter}">${v.findName}</td>
								  <td id="progrs" data-progrs="${v.jobProgrs}">
								  	<div class="progress">
                      					<div class="progress-bar progress-bar-striped progress-bar-animated bg-primary" role="progressbar" style="width: ${v.jobProgrs}%" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100"></div>
                    					</div>
								  </td>
								  <td>
									<ul class="list-unstyled users-list m-0 avatar-group d-flex align-items-center">
						`;	
								
						$.each(v.empProfileImgs.split(', '), function(a,b){
							
							trTag +=`
								  <li data-bs-toggle="tooltip" data-popup="tooltip-custom" data-bs-placement="top" class="avatar avatar-xs pull-up" aria-label="Lilian Fuller" data-bs-original-title="Lilian Fuller">
									<img src="${b}" alt="" class="rounded-circle">
								  </li>
							`;
						})		
						
						trTag += `
									</ul>
								  </td>
								  <td>
								 `;
						if (v.jobStcd == 1) {
							trTag += `<span class="badge bg-label-success me-1">요청</span>`;
						} else if (v.jobStcd == 2) {
							trTag += `<span class="badge bg-label-primary me-1">진행</span> `;
						} else if (v.jobStcd == 3) {
							trTag += `<span class="badge bg-label-danger me-1">피드백</span>`;
						} else if (v.jobStcd == 4) {
							trTag += `<span class="badge bg-label-warning me-1">보류</span>`;
						} else if (v.jobStcd == 5) {
							trTag += `<span class="badge bg-label-info me-1">완료</span>`;
						} else {
							trTag += `<span class="badge bg-label-secondary me-1">상위</span>`;
						}
						trTag += ` 
								 </td>
								  <td id="writter" data-writter="${v.jobEdate}">${v.jobEdate}</td>
								</tr>
							`;
					} else {
						trTag += `
								<tr>
									<td colspan='6'>일감 내역 없음</td>
								<tr>	
							`;
					}
					$("#jobList").html(trTag);
				});
				trTag = `
				<tr>
					<td colspan="6">
						${resp.paging.pagingHTML}
						<form id="searchForm">
							<div id ="searchUI" class="row g-3 d-flex justify-content-center">
								<input type="hidden" name="page" readonly="readonly"/>
								<div class="col-auto">
									<select name=" searchType" class="form-select"> 
										<option value="" >전체</option>
										<option value="title" >제목</option>
										<option value="charger" >담당자</option>
									</select>
								</div>
								<div class="col-auto">
									<input name="searchWord" placeholder="입력하세요" class="form-control" />
								</div>
								<div class="col-auto">
									<input type="button" value="검색" id="searchBtn" class="btn btn-primary" />
								</div>
							</div>
						</form>
					</td>
				</tr>
				`;
				$("#jobPaging").html(trTag);
			}
		});
}

//페이징 버튼 클릭
function fn_paging(page) {
	searchForm.page.value = page;
	fn_jobPaging();
}

//검색 버튼 클릭
$(document).on("click", "#searchBtn", function(){
	fn_jobPaging();
});

const proSn = $('.divider-text').data('pro-sn');



//일감 삭제 아직 진행중...ㅠㅠ
const jobDelete = () => {

	let jobSn = $(this)[0].jobSn;
	let jobWriter = $(this)[0].jobWriter;

	let PJobVO = {
		jobSn: jobSn.value,
		jobWriter: jobWriter.value
	}

	console.log("삭제데이터확인", jobSn, jobWriter);

	let xhr = new XMLHttpRequest();
	xhr.open("delete", "/job/" + proSn + "/delete", true);
	xhr.setRequestHeader("Content-Type", "application/json");
	xhr.onreadystatechange = () => {
		if (xhr.readyState == 4 && xhr.status == 200) {
			console.log("돌아온 결과", xhr.responseText);
			if (xhr.responseText) {
				fInit();
			}
		}
	}
	xhr.send(JSON.stringify(PJobVO)); // get이외는 보내는 데이타를 전부 send안에
}

//일감 home으로 이동 
const fInit = () => {
	let xhr = new XMLHttpRequest();
	xhr.open("get", "/job/" + proSn + "/home", true);
	xhr.onreadystatechange = () => {
		if (xhr.readyState == 4 && xhr.status == 200) {
			console.log("항상 먼저 체크:", JSON.parse(xhr.responseText));
			fList(JSON.parse(xhr.responseText));
		}
	}
	xhr.send();
}


//해당 프로젝트의 나의 일감 확인


$(function () {

	let proSn = $('.divider-text').data('pro-sn');

	let settings = {

		url: '/job/' + proSn + '/myjob',
		contentType: 'application/json',
		method: "get",
		dataType: "json"
	};

	let trTag = "";


	$.ajax(settings)
		.done(function (resp) {
			let jobList = resp.myjob;
			if (jobList[0] != null) {
				$.each(jobList, function (i, v) {

					if (v.jobSn != null) {
						trTag += `
								<tr>							
								  <td>
									<div>
										<span class="fw-medium">${v.jobSj}</span>
									</div>
								  </td>
								  <td id="progrs" data-progrs="${v.jobProgrs}">
								  	<div class="progress">
                      <div class="progress-bar progress-bar-striped progress-bar-animated bg-primary" role="progressbar" style="width: ${v.jobProgrs}%" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100">
											</div>
                    </div>
								  </td>
								  <td>${v.jobEdate}</td>
								  <td>
								 `;

						if (v.jobPriort == 1) {
							trTag += `<span class="text-danger">긴급</span>`;
						} else if (v.jobPriort == 2) {
							trTag += `<span class="text-warning">높음</span> `;
						} else if (v.jobPriort == 3) {
							trTag += `<span class="text-primary">중간</span>`;
						} else {
							trTag += `<span class="text-success">낮음</span>`;

						}
						trTag += `
								 </td>
								 <td>
								 
								 `;

						if (v.jobStcd == 1) {
							trTag += `<span class="badge bg-label-success me-1">요청</span>`;
						} else if (v.jobStcd == 2) {
							trTag += `<span class="badge bg-label-primary me-1">진행</span> `;
						} else if (v.jobStcd == 3) {
							trTag += `<span class="badge bg-label-danger me-1">피드백</span>`;
						} else if (v.jobStcd == 4) {
							trTag += `<span class="badge bg-label-warning me-1">보류</span>`;
						} else if (v.jobStcd == 5) {
							trTag += `<span class="badge bg-label-info me-1">완료</span>`;
						} else {
							trTag += `<span class="badge bg-label-secondary me-1">상위</span>`;
						}

						trTag += `
								 </td>`;

					} else {
						trTag += `
								<tr>
									<td colspan='5'>내 일감 내역 없음</td>
								<tr>	
							`;
					}
					$("#myJob").html(trTag);
				});
			}
		});
});


function fn_jobDetail(proSn, jobSn){
	
	let settings = {
		url: '/job/' + proSn + '/'+jobSn+'/detail',
		contentType: 'application/json',
		method: "get",
		dataType: "json"
	};

	$.ajax(settings)
		.done(function (resp) {
			let jVO = resp.jVO;
			if (jVO != null) {
				console.log(jVO);
				if(jVO.jobStcd == "1"){
					fn_jobStcd('1');
				}else if(jVO.jobStcd == "2"){
					fn_jobStcd('2');
				}else if(jVO.jobStcd == "3"){
					fn_jobStcd('3');
				}else if(jVO.jobStcd == "4"){
					fn_jobStcd('4');
				}else{
					fn_jobStcd();
				}
			}
		});
		
	$("#btnJobDetailModal").click();
}


