<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="cpath" value="${pageContext.request.contextPath }" />
<c:set var="newLine" value="<%='\n'%>" />
<script type = "text/javascript">
	function goDel(diary_seq){
		location.href = "${cpath}/diarydelete.do?diary_seq="+diary_seq;
	}
	
	function goEdit(diary_seq){
		location.href="${cpath}/diaryEditForm.do?diary_seq="+diary_seq;
	}
</script>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>


<body>
<!-- container -->
	<main id="wrap" class="position-relative">
		<div class="container">
			
			<h2>게시판</h2>
			<BR>
			<table class="table">
				<tr>
				
					<td>제목</td>
					<td>${vo.diary_title}</td>

				</tr>
				<tr>
					<td>내용</td>
					<td>${fn:replace(vo.diary_content,newLine,"<br>")}</td>
				</tr>
				<tr>
					<c:if test="${vo.diary_file != null}">
					<td>사진</td>
					<td><img src="${cpath}/img/${vo.diary_file}"></td>
					</c:if>
					
				</tr>
				<tr>
					<td>작성자</td>
					<td>${dvo.diary_nick}</td>
				</tr>
				
				<tr>

						<button class="btn btn-sm btn-primary"
							onclick="location.href='${cpath}/diary.do'">리스트</button>
						<button onclick = "goDel(${vo.diary_seq})">삭제</button>
						<button onclick = "goEdit(${vo.diary_seq})">수정</button>
				</div>
</body>
</html>