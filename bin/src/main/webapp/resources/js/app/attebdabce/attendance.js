/**
 * <pre>
 * 
 * </pre>
 * @author 작성자명
 * @since 2023. 11. 20.
 * @version 1.0
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일        수정자       수정내용
 * --------     --------    ----------------------
 * 2023. 11. 20.      작성자명       최초작성
 * Copyright (c) 2023 by DDIT All right reserved
 * </pre>
 */ 

(()=>{
	currentStatus();
})();

let csrfparam = $("meta[name='_csrf_parameter']").attr("content");
let csrf = $("meta[name='_csrf']").attr("content");

let commuteBtn=document.getElementById('commute');

function commute(){
	let xhr=new XMLHttpRequest();
    xhr.open("post","/attendance/commute",true);
    xhr.setRequestHeader("Content-Type","application/json");
    xhr.setRequestHeader("X-CSRF-TOKEN",csrf);
	xhr.onreadystatechange=()=>{
        if(xhr.readyState==4 && xhr.status==200){
			currentStatus();
		}
	}
	xhr.send();
}

function currentStatus(){
	let xhr=new XMLHttpRequest();
    xhr.open("get","/attendance/work",true);
	xhr.onreadystatechange=()=>{
		if(xhr.readyState==4&&xhr.status==200){
			console.log("응답 데이따 : ",xhr.responseText);
			console.log("길이 : ",xhr.responseText.length);
			if(xhr.responseText.length===2){
				commuteBtn.textContent="출근";
			}else{
				commuteBtn.textContent="퇴근";
			}
		}
    }
    xhr.send();
}