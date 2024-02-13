/**
 * <pre>
 * 
 * </pre>
 * @author 권도윤
 * @since 2023. 11. 16.
 * @version 1.0
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일        수정자       수정내용
 * --------     --------    ----------------------
 * 2023. 11. 16.      작성자명       최초작성
 * Copyright (c) 2023 by DDIT All right reserved
 * </pre>
 */ 

(()=>{
	let xhr=new XMLHttpRequest();
    xhr.open("get","/attendance/work",true);
	xhr.onreadystatechange=()=>{
		if(xhr.readyState==4&&xhr.status==200){
			console.log("성공");
			logList(JSON.parse(xhr.responseText));
			selectLogList();
		}
    }
    xhr.send();
})();

let csrfparam = $("meta[name='_csrf_parameter']").attr("content");
let csrf = $("meta[name='_csrf']").attr("content");

function selectLogList(){
	console.log("여기");
	let xhr=new XMLHttpRequest();
    xhr.open("get","/attendance/logList",true);
//    xhr.setRequestHeader("Content-Type","application/json");
//    xhr.setRequestHeader("X-CSRF-TOKEN",csrf);
    xhr.onreadystatechange=()=>{
        if(xhr.readyState==4 && xhr.status==200){
			console.log(xhr.responseText);
			if(xhr.responseText){
				attendanceLogList(JSON.parse(xhr.responseText));
//				attendanceLogList(xhr.responseText);
			}
		}
	}
	xhr.send();
}

function updLog(button){
	let value=button.value;
	
	let alVO={
		attLog:value
	}
	
	let xhr=new XMLHttpRequest();
    xhr.open("post","/attendance",true);
    xhr.setRequestHeader("Content-Type","application/json");
    xhr.setRequestHeader("X-CSRF-TOKEN",csrf);
    xhr.onreadystatechange=()=>{
        if(xhr.readyState==4 && xhr.status==200){
        	console.log(value,"로 근태 변경");
			selectLogList();
//			console.log(JSON.parse(xhr.responseText));
//			attendanceLogList(JSON.parse(xhr.responseText));
        }
    }
	xhr.send(JSON.stringify(alVO));
};

let attendanceLog=document.getElementById("attendanceLog");

function attendanceLogList(rslt){
	let list=sStartTime;
	for(let i=0;i<rslt.length;i++){
		list+=`<div>● ${rslt[i].ltime}`;
		if(rslt[i].attLog=='N'){
			list+=` 근무`;
		}
		if(rslt[i].attLog=='O'){
			list+=` 외출`;
		}
		if(rslt[i].attLog=='E'){
			list+=` 외근`;
		}
		if(rslt[i].attLog=='B'){
			list+=` 출장`;
		}
		if(rslt[i].attLog=='M'){
			list+=` 회의`;
		}
	}
	attendanceLog.innerHTML=list;
}

let attendanceStart=document.querySelector("#attendanceStart");

let sStartTime=``;

function logList(rslt){
	let newDiv=document.createElement("div");
	sStartTime+=`● ${rslt.stime} 출근`;
	newDiv.textContent=sStartTime;
	
	// 있던 내용물들 싹 무시하고 제일 처음에 넣기
//	attendanceStart.insertBefore(newDiv,attendanceStart.firstChild);
}