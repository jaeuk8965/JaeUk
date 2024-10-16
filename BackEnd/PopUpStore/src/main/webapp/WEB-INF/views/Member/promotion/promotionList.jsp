<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ page isELIgnored="false" %>
<%@ include file="/WEB-INF/views/Common/header.jsp" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Custom Header</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
	<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
	<link rel="stylesheet" href="<%=request.getContextPath()%>/css/style.css">
    <style>
       
       
		
        
       

        .dropdown-toggle::after {
            /* 드롭다운 버튼의 기본 화살표 아이콘을 제거 */
            content: none;
        }

        .dropdown-menu .dropdown-item {
            /* 드롭다운 메뉴 항목의 텍스트 색상을 검정으로 설정 */
            color: black;
        }

        .dropdown-menu .dropdown-item:hover {
            /* 드롭다운 메뉴 항목에 마우스를 올렸을 때 배경과 텍스트 색상을 변경 */
            background-color: #060606;
            color: #fff;
            display: inline-block;
            padding: 5px 10px;
        }
        
		/* 테이블 모서리를 둥글게 설정 */
		.table {
		    border-collapse: separate; /* 테이블 셀 간 경계를 둥글게 하기 위해 사용 */
		    border-spacing: 0; /* 셀 간 간격 제거 */
		    border-radius: 10px; /* 테이블 전체 모서리를 둥글게 설정 */
		    overflow: hidden; /* 둥근 모서리에서 넘치는 부분 숨기기 */
		}
		
		.table-container {
		    /* 테이블 컨테이너의 상하 여백을 설정하고, 최대 너비를 지정 */
		    margin: 20px auto;
		    max-width: 800px;
		}
		
		.table thead {
		    /* 테이블 헤더의 배경색과 텍스트 색상을 설정 */
		    background-color: #343a40;
		    color: #fff;
		}
		
		.table td, .table th {
		    /* 테이블 셀과 헤더 셀의 수직 정렬을 중앙으로 설정하고, 폰트 크기 설정 */
		    vertical-align: middle;
		    font-size: 14px;
		    
		}
		
		.table th.title-column {
		    /* 특정 테이블 헤더의 텍스트 색상을 강제로 검정색으로 설정 */
		    color: #000 !important;
		}
		
		.table td a, .table td a:visited {
		    /* 테이블 셀의 링크 텍스트 색상을 검정색으로 설정 */
		    color: #000 !important;
		}
		
		.table td a:hover {
		    /* 테이블 셀의 링크에 마우스를 올렸을 때 텍스트 색상을 검정색으로 유지 */
		    color: #000 !important;
		}
		
		.stats {
		    /* 통계 정보의 폰트 크기와 색상을 회색으로 설정 */
		    font-size: 12px;
		    color: #6c757d;
		}
		
		.pagination-container {
		    /* 페이지 네비게이션 컨테이너의 상단 여백과 텍스트 중앙 정렬 */
		    text-align: center;
		    margin-top: 20px;
		}
		
		.pagination .page-item.disabled .page-link {
		    /* 비활성화된 페이지 링크의 배경색, 테두리 색상, 텍스트 색상을 설정 */
		    background-color: #f8f9fa;
		    border-color: #dee2e6;
		    color: #6c757d;
		}

		.input-group {
		    /* Bootstrap 기본 border-radius 설정 */
		    border-radius: 0.375rem;
		}
		
		.form-select, .form-control {
		    /* 선택창과 입력창의 둥근 모서리 제거 */
		    border-radius: 0;
		}
		
		.input-group .form-select {
		    /* 선택창의 오른쪽 둥근 모서리를 제거 */
		    border-top-right-radius: 0;
		    border-bottom-right-radius: 0;
		}
		
		.input-group .form-control {
		    /* 입력창의 왼쪽 둥근 모서리를 제거 */
		    border-top-left-radius: 0;
		    border-bottom-left-radius: 0;
		}
		
		.input-group .btn-primary {
		    /* 검색 버튼의 왼쪽 둥근 모서리를 제거 */
		    border-top-left-radius: 0;
		    border-bottom-left-radius: 0;
		}
		
		.btn-primary {
		    /* 기본 버튼의 배경색과 테두리 색상을 설정 */
		    background-color: #007bff;
		    border-color: #007bff;
		}
		
		.btn-primary:hover {
		    /* 버튼에 마우스를 올렸을 때 배경색과 테두리 색상을 더 어둡게 설정 */
		    background-color: #0056b3;
		    border-color: #004085;
		}
		
		.write-button {
		    /* 글쓰기 버튼의 상단 여백 설정, 오른쪽 정렬 및 오른쪽 여백 추가 */
		    margin-top: 20px;
		    text-align: right;
		    margin-right: 10px;
		}
    </style>
</head>
<body>
    <div class="table-container">
        <h2 class="headline-font2" style="text-align: center;">홍보 게시판</h2>
        <br/>
        <table class="table table-secondary table-hover">
            <thead class="text-center">
		                <tr>
				            <th width="10%">번호</th>
				            <th width="*">제목</th>
				            <th width="15%">작성자</th>
				            <th width="10%">조회수</th>
				            <th width="15%">작성일</th>
				        </tr>
             </thead>
             <tbody>
				<c:choose>
				    <c:when test="${ empty lists }"> 
				        <tr>
				            <td colspan="5" align="center">
				                등록된 게시물이 없습니다^^*
				            </td>
				        </tr>
				    </c:when> 
				    <c:otherwise> 
				        <c:forEach items="${ lists }" var="row" varStatus="loop">    
				        <tr align="center">
				            <td> 
				            <!-- 게시물의갯수, 페이지번호, 페이지사이즈를 통해 가상번호를 계산해서
				            출력한다. -->
				            <c:set var="vNum" value="${ maps.totalCount - 
				                (((maps.pageNum-1) * maps.pageSize)	+ loop.index)}" />
				            	${vNum}
				            </td>
				            <td align="center"> 
				                <a href="/${role}/promotionView?promotion_num=${row.promotion_num}&vNum=${vNum}">${row.promotion_title}</a>
				            </td> 
				            <td>${ row.user_nick }</td> 
				            <td>${ row.visitcount }</td> 
				            <td>${ row.promotion_create_date }</td> 
				        </tr>
				        </c:forEach>       
				    </c:otherwise>    
				</c:choose>
            </tbody>
        </table>
   <div class="write-button">
            <button type="button" class="btn btn-primary" onclick="location.href='/${role}/promotionWrite';">글쓰기</button>
   </div>
    </div>
	<!-- 페이지 네비게이션 -->
	<div class="pagination-container mb-4">
	    <nav aria-label="Page navigation">
	        <ul class="pagination justify-content-center">
	            <c:if test="${not empty pagingImg}">
	                ${pagingImg}
	            </c:if>
	            <c:if test="${empty pagingImg}">
	                <li class="page-item disabled">
	                    <span class="page-link">페이지 네비게이션 정보가 없습니다.</span>
	                </li>
	            </c:if>
	        </ul>
	    </nav>
	</div>

<!-- 검색 폼 -->
<form method="get" class="mb-4">
    <div class="container">
        <div class="row justify-content-center">
             <div class="col-md-6 col-lg-5">
                <div class="input-group">
                    <select name="searchField" class="form-select">
                        <option value="promotion_title">제목</option>
                        <option value="user_nick">작성자</option>
                    </select>
                    <input type="text" name="searchKeyword" class="form-control" placeholder="검색어를 입력하세요">
                    <button type="submit" class="btn btn-primary">검색하기</button>
                </div>
            </div>
        </div>
    </div>
</form>
<!--     푸터--------------------------------------------------- -->
    	<%@ include file="/WEB-INF/views/Common/footer.jsp" %> 
	
	    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
	    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
	    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
	    <script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
	
		<script>
	        // Swiper 초기화 스크립트
	        var swiper = new Swiper('.swiper-container1', {
	            loop: true,
	            slidesPerView: 2,
	            spaceBetween: 0,
	            pagination: {
	                el: '.swiper-pagination',
	                clickable: true,
	            },
	            navigation: {
	                nextEl: '.swiper-button-next',
	                prevEl: '.swiper-button-prev',
	            },
	        });
	
	        // 드롭다운 메뉴 스크립트
	        const dropdowns = document.querySelectorAll('.dropdown');
	        dropdowns.forEach(dropdown => {
	            dropdown.addEventListener('mouseenter', () => {
	                dropdown.querySelector('.dropdown-menu').classList.add('show');
	            });
	            dropdown.addEventListener('mouseleave', () => {
	                dropdown.querySelector('.dropdown-menu').classList.remove('show');
	            });
	        });
	        
	        // 관리자로 로그인했을 떄 스크립트
			document.addEventListener("DOMContentLoaded", function() {
	            console.log("페이지 로드됨");

	            const urlParams = new URLSearchParams(window.location.search);
	            console.log("adminLogin 파라미터 값:", urlParams.get('adminLogin'));

	            // 관리자로 로그인 시 알림
	            if (urlParams.get('adminLogin') === 'true') {
	                alert("관리자로 로그인 하셨습니다!");
	            }
	        });
	        
	    </script>
</body>
</html>


