/**
 * <pre>
 * 
 * </pre>
 * @author 전수진
 * @since 2023. 11. 20.
 * @version 1.0
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일        수정자       수정내용
 * --------     --------    ----------------------
 * 2023. 11. 20.  전수진       최초작성(jsp에서 js파일 분리)
 * Copyright (c) 2023 by DDIT All right reserved
 * </pre>
 */ 


// 수신자 선택을 위한 리스트 출력
$(function(){
	$.getJSON("/org/list")
		.done(function(resp) {
			let empList = resp.list;
			console.log("empList================", empList);
            let tags = makeRecpList(resp); 
			console.log(tags);
			$("#sanctnRcyer").append(tags);
		})
		.fail(function(jqxhr, textStatus, error) {
			let err = textStatus + ", " + error;
			console.error("Request Failed: " + err);
		});
		
	// 전 직원목록을 반함
	let makeRecpList = function (resp) {
	   let respList = resp.list;
	   //console.log(deptList);
	   let tags = "";
	   
	   tags += `<option value="-1">선택하세요</option>`;
	
	   for (let i = 0; i < respList.length; i++) {
	      if (respList[i].empName != "관리자") {
	         tags += `<option data-avatar="5.png" value="${respList[i].empCd}">[${respList[i].dept.deptName}]${respList[i].empName} ${respList[i].common.commonCodeSj}</option>`;
	      }
	      // console.log(respList[i].empName);
	   }
	   return tags;
	}

	var $bookmarkList = $('#bookmarkList');
	
	$bookmarkList.on("click", function(){
		$.ajax({
		    type:"get",
		    url:"/bookmark/list",
		    dataType:"json",
		    success:function(list){
				// JSON.parse(rslt)  jQuery가 몰래해줌
				console.log("서버에서 온 값:================", list);
				console.log("서버에서 온 값:================", list[0]);
				
		      var dropdownMenu = $("#dropdownMenu");
		      
		      dropdownMenu.empty(); // 계속 추가 되는것을 막음
	
	            list.bookmarkList.forEach((item) => {
	            	console.log(item);
	                let newItem = `<li><a class="dropdown-item" href="javascript:void(0);" data-bkmk-no="${item.bkmkNo }" >${item.bkmkNm}</a></li>`;
	                dropdownMenu.append(newItem);
	            });
		    },
		    error: function (request, status, error) {
		        console.log("code: " + request.status)
		        console.log("message: " + request.responseText)
		        console.log("error: " + error);
		    }
		});
	});
	
	$('').on("click")
	
});

$('')

$('#dropdownMenu').on("click", "li", function() {
	var bkmkNo = $(this).find("a").data("bkmkNo");
    console.log("클릭한 항목============: ", bkmkNo);
    
	$.ajax({
		type : "get",
		url : "/bookmark/detail",
		data : {
			bkmkNo : bkmkNo
		},
		dataType : "json",
		success : function(list) {
			console.log("확인",list);
			$('#sanctionLine').empty(); // 기존의 값을 지우고 시작(최대 3개만 선택되도록)
			list.detailList.forEach((item) => {
				console.log(item);
				let newItem = `<div>${item.sanctner} ${item.bookmark.emp.empName} ${item.bookmark.emp.common.commonCodeSj}</div>`;
				$("#sanctionLine").append(newItem);
			});
		},
	    error: function (request, status, error) {
	        console.log("code: " + request.status)
	        console.log("message: " + request.responseText)
	        console.log("error: " + error);
	    }
		
	});
});
	
let selectedDataArray = [];
// 결재선의 조직도출력
function listORG() {
    $.ajax({
		type: "get",
		url: "/org/do",
		contentType: "application/json",
		dataType: "json",
		success: function (data) {
			let list = data.list;
			let dept = data.dept;

			console.log("체크1:", list);
			console.log("체크2:", dept);

			//일단 억지 데이터 변경 jstree에 맞춰서 쓰일수 있도록
			for (let i = 0; i < dept.length; i++) {
				dept[i].id = dept[i].deptCd;
				dept[i].parent = dept[i].udeptCd ? dept[i].udeptCd : "#";
				dept[i].text = dept[i].deptName;
				
				if(dept[i].text == "대표이사" || dept[i].text == "총괄사업본부" || dept[i].text == "관리부" ){
					dept[i].state = {'opened' : true}
				}else {
					dept[i].state = {'opened' : false}
				}
			}

			for(let i=0; i< list.length; i++){
				list[i].id = list[i].empCd;
				list[i].parent = list[i].deptCd;
				list[i].text = `${list[i].empName} ${list[i].common.commonCodeSj}`;
			}

			// 배열 합치기!  스프레드 오퍼레이터 ....
			let total = [...list,...dept];

			// 'admin' 조직도 제외
			total = total.filter(item => item.text != '관리자 관리자');

			console.log("total:",total);
			console.log("체크=================",$("#orgTreeContainer"));
			
			$("#orgTreeContainer").jstree({
				core: {
					data: total,
				}
			});


			// Select 했을때 값을 배열에 저장
			$('#orgTreeContainer').on("select_node.jstree", function (e, data) {
				console.log("select했을때", data);
				var id = data.node.id;
				var text = data.node.text;
				var dept = data.node.original.dept.deptName;
				console.log("select했을때 id", id);
				console.log("select했을때 text", text);
				console.log("select했을때 dept", dept);
				
				if(selectedDataArray.length < 3) {    
					// id와 text를 배열에 저장
					let selectedData = {
						empCd: id,
						empName: text,
						deptName: dept
					};
					
					// 선택된 결재자들 출력
					$('#orgTreeResult').append(text+'<input type="text" value= "'+id+'"/><br />');
						selectedDataArray.push(selectedData);
						console.log("선택한 데이터:", selectedDataArray);
				} else {
					data.instance.deselect_node(data.node);
					alert("최대 선택인원을 초과하였습니다!");
				}
			});
		},
	    error: function (request, status, error) {
	        console.log("code: " + request.status)
	        console.log("message: " + request.responseText)
	        console.log("error: " + error);
	    }
    });
}

listORG();
  
$('#remove').on("click", function(){
	$('#orgTreeResult').empty();
    selectedDataArray = [];
	console.log("remove버튼 클릭!!!!!!");
});
	
$('#addLine').on('hidden.bs.modal', function(e) {
	$('#orgTreeResult').empty();
	selectedDataArray = [];
});
	
$('#saveBtn').on("click", function(){
	let bookmarkVal = $("#bookmark").val();
	 // 보내야 되는 값
	let sanctionLine = []; 
	 
	$("#orgTreeResult > input").each((i,itext)=>{
		console.log(itext.value);
		let boDeVO = {
			sanctner: itext.value
		};
		sanctionLine.push(boDeVO);
	});

	console.log("결재라인 체크:",sanctionLine);

	// 요즘은 다 덩어리로 보통 1개로 
	if(sanctionLine.length > 0) {
		let BookmarkVO = {};
		BookmarkVO.bkmkNm = bookmarkVal;
		BookmarkVO.detailList = sanctionLine;
	
		$.ajax({
			type:"post",
			url:"/bookmark/new",
			contentType:"application/json",  // post
			data: JSON.stringify(BookmarkVO) ,
			dataType:"text",
			success:function(rslt){
				// JSON.parse(rslt)  jQuery가 몰래해줌
				console.log("서버에서 온 값:", rslt);

				if(rslt == "OK"){
					Swal.fire("즐겨찾기 등록이 완료되었습니다!");
					//console.log("체킁",$(".swal2-container.swal2-center.swal2-backdrop-show"));
					$(".swal2-container.swal2-center.swal2-backdrop-show").css("z-index",3000);   // default 1060, 동적생성이라 맹글고 바꿔야 함!

				}
			},
		    error: function (request, status, error) {
		        console.log("code: " + request.status)
		        console.log("message: " + request.responseText)
		        console.log("error: " + error);
		    }
		});
	} else {
		alert("결재선을 1명이상 등록해주세요");
	}
});


$('#addBtn').on("click", function(){
	$('#sanctionLine').empty(); // 기존의 값을 지우고 시작(최대 3개만 선택되도록)
	 
	if(selectedDataArray.length > 0 )
		for(let i = 0; i < selectedDataArray.length; i++) {
			let selectedId = selectedDataArray[i].empCd;
			let selectedName = selectedDataArray[i].empName;
			console.log("selectedId : "+selectedId);
			//console.log("selectedName : "+selectedName);

		   $('#sanctionLine').append('<div>'+selectedName+'('+ selectedId+')</div>');
		}
		
	// 모달 닫기
	$('#addLine').modal('hide');
 
});
	

	
