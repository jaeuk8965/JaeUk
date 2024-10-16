<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<%@ page isELIgnored="false" %>
<%@ include file="/WEB-INF/views/Common/adminheader.jsp" %>
<!DOCTYPE html>
<html lang="ko">
	<head>
	    <meta charset="UTF-8">
	    <meta name="viewport" content="width=device-width, initial-scale=1.0">    
	    <title>리뷰 작성</title>
	    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
	    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js"></script>
	    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
	    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/style.css">
	    <style>
	        body {
	            margin: 0;
	            font-family: Arial, sans-serif;
	            background-color: #343a40;
	            color: #fff;
	            display: flex;
	            flex-direction: column;
	            min-height: 100vh;
	        }     
	        .container-custom {
	            max-width: 600px;
	            width: 100%;
	            padding: 20px;
	            margin: 20px auto;
	            background-color: #fff;
	            color: #000;
	            border-radius: 8px;
	            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
	        }
	        h2 {
	            text-align: center;
	            margin-bottom: 20px;
	            color: #343a40;
	        }
	        .form-container {
	            margin: 20px auto;
	            max-width: 800px;
	            background: #f8f9fa;
	            padding: 20px;
	            border-radius: 8px;
	            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
	            color: #343a40;
	            text-align: center;
	        }
	        input[type="text"], textarea, input[type="file"] {
	            width: 100%;
	            padding: 8px;
	            border: 1px solid #ced4da;
	            border-radius: 4px;
	            box-sizing: border-box;
	        }
	        textarea {
	            resize: vertical;
	            height: 150px;
	        }
	    </style>
	    <script type="text/javascript">
	        function validateForm(form) {
	            if (form.reviewTitle.value.trim() === "") {
	                alert("제목을 입력하세요.");
	                form.reviewTitle.focus();
	                return false;
	            }
	            if (form.reviewContent.value.trim() === "") {
	                alert("내용을 입력하세요.");
	                form.reviewContent.focus();
	                return true;
	            }
	        }
	    </script>
	</head>
	<body>
	    <div class="container-custom">
	        <h2>작성하기</h2>
	        <form name="writeFrm" method="post" enctype="multipart/form-data" action="/Admin/review/reviewWrite" onsubmit="return validateForm(this);">
	            <div class="mb-3">
	                <label for="userNick" class="form-label">작성자</label>
	                <input type="text" name="userNick" class="form-control" value="${userNick}" readonly />
	            </div>
	            <div class="mb-3">
	                <label for="reviewTitle" class="form-label">제목</label>
	                <input type="text" name="reviewTitle" class="form-control" />
	            </div>
	            <div class="mb-3">
	                <label for="reviewContent" class="form-label">내용</label>
	                <textarea name="reviewContent" class="form-control" style="height: 100px;"></textarea>
	            </div>
	            <div class="mb-3">
	                <label for="reviewOfile" class="form-label">사진 등록 (jpeg, png, gif, bmp)</label>
	                <input type="file" name="reviewOfile" class="form-control" accept="image/*" />
	            </div>
	            <div class="text-center">
	                <button type="submit" class="btn btn-warning">작성 완료</button>
	                <button type="reset" class="btn btn-danger">초기화</button>
	                <button type="button" class="btn btn-secondary" onclick="location.href='/Admin/review/reviewList';">목록으로</button>
	            </div>
	        </form>
	    </div>
	    
	    <%@ include file="/WEB-INF/views/Common/footer.jsp" %>
	    
	    <script>
	        const dropdowns = document.querySelectorAll('.dropdown');
	
	        dropdowns.forEach(dropdown => {
	            dropdown.addEventListener('mouseenter', () => {
	                dropdown.querySelector('.dropdown-menu').classList.add('show'); // 드롭다운 메뉴 보이기
	            });
	
	            dropdown.addEventListener('mouseleave', () => {
	                dropdown.querySelector('.dropdown-menu').classList.remove('show'); // 드롭다운 메뉴 숨기기
	            });
	        });
	    </script>
	    
	</body>
</html>
