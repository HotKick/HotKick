<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<c:set var="cpath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>커뮤니티_중고거래</title>

<!-- style -->
<link rel="stylesheet" href="${cpath}/css/reset.css">
<link rel="stylesheet" href="${cpath}/css/common.css">
<link rel="stylesheet" href="${cpath}/css/community.css">

<!-- 슬릭 -->
<link rel="stylesheet" type="text/css" href="${cpath}/css/slick.css" />
<link rel="stylesheet" type="text/css" href="${cpath}/css/slick-theme.css" />

<!-- 웹아이콘 -->
<script src="https://kit.fontawesome.com/e76461f593.js"
	crossorigin="anonymous"></script>


</head>
<body>
		<%@ include file="header.jsp" %>
	<main>


		<!-- //게시판 영역 -->
	</main>
	<section id="board">
		<div class="container">
			<div class="board_wrap">
				<div class="board_title">
					<strong>중고거래</strong>
					<div class="tag">
                        <div><a href="${cpath}/communityFree.do" class="free">자유게시판</a></div>
                        <div><a href="${cpath}/communityInfo.do" class="info">정보게시판</a></div>
                        <div><a href="${cpath}/communityTrade.do" class="trade">중고게시판</a></div>
                    </div>
				</div>
				<div class="board_list_wrap">
					<div class="board_list">
						<div class="top">
							<div class="num">번호</div>
							<div class="title">제목</div>
							<div class="writer">글쓴이</div>
							<div class="date">작성일</div>
							<div class="count">조회</div>
						</div>
						<!-- //table_heade -->

						<div>
						<c:forEach var= "vo" items = "${list}" begin="1" end="10" step="1" varStatus="status">
						<c:if test = "${vo.community_type eq '03' }">
							<div class="num">${vo.trade_seq}</div>
							<div class="title">
								<a href="communityDetail.do">${vo.trade_title}</a>
							</div>
							<div class="writer">${vo.trade_id}</div>
							<div class="date">${vo.trade_date}</div>
							<div class="count">${vo.trade_cnt}</div>
							</c:if>
							</c:forEach>
						</div>
						<!-- //1행 -->



					</div>
					<!-- 페이지 넘버 -->
					<div class="board_page">
						<a href="#" class="bt first"></a> <a href="#" class="bt prev"></a>
						<a href="#" class="num on">1</a> <a href="#" class="num">2</a> <a
							href="#" class="num">3</a> <a href="#" class="num">4</a> <a
							href="#" class="num">5</a> <a href="#" class="bt next">></a> <a
							href="#" class="bt last">>></a>
					</div>
					<div class="bt_wrap">
                        <button><a href="${cpath}/communityWriteForm.do">등록</a></button>
                    </div>
				</div>
			</div>
			<!--  -->
		</div>
		<!-- //container -->
	</section>


		<footer id="footer">
		<div class="container">
			<div class="foot_inner mt30">
				<div class="foot_logo">
					<a href="${cpath}/main.do">Baby LOG</a>
				</div>
				<div class="foot_nav">
					<ul>
						<li><a href="${cpath}/diary.do">육아일기</a></li>
						<li><a href="${cpath}/communityFree.do">커뮤니티</a></li>
						<li><a href="${cpath}/shop.do">쇼핑몰</a></li>
						<li><a href="${cpath}/newsGov.do">뉴스</a></li>
						<li><a href="${cpath}/question.do">고객센터</a></li>
					</ul>
				</div>
				<div class="foot_icon">
					<ul>
						<li><a href="#"> <i class="fa-brands fa-twitter"></i> <span>트위터</span>
						</a></li>
						<li><a href="#"> <i class="fa-brands fa-instagram"></i> <span>인스타그램</span>
						</a></li>
						<li><a href="#"> <i class="fa-brands fa-facebook"></i> <span>페이스북</span>
						</a></li>
					</ul>
				</div>
			</div>

		</div>
	</footer>

	<!-- script -->
	<script type="text/javascript"
		src="//code.jquery.com/jquery-1.11.0.min.js"></script>
	<script src="${cpath}/js/slick.min.js"></script>

	<script>
    $('table').DataTable();

// See:
// http://www.sitepoint.com/responsive-data-tables-comprehensive-list-solutions
</script>


</body>
</html>