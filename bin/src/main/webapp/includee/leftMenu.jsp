<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
  <!-- Menu -->
  <aside id="layout-menu" class="layout-menu menu-vertical menu bg-menu-theme">
    <div class="app-brand demo">
      <a href="#" class="app-brand-link">
        <img src="/resources/images/minilogo.png" style="width: 35%;margin-left: -10px;margin-right: 10px;">
        <span class="app-brand-text demo menu-text fw-bold ms-2">sujinbabo</span>
      </a> <a href="javascript:void(0);" class="layout-menu-toggle menu-link text-large ms-auto"> <i
          class="bx bx-chevron-left bx-sm align-middle"></i>
      </a>
    </div>

    <div class="menu-inner-shadow"></div>

    <ul class="menu-inner py-1">
      <!-- Page -->
      <li class="menu-item active"><a href="/dashBoard/E220401001" class="menu-link"> <i class="menu-icon tf-icons bx bx-home-circle"></i>
          <div class="text-truncate">그룹웨어 대쉬보드</div>
        </a></li>
      <li class="menu-item"><a href="/pms/pdash/E220401001" class="menu-link">
          <i class="menu-icon tf-icons bx bx-detail"></i>
          <div class="text-truncate">PMS 대쉬보드</div>
        </a></li>

      <!--전자결재-->
      <li class="menu-item " style="">
        <a href="javascript:void(0);" class="menu-link menu-toggle">
          <i class="menu-icon tf-icons bx bx-lock-open-alt"></i>
          <div class="text-truncate">전자결재</div>
        </a>
        <ul class="menu-sub">
          <li class="menu-item">
            <a href="<c:url value='/sanctionform' />" class="menu-link">
              <div class="text-truncate">결재작성</div>
            </a>
          </li>
          <li class="menu-item">
            <a href="javascript:void(0);" class="menu-link menu-toggle">
              <div class="text-truncate">개인문서함</div>
            </a>
            <ul class="menu-sub">
              <li class="menu-item">
                <a href="javascript:void(0);" class="menu-link" target="_blank">
                  <div class="text-truncate">기안문서함</div>
                </a>
              </li>
              <li class="menu-item">
                <a href="javascript:void(0);" class="menu-link" target="_blank">
                  <div class="text-truncate">전체문서함</div>
                </a>
              </li>
              <li class="menu-item">
                <a href="javascript:void(0);" class="menu-link" target="_blank">
                  <div class="text-truncate">진행문서함</div>
                </a>
              </li>
              <li class="menu-item">
                <a href="javascript:void(0);" class="menu-link" target="_blank">
                  <div class="text-truncate">완료문서함</div>
                </a>
              </li>
              <li class="menu-item">
                <a href="javascript:void(0);" class="menu-link" target="_blank">
                  <div class="text-truncate">반려문서함</div>
                </a>
              </li>
              <li class="menu-item">
                <a href="javascript:void(0);" class="menu-link" target="_blank">
                  <div class="text-truncate">임시문서함</div>
                </a>
              </li>
              <li class="menu-item">
                <a href="javascript:void(0);" class="menu-link" target="_blank">
                  <div class="text-truncate">결재대기문서함</div>
                </a>
              </li>
            </ul>
          </li>
          <li class="menu-item" style="">
            <a href="javascript:void(0);" class="menu-link menu-toggle">
              <div class="text-truncate">부서문서함</div>
            </a>
          </li>
        </ul>
      </li>
      <!-- 전자결재여기까지 -->

      <!--게시판-->
      <li class="menu-item " style="">
        <a href="javascript:void(0);" class="menu-link menu-toggle">
          <i class="menu-icon tf-icons bx bx-lock-open-alt"></i>
          <div class="text-truncate">게시판</div>
        </a>
        <ul class="menu-sub">
          <li class="menu-item">
            <a href="<c:url value='/notice' />" class="menu-link">
              <div class="text-truncate">공지사항</div>
            </a>
          </li>
          <li class="menu-item">
            <a href="/event/home" class="menu-link">
              <div class="text-truncate">경조사</div>
            </a>
          </li>
          <li class="menu-item">
            <a href="javascript:void(0);" class="menu-link menu-toggle">
              <div class="text-truncate">자유게시판</div>
            </a>
          </li>
          <li class="menu-item" style="">
            <a href="<c:url value='/faq' />" class="menu-link "> 
              <div class="text-truncate">FAQ</div>
            </a>
          </li>
        </ul>
      </li>
      <!--게시판 여기까지-->


      <!--근태-->
      <li class="menu-item " style="">
        <a href="/attendance" class="menu-link ">
          <i class="menu-icon tf-icons bx bx-lock-open-alt"></i>
          <div class="text-truncate">근태현황</div>
        </a>
      </li>

      <!--그룹웨어일정-->
      <li class="menu-item " style="">
        <a href="/cal" class="menu-link ">
          <i class="menu-icon tf-icons bx bx-lock-open-alt"></i>
          <div class="text-truncate">그룹웨어일정</div>
        </a>
      </li>

      <!--프로젝트-->
      <li class="menu-item" style="">
        <a href="javascript:void(0);" class="menu-link menu-toggle">
          <i class="menu-icon tf-icons bx bx-spreadsheet"></i>
          <div class="text-truncate">프로젝트</div>
        </a>
        <ul class="menu-sub">
          <li class="menu-item">
            <a href="/cal" class="menu-link">
              <div class="text-truncate">프로젝트일정</div>
            </a>
          </li>
          <li class="menu-item">
            <a href="/job/P23001" class="menu-link">
              <div class="text-truncate">일감관리</div>
            </a>
          </li>
          <li class="menu-item">
            <a href="#" class="menu-link">
              <div class="text-truncate">간트차트빨리해송석원</div>
            </a>
          </li>
          <li class="menu-item">
            <a href="#" class="menu-link">
              <div class="text-truncate">이슈</div>
            </a>
          </li>
          <li class="menu-item">
            <a href="/pms/project" class="menu-link">
              <div class="text-truncate">프로젝트선택창</div>
            </a>
          </li>
          <li class="menu-item">
            <a href="/memo" class="menu-link">
              <div class="text-truncate">메모장</div>
            </a>
          </li>
          <li class="menu-item">
            <a href="javascript:void(0);" class="menu-link menu-toggle">
              <div class="text-truncate">업무현황</div>
            </a>
            <ul class="menu-sub">
              <li class="menu-item">
                <a href="javascript:void(0);" class="menu-link" target="_blank">
                  <div class="text-truncate">개인</div>
                </a>
              </li>
              <li class="menu-item">
                <a href="javascript:void(0);" class="menu-link" target="_blank">
                  <div class="text-truncate">리더통계</div>
                </a>
              </li>
            </ul>
          </li>
        </ul>
      </li>
      <!--프로젝트끝-->

      <!--자원예약-->
      <li class="menu-item" style="">
        <a href="javascript:void(0);" class="menu-link menu-toggle">
          <i class="menu-icon tf-icons bx bx-spreadsheet"></i>
          <div class="text-truncate">자원예약</div>
        </a>
        <ul class="menu-sub">
          <li class="menu-item">
            <a href="javascript:void(0);" class="menu-link">
              <div class="text-truncate">차량</div>
            </a>
          </li>
          <li class="menu-item">
            <a href="javascript:void(0);" class="menu-link">
              <div class="text-truncate">회의실</div>
            </a>
          </li>
          <li class="menu-item">
            <a href="javascript:void(0);" class="menu-link">
              <div class="text-truncate">내역</div>
            </a>
          </li>
        </ul>
      </li>
      <!-- /자원예약-->

      <!--메일-->
      <li class="menu-item" style="">
        <a href="" class="menu-link menu-toggle">
          <i class="menu-icon tf-icons bx bx-spreadsheet"></i>
          <div class="text-truncate">메일함</div>
        </a>
        <ul class="menu-sub">
          <li class="menu-item">
            <a href="/mail/mailForm" class="menu-link">
              <div class="text-truncate">메일함</div>
            </a>
          </li>
<!--           <li class="menu-item"> -->
<!--             <a href="javascript:void(0);" class="menu-link"> -->
<!--               <div class="text-truncate">메일쓰기</div> -->
<!--             </a> -->
<!--           </li> -->
<!--           <li class="menu-item"> -->
<!--             <a href="javascript:void(0);" class="menu-link"> -->
<!--               <div class="text-truncate">받은메일</div> -->
<!--             </a> -->
<!--           </li> -->
<!--           <li class="menu-item"> -->
<!--             <a href="javascript:void(0);" class="menu-link"> -->
<!--               <div class="text-truncate">보낸메일</div> -->
<!--             </a> -->
<!--           </li> -->
<!--           <li class="menu-item"> -->
<!--             <a href="javascript:void(0);" class="menu-link"> -->
<!--               <div class="text-truncate">휴지통</div> -->
<!--             </a> -->
<!--           </li> -->
          <li class="menu-item">
            <a href="javascript:void(0);" class="menu-link">
              <div class="text-truncate">주소록</div>
            </a>
          </li>
        </ul>
      </li>
      <!-- /메일-->

      <!--조직도-->
      <li class="menu-item " style="">
        <a href="javascript:void(0);" class="menu-link menu-toggle">
          <i class="menu-icon tf-icons bx bx-lock-open-alt"></i>
          <div class="text-truncate">조직도</div>
        </a>
        <ul class="menu-sub">
          <li class="menu-item">
            <a href="/org" class="menu-link">
              <div class="text-truncate">조직도조회</div>
            </a>
          </li>
          <li class="menu-item">
            <a href="/org/organization" class="menu-link">
              <div class="text-truncate">주소록</div>
            </a>
          </li>
        </ul>
      </li>
      <!--/조직도-->

      <!--마이페이지-->
      <li class="menu-item " style="">
        <a href="javascript:void(0);" class="menu-link ">
          <i class="menu-icon tf-icons bx bx-lock-open-alt"></i>
          <div class="text-truncate">마이페이지</div>
        </a>
      </li>
      <!--/마이페이지-->

      <!--웹하드-->
      <li class="menu-item" style="">
        <a href="javascript:void(0);" class="menu-link menu-toggle">
          <i class="menu-icon tf-icons bx bx-spreadsheet"></i>
          <div class="text-truncate">웹하드</div>
        </a>
        <ul class="menu-sub">
          <li class="menu-item">
            <a href="/web" class="menu-link">
              <div class="text-truncate">개인</div>
            </a>
          </li>
          <li class="menu-item">
            <a href="/web" class="menu-link">
              <div class="text-truncate">부서</div>
            </a>
          </li>
        </ul>
      </li>
      <!-- /웹하드-->



      <!--관리자-->
      <li class="menu-item " style="">
        <a href="javascript:void(0);" class="menu-link menu-toggle">
          <i class="menu-icon tf-icons bx bx-lock-open-alt"></i>
          <div class="text-truncate">관리자</div>
        </a>
        <ul class="menu-sub">
          <li class="menu-item">
            <a href="javascript:void(0);" class="menu-link">
              <div class="text-truncate">회사정보관리</div>
            </a>
          </li>
          <li class="menu-item">
            <a href="javascript:void(0);" class="menu-link menu-toggle">
              <div class="text-truncate">직원정보관리</div>
            </a>
            <ul class="menu-sub">
              <li class="menu-item">
                <a href="/account/home" class="menu-link" target="_blank">
                  <div class="text-truncate">계정관리</div>
                </a>
              </li>
            </ul>
          </li>
          <li class="menu-item" style="">
            <a href="javascript:void(0);" class="menu-link">
              <div class="text-truncate">프로젝트관리</div>
            </a>
          </li>
          <li class="menu-item" style="">
            <a href="/cal" class="menu-link">
              <div class="text-truncate">관리자일정</div>
            </a>
          </li>
          <li class="menu-item" style="">
            <a href="/org/organization" class="menu-link ">
              <div class="text-truncate">조직도관리</div>
            </a>
          </li>
          <li class="menu-item" style="">
            <a href="javascript:void(0);" class="menu-link ">
              <div class="text-truncate">지표분석</div>
            </a>
          </li>
          <li class="menu-item" style="">
            <a href="javascript:void(0);" class="menu-link ">
              <div class="text-truncate">관리자웹하드</div>
            </a>
          </li>
          <li class="menu-item" style="">
            <a href="javascript:void(0);" class="menu-link ">
              <div class="text-truncate">게시판</div>
            </a>
          </li>
          <li class="menu-item">
            <a href="javascript:void(0);" class="menu-link menu-toggle">
              <div class="text-truncate">근태관리</div>
            </a>
            <ul class="menu-sub">
              <li class="menu-item">
                <a href="javascript:void(0);" class="menu-link" target="_blank">
                  <div class="text-truncate">스케쥴러</div>
                </a>
              </li>
              <li class="menu-item">
                <a href="javascript:void(0);" class="menu-link" target="_blank">
                  <div class="text-truncate">직원근태</div>
                </a>
              </li>
            </ul>
          </li>
          <li class="menu-item">
            <a href="javascript:void(0);" class="menu-link menu-toggle">
              <div class="text-truncate">자원관리</div>
            </a>
            <ul class="menu-sub">
              <li class="menu-item">
                <a href="javascript:void(0);" class="menu-link" target="_blank">
                  <div class="text-truncate">차량관리</div>
                </a>
              </li>
              <li class="menu-item">
                <a href="javascript:void(0);" class="menu-link" target="_blank">
                  <div class="text-truncate">회의실관리</div>
                </a>
              </li>
            </ul>
          </li>
        </ul>
      </li>
      <!-- /관리자 -->






    </ul>
    <!-- 여기까지 -->
  </aside>

  <!-- / Menu -->