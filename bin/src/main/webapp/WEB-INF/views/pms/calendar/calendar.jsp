<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security"%>
<script src='https://cdn.jsdelivr.net/npm/fullcalendar@6.1.8/index.global.min.js'></script>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/calendar/calendar.css">
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>


<security:authentication property="principal" var="principal" />

<!-- 실제 화면을 담을 영역 -->
<div id="Wrapper">
	<div id='calendar'></div>
	<button onclick="insertOpenModal()" id="openCal" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#enableOTP" _msttexthash="15070224" _msthash="286">등록</button>
</div>


<!-- 모달 영역 밖으로 빼어 놓는게 좋음-->
<div id="yrModal" class="modal-dialog modal-lg modal-simple modal-add-new-address" _mstvisible="1">
	<div class="modal-content p-3 p-md-5" _mstvisible="2">
		<div class="modal-body" _mstvisible="3">
			<button onclick="fMClose()" type="button" class="btn-close" data-bs-dismiss="modal" aria-label="닫다" _mstaria-label="59709" _msthash="363" _mstvisible="4"></button>
			<div class="text-center mb-4" _mstvisible="4">
				<h3 class="address-title" _msttexthash="28777372" _msthash="364" _mstvisible="5">Calendar</h3>
				<p class="address-subtitle" _msttexthash="97182306" _msthash="365" _mstvisible="5">( 일정 추가 )</p>
			</div>
			<form method="post" id="addNewAddressForm" class="row g-3 fv-plugins-bootstrap5 fv-plugins-framework" onsubmit="return false" novalidate="novalidate" _mstvisible="4">
				<div class="col-12 col-md-6 fv-plugins-icon-container" _mstvisible="5">
					범위<select id="schType" name="schType" onchange="selectBoxChange(this.value);">
						<option value="" style="display: none;" disabled selected>--선택--</option>
						<c:forEach items="${listType }" var="type">
							<option value="${type.commonCodeCd }">${type.commonCodeSj}</option>
						</c:forEach>
					</select><br> 시작일 <input type="datetime-local" id="schStart" name="schStart" value=""><br> 종료일 <input type="datetime-local" id="schEnd" name="schEnd" value=""><br> 제목 <input type="text" id="schTitle" name="schTitle" value=""><br> 내용
					<textarea name="schContent" id="schContent" name="schContent" cols="40" rows="8"></textarea>
					<br> 하루종일 <input type="checkbox" id="allDay" name="allDay"><br> 알람여부 <input type="checkbox" id="schAlarm" name="schAlarm"><br>
					<!-- 					배경색<input type="color" id="schBColor" name="schBColor" > -->
					글자색<input type="color" id="schFColor" name="schFColor">
					<div class="fv-plugins-message-container fv-plugins-message-container--enabled invalid-feedback" _mstvisible="6"></div>
				</div>

				<button onclick="fCalAdd()" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#enableOTP" _msttexthash="15070224" _msthash="286">등록</button>
				<input type="hidden" id="schEmpCd" name="schEmpCd" value="${principal.realUser.empCd }"> <input type="hidden" id="schCode" name="schCode" _mstvisible="5">
				<security:csrfInput />
			</form>
		</div>
	</div>
</div>

<!-- 모달 영역 밖으로 빼어 놓는게 좋음-->
<div id="detailModal" class="modal-dialog modal-lg modal-simple modal-add-new-address" _mstvisible="1">
	<div class="modal-content p-3 p-md-5" _mstvisible="2">
		<div class="modal-body" _mstvisible="3">
			<button onclick="fMClose()" type="button" class="btn-close" data-bs-dismiss="modal" aria-label="닫다" _mstaria-label="59709" _msthash="363" _mstvisible="4"></button>
			<div class="text-center mb-4" _mstvisible="4">
				<h3 class="address-title" _msttexthash="28777372" _msthash="364" _mstvisible="5">Calendar</h3>
				<p class="address-subtitle" _msttexthash="97182306" _msthash="365" _mstvisible="5">( 일정 수정, 삭제 )</p>
			</div>
			<form method="post" id="addNewAddressForm" class="row g-3 fv-plugins-bootstrap5 fv-plugins-framework" onsubmit="return false" novalidate="novalidate" _mstvisible="4">
				<div class="col-12 col-md-6 fv-plugins-icon-container" _mstvisible="5">
					제목 <input type="text" id="detailTitle" name="detailTitle" value=""><br> 내용
					<textarea name="schContent" id="detailContent" name="detailContent" cols="40" rows="8"></textarea>
					<br> 시작일 <input type="datetime-local" id="detailStart" name="detailStart" value=""><br> 종료일 <input type="datetime-local" id="detailEnd" name="detailEnd" value=""><br> 작성자 <input type="text" id="detailEmp" name="detailEmp" value="" disabled><br> 하루종일 <input type="checkbox" id="detailAllDay" name="detailAllDay"><br> 알람여부 <input type="checkbox" id="detailAlarm" name="detailAlarm"><br> 글자색<input type="color" id="detailFColor" name="detailFColor">
					<div class="fv-plugins-message-container fv-plugins-message-container--enabled invalid-feedback" _mstvisible="6"></div>
				</div>
				<input type="hidden" id="detailEmpCd" name="detailEmpCd" value="" />
				<button onclick="fCalUpdate()" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#enableOTP" _msttexthash="15070224" _msthash="286">수정</button>
				<button onclick="fCalDelete()" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#enableOTP" _msttexthash="15070224" _msthash="286">삭제</button>

				<security:csrfInput />
			</form>
		</div>
	</div>
</div>


<%--  <script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/app/calendar/calendar.js"></script>  --%>


<script>
        
        const YrModal = document.querySelector("#yrModal");
        const calendarEl = document.querySelector('#calendar');
        const mySchType = document.querySelector("#schType");
        const mySchStart = document.querySelector("#schStart");
        const mySchEnd = document.querySelector("#schEnd");
        const mySchTitle = document.querySelector("#schTitle");
        const mySchContent = document.querySelector("#schContent");
        const mySchAllday = document.querySelector("#allDay");
        const mySchAlarm = document.querySelector("#schAlarm");
//         const mySchBColor = document.querySelector("#schBColor");
        const mySchFColor = document.querySelector("#schFColor");
        const mySchCode = document.querySelector("#schCode");
        const mySchEmpCd = document.querySelector("#schEmpCd");
        const form = document.querySelector("#addNewAddressForm");
        
        
        const detailTitle = document.querySelector("#detailTitle");
        const detailContent = document.querySelector("#detailContent");
        const detailStart = document.querySelector("#detailStart");
        const detailEnd = document.querySelector("#detailEnd");
        const detailEmp = document.querySelector("#detailEmp");
        const detailAllDay = document.querySelector("#detailAllDay");
        const detailAlarm = document.querySelector("#detailAlarm");
        const detailFColor = document.querySelector("#detailFColor");
        const detailEmpCd = document.querySelector("#detailEmpCd");

        
        //캘린더 헤더 옵션
        const headerToolbar = {
            left: 'prevYear,prev,next,nextYear today',
            center: 'title',
            right: 'dayGridMonth,dayGridWeek,timeGridDay'
        }



      //jquery 소스
      var selectBoxChange = function(value){
	    console.log("값변경테스트: " + value);
	    $.ajax({
	        method: "GET", // type을 method로 수정
	        url: "/cal/code",
	        contentType: "application/json",
	        dataType: "json", // 서버로부터 기대되는 데이터 형식
	        data: { 
	            schType: value 
	        },
	        success: function(rslt){
	            console.log(rslt.code);
	            $("#schCode").val(rslt.code);
	        },
	    });
	};
        
        
//         let events = [
//             {
//             	calCd : "C_231128_001",
//                 title: '테스트',
//                 start: "2023-11-28T09:20",
//                 end: "2023-11-29T09:20",
//                 backgroundColor : "#f40101",
//                 textColor : "black",
//                 type : "C",
//                 allDay : false
//             },
//             {
//             	calCd : "C_231110_001",
//                 title: '가',
//                 start: "2023-11-10T09:20",
//                 end: "2023-11-12T09:20",
//                 backgroundColor : "#f40101",
//                 textColor : "black",
//                 type : "P",
//                 allDay : false
//             },
//             {
//             	calCd : "C_231120_001",
//                 title: 'sk',
//                 start: "2023-11-20T09:20",
//                 end: "2023-11-22T09:20",
//                 backgroundColor : "#f40101",
//                 textColor : "black",
//                 type : "I",
//                 allDay : false
//             }
//         ];


        // 캘린더 생성 옵션(참고)
        const calendarOption = {
            height: '700px', // calendar 높이 설정
            expandRows: true, // 화면에 맞게 높이 재설정
            slotMinTime: '09:00', // Day 캘린더 시작 시간
            slotMaxTime: '18:00', // Day 캘린더 종료 시간
            // 맨 위 헤더 지정
            headerToolbar: headerToolbar,
            initialView: 'dayGridMonth',  // default: dayGridMonth 'dayGridWeek', 'timeGridDay', 'listWeek'
            locale: 'kr',        // 언어 설정
            selectable: true,    // 영역 선택
            selectMirror: true,  // 오직 TimeGrid view에만 적용됨, default false
            navLinks: true,      // 날짜,WeekNumber 클릭 여부, default false
            weekNumbers: true,   // WeekNumber 출력여부, default false
            editable: true,      // event(일정) 
            // 시작일 및 기간 수정가능여부
            eventStartEditable: true,
            eventDurationEditable: true,
            
            dayMaxEventRows: true,  // Row 높이보다 많으면 +숫자 more 링크 보임!
            /*
            views: {
                dayGridMonth: {
                    dayMaxEventRows: 3
                }
            },
            */
            nowIndicator: true,
            events:"/cal/list",
            /*
            eventSources: [
                './commonEvents.json'  // Ajax 요청 URL임에 유의!
//                 './KYREvents.json',
//                 './SYREvents.json'
            	
            ]
            */
        }

        // 캘린더 생성
        const calendar = new FullCalendar.Calendar(calendarEl, calendarOption);

        calendar.render();

        // 캘린더 이벤트 등록
//         calendar.on("eventAdd", info => console.log("Add:", info));
//         calendar.on("eventChange", info => console.log("Change:", info));
//         calendar.on("eventRemove", info => console.log("Remove:", info));
//         calendar.on("eventClick", info => {
//             console.log("eClick:", info);
//             console.log('Event: ', info.event.extendedProps);
//             console.log('Coordinates: ', info.jsEvent);
//             console.log('View: ', info.view);

//             detailOpenModal();
            
//             info.el.style.borderColor = 'purple';
//         });
//         calendar.on("eventMouseEnter", info => console.log("eEnter:", info));
//         calendar.on("eventMouseLeave", info => console.log("eLeave:", info));
//         calendar.on("dateClick", info => console.log("dateClick:", info));
//         calendar.on("select", info => {
//             console.log("체크:", info);

//             mySchStart.value = info.startStr;
//             mySchEnd.value = info.endStr;

//             YrModal.style.display = "block";
//         });

        calendar.on("eventClick", info => {
			
         let scheduleCd = info.event.extendedProps.calCd;

		console.log("결과 : ", scheduleCd);        	
			$.ajax({
				type:"get",
				url:"/cal/detail",
				contentType: "application/json",
				dataType: "json",
				data:{
					"scheduleCd":scheduleCd
				},
				success:function(rslt){
					let detail = rslt.detailCal;
					detailTitle.value=detail.scheduleSj;
					detailContent.value=detail.scheduleCn;
					detailStart.value=detail.scheduleBgnDt;
					detailEnd.value=detail.scheduleEndDt;
					detailEmp.value=detail.empCd;
					detailAllDay.value=detail.scheduleDayYn;
					detailAlarm.value=detail.scheduleAlarmYn;
					detailFColor.value=detail.scheduleFcolor;
					detailEmpCd.value=scheduleCd;
					
					detailOpenModal();

				},
            	error: function (request, status, error) {
                    console.log("code: " + request.status)
                    console.log("message: " + request.responseText)
                    console.log("error: " + error);
                }
			})

        });
        

        // 일정(이벤트) 추가
        function fCalAdd() {
            if (!mySchType.value) {
                alert("범위를 선택하세요")
                mySchType.focus();
                return;
            }
            if (!mySchTitle.value) {
                alert("제목을 입력하세요")
                mySchTitle.focus();
                return;
            }
//             let bColor = mySchBColor.value;
            let fColor = mySchFColor.value;
//             if (fColor == bColor) {
//                 bColor = "black";
//                 fColor = "white";
//             }

            let event = {
                "searchCd": mySchType.value,
                "scheduleBgnDt": mySchStart.value,
                "scheduleEndDt": mySchEnd.value,
                "scheduleCn": mySchContent.value,
                "scheduleSj": mySchTitle.value,
                "scheduleAlarmYn": mySchAlarm.checked?'Y':'N',
                "scheduleDayYn": mySchAllday.checked?'Y':'N',
                "empCd": mySchEmpCd.value,
//                 backgroundColor: bColor,
                "scheduleFcolor": fColor,
                "scheduleCd":mySchCode.value
            };
            console.log(event);
            
            $.ajax({
            	type:"post",
            	url:"/cal",
            	data:JSON.stringify(event),
            	contentType: "application/json",
            	dataType:"json",
            	success:function(rslt){
//             		calendar.addEvent(event);
//             		calendarOption();
            		calendar.refetchEvents();
            		fMClose();
            	},
            	error: function (request, status, error) {
                    console.log("code: " + request.status)
                    console.log("message: " + request.responseText)
                    console.log("error: " + error);
                }
            })
            
            
//             calendar.addEvent(event);
//             fMClose();

        }

        // 모달 열기 함수
        function insertOpenModal() {
            // 모달을 나타나게 설정
            YrModal.style.display = "block";
        }
        
        // 모달 열기 함수
        function detailOpenModal() {        	
            // 모달을 나타나게 설정
            detailModal.style.display = "block";
        }

        // 모달 닫기 함수
        function fMClose() {
            // 모달을 숨기는 설정
            YrModal.style.display = "none";
            detailModal.style.display = "none";
        }
        
        //이벤트 업데이트!, 이벤트소스 다시 가져와서 다시 그리깅
        function fCalUpdate() {
            let jsondata  = {
            	"scheduleCd":detailEmpCd.value,
     			"scheduleSj" : detailTitle.value,
     			"scheduleCn" : detailContent.value,
     			"scheduleBgnDt" : detailStart.value,
     			"scheduleEndDt" : detailEnd.value,
     			"empCd": mySchEmpCd.value,
     			"scheduleDayYn" : detailAllDay.checked?'Y':'N',
     			"scheduleAlarmYn" : detailAlarm.checked?'Y':'N',
     			"scheduleFcolor" : detailFColor.value
            }
            $.ajax({
        		url : "/cal",
        		type : "put",
        		contentType: "application/json;charset=UTF-8",
        		data : JSON.stringify(jsondata),
        		success : function(res) {
        			console.log(res);
        			calendar.refetchEvents();
            		fMClose();
        		},
        		error: function (request, status, error) {
                    console.log("code: " + request.status)
                    console.log("message: " + request.responseText)
                    console.log("error: " + error);
                },
        		dataType : 'json'
        	})
        	
            calendar.refetchEvents();
        }
        
        function fCalDelete(){
        	
            Swal.fire({
                title: '정말 삭제 하시겠습니까?',
                text: "다시 되돌릴 수 없습니다.",
                icon: 'warning',
                showCancelButton: true,
                confirmButtonColor: '#3085d6',
                cancelButtonColor: '#d33',
                confirmButtonText: '승인',
                cancelButtonText: '취소',
                reverseButtons: false, // 버튼 순서 거꾸로
                
              }).then(result => {
                if (result.isConfirmed) { // 만약 모달창에서 confirm 버튼을 눌렀다면
                
        	$.ajax({
        		url:"/cal",
        		type:"DELETE",
        		contentType: "application/json;charset=UTF-8",
        		data : detailEmpCd.value,
        		dataType : 'json',
        		success : function(res) {
        			calendar.refetchEvents();
            		fMClose();
        		},
        		error:function(xhr){
        			alert("2")
        		}
        	})
                   Swal.fire('삭제되었습니다.', '','success');
                }
             });
        	
        }
    </script>

