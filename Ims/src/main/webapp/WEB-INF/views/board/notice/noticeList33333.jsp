<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>noticeList</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/elegant-icons.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/nice-select.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/jquery-ui.min.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/owl.carousel.min.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/slicknav.min.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css" type="text/css">
<style>

<!-- 게시판 페이징 색상 파란색에서 회색으로 변경 -->
.pagination > li > a, .pagination > li > span{
     color:black !Important;       
}
.page-link {
  Color: #000; 
  background-color: #fff;
  border: 1px solid #ccc; 
}

.page-item.active .page-link {
 z-index: 1;
 Color: #555;
 font-weight:bold;
 background-color: #f1f1f1;
 border-color: #ccc;
 
}

.page-link:focus,
.page-link:hover {
  Color: #000;
  background-color: #fafafa; 
  border-color: #ccc;
}

<!-- ! -->
</style>
<script src="https://kit.fontawesome.com/ea9f50e12b.js" crossorigin="anonymous"></script>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
/* 
$(function(){
	$("#p_on").on("click", function(){
		$("#s_off").show();
		$("#p_on").attr("id", "p_off");
		$("#s_off").attr("id", "s_on");
	});
	
}); 
*/

/* 
function dis4(){
	if($('#dis4').css('display') == 'none'){
		$('#dis4').show();
	}else{
		$('#dis4').hide();
	}
}
function dis3(){
	if($('#dis3').css('display') == 'none'){
		$('#dis3').show();
	}else{
		$('#dis3').hide();
	}
}
function dis2(){
	if($('#dis2').css('display') == 'none'){
		$('#dis2').show();
	}else{
		$('#dis2').hide();
	}
}
function dis1(){
	if($('#dis1').css('display') == 'none'){
		$('#dis1').show();
	}else{
		$('#dis1').hide();
	}
}
 */
 /* 
// 검색기능
$(function(){
	$("#btn_Search").click(function(){
		$.ajax({
			uri : 'noticeListSearch.do',
			type : 'POST',
			data : $("form_Search").serialize(),
			success : function(obg){
				console.log(obj);
			},
			error : function(e){
				console.log(e);
			}
		});
	});
	
}); */
//
</script>
</head>
<body class="text-center">

<div class="py-3"></div><!-- padding y축 공백 -->
	<div class="h2">로고</div>
	<div class="py-3"></div><!-- padding y축 공백 -->
	<div class="container">
	<nav class="row">
		<div class="col-md-3"><a class="text-dark" href="#">메뉴1</a></div>
		<div class="col-md-3"><a class="text-dark" href="#">메뉴2</a></div>
		<div class="col-md-3"><a class="text-dark" href="#">메뉴3</a></div>
		<div class="col-md-3"><a class="text-dark" href="#">메뉴4</a></div>
	</nav>
	<div class="py-5"></div><!-- padding y축 공백 -->
	<div class="py-5"></div><!-- padding y축 공백 -->
	<div class="">
	<div class="text-left">
		<span class="h3">공지사항l</span>
		<span class="h5">Im`s의 소식을 알려드립니다.</span>
	</div>
	<!-- 검색기능 -->
	<form id="form_Search">
		<div class="row">
			<div class="col col-lg-3">
			
				<div class="input-group mb-3">
						<input type="hidden" name="SearchCondition" value="noticeSearch">
						<input type="text" class="form-control" aria-label="Recipient's username" aria-describedby="button-addon2" name="SearchKeyword">
					
					<button class="btn btn-outline-dark" type="button" id="btn_Search"><i class="fa-solid fa-magnifying-glass"></i></button>
				</div>
			</div>
			<div class="col">
				<a class="text-dark" href="#">1:1문의 게시판</a>&nbsp;&nbsp;/&nbsp;&nbsp;<a class="text-dark" href="#">상품문의 게시판</a>&nbsp;&nbsp;/&nbsp;&nbsp;<a class="text-dark" href="#">고객 의견 게시판</a>
			</div>
		</div>
		</form>
		<!--  -->
	</div>
	<div class="d-grid gap-2 d-md-flex justify-content-md-end">
		<button class="btn btn-dark me-md-2" type="button" onclick="location.href='/shop/notice/Write.do'">글쓰기</button>
	</div>
	
	<table class="table">
		<thead>
			<tr>
				<td>번호</td>
				<td style="width:650px;">제목</td>
				<td style="width:300px;">작성일</td>
			</tr>
		</thead>
		<tbody>
				
					<c:forEach var="nList" items="${NoticeList }">

						<tr id="show" onclick="dis4()">
							<td>${nList.n_bidx }</td>
							<td class="text-left"><a href="/shop/notice/View.do/${nList.n_bidx}">${nList.n_title}</a></td>
							<td><fmt:formatDate pattern="yyyy-MM-dd" value="${nList.n_regdate }" />
							</td>
						</tr>
						<tr id="dis4" style="display:none"><!-- style="display:none"  ==  class="d-none"-->
							<td colspan=3 class="text-left">
							${nList.n_content}
							</td>
						</tr>
					</c:forEach>
				

			</tbody>
	</table>
	<form id="moveForm" method="get">
		<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum }">
		<input type="hidden" name="amount" value="${pageMaker.cri.amount }">
	</form>
	
	<%-- <div class="example">
		<nav aria-label="...">
			<ul class="pagination justify-content-center" id="pageInfo">
				<c:if test="${pageMaker.prev}">
				<li class="page-item disabled">
					<a class="page-link" href="${pageMaker.startPage - 1}">Previous</a>
				</li>
				</c:if>
				
				<c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
				<li class="page-item">
					<a class="page-link" href="${num}">${num}</a>
				</li>
				</c:forEach>
				
				<c:if test="${pageMaker.next}">
				<li class="page-item">
					<a class="page-link" href="${pageMaker.endPage + 1}">Next</a>
				</li>
				</c:if>
			</ul>
		</nav>
	</div>
	<script>
		$("#pageInfo").on("click", function(e){
			
		});
	</script>
	 --%>
	
	<!-- <div class="example">
		<nav aria-label="...">
			<ul class="pagination justify-content-center">
				<li class="page-item disabled">
					<a class="page-link">Previous</a>
				</li>
				<li class="page-item"><a class="page-link" href="#">1</a></li>
				<li class="page-item active" aria-current="page">
					<a class="page-link" href="#">2</a>
				</li>
				<li class="page-item"><a class="page-link" href="#">3</a></li>
				<li class="page-item">
					<a class="page-link" href="#">Next</a>
				</li>
			</ul>
		</nav>
	</div> -->
	
	<div class="d-grid gap-2 d-md-flex justify-content-md-end">
		<button class="btn btn-dark me-md-2" type="button" onclick="location.href='/shop/'">돌아가기</button>
	</div>
	</div>

</body>
</html>