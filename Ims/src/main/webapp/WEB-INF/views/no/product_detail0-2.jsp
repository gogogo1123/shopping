<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
		alert("수량을 선택해주세요");
		fm.size.focus();
		
	 
		
		return;
  }  
  
	
	//가상경로 사용
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
    
    
    

<div class="container-fluid mt-2 mb-3"> <div class="row no-gutters"> <div class="col-md-5 pr-2"> <div class="card"> <div class="demo"> <ul id="lightSlider"> <li data-thumb="https://i.imgur.com/KZpuufK.jpg"> <img src="https://i.imgur.com/KZpuufK.jpg" /> </li> <li data-thumb="https://i.imgur.com/GwiUmQA.jpg"> <img src="https://i.imgur.com/GwiUmQA.jpg" /> </li> <li data-thumb="https://i.imgur.com/DhKkTrG.jpg"> <img src="https://i.imgur.com/DhKkTrG.jpg" /> </li> <li data-thumb="https://i.imgur.com/kYWqL7k.jpg"> <img src="https://i.imgur.com/kYWqL7k.jpg" /> </li> <li data-thumb="https://i.imgur.com/c9uUysL.jpg"> <img src="https://i.imgur.com/c9uUysL.jpg" /> </li> <li data-thumb="https://i.imgur.com/KZpuufK.jpg"> <img src="https://i.imgur.com/KZpuufK.jpg" /> </li> <li data-thumb="https://i.imgur.com/GwiUmQA.jpg"> <img src="https://i.imgur.com/GwiUmQA.jpg" /> </li> <li data-thumb="https://i.imgur.com/DhKkTrG.jpg"> <img src="https://i.imgur.com/DhKkTrG.jpg" /> </li> <li data-thumb="https://i.imgur.com/kYWqL7k.jpg"> <img src="https://i.imgur.com/kYWqL7k.jpg" /> </li> <li data-thumb="https://i.imgur.com/c9uUysL.jpg"> <img src="https://i.imgur.com/c9uUysL.jpg" /> </li> <li data-thumb="https://i.imgur.com/KZpuufK.jpg"> <img src="https://i.imgur.com/KZpuufK.jpg" /> </li> <li data-thumb="https://i.imgur.com/GwiUmQA.jpg"> <img src="https://i.imgur.com/GwiUmQA.jpg" /> </li> <li data-thumb="https://i.imgur.com/DhKkTrG.jpg"> <img src="https://i.imgur.com/DhKkTrG.jpg" /> </li> <li data-thumb="https://i.imgur.com/kYWqL7k.jpg"> <img src="https://i.imgur.com/kYWqL7k.jpg" /> </li> <li data-thumb="https://i.imgur.com/c9uUysL.jpg"> <img src="https://i.imgur.com/c9uUysL.jpg" /> </li> </ul>
</div> </div> <div class="card mt-2"> <h6>Reviews</h6> <div class="d-flex flex-row"> <div class="stars"> <i class="fa fa-star"></i> <i class="fa fa-star"></i> <i class="fa fa-star"></i> <i class="fa fa-star"></i> </div> <span class="ml-1 font-weight-bold">4.6</span> </div> <hr> <div class="badges"> <span class="badge bg-dark ">All (230)</span> <span class="badge bg-dark "> <i class="fa fa-image"></i> 23 </span> <span class="badge bg-dark "> <i class="fa fa-comments-o"></i> 23 </span> <span class="badge bg-warning"> <i class="fa fa-star"></i> <i class="fa fa-star"></i> <i class="fa fa-star"></i> <i class="fa fa-star"></i> <span class="ml-1">2,123</span> </span> </div> <hr> <div class="comment-section"> <div class="d-flex justify-content-between align-items-center"> <div class="d-flex flex-row align-items-center"> <img src="https://i.imgur.com/o5uMfKo.jpg" class="rounded-circle profile-image" > <div class="d-flex flex-column ml-1 comment-profile"> <div class="comment-ratings"> <i class="fa fa-star"></i> <i class="fa fa-star"></i> <i class="fa fa-star"></i> <i class="fa fa-star"></i> </div> <span class="username">Lori Benneth</span> </div> </div> <div class="date"> <span class="text-muted">2 May</span> </div> </div> <hr> <div class="d-flex justify-content-between align-items-center"> <div class="d-flex flex-row align-items-center"> <img src="https://i.imgur.com/tmdHXOY.jpg" class="rounded-circle profile-image" > <div class="d-flex flex-column ml-1 comment-profile"> <div class="comment-ratings"> <i class="fa fa-star"></i> <i class="fa fa-star"></i> <i class="fa fa-star"></i> <i class="fa fa-star"></i> </div> <span class="username">Timona Simaung</span> </div> </div> <div class="date"> <span class="text-muted">12 May</span> </div> </div> </div> </div> </div> <div class="col-md-7"> <div class="card"> <div class="d-flex flex-row align-items-center"> <div class="p-ratings"> <i class="fa fa-star"></i> <i class="fa fa-star"></i> <i class="fa fa-star"></i> <i class="fa fa-star"></i> </div> <span class="ml-1">5.0</span> </div> <div class="about"> <span class="font-weight-bold">IKEA x HAY Ypperlig Collection </span> <h4 class="font-weight-bold">$3,444</h4> </div> <div class="buttons"> <button class="btn btn-outline-warning btn-long cart">Add to Cart</button> <button class="btn btn-warning btn-long buy">Buy it Now</button> <button class="btn btn-light wishlist"> <i class="fa fa-heart"></i> </button> </div> <hr> <div class="product-description"> <div><span class="font-weight-bold">Color:</span><span> blue</span></div> <div class="my-color"> <label class="radio"> <input type="radio" name="gender" value="MALE" checked> <span class="red"></span> </label> <label class="radio"> <input type="radio" name="gender" value="FEMALE"> <span class="blue"></span> </label> <label class="radio"> <input type="radio" name="gender" value="FEMALE"> <span class="green"></span> </label> <label class="radio"> <input type="radio" name="gender" value="FEMALE"> <span class="orange"></span> </label> </div> <div class="d-flex flex-row align-items-center"> <i class="fa fa-calendar-check-o"></i> <span class="ml-1">Delivery from sweden, 15-45 days</span> </div> <div class="mt-2"> <span class="font-weight-bold">Description</span> <p>The minimalist collaboration features chairs, lightening, Shelves, Sofas, Desks and various home accessories, all offering form and function at the same point.We use high-strength clamps and joinery techniques specially designed for engineered wood beds. Ergo, no irksome creaks - and you can sleep like a baby, well into adulthood!</p> <div class="bullets"> <div class="d-flex align-items-center"> <span class="dot"></span> <span class="bullet-text">Best in Quality</span> </div> <div class="d-flex align-items-center"> <span class="dot"></span> <span class="bullet-text">Anti-creak joinery</span> </div> <div class="d-flex align-items-center"> <span class="dot"></span> <span class="bullet-text">Sturdy laminate surfaces</span> </div> <div class="d-flex align-items-center"> <span class="dot"></span> <span class="bullet-text">Relocation friendly design</span> </div> <div class="d-flex align-items-center"> <span class="dot"></span> <span class="bullet-text">High gloss, high style</span> </div> <div class="d-flex align-items-center"> <span class="dot"></span> <span class="bullet-text">Easy-access hydraulic storage</span> </div> </div> </div> <div class="mt-2"> <span class="font-weight-bold">Store</span> </div> <div class="d-flex flex-row align-items-center"> <img src="https://i.imgur.com/N2fYgvD.png" class="rounded-circle store-image" > <div class="d-flex flex-column ml-1 comment-profile"> <div class="comment-ratings"> <i class="fa fa-star"></i> <i class="fa fa-star"></i> <i class="fa fa-star"></i> <i class="fa fa-star"></i> </div> <span class="username">Rare Boutique</span> <small class="followers">25K Followers</small> </div> </div> </div> </div> <div class="card mt-2"> <span>Similar items:</span> <div class="similar-products mt-2 d-flex flex-row"> <div class="card border p-1" style="width: 9rem;margin-right: 3px;"> <img src="https://i.imgur.com/KZpuufK.jpg" class="card-img-top" alt="..."> <div class="card-body"> <h6 class="card-title">$1,999</h6> </div> </div> <div class="card border p-1" style="width: 9rem;margin-right: 3px;"> <img src="https://i.imgur.com/GwiUmQA.jpg" class="card-img-top" alt="..."> <div class="card-body"> <h6 class="card-title">$1,699</h6> </div> </div> <div class="card border p-1" style="width: 9rem;margin-right: 3px;"> <img src="https://i.imgur.com/c9uUysL.jpg" class="card-img-top" alt="..."> <div class="card-body"> <h6 class="card-title">$2,999</h6> </div> </div> <div class="card border p-1" style="width: 9rem;margin-right: 3px;"> <img src="https://i.imgur.com/kYWqL7k.jpg" class="card-img-top" alt="..."> <div class="card-body"> <h6 class="card-title">$3,999</h6> </div> </div> <div class="card border p-1" style="width: 9rem;"> <img src="https://i.imgur.com/DhKkTrG.jpg" class="card-img-top" alt="..."> <div class="card-body"> <h6 class="card-title">$999</h6> </div> </div> </div> </div> </div> </div> </div> 
                     
 
    
    

</body>
</html>