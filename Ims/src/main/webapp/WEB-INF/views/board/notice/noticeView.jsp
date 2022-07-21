<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta charset="UTF-8">
<title>noticeView</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css"></link>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/font-awesome.min.css" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/elegant-icons.css" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/nice-select.css" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/jquery-ui.min.css" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/owl.carousel.min.css" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/slicknav.min.css" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css" type="text/css">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

<script src="https://kit.fontawesome.com/ea9f50e12b.js" crossorigin="anonymous"></script>


<script>
$(function(){
	$("#del").click(function(){
		var result = confirm("삭제하시겠습니까?");
		
		if(result){
			location.replace('/shop/board/${ct}/Delete.do/${vo.bidx}/${ct_idx}');
		}else{
			
		}
	});
});

$(function(){
	$("#modi").click(function(){
		location.replace('/shop/board/${ct}/Modify.do/${vo.bidx}/${ct_idx}');
	});
});
</script>
	
</head>

<%@ include file="../../include/menu.jsp" %>
<body class="text-center">
<form class="form-horizontal" id="frm"name="moveForm" method="post">
	<%-- <input type="hidden" name="type" value="${pageMaker.cri.type}">
	<input type="hidden" name="keyword" value="${pageMaker.cri.keyword}"> --%>
	<input type="hidden" name="page" value="${pageMaker.cri.page}">
	<input type="hidden" name="PerPageNum" value="${pageMaker.cri.perPageNum}">
	<input type="hidden" name="bidx" value="${vo.bidx}">
	<input type="hidden" name="ct_idx" value="${ct_idx}">
	<input type="hidden" name="ct" value="${ct}">
</form>	
<div class="container">
	
	<div class="text-left">
		<c:if test="${ct_idx == 0 }">
			<span class="h3">공지사항l</span>
			<span class="h5">Im`s의 소식을 알려드립니다.</span>
		</c:if>
		<c:if test="${ct_idx == 1 }">
			<span class="h3">QnA l</span>
			<span class="h5">(자주 묻는 질문 답변)</span>
		</c:if>
	</div>
<!-- 검색기능 -->
<form class="navbar-form" autocomplete="off" action="/shop/board/${ct}/List.do?page=${pageMaker.cri.page}&ct_idx=${ct_idx}&ct=${ct}&type=${type}&keyword=${keyword}" method="post">
<input type="hidden" name="ct_idx" value="${ct_idx}">
<input type="hidden" name="ct" value="${ct}">
<%-- <input type="hidden" name="type" value="${pageMaker.cri.type}">
<input type="hidden" name="keyword" value="${pageMaker.cri.keyword}"> --%>
<div class="input-group" style="display: flex;">
	<div class="form-group navbar-left" style="display: flex;">	
		<select class="form-control" name="type" id="type" style="width:150px;">
	        <option value="title" 
				<c:if test="${map.search_option == 'title'}">selected</c:if>
				        >제목</option>
	        <option value="content" 
				<c:if test="${map.search_option == 'content'}">selected</c:if>
				        >내용</option>
	      	<option value="all"
				<c:if test="${map.search_option == 'all'}">selected</c:if>
					        >내용+제목</option>
   		</select>
		<input type="text" class="form-control" aria-label="Recipient's username" aria-describedby="button-addon2" name="keyword" value="">
		<button class="btn btn-outline-dark" type="submit" id="btn_Search"><i class="fa-solid fa-magnifying-glass"></i></button>
	</div>
</div>
</form>
	<div class="">
		<div class="">
		</div>
		<div class="">
			<a class="text-dark" href="#">1:1문의 게시판</a>&nbsp;&nbsp;/&nbsp;&nbsp;<a class="text-dark" href="#">상품문의 게시판</a>&nbsp;&nbsp;/&nbsp;&nbsp;<a class="text-dark" href="#">고객 의견 게시판</a>
		</div>
	</div>
	<!-- 검색기능 끝 -->	
	<c:if test="${sessionScope.name == '관리자'}">
		<div class="d-grid gap-2 d-md-flex justify-content-md-end">
			<button class="btn btn-dark me-md-2" type="button" 
			onclick="location.href='/shop/board/${ct}/Write.do'">글쓰기</button>
		</div>
	</c:if>			
	<table class="table table-bordered ">
		<tr>
			<td>
				<p class="text">${vo.title}</p>
			</td>
		</tr>
		<tr>
			<td><p class="text">${vo.content}</p><br/>
				<!-- 만약 이미지가 없을 때 엑박 처리되는 형상 제거 -->
				<c:choose>
					<c:when test="${vo.filename == '-' or vo.filename == 'noimg'}">
						<div style="display:none;">
							<img src="/shop/resources/images/${vo.filename}" id="filename" width="500px" height="500px;"/>
						</div>
					</c:when>
					<c:when test="${vo.filename != null}">
						<div>
							<img src="/shop/resources/images/${vo.filename}" id="filename" width="500px" height="500px;"/>
						</div>
					</c:when>
				</c:choose>
			</td>
		</tr>
		
		<tr>
			<td>
			<c:choose>
				<c:when test="${sessionScope.name == '관리자'}">
					<button class="btn btn-outline-secondary" id="modi">수정하기</button>
					<button class="btn btn-outline-secondary" id="del">삭제하기</button>
				</c:when>
			</c:choose>
			<a class="btn btn-outline-secondary" href="/shop/board/${ct}/List.do?page=${pageMaker.cri.page}&ct_idx=${ct_idx}&ct=${ct}&type=${type}&keyword=${keyword}">돌아가기</a>
			<a class="btn btn-outline-secondary" href="/shop/">HOME</a>
			</td>
		</tr>
	</table>
	
</div>
</body>
</html>