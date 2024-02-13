/**
 * <pre>
 * 
 * </pre>
 * @author 작성자명
 * @since 2023. 11. 8.
 * @version 1.0
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일        수정자       수정내용
 * --------     --------    ----------------------
 * 2023. 11. 8.      박민주       최초작성
 * Copyright (c) 2023 by DDIT All right reserved
 * </pre>
 */
$(function () {
	const myContent = $("#myContent");
	console.log(myContent);
	let makeForm = function () {
		let formText = `
			<form method="post" class="mb-3" action="/findPwProcess"
				enctype="application/x-www-form-urlencoded" id="sendCertiNumForm">

			<div class="mb-3" id="formDiv">
				<label for="empName" class="form-label" req>이름</label>
				<input
				  type="text"
				  class="form-control"
				  id="empName"
				  name="empName"
				  placeholder="Enter your name"  
				  required
				  autofocus />
				<label for="empCd" class="form-label">사번</label>
				<input
				  type="text"
				  class="form-control"
				  id="empCd"
				  name="empCd"
				  placeholder="Enter your code"
				  required
				  autofocus />
				<label for="email" class="form-label">휴대폰번호</label>
				<input
				  type="text"
				  class="form-control"
				  id="empTelno"
				  name="empTelno"
				  placeholder="Enter your tel"
		          required
				  autofocus />
			</div>
			<input type="submit" class="btn btn-primary d-grid w-100" value="인증번호 발송" id="sendCrtfNo"></button>
			<sec:csrfInput/>
		</form>
		`;
		
		$(myContent).html(formText);
	}
	makeForm();
	
	$(sendCertiNumForm).on("submit", function(event){
		event.preventDefault();
		console.log(this.action);
		let url = this.action;
		let method = this.method;
		let data = $(this).serializeJSON(); //제이쿼리 슬림버전에는 존재하지 않음
		let json = JSON.stringify(data);
		// console.log(data);
		// console.log(json);
		let settings = {
			url : url,
			method : method,
            data : json,
            dataType : "json",
            contentType : "application/json; charset=utf-8"
		};
		console.log("settings : ", settings);

		//ajax로 입력된 데이터를 전송하여, 정보가 일치하는지 확인하기
		$.ajax(settings).done(function(resp){
            console.log("resp.success : ", resp.success);
		
            if(resp.success === true){ //문자발송까지 성공한 경우
				appendCertiNum();
				alert(resp.message);
            }else{ //입력한 직원 정보 불일치
				alert(resp.message);
            }
        }).always(function(){ //ajax 완료 후 항상 실행하는 메소드

			//직원정보가 없어서 아래 안생긴 경우는.?
			if($("#empCrtfcNo").length===0){//없다면
				console.log("폼 없음");
			}else{
				console.log("폼 잇음")
				$("#certiNumForm").on("submit", function(event){
					event.preventDefault();
					console.log(this.action);
					let url = this.action;
					let method = this.method;
		
					//사번과 입력한 인증번호가 들어가 있어야함
					let empCrtfcNo = $("#empCrtfcNo").val;
		            if(!empCrtfcNo){
		                alert("인증번호를 입력해주세요.");
		                return;
		            }
		
					let data = $(this).serializeJSON(); //제이쿼리 슬림버전에는 존재하지 않음
					let json = JSON.stringify(data);

					let settings = {
						url : url,
						method : method,
						data : json,
						dataType : "json",
						contentType : "application/json; charset=utf-8"
					};
					
					console.log("아래 콘솔 : ", settings);

					 $.ajax(settings).done(function(resp){
						console.log("resp.success : ", resp.success);
						if(resp.success === true){ //인증번호 일치
							location.href="";//비밀번호 변경 창으로 이동, 사번은?
						}else{ //인증번호 불일치
							alert(resp.message);
							$("#empCrtfcNo").val("");
						}
					})
				}); //certiNumForm submit end
			};//if-else end
		}); //ajax,done,always end

		let appendCertiNum = function(){
			let tags = `
			<form method="post" class="mb-3" action="/checkCertiNum"
					enctype="application/x-www-form-urlencoded" id="certiNumForm">

				<div class="mb-3">
					<label for="empCrtfcNo" class="form-label">휴대폰번호</label>
					<input
					  type="text"
					  class="form-control"
					  id="empCrtfcNo"
					  name="empCrtfcNo"
					  placeholder="Enter your certificate number"
					  autofocus />
					 <input type="hidden" name="empCd" id="empCd" value="${data.empCd}"
				</div>
				<input type="submit" class="btn btn-primary d-grid w-100" value="확인"></button>
				<sec:csrfInput/>
			</form>
			`;

			let formDiv = $("#formDiv");
			console.log("dfdfdfdf")
			//위에 세가지 항목들 비활성화
			$("#empName").attr("readonly", true);
			$("#empCd").attr("readonly", true);
			$("#empTelno").attr("readonly", true);
			$("#sendCrtfNo").attr("type", "hidden");
			//인증번호 발송 버튼
			console.log(formDiv);
			formDiv.append(tags);
		};
	})
})