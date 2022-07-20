<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta charset="UTF-8">
<title>noticeView</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/elegant-icons.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/nice-select.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/jquery-ui.min.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/owl.carousel.min.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/slicknav.min.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css" type="text/css">
	<script src="${pageContext.request.contextPath}/resources/js/jquery-3.6.0.min.js"></script>
	<script>
	
	</script>
	
</head>

<%@ include file="../../include/menu.jsp" %>
<body class="text-center">
<form name="moveForm" method="get">
	<input type="hidden" name="type" value="${pageMaker.cri.type}">
	<input type="hidden" name="keyword" value="${pageMaker.cri.keyword}">
	<input type="hidden" name="page" value="${pageMaker.cri.page}">
	<input type="hidden" name="PerPageNum" value="${pageMaker.cri.perPageNum}">
	<input type="hidden" name="bidx" value="${vo.bidx}">
	<input type="hidden" name="ct_idx" value="${ct_idx}">
	<input type="hidden" name="ct" value="${ct}">
<div class="container">
	<table class="table">
		<tr>
		<td>
			<p class="text">${vo.title}</p>
			<td>
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
			<a class="btn btn-outline-secondary" href="/shop/board/${ct}/Modify.do/${vo.bidx}/${ct_idx}">수정하기</a>
			<a class="btn btn-outline-secondary" href="/shop/board/${ct}/Delete.do/${vo.bidx}/${ct_idx}">삭제하기</a>
			<a class="btn btn-outline-secondary" href="/shop/board/${ct}/List.do?page=${pageMaker.cri.page}&ct_idx=${ct_idx}&ct=${ct}&type=${type}&keyword=${keyword}">돌아가기</a>
			<a class="btn btn-outline-secondary" href="/shop/">HOME</a>
			</td>
		</tr>
	</table>
	
</div>
</form>	
</body>
</html>