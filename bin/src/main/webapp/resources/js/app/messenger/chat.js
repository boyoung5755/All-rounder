/**
 * <pre>
 * 채팅 기능에서 사용하는 자바스크립트
 * 순수 자바스크립트 코드로 작성할 예정
 * </pre>
 * @author 박민주
 * @since 2023. 11. 12.
 * @version 1.0
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일        수정자       수정내용
 * --------     --------    ----------------------
 * 2023. 11. 18. 박민주		최초작성
 * 2023. 11. 19. 박민주     채팅방 목록 조회
 * 2023. 11. 19. 박민주     채팅방 개설
 * 2023. 11. 19. 박민주     채팅방 삭제
 * 2023. 11. 19. 박민주     채팅방 이름 수정
 * Copyright (c) 2023 by DDIT All right reserved
 * </pre>
 */

//페이지 로딩 후
document.addEventListener('DOMContentLoaded', function(){
		/* 필요한 정보 : 접속 중인 아이디, 이름, 부서, 직급, 
					   입사일, 메일, 휴대폰 번호 => 이건 상세창에 띄우기
			메시지, 메시지 전송시간  */
	let senderEmpCd = document.querySelector("#empCd").value; //로그인된 유저의 사번
    
    //메세지 전송버튼 클릭 시 전송할 JSON 데이터
    let sendData = {
        senderEmpCd : senderEmpCd
    };
    // AJAX 를 통해 로그인된 사원의 기본 정보를 JSON 객체에 추가함
    $.ajax({
        type :"GET",
        url: `/org/${senderEmpCd}`,
        data : JSON.stringify(senderEmpCd),
        dataType : "json",
        contentType : "application/json",
        success: function(resp){
            console.log("성공 ===> ", resp);
            sendData.senderEmpName = resp.emp.empName; /* 이름 */
            sendData.senderDeptName = resp.emp.dept.deptName; /* 부서이름 */
            sendData.senderCommonCodeSj = resp.emp.common.commonCodeSj; /* 직급 */
            console.log("지금까지 생성된 JSON 데이터 ==> ", sendData);
        },
        error: function(xhr){
            console.log("실패 ===> ", xhr);
        }
    });

	chatRoomCd="";
	chatContactListItems = [].slice.call(document.querySelectorAll('.chat-contact-list-item:not(.chat-contact-list-item-title)')); //title 아닌 li 태그
	
	// Select chat or contact (채팅방 선택)
    chatContactListItems.forEach(chatContactListItem => {
      // Bind click event to each chat contact list item
      chatContactListItem.addEventListener('click', e => {
        // Remove active class from chat contact list item
		chatRoomCd = chatContactListItem.getAttribute("data-value"); //위에 전역변수에 데이터 담아놓음
        document.getElementById("historyUl").replaceChildren(); //메시지 이력 영역 비우기
        
        var chatHistory = JSON.parse(localStorage.getItem(chatRoomCd)); //채팅이력 JSON으로.
        console.log("채팅이력 ==>" , chatHistory);

        //채팅이력이 존재한다면 appned 없으면 말고~
        let liTags ="";
        if(chatHistory){ //채팅이력이 존재한다면
            for(var i=0; i<chatHistory.length; i++){
                var startLiTags = "";
                if(chatHistory[i].senderEmpCd==senderEmpCd){ //본인이면 오른쪽에 출력
                    startLiTags = '<li class="chat-message chat-message-right">';
                }else{ //아니면 왼쪽에 출력
                    startLiTags = '<li class="chat-message">';
                }
                liTags += `
                    ${startLiTags}
                        <div class="d-flex overflow-hidden">
                            <div class="chat-message-wrapper flex-grow-1">
                                <div class="chat-message-text">
                                    <p class="mb-0">${chatHistory[i].sendContent}</p>
                                </div>
                                <div class="text-end text-muted mt-1">
                                    <i class="bx bx-check-double text-success"></i> 
                                    <small>${chatHistory[i].sendTime}</small>
                                </div>
                            </div>
                            <div class="user-avatar flex-shrink-0 ms-3">
                                <div class="avatar avatar-sm">
                                    <img src="/resources/assets/img/avatars/1.png" alt="Avatar"
                                        class="rounded-circle" />
                                </div>
                            </div>
                        </div>
                    </li>
                `;
            }
        }else{ //채팅이력이 존재하지 않는다면
        }
        document.getElementById("historyUl").innerHTML = liTags;

        chatContactListItems.forEach(chatContactListItem => {
          chatContactListItem.classList.remove('active');
        });
        // Add active class to current chat contact list item
        e.currentTarget.classList.add('active');
      });
    });
	
    //신규 채팅방 개설
    document.querySelector("#sendBtn").addEventListener("click", e => {
		
		var selectedUsers = [];
	    var selectElement = document.getElementById("chatParticipant"); 
	    var options = selectElement && selectElement.options; 
	    // 선택된 사용자들을 배열에 추가
	    for (var i = 0; i < options.length; i++) {
	        if (options[i].selected) {
	            selectedUsers.push(options[i].value);
	        }
	    }
		
		console.log("선택된 사용자들 selectedUsers ====> " + selectedUsers);
        $.ajax({
            type :"POST",
            url: "/messenger",
            data : JSON.stringify(selectedUsers),
            dataType : "json",
			contentType : "application/json",
            success: function(resp){
                console.log("성공 ===> ", resp);
                console.log("resp.success ===> ", resp.success);
                location.reload();
            },
            error: function(xhr){
                console.log("실패 ===> ", xhr);
            }
        });
    });

	//채팅방 삭제
    document.querySelectorAll(".chatRoomDeleteBtn").forEach(btn =>{
        btn.addEventListener("click", function(){
            var li = this.parentElement.closest('li');
            var chatRoomCd = li.getAttribute("data-value");
            console.log("클릭한 chatRoomCd ===> ", chatRoomCd);

            $.ajax({
                type: "DELETE",
                url:`/messenger/${chatRoomCd}`,
                contentType : "application/json",
                success: function(resp){
                    console.log("삭제결과 ==>" ,resp);
                    alert("삭제되었습니다");
                    location.reload();
                },
                error :function(xhr){
                    console.log("삭제 실패 ====> ", xhr);
                }
            })
        })
    });
    
	//채팅방 이름 변경 버튼 클릭하여 모달 띄우고 닫기
    document.querySelectorAll(".chatRoomTitleModiBtn").forEach(btn =>{
        btn.addEventListener("click", function(){
            const li = this.parentElement.closest('li');
            chatRoomCd = li.getAttribute("data-value");
            console.log("클릭한 chatRoomCd ===> ", chatRoomCd);

            const modal = document.querySelector("#modal");
            const clsBtn = document.querySelector("#clsBtn");
           
            
            btn.addEventListener("click", function () {
                modal.style.display = "block"; //모달 보이게
            });
            clsBtn.addEventListener("click", function () {
                modal.style.display = "none"; //모달 닫기
            });
        })
    });

	//채팅방 이름 변경
    const saveBtn = document.querySelector("#saveBtn");
    saveBtn.addEventListener("click", function () { 
        var newTitle = document.querySelector("#newTitle").value;
        console.log("newTitle = ", newTitle);
        console.log("chatRoomCd = ", chatRoomCd);
        //위 두값을 ajax 로 넘겨서 수정해야함
        $.ajax({
            type: "PUT",
            url:`/messenger/${chatRoomCd}`,
            data: newTitle,
            dataType: "json",
            contentType : "application/json",
            success: function(resp){
                console.log("결과 ==>" ,resp);
                alert("변경되었습니다");
                location.reload();
            },
            error :function(xhr){
                console.log("변경 실패 ====> ", xhr);
            }
        });
    });

	//채팅 메시지 전송
    const msgSendBtn = document.querySelector("#msgSendBtn");
    msgSendBtn.addEventListener("click",function(){


        var inputText = document.querySelector("#inputText");
        var text = inputText.value;
        text.innerHTML = ""; //입력란 초기화

        var currentDate = new Date();
        var formattedDate = currentDate.toISOString().split('T')[0]; // YYYY-MM-DD
        var formattedTime = new Intl.DateTimeFormat('en-US', { hour: '2-digit', minute: '2-digit' }).format(currentDate);
        sendData.sendDate = formattedDate;
        sendData.sendTime = formattedTime;
        sendData.chatRoomCd = chatRoomCd;
        sendData.sendContent = text;
		
        // 기존 대화 가져오기
        var existingData = localStorage.getItem(chatRoomCd);
        console.log("existingData ---> ", existingData);
        var storageData = []; //데이터가 쌓일 배열
        if(existingData){ //기존데이터가 있다면
            storageData = JSON.parse(existingData); 
        }
        storageData.push(sendData);

        console.log("보내기전 마지막 ! sendData ===> ", sendData);

        //1) local storage 에 저장
        localStorage.setItem(chatRoomCd, JSON.stringify(storageData));
        //2) 보내기
		webSocketChat.send(JSON.stringify(sendData));
     
    });
	
});

//전체 사원 목록 불러오기
const getAllEmpList = () => {

};
