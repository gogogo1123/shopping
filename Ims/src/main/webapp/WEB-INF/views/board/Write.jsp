<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<c:choose>
	<c:when test="${ct == 'notice' }">
		<title>noticeWrite</title>
	</c:when>
	<c:when test="${ct == 'qna' }">
		<title>qnaWrite</title>
	</c:when>
</c:choose>
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
		
		$("#submit").on('click' , function(){
			
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
<c:if test="${sessionScope.name != '관리자'}">
	<script>
	alert("유효하지 않은 접근입니다.");
	location.href="/shop/";
	</script>
</c:if>
	<form class="form-data" id="form" action="/shop/board/${ct}/WriteProcess.do" method="post" enctype="multipart/form-data">
		
			
		<div class="container">
		<!-- 제목 -->
		<div class="form-group">
			<div class="input-group">
				<select id="category" name="ct_idx" class="form-control col-sm-2" aria-label="Default select example">
					<option value="">카테고리</option>
					<option value="0" <c:if test="${ct=='notice'}"><c:out value="selected">selected</c:out></c:if>>공지사항</option>				
					<option value="1" <c:if test="${ct=='qna'}"><c:out value="selected">selected</c:out></c:if>>qna</option>				
					<option value="2" >1:1문의</option>
				</select>
				<input type="text" class="form-control col-sm-8" id="title" placeholder="제목을 입력하세요" name="title" aria-label="Recipient's username" aria-describedby="button-addon2"><br>
				<div id="title_result"></div>
				<!-- 작성자 -->
				<input type="text" class="form-control col-sm-2" id="name" placeholder="작성자" readonly="readonly" value="${sessionScope.name}" name="member_name" aria-label="Recipient's username" aria-describedby="button-addon2"><br>
				<div id="writer_result"></div>
			</div>
			
			
		<!--  -->
			<textarea style="height:400px;" class="form-control" name="content" rows="" cols="" id="content" placeholder="내용을 입력하세요"></textarea>
			<div id="content_result"></div>
		
            <input type="file" accept='image/jpg,impge/png,image/jpeg,image/gif' class="bg-light form-control" multiple="multiple" name="files">        
        </div>
		
		<div class="form-group pt-1 text-right">
		
			<input class="btn btn-outline-secondary" id="submit" type="submit" value="글작성"/>
			
			<input class="btn btn-outline-secondary" type="button" value="돌아가기" onclick="location.href='/shop/board/${ct}/List.do'"/>
			
		</div>
		</div>
	</form>

</body>
</html>