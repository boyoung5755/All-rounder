/**
 * <pre>
 * 
 * </pre>
 * @author 김보영
 * @since 2023. 11. 15.
 * @version 1.0
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일        	수정자       수정내용
 * --------     	--------    ----------------------
 * 2023. 11. 15.    김보영       최초작성 , ag그리드
 * 2023. 11. 20.    김보영       직원CRUD
 * Copyright (c) 2023 by DDIT All right reserved
 * </pre>
 */

//페이지 로딩 후 실행
$(function () {

	fn_suprrList();


	/*부서에따른 직원목록 조회*/
	$("#deptCd").on("change", function () {

		fn_suprrList();

	})
})


/* 직원목록 AG-GRID */
const gridOptions = {
	// define grid columns
	columnDefs: [
		{
			field: 'empProfileImg', headerName: '프로필사진'
			, cellRenderer: function (row) {
				if (row.data.empProfileImg != null) {
					return "<img src='" + row.data.empProfileImg + "' style='height: 100%;'/>";
				}else{
					return "<img src='/resources/images/basic.png' style='height: 100%;'/>";
				}
			}
		},
		{ field: 'empCd', headerName: '사번' },
		{ field: 'empName', headerName: '이름' },
		{ field: 'empAdres', headerName: '주소' },
		{ field: 'empAdresDetail', headerName: '상세주소' },
		{ field: 'empBirth', headerName: '생년월일' },
		{ field: 'empSsn', headerName: '주민번호' },
		{ field: 'empRank', headerName: '직책' },
		{ field: 'empPosition', headerName: '직급' },
		{ field: 'empHiredate', headerName: '입사일' },
		{ field: 'deptName', headerName: '부서명' },
		{ field: 'empMail', headerName: '이메일' },
		{ field: 'empTelno', headerName: '휴대전화' },
		{ field: 'empExtension', headerName: '내선전화' },
	],
	rowHeight: 60,
	defaultColDef: {
		sortable: true,
		resizable: true,
		filter: true,
		width: 150,
	},
	pagination: true,
	paginationAutoPageSize: false,
	paginationPageSize: 10,
	onRowClicked: function (event) {
		console.log(event);
		location.href = "/account/edit?empCd=" + event.data.empCd
	}
};


//페이지 로딩 후 실행
document.addEventListener('DOMContentLoaded', function () {

	fn_setAgGrid();//AG그리드 세팅

});


function fn_setAgGrid() {
	var gridDiv = document.querySelector("#empList");
	if (gridDiv != null) {

		new agGrid.Grid(gridDiv, gridOptions);


		const httpRequest = new XMLHttpRequest();
		httpRequest.open('GET', '/account/empList');
		httpRequest.send();

		httpRequest.onreadystatechange = function () {
			if (httpRequest.readyState === 4 && httpRequest.status === 200) {
				httpResult = JSON.parse(httpRequest.responseText);

				var json = [];
				for (var i = 0; i < httpResult.empList.length; i++) {
					var obj = new Object();

					obj.empProfileImg = httpResult.empList[i].empProfileImg;
					obj.empCd = httpResult.empList[i].empCd;
					obj.empName = httpResult.empList[i].empName;
					obj.empAdres = httpResult.empList[i].empAdres;
					obj.empAdresDetail = httpResult.empList[i].empAdresDetail;
					obj.empBirth = httpResult.empList[i].empBirth;
					obj.empSsn = httpResult.empList[i].empSsn;
					obj.empRank = httpResult.empList[i].empRank;
					obj.empPosition = httpResult.empList[i].empPosition;
					obj.empHiredate = httpResult.empList[i].empHiredate;
					obj.deptName = httpResult.empList[i].dept.deptName;
					obj.empMail = httpResult.empList[i].empMail;
					obj.empTelno = httpResult.empList[i].empTelno;
					obj.empExtension = httpResult.empList[i].empExtension;
					json.push(obj);
				}

				gridOptions.api.setRowData(json);
			}
		};
	}
}

function excelDownload() {
	location.href = '/account/excel/download';
}

function accountForm() {
	location.href = '/account/form';
}

function fn_goList() {
	location.href = '/account/home';
}


/* 우편번호찾기	*/

function execDaumPostcode() {
	new daum.Postcode({
		oncomplete: function (data) {
			document.getElementById('empZip').value = data.zonecode;
			document.getElementById('empAdres').value = data.address;
		}
	}).open();
}


function fn_suprrList() {

	let settings = {

		url: '/account/suprr',
		contentType: 'application/json',
		method: "get",
		dataType: "json",
		data: {
			"deptCd": $("#deptCd").val()
		}
	};

	let tags = "";

	$.ajax(settings)
		.done(function (resp) {
			console.log(resp)
			let suprrList = resp;

			tags = `
				 <option value="">선택</option>
			`;
			if (suprrList != null) {
				$.each(suprrList, function (i, v) {

					let sel = "";
					if(v.empCd == $("#tempEmpSuprr").val()){
						sel = "selected";
					}
					tags += `
						<option value="${v.empCd}" ${sel}>${v.empName}</option>
					`;
				})
			}
			$("#empSuprr").html(tags);
		})


}


//직원 등록 비동기

function fn_insertEmp() {

	//저장확인모달창
	fn_swalConfirm("저장하시겠습니까?", function(){
		//비동기
		var data = new FormData($("#formAccountSettings")[0]);

		$.ajax({
			type: "POST",
			enctype: 'multipart/form-data',
			url: "/account/insert",
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
				fn_swalComplete(text, icon, "/account/home", data.success);
			},
			error: function () {
				fn_swalError();
			}
		});
	});
}


//직원수정
function fn_updateEmp(){
	
	//수정확인모달창
	fn_swalConfirm("수정하시겠습니까?", function(){
		//비동기
		var data = new FormData($("#formAccountSettings")[0]);

		$.ajax({
			type: "PUT",
			enctype: 'multipart/form-data',
			url: "/account/update",
			data: data,
			processData: false,
			contentType: false,
			cache: false,
			success: function (data) {
				var text;
				var icon;
				if (data.success == "Y") {
					text = "수정이 완료되었습니다.";
					icon = "success";
				} else {
					text = "수정이 실패되었습니다.";
					icon = "warning";
				}
				//모달창열기
				fn_swalComplete(text, icon, "/account/home", data.success);
			},
			error: function () {
				fn_swalError();
			}
		});
	});
}

//직원 삭제
function fn_deleteEmp(){
	
	//삭제확인모달창
	if(accountActivation.checked == true){
	
		fn_swalConfirm("삭제하시겠습니까?", function(){
			//비동기
			var data = new FormData($("#formAccountDeactivation")[0]);
	
			$.ajax({
				type: "DELETE",
				enctype: 'multipart/form-data',
				url: "/account/delete",
				data: data,
				processData: false,
				contentType: false,
				cache: false,
				success: function (data) {
					var text;
					var icon;
					if (data.success == "Y") {
						text = "삭제가 완료되었습니다.";
						icon = "success";
					} else {
						text = "삭제가 실패되었습니다.";
						icon = "warning";
					}
					//모달창열기
					fn_swalComplete(text, icon, "/account/home", data.success);
				},
				error: function () {
					fn_swalError();
				}
			});
		});
	}
}


// 이미지파일 미리보기
let accountUserImage = document.getElementById('uploadedAvatar');
const fileInput = document.querySelector('#input-file');
const resetFileInput = document.querySelector('#reset-btn');

if (accountUserImage) {
	const resetImage = accountUserImage.src;
	fileInput.onchange = () => {
		if (fileInput.files[0]) {
			accountUserImage.src = window.URL.createObjectURL(fileInput.files[0]);
		}
	};
	resetFileInput.onclick = () => {
		fileInput.value = '';
		accountUserImage.src = resetImage;
	};
}
