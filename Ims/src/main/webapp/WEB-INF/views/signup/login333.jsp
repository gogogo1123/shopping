<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
@import url('https://fonts.googleapis.com/css2?family=Roboto+Slab:wght@200&display=swap');*{padding:0;margin:0;box-sizing:border-box}.container{display:flex;justify-content:center;align-items:center;min-height:100vh;background-image: linear-gradient(to right top,#black,#black)}.container .card{height:420px;width:800px;background-color:#black;position:relative;box-shadow:0 15px 30px rgba(0,0,0,0.1);font-family: 'Roboto Slab', serif}.container .card .form{width:100%;height:100%;display:flex}.container .card .left-side{width:50%;background-color:#fff;height:100%;position:relative;overflow:hidden}.left-side span:nth-child(1){position:absolute;transform:rotate(45deg);top:70px;left:-100px;display:flex;height:180px;width:400px;border-top-right-radius:150px;border-bottom-right-radius:150px;border:15px solid #7FC1D2;background-image: linear-gradient(to right,#D43CC6,#682E36)}.left-side span:nth-child(2){position:absolute;transform:rotate(45deg);top:-20px;left:130px;display:flex;height:100px;width:200px;border-top-right-radius:150px;border-bottom-right-radius:150px;background-image: linear-gradient(to right,#D43CC6,#682E36)}.left-side span:nth-child(3){position:absolute;transform:rotate(45deg);top:280px;left:-70px;display:flex;height:100px;width:200px;border-top-right-radius:150px;border-bottom-right-radius:150px;background-image: linear-gradient(to right,#D43CC6,#682E36)}.left-side span:nth-child(4){position:absolute;transform:rotate(-135deg);top:370px;left:170px;display:flex;height:100px;width:200px;border-top-right-radius:150px;border-bottom-right-radius:150px;background-image: linear-gradient(to right,#FD2A6F,#FD2A46)}.container .card .right-side{width:50%;background-color:#fff;height:100%;padding:20px}.d-none{display:none !important}.login{display:flex;justify-content:center;text-align:center;width:100%;margin-top:20px}.input_text{margin-top:20px;width:100%;position:relative}input[type="text"]{height:45px;width:100%;border:none;background-color:#E7DCE6;outline:0;padding:5px 10px;padding-left:25px;border-radius:10px}input[type="password"]{height:45px;width:100%;border:none;background-color:#E7DCE6;outline:0;padding:5px 10px;padding-left:25px;padding-right:28px;border-radius:10px}.fa-lock{position:absolute;top:15px;left:10px;cursor:pointer;color:#70747C}.fa-user{position:absolute;top:14px;left:9px;cursor:pointer;color:#70747C}.fa-envelope{position:absolute;top:15px;left:7px;cursor:pointer;color:#70747C;font-size:14px}.fa-eye-slash{position:absolute;top:15px;right:9px;cursor:pointer;color:#70747C}.fa-eye{position:absolute;top:15px;right:9px;cursor:pointer;color:#70747C}.login_btn{margin-top:20px;display:flex;justify-content:center;align-items:center}.login_btn button{height:45px;outline:0;border:none;width:100%;color:#fff;border-radius:30px;background-color:#B33346;font-size:13px;cursor:pointer;transition:all 0.5s}.login_btn button:hover{background-color:#631B26}.forgot{text-align:center;margin-top:20px;font-size:13px;color:#B8B0B1;font-weight:600;letter-spacing:1px}.forgot p a{text-decoration:none}.create{margin-top:40px;text-align:center;text-decoration:none;font-size:13px;font-weight:700}.margin{margin-top:67px !important}.create a{text-decoration:none;color:blue}.signin_warn{border:1px solid red !important}.signup_warn{border:1px solid red !important}.signin_eye_wrn{border:1px solid blue !important}.signup_eye_wrn{border:1px solid blue !important}@media (max-width:750px){.container .card{max-width: 350px}.container .card .right-side{width:100%}.container .card .left-side{display: none}}
</style>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<meta charset="UTF-8">

<title>Insert title here</title>

<script src="http://code.jquery.com/jquery-3.6.0.min.js"></script>

<script>

$(function(){

$("#btnLogin").click(function(){
var userid=$("#userid").val();
var passwd=$("#passwd").val();
if(userid==""){

alert("???????????? ???????????????.");

$("#userid").focus();
return;

}

if(passwd==""){

alert("??????????????? ???????????????.");

$("#passwd").focus();
return;

}

document.form1.action="/shop/member/login_check.do";
document.form1.submit();
});



});

</script>

</head>

<body>

<div class="container"> 
<div class="card"> 
<div class="form">
 <div class="left-side">
  <span></span>
   <span></span>
    <span></span> 
    <span></span>
     </div> 
     
     <div class="right-side"> 
     <div class="signin_form s_form "> 
     <div class="login">
      <h2>Im's</h2>

<%@ include file="../include/menu.jsp" %>

<h2> ?????????</h2>

<form name="form1" method="post">

<table border="1" width="400px">

<tr>

<td>?????????</td>

<td><input id="userid" name="member_id"></td>

</tr>

<tr>

<td>????????????</td>

<td><input type="password" id="passwd" name="member_pw">

</td>

</tr>

<tr>

<td colspan="2" align="center">

<button type="button" id="btnLogin">?????????</button>

<c:if test="${message == 'error' }">

<div style="color:red;">

????????? ?????? ??????????????? ???????????? ????????????.

</div>

</c:if>


<c:if test="${param.message == 'logout' }">

<div style="color:red;">
???????????????????????????.

</div>

</c:if>

</td>

</tr>

</table>

 <a id="custom-login-btn" href="javascript:kakaoLogin()">
      <img
        src="//k.kakaocdn.net/14/dn/btqCn0WEmI3/nijroPfbpCa4at5EIsjyf0/o.jpg"
        width="222"
      />
    </a>
    <button id="logout-btn" style="display: none" onclick="kakaoLogout();">
      ????????????
    </button>
    <script>
      Kakao.init("012a27e095a806df95d215e20a442cb6"); //?????? ?????? ??????

      function kakaoLogin() {
        Kakao.Auth.login({
          scope: "profile_nickname,account_email", //?????????????????? ????????? ID??? ????????? ???????????? ???
          success: function () {
            //????????? ??????
            Kakao.API.request({
              //????????? ????????? ???????????? ?????? API
              url: "/v2/user/me",
              success: (res) => {
                //????????? ????????? ??????????????? ??????
                const kakaoAccount = res.kakao_account; //????????? ?????? ??????
                console.log(kakaoAccount);
                document.getElementById("custom-login-btn").style.display =
                  "none"; //????????? ?????? ?????????
                document.getElementById("logout-btn").style.display = ""; //???????????? ?????? ?????????
              },
            });
          },
          fail: function (error) {
            //????????? ??????
            console.log(error);
          },
        });
      }

      function kakaoLogout() {
        if (!Kakao.Auth.getAccessToken()) {
          //???????????? ????????? Access Token ??? ??????????????? ??????. ????????? ?????? ???????????? ?????? ??????.
          console.log("Not logged in.");
          return;
        }

        Kakao.Auth.logout((res) => {
          //???????????? ?????? ??????
          console.log(window.Kakao.Auth.getAccessToken());
          console.log(res);
          document.getElementById("custom-login-btn").style.display = ""; //????????? ?????? ?????????
          document.getElementById("logout-btn").style.display = "none"; //???????????? ?????? ?????????
        });
      }
    </script>

</form>

</body>

</html>
