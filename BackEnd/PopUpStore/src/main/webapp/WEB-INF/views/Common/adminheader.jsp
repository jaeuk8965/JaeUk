<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>
<% 
String userIdFromSession = (String) session.getAttribute("userId"); // 세션에서 userId 가져오기
String userIdFromModel = (String) request.getAttribute("userId"); // 모델에서 userId 가져오기
String userId = userIdFromModel != null ? userIdFromModel : userIdFromSession;
%>
<header class="header d-flex justify-content-between align-items-center p-3 bg-dark text-white">
    <h2 style="margin-right: 50px;">
        <a href="/Admin/Home" style="color: #4e4f4e; text-decoration: none;">PopUpStore</a>
    </h2>
    <nav class="nav">
        <a href="#">소개</a>	
        <a href="#">팝업스토어</a>
        <a href="/Admin/Map">위치찾기</a>
        <a href="/GoodsShop">온라인스토어</a>
        <div class="dropdown" style="position: relative;">
            <button type="button" class="dropdown-toggle">게시판</button>
            <ul class="dropdown-menu">
                <li>
                    <a class="dropdown-item" href="/Admin/review/reviewList">후기</a>
                </li>
                <li>
                    <a class="dropdown-item" href="/Admin/inquiry/inquiryList">문의 & 건의</a>
                </li>
                <li>
                    <a class="dropdown-item" href="#">이벤트</a> <!-- 이 부분은 조건 설정을 하지 않았습니다. -->
                </li>
                <li>
 					<a class="dropdown-item" href="/Admin/promotionList">홍보문의</a>                
				</li>
            </ul>
        </div>
    </nav>
    <div class="auth">
        <% if (userId != null) { %>
            <a href="/Logout.do">로그아웃</a>
        <% } else { %>
            <a href="/Guest/auth/Login">로그인</a>
        <% } %>
        <div class="dropdown">
            <button class="dropdown-toggle" aria-expanded="false">
                <svg xmlns="http://www.w3.org/2000/svg" width="28" height="28" fill="#4e4f4e" class="bi bi-list-ul" viewBox="0 0 16 16">
                    <path fill-rule="evenodd" d="M5 11.5a.5.5 0 0 1 .5-.5h9a.5.5 0 0 1 0 1h-9a.5.5 0 0 1-.5-.5m0-4a.5.5 0 0 1 .5-.5h9a.5.5 0 0 1 0 1h-9a.5.5 0 0 1-.5-.5m0-4a.5.5 0 0 1 .5-.5h9a.5.5 0 0 1 0 1h-9a.5.5 0 0 1-.5-.5m-3 1a1 1 0 1 0 0-2 1 1 0 0 0 0 2m0 4a1 1 0 1 0 0-2 1 1 0 0 0 0 2m0 4a1 1 0 1 0 0-2 1 1 0 0 0 0 2"/>
                </svg>
            </button>
            <ul class="dropdown-menu">
                <li><a class="dropdown-item" href="/Admin/AdminEdit">정보수정</a></li>
                <li><a class="dropdown-item" href="#">마이팝업리스트</a></li>
                <li><a class="dropdown-item" href="/Cart">장바구니</a></li>
                <li><a class="dropdown-item" href="/Admin/users">사용자 리스트</a></li>
            </ul>
        </div>
    </div>
</header>