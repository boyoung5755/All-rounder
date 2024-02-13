/**
 * <pre>
 * 
 * </pre>
 * @author 박민주
 * @since 2023. 11. 12.
 * @version 1.0
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일        수정자       수정내용
 * --------     --------    ----------------------
 * 2023. 11. 12.      박민주       최초작성
 * 2023. 11. 13.      박민주		sendForm 구현 완료
 * 2023. 11. 14.	  박민주		첨부파일 전송 위해 sendForm 수정
 * 2023. 11. 15.      박민주		
 * 2023. 11. 16. 
 * Copyright (c) 2023 by DDIT All right reserved
 * </pre>
 */


//전역변수
const MJ = {};

// 전역 함수 (메일 작성 모달 실행되는 함수)
MJ.getJSON = function (pURL) { //메소드를 get으로 고정시켜 놓고 url만 설정
	console.log("체킁킁:ppp", pURL);
	let xhr = new XMLHttpRequest();
	xhr.open("get", pURL, true);
	xhr.onreadystatechange = function () {
		if (xhr.readyState == 4 && xhr.status == 200) {
			let tags = makeRecpList(xhr.responseText);
			console.log("select 여기~", $("#receiversCd"));
			$("#receiversCd").append(tags);
			console.log(tags);
		}
	}
	xhr.send();
}

// 날짜 형식 변경하는 함수 : ex) 97/01/25
const changeDateFormat = (inputText) => {
	const dateObject = new Date(inputText);
	const shortYear = dateObject.getFullYear().toString().slice(-2);
	// 원하는 형식으로 포맷팅
	const formattedDate = `${shortYear}/${dateObject.getMonth() + 1}/${dateObject.getDate()}`;
	return formattedDate;
}

// 전 직원목록을 반함
let makeRecpList = function (resp) {
	let respList = JSON.parse(resp).list;
	let deptList = JSON.parse(resp).dept;
	//console.log(deptList);
	let tags = "";

	for (let i = 0; i < deptList.length; i++) {
		if (deptList[i].udeptCd == "DEPT_010") {
			tags += `<option data-avatar="10.png" value="${deptList[i].deptCd}">[${deptList[i].deptName}] 전체 </option>`;
		}
	}

	for (let i = 0; i < respList.length; i++) {
		if (respList[i].empName != "관리자") {
			tags += `<option data-avatar="5.png" value="${respList[i].empCd}">[${respList[i].dept.deptName}]${respList[i].empName} ${respList[i].common.commonCodeSj}</option>`;
		}
		// console.log(respList[i].empName);
	}
	return tags;
}

//DomContentLoaded 이벤트
$(function () {
	$("#pagingHere").empty();
	emailSearch = document.querySelector('.email-search-input');
	emailView = document.querySelector(".app-email-view-content");
	emailViewContainer = document.getElementById('app-email-view');
	emailFilterFolderLists = [].slice.call(document.querySelectorAll('.email-filter-folders li'));
	emailListItemActions = [].slice.call(document.querySelectorAll('.email-list-item-actions li'));

	// ▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶ 메일 리스트 출력하는 이벤트 및 함수들 ▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶
	// 페이지 로딩 후, 실행 : 받은 메일 리스트를 파라미터로 가져와서 makeMailList 함수 실행
	let makeMailList = function (pUrl, mailBoxType) {
		console.log("mailBoxType ====> ", mailBoxType);
		let settingsList = {
			url: `/mail/${pUrl}`,
			method: "get",
			dataType: "json",
			contentType: "application/json; charset=utf-8"
		};
		$.ajax(settingsList).done(function (resp) {
			// console.log("mailBoxType ===> ", mailBoxType);
			let liTag = makeMailLiTag(resp, mailBoxType);
			$("#mailUl").append(liTag);
			$("#pagingHere").append(resp.paging.pagingHTML);
			
			bookmarkEmail = [].slice.call(document.querySelectorAll('.email-list-item-bookmark'));
			 // Bookmark email=======================================================================================
		    if (bookmarkEmail) {
		      bookmarkEmail.forEach(emailItem => {
		        emailItem.addEventListener('click', e => {
		          let emailItem = e.currentTarget.parentNode.parentNode;
		          let starredAttr = emailItem.getAttribute('data-starred');
					console.log("emailItem ====> ", emailItem);
					var emailCd = emailItem.getAttribute('data-value'); //메일코드
					mailBoxType = emailItem.getAttribute('data-mailBoxType'); //메일함코드
					console.log("별표 눌러서 획득한 메일코드 ! =====> ", emailCd);
					console.log("별표 눌러서 획득한 mailBoxType ! =====> ", mailBoxType);

					//ajax 실행 => 중요 메일 처리
					$.ajax({
						type: "PUT",
						url: `/mail/important/${emailCd}`,
						data: JSON.stringify({ mailBoxType: mailBoxType }),
						contentType: "application/json",
						dataType: "JSON",
						success: (resp) => {
							console.log("성공!! ===> " , resp);
						},
						error: (xhr) => {
							console.log("실패 : " , xhr.status);
						}
					})

		          e.stopPropagation();
		          if (!starredAttr) {
		            emailItem.setAttribute('data-starred', 'true');
		          } else {
		            emailItem.removeAttribute('data-starred');
		          }
		        });
		      });
		    }//=======================================================================================
			// 메일리스트 클릭 했을 때, 상세 정보
			emailListItems1 = [].slice.call(document.querySelectorAll('.email-list-item')); //메일리스트 중 한개
			console.log("list item==> ", emailListItems1);

			if (emailListItems1) {
				emailListItems1.forEach(emailListItem => {
					emailListItem.addEventListener('click', e => {
						emailViewModal(emailListItem); //메일 상세 정보 모달 함수 실행
						
					});
				});
			};

			//메일 상세 정보 모달 함수
			let emailViewModal = function (emailListItem) {
				emailView1 = document.getElementById('app-email-view');
				emailView1.className += ' show';
				let mailCd = emailListItem.getAttribute('data-value');
				console.log("mailCd====> ", mailCd);
				
				// 메일 상세 스크롤바
			    if (emailView) {
			      new PerfectScrollbar(emailView, {
			        wheelPropagation: false,
			        suppressScrollX: true
			      });
			    }

				$.ajax({
					url: `/mail/${mailCd}`,
					type: "get",
					dataType: "JSON",
					success: (resp) => {
						if(resp){
							//메일 상세페이지 모달 input 태그 비우기
							$("#mailViewName").empty(); //이름란 비우기
							$("#mailViewEmail").empty(); //발신자 이메일란 비우기
							$("#emailViewDateTime").empty(); //발신날짜 비우기
							$("#emailViewCardBody").empty(); // 내용란 비우기

							var mailViewName = `
								[${resp.senderVO.dept.deptName}]${resp.senderVO.empName}
							`;
							//모달에 넣기
							$("#mailViewName").text(mailViewName); //발신인 넣기
							$("#mailViewEmail").text(resp.senderVO.empMail); //발신인 이메일 넣기
							$("#emailViewDateTime").text(resp.mailTrnsmisDt); //발신날자 넣기
							$("#emailViewCardBody").html(resp.mailCn); //내용 넣기
							
							//첨부파일 처리
							var attachesListText = `
									<hr/>
									<p class="mb-2">Attachments</p>
									<div class="cursor-pointer" id="emailViewAttaches">
							`;
							if(!resp.attachments){ //첨부파일 없을 시
								attachesListText += "첨부파일 없음";
							}else{ //첨부파일 있을 시
								for(var i=0; i<resp.attachments.length; i++){
									var attNo = resp.attachments[i].mailAttachNo;
									if(!i==0){ //i가 0이 아니라면
										attachesListText += "<br/>";
									}
									attachesListText += `
										<a href="/mail/${mailCd}/mailAttach/${attNo}">
										<i class="bx bx-file"></i>
										<span class="align-middle ms-1">${resp.attachments[i].mailAttachName}</span></a>
									`;
								}
							}
							attachesListText += "</div>";
							$("#emailViewCardBody").append(attachesListText);
						}
					}
				})
			}
		});

		//메일 리스트 태그 만들기 함수
		let makeMailLiTag = function (resp, mailBoxType) {
			$("#pagingDiv").append(resp.paging);

			let dataList = resp.paging.dataList;
			console.log(resp.paging);
			let liTag = "";
			if (dataList.length == 0) {
				liTag += `
					<li> 메일함이 비었습니다 !</li>
				`;
			}
			for (var i = 0; i < dataList.length; i++) {
				console.log(dataList[i]);
				let cnText = dataList[i].mailCn;
				let newCnText = cnText.replace(/<[^>]*>?/g, '').replace(/\n/g, '');
				console.log(dataList[i].mailCn);
				console.log(newCnText);
				let dateText = dataList[i].mailTrnsmisDt;
				let formattedDate = changeDateFormat(dateText);

				liTag += `
				<li
				data-mailBoxType="${mailBoxType}"
				style="z-index:-5"
				data-value="${dataList[i].mailCd}"
				class="email-list-item email-marked-read"
				data-starred="true"
				data-bs-toggle="sidebar"
				data-target="#app-email-view">
				<div class="d-flex align-items-center">
				  <div class="form-check">
					<input class="email-list-item-input form-check-input" type="checkbox" id="email-1" />
					<label class="form-check-label" for="email-1"></label>
				  </div>
				  <i
				  	id="starBtn"
					class="email-list-item-bookmark bx bx-star d-sm-inline-block d-none cursor-pointer mx-4 bx-sm"></i>
				  <img
					src="/resources/assets/img/avatars/1.png"
					alt="user-avatar"
					class="d-block flex-shrink-0 rounded-circle me-sm-3 me-0"
					height="32"
					width="32" />
				  <div class="email-list-item-content ms-2 ms-sm-0 me-2">
					<span class="email-list-item-username me-2 h6">${dataList[i].mailSj}</span>
					<span class="email-list-item-subject d-xl-inline-block d-block" id="mailCnText">
						[${dataList[i].senderVO.dept.deptName}/${dataList[i].senderVO.common.commonCodeSj}] ${dataList[i].senderVO.empName}
					</span>
				  </div>
				  <div class="email-list-item-meta ms-auto d-flex align-items-center">
					<small class="email-list-item-time text-muted">${formattedDate}</small>
					<ul class="list-inline email-list-item-actions">
					  <li class="list-inline-item email-delete" data-btnId="delBtn" data-value="${dataList[i].mailCd}" data-mailBoxType="${mailBoxType}"><i class="bx bx-trash-alt fs-4"></i></li>
					  <li class="list-inline-item email-unread"><i class="bx bx-envelope fs-4"></i></li>
					  <li class="list-inline-item"><i class="bx bx-error-circle fs-4"></i></li>
					</ul>
				  </div>
				</div>
			  </li>
				`;
			};
			return liTag;
		}

	};
	makeMailList("receptionMail", "R"); //처음 로딩 되었을 때 mailList => (받은메일함 "1")
	
	//================================================================

	// 받은 메일함 클릭 시 이벤트 : 받은 메일 리스트를 파라미터로 가져와서 makeMailList 함수 실행
	$("#sentMailBox").on("click", function () {
		$("#pagingHere").empty();
		$("#mailUl").empty();
		makeMailList("sentMail", "S");
	});
	
	// 보낸 메일함 클릭 시 이벤트 : 보낸 메일 리스트를 파라미터로 가져와서 makeMailList 함수 실행
	$("#receptionMailBox").on("click", function () {
		$("#pagingHere").empty();
		$("#mailUl").empty();
		makeMailList("receptionMail", "R");
	});

	$("#importantMailBox").on("click", function () {
		alert("중요메일함 입니당");
		$("#mailUl").empty();
		
		$.ajax({
			type : "GET",
			url: "/mail/important/",
			dataType: "JSON",
			success : (resp) => {
				console.log("성공했다 ! ===> " +resp);
			},
			error : (xhr) => {
				console.log("실패했다 ㅠㅠ")
			}
		});
	
	});

	
	
	
	

	// ◀◀◀◀◀◀◀◀◀◀◀◀◀◀◀◀◀◀◀ 여기까지 메일 리스트 출력하는 이벤트 및 함수들 ◀◀◀◀◀◀◀◀◀◀◀◀◀◀◀◀◀◀◀

	// ▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶ 메일 상세 출력 ▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶

	// ◀◀◀◀◀◀◀◀◀◀◀◀◀◀◀◀◀◀◀ 여기까지 메일 리스트 출력하는 이벤트 및 함수들 ◀◀◀◀◀◀◀◀◀◀◀◀◀◀◀◀◀◀◀

	//이메일 상세보기에서 내용이 화면 넘칠 시, 스크롤 처리
	if (emailView) {
		new PerfectScrollbar(emailView, {
			wheelPropagation: false,
			suppressScrollX: true
		});
	}

	// Close view on email filter folder list click
	if (emailFilterFolderLists) {
		emailFilterFolderLists.forEach(emailFilterFolderList => {
			emailFilterFolderList.addEventListener('click', e => {
				emailViewContainer.classList.remove('show');
			});
		});
	}

	// ▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶ 메일 작성 관련 ▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶

	// 메일 작성 클릭 시, 메일 작성 모달 출력
	emailCompose = document.querySelector('.app-email-compose');
	emailCompose.addEventListener('show.bs.modal', event => {
		// 메일 작성 모달 출력됐을 때, 제목, 수신자, 내용, 파일선택란이 비어있어야한다.
		// $('#mailCn').val('');
		//console.log(CKEDITOR.instances.mailC);
		// CKEDITOR.instances.mailCn.setData("");
		$('#receiversCd').val('');
		MJ.getJSON("/org/list"); // 메일 작성 모달에서 전 직원의 목록을 수신자 선택란에 append 하는 함수실행 
		initSelect2();
	});

	function initSelect2() { //수산자 리스트에 사원의 이미지를 렌더링함 !
		receiversCd = $('#receiversCd'); //수신자를 선택하는 select 태그

		if (receiversCd.length) {
			function renderContactsAvatar(option) { //수신자 리스트에 사원의 이미지를 렌더링하는 함수
				if (!option.id) {
					return option.text;
				}
				var dataAvatar = $(option.element).data('avatar');
				let $avatar =
					"<div class='d-flex flex-wrap align-items-center'>" +
					"<div class='avatar avatar-xs me-2 w-px-20 h-px-20'>" +
					`<img src="/resources/assets/img/avatars/${dataAvatar}" alt='avatar' class='rounded-circle'/>` +
					'</div>' +
					option.text +
					'</div>';
				return $avatar;
			}
			receiversCd.wrap('<div class="position-relative"></div>').select2({ //위의 함수 랩핑, 호출
				placeholder: '선택',
				dropdownParent: receiversCd.parent(),
				closeOnSelect: false,
				templateResult: renderContactsAvatar,
				templateSelection: renderContactsAvatar,
				escapeMarkup: function (es) {
					return es;
				}
			});
		}
	}

	//메일 작성 시, 이미지 업로드할 때 토큰 같이 넘기기
	let csrfparam = $("meta[name='_csrf_parameter']").attr("content");
	let csrf = $("meta[name='_csrf']").attr("content");
	CKEDITOR.replace("mailCn", {
		filebrowserImageUploadUrl: `/mail/image?type=image&${csrfparam}=${csrf}`
	});

	//sendBtn 클릭시 메일 전송
	$("#sendBtn").on("click", function (event) {
		let formData = new FormData($("#sendForm")[0]);

		// JSON Data append
		let mailSj = $("#mailSj").val();
		let receiversCd = $("#receiversCd").val(); //배열
		let mjMailCn = CKEDITOR.instances.mailCn.getData();

		console.log("작성된 메일 내용 ====>", mjMailCn)

		formData.append('mailCn', mjMailCn); //이거 안하면 쉼표(,) 만 넘어감 ㅠㅠ

		$.ajax({
			type: "post",
			url: "/mail",
			data: formData,
			processData: false,  // 필수: FormData를 string으로 변환하지 않음
			contentType: false,   // 필수: 파일 업로드를 위해 false로 설정
			dataType: "json",
			success: (resp) => {
				console.log(resp);
				if (resp.status === "OK") { //메일 전송 성공
					alert("메일 전송 성공");
				} else { //메일 전송 실패
					alert("메일 전송 실패");
				}
			},
			error: (xhr) => {
				console.log(xhr.status);
			}
		})
	}); //메일 전송 submit
	// ◀◀◀◀◀◀◀◀◀◀◀◀◀◀◀◀◀◀◀ 여기까지 메일 작성 관련 ◀◀◀◀◀◀◀◀◀◀◀◀◀◀◀◀◀◀◀
});

$(document).on("click", "li[data-btnId='delBtn']", function (e) {
	$("#app-email-view").removeClass('col app-email-view flex-grow-0 bg-body show');
	$("#app-email-view").addClass('col app-email-view flex-grow-0 bg-body');
	console.log("부모찾기 ===> ", $(this).parent());
	console.log("this ===> ", this);
	return false;
});

