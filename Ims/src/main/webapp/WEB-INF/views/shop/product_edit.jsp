<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
@import
	url('https://fonts.googleapis.com/css2?family=Poppins&display=swap');

* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
}

body {
	font-family: 'Poppins', sans-serif;
	background-color: aliceblue;
}

.wrapper {
	padding: 30px 50px;
	border: 1px solid #ddd;
	border-radius: 15px;
	margin: 10px auto;
	max-width: 600px;
}

h4 {
	letter-spacing: -1px;
	font-weight: 400;
}

.img {
	width: 70px;
	height: 70px;
	border-radius: 6px;
	object-fit: cover;
}

#img-section p, #deactivate p {
	font-size: 12px;
	color: #777;
	margin-bottom: 10px;
	text-align: justify;
}

#img-section b, #img-section button, #deactivate b {
	font-size: 14px;
}

label {
	margin-bottom: 0;
	font-size: 14px;
	font-weight: 500;
	color: #777;
	padding-left: 3px;
}

.form-control {
	border-radius: 10px;
}

input[placeholder] {
	font-weight: 500;
}

.form-control:focus {
	box-shadow: none;
	border: 1.5px solid #0779e4;
}

select {
	display: block;
	width: 100%;
	border: 1px solid #ddd;
	border-radius: 10px;
	height: 40px;
	padding: 5px 10px;
	/* -webkit-appearance: none; */
}

select:focus {
	outline: none;
}

.button {
	background-color: #fff;
	color: #0779e4;
}

.button:hover {
	background-color: #0779e4;
	color: #fff;
}

.btn-primary {
	background-color: #0779e4;
}

.danger {
	background-color: #fff;
	color: #e20404;
	border: 1px solid #ddd;
}

.danger:hover {
	background-color: #e20404;
	color: #fff;
}

@media ( max-width :576px) {
	.wrapper {
		padding: 25px 20px;
	}
	#deactivate {
		line-height: 18px;
	}
}
</style>
<!-- Bootstrap -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
	crossorigin="anonymous"></script>
<script src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://kit.fontawesome.com/6c060c00b1.js"
	crossorigin="anonymous"></script>

<script>
    
    
    function product_update() {
    
    	var product_name = document.form1.product_name.value;
    	var price = document.form1.price.value;
    	var size = document.form1.size.value;
    	var quantity = document.form1.quantity.value;
    	var fee = document.form1.fee.value;
    	var out_put = document.form1.out_put.value;
    	var brand = document.form1.brand.value;
    	var color = document.form1.color.value;
    	var purpose = document.form1.purpose.value;
    	var gender = document.form1.gender.value;
    	var quantity = document.form1.quantity.value;
    	
		
		document.form1.action="<%=request.getContextPath()%>/shop/product/update.do"
		document.form1.submit();
	}
    
    
    
    function product_delete() {
    
    	if(confirm("삭제하시겠습니까?")){
    		document.form1.action="<%=request.getContextPath()%>/shop/product/delete.do"
			document.form1.submit();
		}
	}
</script>



</head>
<body>
	<%@ include file="../include/menu1.jsp"%>

	<form name="form1" id="form1" method="post"
		enctype="multipart/form-data">
		<div class="wrapper bg-white mt-lg-10 ">
			<h4 class="pb-4 border-bottom" style="text-align: center;">상품 수정</h4>
			<div class="py-2">
				<div class="row py-2">
					<div class="col-md-12">
						<label for="firstname">상품명</label> <input type="hidden"
							name="product_code" value="${product_code}"> <input
							type="text" class="bg-light form-control" placeholder="Steve"
							name="product_name" value="${vo.product_name}">
					</div>
				</div>
				<div class="row py-2">
					<div class="col-md-12">
						<label for="firstname">가 격</label> <input type="number"
							class="bg-light form-control" placeholder="Steve" name="price"
							value="${vo.price}">
					</div>
				</div>
				<div class="row py-2">
					<div class="col-md-12">
						<label for="firstname">수 량</label> <input type="number"
							class="bg-light form-control" placeholder="Steve" name="quantity"
							value="${vo.quantity}">
					</div>
				</div>
				<div class="row py-2">
					<div class="col-md-12">
						<label for="firstname">상품사이즈</label> <input type="text"
							class="bg-light form-control" placeholder="사이즈" name="size"
							value="${vo.size }">
					</div>
				</div>
				<div class="row py-2">
					<div class="col-md-12">
						<label for="firstname">배송비</label>
						<div class="input-group mb-3">
							<input type="text" class="bg-light form-control"
								placeholder="Steve" name="fee" value="${vo.fee}"> <span
								class="input-group-text">원</span>
						</div>
					</div>
				</div>
				<div class="row py-2">
					<div class="col-md-12">

						<label for="firstname">출고일</label>
						<div class="input-group mb-3">
							<input type="text" class="bg-light form-control"
								placeholder="Steve" name="out_put" value="${vo.out_put}">
							<span class="input-group-text">이내</span>
						</div>
					</div>
				</div>
				<div class="row py-2">
					<div class="col-md-12">
						<label for="firstname">제품 브랜드</label>
						<div class="input-group mb-3">
							<!-- s: 수정할때. detail에서 value값을 가져와서 뿌림 -->
							<select class="form-select bg-light form-control" name="brand">
								<option value="GUCCI"
									<c:if test="${vo.brand=='GUCCI'}"><c:out value="selected">selected</c:out></c:if>>GUCCI</option>
								<option value="BOTTEGAVENETA"
									<c:if test="${vo.brand=='BOTTEGAVENETA'}"><c:out value="selected">selected</c:out></c:if>>BOTTEGA
									VENETA</option>
								<option value="BURBERRY"
									<c:if test="${vo.brand=='BURBERRY'}"><c:out value="selected">selected</c:out></c:if>>BURBERRY</option>
								<option value="MAISONMARGIELA"
									<c:if test="${vo.brand=='MAISONMARGIELA'}"><c:out value="selected">selected</c:out></c:if>>MAISON
									MARGIELA</option>
								<option value="THOMBROWN"
									<c:if test="${vo.brand=='THOMBROWN'}"><c:out value="selected">selected</c:out></c:if>>THOM
									BROWN</option>
								<option value="VALETINO"
									<c:if test="${vo.brand=='VALETINO'}"><c:out value="selected">selected</c:out></c:if>>VALETINO</option>
							</select>
							<!-- s: 수정할때. detail에서 value값을 가져와서 뿌림 -->
						</div>
					</div>
				</div>
				<div class="row py-2" style="max-width: 100%">
					<div class="col-md-12">
						<label for="firstname">제품 색상</label>
						<div class="input-group mb-3">
							<select class="form-select bg-light form-control" name="color">
								<option>color</option>
								<option value="white"
									<c:if test="${vo.color=='white'}"><c:out value="selected">selected</c:out></c:if>>White</option>
								<option value="yello"
									<c:if test="${vo.color=='yello'}"><c:out value="selected">selected</c:out></c:if>>Yellow</option>
								<option value="blue"
									<c:if test="${vo.color=='blue'}"><c:out value="selected">selected</c:out></c:if>>Blue</option>

							</select>
						</div>
					</div>
					<div class="row py-2">
						<div class="col-md-12">
							<label for="firstname">제품 용도</label>
							<div class="input-group mb-3">
								<select class="form-select bg-light form-control" name="purpose">
									<option selected>용도</option>
									<option value="등산"
										<c:if test="${vo.purpose=='등산'}"><c:out value="selected">selected</c:out></c:if>>등산용</option>
									<option value="여행"
										<c:if test="${vo.purpose=='여행'}"><c:out value="selected">selected</c:out></c:if>>여행용</option>
									<option value="패션"
										<c:if test="${vo.purpose=='패션'}"><c:out value="selected">selected</c:out></c:if>>패션용</option>

								</select>
							</div>
						</div>
						<div class="col-md-12">
							<label for="firstname">제품 성별</label>
							<div class="input-group mb-3">
								<!-- s: 수정하기: detail에서 radio value값을 불러와서 뿌림 -->
								<div class="form-check form-check-inline">
									<input class="form-check-input" type="radio" name="gender"
										value="남성용"
										<c:if test="${vo.gender=='남성용'}">
	                      <c:out value="checked">checked</c:out>
	                      </c:if>>
									<label class="form-check-label" for="inlineRadio1">남성용</label>
								</div>
								<div class="form-check form-check-inline">
									<input class="form-check-input" type="radio" name="gender"
										value="여성용"
										<c:if test="${vo.gender=='여성용'}">
	                      <c:out value="checked">checked</c:out>
	                      </c:if>>
									<label class="form-check-label" for="inlineRadio1" value="여성용">여성용</label>
								</div>
								<div class="form-check form-check-inline">
									<input class="form-check-input" type="radio" name="gender"
										value="남여공용"
										<c:if test="${vo.gender=='남여공용'}"><c:out value="checked">checked</c:out></c:if>>
									<label class="form-check-label" for="inlineRadio1" value="남여공용">남여공용</label>
								</div>
								<!-- e: 수정하기: detail에서 radio value값을 불러와서 뿌림 -->


							</div>
						</div>
						<div class="row py-2">
							<div class="col-md-12">
								<label>상품이미지</label> <input type="file"
									class="bg-light form-control" placeholder="Steve" name="file1">
							</div>
						</div>
						<img alt=""
							src="<%=request.getContextPath() %>/resources/images/${vo.filename}">
						<div class="row py-2">
							<div class="col-md-12">
								<label>상품이미지</label> <input type="file"
									class="bg-light form-control" placeholder="Steve" name="file2">
							</div>
						</div>
						<img alt=""
							src="<%=request.getContextPath() %>/resources/images/${vo.filename1}">
						<div class="row py-2">
							<div class="col-md-12">
								<label>상품이미지</label> <input type="file"
									class="bg-light form-control" placeholder="Steve" name="file3">
							</div>
						</div>
						<img alt=""
							src="<%=request.getContextPath() %>/resources/images/${vo.filename2}">
					</div>
				</div>
			</div>
		
	

	<!--버튼-->
	<div class="py-3 pb-4 border-bottom">
		<button class="btn btn-primary mr-3" onclick="product_update()">등록하기</button>
		<button class="btn btn-primary mr-3" onclick="product_delete()">삭제하기</button>
		<button class="btn btn-primary mr-3"
			onclick="location.href='<%=request.getContextPath()%>/shop/product/list.do'"
			type="button">목록으로</button>
	</div>

	<div class="d-sm-flex align-items-center pt-3" id="deactivate">
		<div>
			<b>Deactivate your account</b>
			<p>Details about your company account and password</p>
		</div>
		
	</div>
</div>
</form>
	<%@ include file="../include/footer.jsp"%>
</body>
</html>