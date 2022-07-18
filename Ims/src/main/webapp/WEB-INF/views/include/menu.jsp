<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<a href="/shop/">홈</a>

<a href="/shop/shop/product/list.do?">상품리스트</a>

<a href="<c:url value='/notice/List.do'/>">공지사항2</a> 

<a href="<c:url value='/notice/Write.do'/>">공지사항 글쓰기</a>

<a href="<c:url value='/email.do'/>">이메일 보내기</a>


<div style="text-align:right;">

<c:choose>

<c:when test="${sessionScope.userid == null }">

<a href="/shop/member/login.do">로그인</a> |

<a href="/shop/admin/login.do">관리자 로그인</a>

<a href="/shop/shop/cart/list.do">장바구니</a>

<a href="/shop/mypage/main.do">마이페이지</a>

</c:when>

<c:otherwise>

${sessionScope.name}님이 로그인중입니다.

<a href="/shop/member/logout.do">로그아웃</a> |

<a href="/shop/admin/logout.do">관리자 로그아웃</a>

<a href="/shop/shop/cart/list.do">장바구니</a>

<a href="/shop/mypage/main.do">마이페이지</a>

<a href="/shop/admin/main.do">관리</a>

</c:otherwise>

</c:choose>

</div>

<hr>