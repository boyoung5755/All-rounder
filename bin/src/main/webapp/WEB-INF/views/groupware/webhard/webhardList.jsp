<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>    
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>
<%
  String contextPath = request.getContextPath();
%>
<div class="webRoute" style="display:flex;"></div>
<br>
<table>
<tbody id="listBody">
<%-- <c:forEach items="${webList}" var="web"> --%>
<!-- 	<tr> -->
<%-- 	<c:if test="${empty web.webTy}"> --%>
<%-- 		<td><a href="<c:url value='/web?webCours=${web.webCours}${web.webSnm}/'/>">폴더 : ${web.webRnm}</a></td> --%>
<%-- 	</c:if> --%>
<%-- 	<c:if test="${not empty web.webTy}"> --%>
<%-- 		<td>파일 : ${web.webRnm}</td> --%>
<%-- 	</c:if> --%>
<!-- 	</tr> -->
<%-- 	</c:forEach> --%>
</tbody>
<tfoot>
	<tr>
		<td>파일 추가
			<form:form id="insertFile" modelAttribute="web" method="post" enctype="multipart/form-data">
				파일<input type="file" name="file" id="file" placeholder="파일이름"/>
				폴더 이름<input type="text" name="webRnm" id="webRnm" placeholder="폴더이름"/>
				<input type="submit" id="onInsertFile" value="파일추가"/>
			</form:form>
		</td>
	</tr>
	<tr>
		<td>이름 변경
			<input type="text" name="updName" id="updName" placeholder="변경이름"/>
		</td>
	</tr>
</tfoot>
</table>
<script>

$(function(){
// 	console.log(csrfparam);
// 	console.log(csrf);
});
let csrfparam = $("meta[name='_csrf_parameter']").attr("content");
let csrf = $("meta[name='_csrf']").attr("content");

// var contextPath='\${pageContext.request.contextPath}';
var cours="/";
var beforeCours="";
var rnm="내 드라이브";

var ajaxList=function(cours){
	let uri="/web/list?webCours="+cours;
	let xhr=new XMLHttpRequest();
    xhr.open("get",uri,true);
    xhr.onreadystatechange=()=>{
        if(xhr.readyState==4&&xhr.status==200){
        	let datas = JSON.parse(xhr.responseText) 
        	let target = datas.webList;
//         	console.log(target);
        	makeList(target);
        }
    }
    xhr.send();
}

let div=``;
let webRoute = document.querySelector(".webRoute");

var makeList = function(webList){
// 	$("<div>").addClass("back")
// 	=
// 	let newDiv= document.createElement("div");
// 	newDiv.classList.add("back");
	let newDiv= document.createElement("h4");
	newDiv.setAttribute("data-value", cours);
	newDiv.setAttribute("data-name", rnm);
	newDiv.style.marginRight = "5px";
	newDiv.textContent =rnm;
	newDiv.addEventListener("click",function(){
		cours=this.getAttribute("data-value");
		deleteCours = webRoute.querySelectorAll(`[data-value*="\${cours}"]`);
		for(let i=0;i<deleteCours.length;i++){
			let ab=cours.length;
			let abc=deleteCours[i].getAttribute("data-value").length;
			if(ab<=abc){
// 				console.log("삭제 : ",deleteCours[i]);
				if(cours!==beforeCours){
					rnm=this.getAttribute("data-name");
					webRoute.removeChild(deleteCours[i]);
				}
			}
		}
// 		deleteCours.forEach(function(deleteCour){
// 			let ab=cours.length;
// 			let abc=deleteCour.length;
// 			if(ab<abc){
// 				webRoute.removeChild(deleteCour);
// 			}
// 		});
		ajaxList(cours);
	});
	if(cours!==beforeCours){
		webRoute.appendChild(newDiv);
	}
	beforeCours=cours;
// 	div+=`<div class="back" data-value="\${cours}">\${rnm}</div>`;
	let list=``;
	for(let i=0;i<webList.length;i++){
		list+=`<tr>`;
		if(!webList[i].webTy){	/* 폴더일 때 */
			list+=
				`<td class="folder" data-name="\${webList[i].webRnm}" data-value="\${cours}\${webList[i].webSnm}/">
					<img style="width:100px; height:100px;" src="<%= contextPath %>/resources/images/webHard/webFolder.png"/>\${webList[i].webRnm}
				</td>
				<td data-serial="\${webList[i].webSnm}">
					<input type="button" onclick="fileDel(this)" value="삭제"/>
					<input type="button" onclick="fileUpd(this)" value="이름 변경"/>
			</td>`;
		}else{	/* 파일일 때 */
			list+=
				`<td>
					<img style="width:100px; height:100px;" src="<%= contextPath %>/resources/images/webHard/\${webList[i].webTy}.png"/> \${webList[i].webRnm}
				</td>
				<td data-ty="\${webList[i].webTy}" data-serial="\${webList[i].webSnm}" data-local="\${webList[i].webRnm}" data-value="\${cours}\${webList[i].webSnm}.\${webList[i].webTy}">
					<input type="button" onclick="fileDown(this)" value="다운로드"/>
					<input type="button" onclick="fileDel(this)" value="삭제"/>
					<input type="button" onclick="fileUpd(this)" value="이름 변경"/>
			</td>`;
		}
		list+=`</tr>\n`;
	}
// 	console.log("list", list)
// 	let listBody = document.querySelector("#listBody");
	listBody.innerHTML=list;
	
// 	console.log("listBody", document.querySelector("#listBody"))
var folder=document.querySelectorAll(".folder");
	
	for(let i=0; i<folder.length; i++){
		folder[i].addEventListener("dblclick", function(){
	 		cours=this.getAttribute("data-value");
	 		rnm="/       " + this.getAttribute("data-name");
	 		ajaxList(cours);
		});
	}
}
var insertFile=document.getElementById("insertFile");

insertFile.addEventListener("submit",function(ev){
	ev.preventDefault();
	let formData = new FormData();
	file = document.querySelector("#file").files[0];
	/*
	console.log(formData);
    let web = {
    	file:document.getElementById("file").files[0],
    	webRnm:document.getElementById("webRnm").value,
   		webCours:cours
    };
    console.log(web);
    */
// 	let webRnm=document.getElementById("webRnm");
// 	let file=document.getElementById("file");
// 	let webCours=cours;
	
	console.log("cours", cours);
	if(file){
		formData.append("file",file);
	}
	formData.append("webRnm",document.querySelector("#webRnm").value);
	formData.append("webCours",cours);

	let xhr=new XMLHttpRequest();
    xhr.open("post","/web",true);
    //xhr.setRequestHeader("Content-Type","application/json");
    xhr.setRequestHeader("${_csrf.headerName}",csrf);
    xhr.onreadystatechange=()=>{
        if(xhr.readyState==4 && xhr.status==200){
        	console.log("성공");
        	ajaxList(cours);
        }
    }
    xhr.send(formData);
});
	
function fileDown(button){
	let dataValue = button.parentNode.getAttribute('data-value');
	let local = button.parentNode.getAttribute('data-local');
	
	let formData = new FormData();
	
	formData.append("ftpFile",dataValue);
	formData.append("localFile",local);

	let xhr=new XMLHttpRequest();
    xhr.open("post","/web/download",true);
//     xhr.setRequestHeader("Content-Type","application/json");
    xhr.setRequestHeader("${_csrf.headerName}",csrf);
    xhr.onreadystatechange=()=>{
        if(xhr.readyState==4 && xhr.status==200){
        	console.log(dataValue);
        	console.log(local);
        	console.log("다운로드");
        	ajaxList(cours);
        }
    }
    xhr.send(formData);
}
	
function fileDel(button){
	let serial = button.parentNode.getAttribute('data-serial');
	
	let formData = new FormData();
	
	formData.append("webSnm",serial);
	formData.append("webCours",cours);

	let xhr=new XMLHttpRequest();
    xhr.open("post","/web/delete",true);
//     xhr.setRequestHeader("Content-Type","application/json");
    xhr.setRequestHeader("${_csrf.headerName}",csrf);
    xhr.onreadystatechange=()=>{
        if(xhr.readyState==4 && xhr.status==200){
        	console.log(serial);
        	console.log("삭제");
        	ajaxList(cours);
        }
    }
    xhr.send(formData);
}
	
function fileUpd(button){
	let updName = document.getElementById('updName').value;
	let serial = button.parentNode.getAttribute('data-serial');
	let ty = button.parentNode.getAttribute('data-ty');
	if(ty){
		updName+="."+ty;
	}
	
	let webVO={
		webSnm:serial,
		webRnm:updName,
		webCours:cours
	}
	console.log(webVO);
	let xhr=new XMLHttpRequest();
    xhr.open("post","/web/update",true);
    xhr.setRequestHeader("Content-Type","application/json");
    xhr.setRequestHeader("${_csrf.headerName}",csrf);
    xhr.onreadystatechange=()=>{
        if(xhr.readyState==4 && xhr.status==200){
        	console.log("수정");
        	ajaxList(cours);
        }
    }
    xhr.send(JSON.stringify(webVO));
}

// var second=function(){
// // 	console.log("여기 있다.")
// 	var back=document.querySelectorAll(".back");
// 	console.log(back);
// 	for(let i=0; i<back.length; i++){
// 		back[i].addEventListener("click",function(){
// 			console.log(this);
// 			cours=this.getAttribute("data-value");
// 			console.log("corus : ",cours);
// 			ajaxList(cours);
// 		});
// 	}
// }
// $(document).on("click",".back",function(){
// 	console.log(this);
// 	cours=this.getAttribute("data-value");
// 	console.log("corus : ",cours);
// 	ajaxList(cours);
// });
// 	folder.addEventListner('click',function(){
// 		cours=folder.getAttribute("data-value");
// 		console.log(cours);
// 	});
// }

ajaxList(cours);

// 마우스 우클릭 이벤트
// is_right_click=(event.which==3) || (event.button==2)

// const mouse_end = async(event) => {
//     if(is_right_click) return;
//     console.log("오른 클릭");
// }

// element.addEventListener("mouseup",mouse_end);

// window.oncontextmenu=function(){
//     return false;
// }
</script>