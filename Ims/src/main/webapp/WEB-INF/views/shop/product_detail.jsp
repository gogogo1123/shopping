<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
      <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<script src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
   <script src="https://kit.fontawesome.com/6c060c00b1.js" crossorigin="anonymous"></script>
       <link rel='stylesheet' href='https://sachinchoolur.github.io/lightslider/dist/css/lightslider.css'>
    
    
                        <script src='https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js'></script>
<script src='https://sachinchoolur.github.io/lightslider/dist/js/lightslider.js'></script>
<script> $('#lightSlider').lightSlider({ gallery: true, item: 1, loop: true, slideMargin: 0, thumbItem: 9 });
</script>

<style type="text/css">

@import url("https://fonts.googleapis.com/css2?family=Poppins:wght@100;200;300;400;500;600;700;800&display=swap");


   body{

    background-color: #eee;
    font-family: "Poppins", sans-serif

   }

.card {
    background-color: #fff;
    padding: 14px;
    border: none
}

.demo {
    width: 100%
}

ul {
    list-style: none outside none;
    padding-left: 0;
    margin-bottom: 0
}

li {
    display: block;
    float: left;
    margin-right: 6px;
    cursor: pointer
}

img {
    display: block;
    height: auto;
    width: 100%
}

.stars i {
    color: #f6d151
}

.stars span {
    font-size: 13px
}

hr {
    color: #d4d4d4
}

.badge {
    padding: 5px !important;
    padding-bottom: 6px !important
}

.badge i {
    font-size: 10px
}

.profile-image {
    width: 35px
}

.comment-ratings i {
    font-size: 13px
}

.username {
    font-size: 12px
}

.comment-profile {
    line-height: 17px
}

.date span {
    font-size: 12px
}

.p-ratings i {
    color: #f6d151;
    font-size: 12px
}

.btn-long {
    padding-left: 35px;
    padding-right: 35px
}

.buttons {
    margin-top: 15px
}

.buttons .btn {
    height: 46px
}

.buttons .cart {
    border-color: #ff7676;
    color: #ff7676
}

.buttons .cart:hover {
    background-color: #e86464 !important;
    color: #fff
}

.buttons .buy {
    color: #fff;
    background-color: #ff7676;
    border-color: #ff7676
}

.buttons .buy:focus,
.buy:active {
    color: #fff;
    background-color: #ff7676;
    border-color: #ff7676;
    box-shadow: none
}

.buttons .buy:hover {
    color: #fff;
    background-color: #e86464;
    border-color: #e86464
}

.buttons .wishlist {
    background-color: #fff;
    border-color: #ff7676
}

.buttons .wishlist:hover {
    background-color: #e86464;
    border-color: #e86464;
    color: #fff
}

.buttons .wishlist:hover i {
    color: #fff
}

.buttons .wishlist i {
    color: #ff7676
}

.comment-ratings i {
    color: #f6d151
}

.followers {
    font-size: 9px;
    color: #d6d4d4
}

.store-image {
    width: 42px
}

.dot {
    height: 10px;
    width: 10px;
    background-color: #bbb;
    border-radius: 50%;
    display: inline-block;
    margin-right: 5px
}

.bullet-text {
    font-size: 12px
}

.my-color {
    margin-top: 10px;
    margin-bottom: 10px
}

label.radio {
    cursor: pointer
}

label.radio input {
    position: absolute;
    top: 0;
    left: 0;
    visibility: hidden;
    pointer-events: none
}

label.radio span {
    border: 2px solid #8f37aa;
    display: inline-block;
    color: #8f37aa;
    border-radius: 50%;
    width: 25px;
    height: 25px;
    text-transform: uppercase;
    transition: 0.5s all
}

label.radio .red {
    background-color: red;
    border-color: red
}

label.radio .blue {
    background-color: blue;
    border-color: blue
}

label.radio .green {
    background-color: green;
    border-color: green
}

label.radio .orange {
    background-color: orange;
    border-color: orange
}

label.radio input:checked+span {
    color: #fff;
    position: relative
}

label.radio input:checked+span::before {
    opacity: 1;
    content: '\2713';
    position: absolute;
    font-size: 13px;
    font-weight: bold;
    left: 4px
}

.card-body {
    padding: 0.3rem 0.3rem 0.2rem
}
</style>
    
 <script>
  function check(){  
  var fm = document.form;   
  if (fm.amount.value==""){
		alert("????????? ????????????????????");
		fm.size.focus();
		
	 
		
		return;
  }  
  
	
	//???????????? ??????
	fm.action = "/shop/shop/cart/insert.do";
	fm.method = "post";
	fm.submit();  

return;
}  

</script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>


    <%@ include file="../include/menu.jsp" %>
    
    
    
 <form name="form">
 
   <input type="hidden" name="price" value="${vo.price}">
       <input type="hidden" name="size" value="${vo.size}">
        <input type="hidden" name="product_code" value="${vo.product_code}">
        
<div class="container-fluid mt-2 mb-3">
 <div class="row no-gutters">
  <div class="col-md-5 pr-2">
   <div class="card" style="background: #eee;margin-bottom: 10px;">
   
    
    <div id="carouselExampleIndicators" class="carousel slide" data-bs-ride="carousel">
  <div class="carousel-indicators">
    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1" aria-label="Slide 2"></button>
    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2" aria-label="Slide 3"></button>
  </div>
  <div class="carousel-inner" style="margin-bottom: 30px;">
  
    <div class="carousel-item active" style="margin-bottom: 30px;margin-top: 40px;">
      <img src="/shop/resources/images/${vo.filename}" style="height: 850px;">
    </div>
    <div class="carousel-item" style="margin-bottom: 30px;margin-top: 40px;">
      <img src="/shop/resources/images/${vo.filename1}" style="height: 850px;">
    </div>
    <div class="carousel-item" style="margin-bottom: 30px;margin-top: 40px;">
      <img src="/shop/resources/images/${vo.filename2}" style="height: 850px;">
    </div>
  </div>
  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Previous</span>
  </button>
  <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Next</span>
  </button>
</div>

    </div>
</div> 

  <div class="col-md-7">
   <div class="card">
   <div class="d-flex flex-row align-items-center">
    ${vo.brand}
       </div>
       
       
        <div class="about" style="margin-top: 6px;"> 
        <span class="font-weight-bold" style="font-size: 20px;">${vo.product_name}</span> 
        
       <h4 class="font-weight-bold" style="margin-top: 12px;">
       <fmt:formatNumber value="${vo.price}" pattern="#,###" />???
       	</h4> 
       	
       </div>
       
<label style="color: gray;font-family: 'Noto Sans KR', sans-serif;font-size:18px;"><strong>????????????</strong></label>
    	<input type="number" size="3000" min="1" max="99" style="width: 400px;border-radius: 5px;" class="form" name="amount" value="amount">

        <div class="buttons"> 
       <button class="btn btn-outline-dark" type="button" onclick="check()">Add to Cart</button>
        <button class="btn btn-dark" onclick="location='/shop/shop/product/list.do'" type="button">Product list</button> 
        <button class="btn btn-outline-dark"> <i class="fa fa-heart"></i> 
        </button>
        
        
         </div> 
         <hr>
          <div class="product-description"> 
          <div><span class="font-weight-bold">?????? :</span><span>&nbsp;${vo.gender}</span></div> 
          <div class="my-color">



 <div class="d-flex flex-row align-items-center"> 
<span>??????:</span>
 <span class="ml-1">&nbsp;${vo.purpose}</span> 
 </div>
 
 
  <div class="mt-2"> 



 <span>?????????:</span>
 <span class="ml-1">&nbsp;???????????? ???????????? 30???????????? ???????????? ?????? ?????? <br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;  ???????????? 100???????????? ????????????</span> 

<Br>
<div style="margin-top: 4px;">
 <span >???????????????:</span>
 <span class="ml-1">&nbsp;?????? 36?????? (2,260??? x 36)</span> 
</div>

<div style="margin-top: 4px;">
 <span style="align-items: center;margin-top: 10px;">????????????:</span>
 <span class="ml-1">&nbsp;100.000 ??? ?????? ?????? ?????? + 100% ????????????<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;????????? <fmt:formatNumber value="${vo.fee}" pattern="#,###" />???.</p></span> 
</div>

<div style="margin-top: 4px;">
 <span >???????????????:</span>
 <span class="ml-1">&nbsp;${vo.size}</span> 
</div>


 <Div style="margin-top: 4px;">
  <span >?????????:</span>
 <span class="ml-1">&nbsp;????????????(?????????):??????,?????? | ????????????</span> 
 </div>

  
   <div class="bullets"> 
   <div class="d-flex align-items-center"> 
   <span class="dot"></span> <span class="bullet-text">Best in Quality</span> 
   </div> <div class="d-flex align-items-center"> <span class="dot"></span> 
   <span class="bullet-text">Anti-creak joinery</span> </div> <div class="d-flex align-items-center">
    <span class="dot"></span> <span class="bullet-text">Sturdy laminate surfaces</span> </div>
     <div class="d-flex align-items-center">
      <span class="dot"></span> <span class="bullet-text">Relocation friendly design</span>
       </div> <div class="d-flex align-items-center"> <span class="dot"></span>
        <span class="bullet-text">High gloss, high style</span> </div> <div class="d-flex align-items-center">
         <span class="dot"></span> <span class="bullet-text">Easy-access hydraulic storage</span> </div> </div> </div>
          <div class="mt-2">
         
           <span class="font-weight-bold">Store</span> </div> <div class="d-flex flex-row align-items-center"> 
         <p style="font-size: 30px;"> <i class="fa-solid fa-basket-shopping"></i></p>
           <div class="d-flex flex-column ml-1 comment-profile"> <div class="comment-ratings">
            <i class="fa fa-star"></i> <i class="fa fa-star"></i> <i class="fa fa-star"></i> 
            <i class="fa fa-star"></i> </div> <span class="username">&nbsp;&nbsp;Im`s mall</span>
             <small class="followers">SHOPING</small> </div> </div> </div> </div>
             
              <div class="card mt-2" style="margin-bottom: 60px;"> 
             <span style="margin-bottom: 10px;">?????? ????????? ??????</span> 
             <div class="similar-products mt-2 d-flex flex-row">
                <c:forEach var="list" items="${top5}">
              <div class="card border p-1" style="width: 9rem;margin-right: 3px;">
              
            
           
               <img src="/shop/resources/images/${list.filename}" class="card-img-top" alt="..." width="60px" height="30px">
                <div class="card-body"> <h6 class="card-title">${list.product_name}</h6> 
                </div>
                 </div>
               </c:forEach>
                    
                      
                      </div> </div> </div> </div> </div> 
                     
      </form>                
                     

    
    
          <br><br>
          <hr>
          <div class="row" style="justify-content: center;margin-left: 450px;">
              <div class="col-12">
        
              <img src="https://cdn-prd.ssoldot.me/media/events/9A6kDrZFvWnJupX.jpg" class="img-fluid" style="width: 1000px;">
                  <br><br><br><br>
                  <img src="https://storage.googleapis.com/cbmpress/uploads/sites/3/2017/01/cloth-05.jpg" class="img-fluid" style="width: 1000px;">
                  <br><br><br><br>
                  <img src="https://cdn.imweb.me/upload/S201912072d9f3bab5337e/8faafefd2429a.jpg" class="img-fluid"style="width: 1000px;">
                   <br><br><br><br>
                  <img src="http://m.thefindme.co.kr/web/upload/NNEditor/20190823/EAB590ED999820EBB08F20EBB098ED928820EC9588EB82B4.jpg" class="img-fluid" style="width: 1000px;">
              </div>
          </div>

</body>
</html>