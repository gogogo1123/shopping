<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>noticeWrite</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/elegant-icons.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/nice-select.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/jquery-ui.min.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/owl.carousel.min.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/slicknav.min.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css" type="text/css">
<style>
		
</style>

<script src="https://kit.fontawesome.com/ea9f50e12b.js" crossorigin="anonymous"></script>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
	$(function(){
		
		$("#form").on('submit' , function(){
			
			var category = $("#category").val();
			var title = $("#title").val();
			var name = $("#name").val();
			var content = $("#content").val();
			
			if(category  == ""){
				alert("카테고리를 선택해주세요");
				$("#category").focus();
				return false;	
				
			}else if(title == ""){
				alert("작성하지 않은 부분이 있습니다.");
				$("#title").focus();
				return false;	
				
			}else if(name == ""){
				alert("작성하지 않은 부분이 있습니다.");
				$("#name").focus();
				return false;		
				
			}else if(content == ""){
				alert("작성하지 않은 부분이 있습니다.");
				$("#content").focus();
				return false;	
				
			}
		});
	});
</script>
</head>
<%@ include file="../include/menu.jsp" %>
<body class="text-center">
	<form class="form-data" id="form" action="/shop/notice/WriteProcess.do" method="post" enctype="multipart/form-data">
		
			
		
		<!-- 제목 -->
		<div class="">
			<div class="">
				<select id="category" name="ct_idx" class="" aria-label="Default select example">
					<option value="">카테고리</option>
					<option value="0" selected>공지사항</option>				
					<option value="1">qna</option>				
					<option value="2">1:1문의</option>
				</select>
			</div>
			<div class="">
				<div class="">
					제목<input type="text" class="" id="title" placeholder="title" name="n_title" aria-label="Recipient's username" aria-describedby="button-addon2"><br>
					<div id="title_result"></div>
					<!-- 작성자 -->
					작성자<input type="text" class="" id="name" placeholder="작성자" value="" name="member_name" aria-label="Recipient's username" aria-describedby="button-addon2"><br>
					<div id="writer_result"></div>
				</div>	
			</div>
				
		</div>
		
		
		<!--  -->
		<div>
			내용<textarea name="n_content" rows="" cols="" id="content"></textarea>
			<div id="content_result"></div>
		</div>
		<div class="col-md-12">
            <input type="file" class="bg-light form-control" multiple="multiple" name="file1">    
        </div>
		
		<div class="pt-1 text-right">
		
			<input id="btn-outline-secondary" class="btn btn-outline-secondary" type="submit" value="글작성"/>
			
			<input id="btn-outline-secondary" class="btn btn-outline-secondary" type="button" value="돌아가기" onclick="location.href='/shop/notice/List.do'"/>
			
		</div>
		
		</div>
	</form>

</body>
</html>