<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<c:set var="cpath" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>헤더</title>

<!-- style -->
<link rel="stylesheet" href="${cpath}/css/reset.css">
<link rel="stylesheet" href="${cpath}/css/common.css">
<!-- 웹아이콘 -->
<script src="https://kit.fontawesome.com/e76461f593.js"
	crossorigin="anonymous"></script>
	
	
<!-- 비 로그인자 로그인 알림 다이어리 -->	
<script type="text/javascript">
function diary_member(){
	 if(${empty mvo}){
		 alert("로그인 후 이용가능합니다.");
		 document.location.href= "${cpath}/loginform.do";
	 }else{
		 location.href="${cpath}/diary.do";
		 
	 }
	 }

</script>

<!-- 비 로그인자 로그인 알림 쇼핑몰 -->
<script type="text/javascript">
function shop_member(){
	 if(${empty mvo}){
		 alert("로그인 후 이용가능합니다.");
		 document.location.href= "${cpath}/loginform.do";
	 }else{
		 location.href="${cpath}/shop.do";
		 
	 }
	 }

</script>

<!-- / 비 로그인자 로그인 알림  -->

</head>
<body>

	<!-- !!new header ------------------------------------------------->
	<div id="nav">
	  <div class="container">
	      <nav class="navbar">
	          <div class="navbar_logo">
	              <i class="fab fa-apple"></i>
	              <a href="${cpath}/main.do">Baby LOG</a>
	          </div>
	          <ul class="navbar_menu">
	          			<li><a onclick="diary_member()">육아일기</a></li>
						<li><a href="${cpath}/communityFree.do">커뮤니티</a></li>
						<li><a onclick="shop_member()">쇼핑몰</a></li>
						<li><a href="${cpath}/newsGov.do">뉴스</a></li>
						<li><a href="${cpath}/newsGov.do">고객센터</a></li>
	          </ul>
	          <ul class="navbar_icons">
	          <c:if test="${empty mvo}">
		              <li><a href="${cpath}/loginform.do"><i class="fab fa-facebook-square"></i></a></li>
	              	  <li><a href="${cpath}/signupform.do"><i class="fab fa-instagram"></i></a></li>
			  </ul>
	          </c:if>
	          <c:if test="${!empty mvo}">
					${mvo.mem_name}님 환영합니다.
					<li><a href="${cpath}/mypage.do">마이페이지</a></li>
					<li><a href="${cpath}/logout.do">로그아웃</a></li>
			  </c:if>
	          <a href="#" class="navbar_toggleBtn">
	              <i class="fas fa-bars"></i>
	          </a>
	      </nav>
	      <!-- //navbar -->
	  
	  </div>
	  <!-- //container -->
	  </div>
	  <!-- //#nav -->
	  
	  <!--  // new header end ------------------------------------------------->
		
</body>
</html>