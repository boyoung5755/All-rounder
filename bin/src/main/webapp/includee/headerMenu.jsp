<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<%@taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
 <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<script>
    let webSocket = new WebSocket("ws://localhost/alarm");
	let webSocketChat = new WebSocket("ws://localhost/chat");
    
    const fOpen = ()=>{
        console.log(" 접속 성공!!!!!!!");
        // 서버로 메세지 보내기
    }
    // message이벤트가 발생했을 때 실행되는 함수
    const fMsg = ()=>{
        console.log("서버에서 온 메세지",event.data); //서버가 보낸 내용은 event.data에 담겨넘어옴
    };


    const COpen = ()=>{
        console.log("[채팅] 접속 성공!!!!!!!");
        // 서버로 메세지 보내기
    }
    // message이벤트가 발생했을 때 실행되는 함수
    const CMsg = ()=>{
    	//여기서 처리하기!
        console.log("[채팅] 서버에서 온 메세지", event.data); //서버가 보낸 내용은 event.data에 담겨넘어옴 //여기서 화면에 뿌려주기
        const receivedData = JSON.parse(event.data);
        console.log("JSON 객체로 다시 파싱~ ==> ", receivedData);
        
        let formatDate ="";
        if(compareToToday(receivedData.sendTime)){
        	formatDate = `\${receivedData.sendTime}`;
        }else{
        	formatDate = `\${receivedData.sendDate} / \${receivedData.sendTime}`;
        }
        let liTags = `
                    <li class="chat-message chat-message-right">
                        <div class="d-flex overflow-hidden">
                            <div class="chat-message-wrapper flex-grow-1">
                                <div class="chat-message-text">
                                    <p class="mb-0">\${receivedData.sendContent}</p>
                                </div>
                                <div class="text-end text-muted mt-1">
                                    <i class="bx bx-check-double text-success"></i> 
                                    <small>\${formatDate}</small>
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
        let lastChatRightMessage = document.querySelector(".chat-message-right:last-child");
        if (lastChatRightMessage) {
            lastChatRightMessage.insertAdjacentHTML('afterend', liTags);
        } else {
            // 만약 chat-message-right 클래스를 가진 요소가 없으면, 첫 번째 요소로 추가
            let historyUl = document.getElementById('historyUl');
            if (historyUl) {
                historyUl.insertAdjacentHTML('afterbegin', liTags);
            }
        }
    }
    
    webSocket.onopen = fOpen;
    webSocket.onmessage = fMsg;
    
    webSocketChat.onopen = COpen;
    webSocketChat.onmessage = CMsg;

</script>


 <!-- Navbar -->
<nav class="navbar navbar-expand-lg bg-primary">
  <div class="container-fluid">
    <a class="navbar-brand" href="javascript:void(0)"></a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbar-ex-7">
      <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbar-ex-7">

      <ul class="navbar-nav ms-lg-auto">
        <li class="nav-item">
          <a class="nav-link" href="javascript:void(0);"><i class="tf-icons navbar-icon bx bx-user"></i> Profile</a>
        </li>
        <!-- 실시간 알림 구현예정 -->
        <li class="nav-item">
          <a class="nav-link" href="javascript:void(0);"><i class="tf-icons bx bx-xs bx-bell">
          <span class="badge rounded-pill bg-danger text-white badge-notifications">5</span></i> Alarm</a>
        </li>
        <li class="nav-item" >
          <a class="nav-link" id="logoutUI" href="javascript:;"><i class="tf-icons navbar-icon bx bx-lock-open-alt"></i> Logout</a>
        </li>
      </ul>
    </div>
  </div>
</nav>



<form:form action="/logout" id="logoutForm" method="POST">
	<input type="hidden" value="로그아웃">
</form:form>
    
<script type="text/javascript">
	$("#logoutUI").on("click", function(event) {
		$(logoutForm).submit();
	});

	const compareToToday = (dateData) => {
		let today = new Date();
		let year = today.getFullYear();
		let month = String(today.getMonth() + 1).padStart(2, '0');
	    let day = String(today.getDate()).padStart(2, '0');
	    let formattedToday = `${year}-${month}-${day}`;
	    
	    if(dateData==formattedToday){
	    	return true;
	    }else{
	    	return false;
	    }
	}

</script>


          



