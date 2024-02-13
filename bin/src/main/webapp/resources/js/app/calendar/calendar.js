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
 * 2023. 11. 13.    오경석       최초작성
 * Copyright (c) 2023 by DDIT All right reserved
 * </pre>
 */ 

const YrModal = document.querySelector("#yrModal");
const calendarEl = document.querySelector('#calendar');
const mySchType = document.querySelector("#schType");
const mySchStart = document.querySelector("#schStart");
const mySchEnd = document.querySelector("#schEnd");
const mySchTitle = document.querySelector("#schTitle");
const mySchAllday = document.querySelector("#allDay");
const mySchBColor = document.querySelector("#schBColor");
const mySchFColor = document.querySelector("#schFColor");

//캘린더 헤더 옵션
const headerToolbar = {
    left: 'prevYear,prev,next,nextYear today',
    center: 'title',
    right: 'dayGridMonth,dayGridWeek,timeGridDay'
}

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
    events:events,
    /*
    eventSources: [
            './commonEvents.json'  // Ajax 요청 URL임에 유의!
//           './KYREvents.json',
//           './SYREvents.json'
            	
    ]
    */
}

 const YrModal = document.querySelector("#yrModal");
        const calendarEl = document.querySelector('#calendar');
        const mySchType = document.querySelector("#schType");
        const mySchStart = document.querySelector("#schStart");
        const mySchEnd = document.querySelector("#schEnd");
        const mySchTitle = document.querySelector("#schTitle");
        const mySchAllday = document.querySelector("#allDay");
        const mySchBColor = document.querySelector("#schBColor");
        const mySchFColor = document.querySelector("#schFColor");

        
        //캘린더 헤더 옵션
        const headerToolbar = {
            left: 'prevYear,prev,next,nextYear today',
            center: 'title',
            right: 'dayGridMonth,dayGridWeek,timeGridDay'
        }


        	let events = null;
        	$.ajax({
        		type: "get",
        		url: "/cal/list",
        		contentType: "application/json",
    			dataType: "json",
    			success : function(rslt){
    				alert("1")
    				events = rslt.empCal;
    				console.log("@@@@",rslt.empCal);
    			},
    			error : function(xhr){
    				alert("2")
    			}
        	})
 
        
        
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
            events:events,
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
        calendar.on("eventAdd", info => console.log("Add:", info));
        calendar.on("eventChange", info => console.log("Change:", info));
        calendar.on("eventRemove", info => console.log("Remove:", info));
        calendar.on("eventClick", info => {
            console.log("eClick:", info);
            console.log('Event: ', info.event.extendedProps);
            console.log('Coordinates: ', info.jsEvent);
            console.log('View: ', info.view);

            info.el.style.borderColor = 'purple';
        });
        calendar.on("eventMouseEnter", info => console.log("eEnter:", info));
        calendar.on("eventMouseLeave", info => console.log("eLeave:", info));
        calendar.on("dateClick", info => console.log("dateClick:", info));
        calendar.on("select", info => {
            console.log("체크:", info);

            mySchStart.value = info.startStr;
            mySchEnd.value = info.endStr;

            YrModal.style.display = "block";
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
            let bColor = mySchBColor.value;
            let fColor = mySchFColor.value;
            if (fColor == bColor) {
                bColor = "black";
                fColor = "white";
            }

            let event = {
                type: mySchType.value,
                start: mySchStart.value,
                end: mySchEnd.value,
                title: mySchTitle.value,
                allDay: mySchAllday.checked,
                backgroundColor: bColor,
                textColor: fColor
            };
            
            console.log("@@@@@",event);

            calendar.addEvent(event);
            fMClose();
        }

        // 모달 열기 함수
        function openModal() {
            // 모달을 나타나게 설정
            YrModal.style.display = "block";
        }

        // 모달 닫기 함수
        function fMClose() {
            // 모달을 숨기는 설정
            YrModal.style.display = "none";
        }
        
        //이벤트 업데이트!, 이벤트소스 다시 가져와서 다시 그리깅
        function fCalUpdate() {
            console.log("흥치치");
            calendar.refetchEvents();
        }