<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "vo.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>index.jsp</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
<div class = "container_fluid p-3 my-3  bg-dark text-white">
	<!-- submenu 인클루드(include) 시작 -->
	<div>
		<!-- ./같은위치/partial폴더/submenu.jsp(webContent,상대주소) , /shop/partial/submenu.jsp(프로젝트기준,절대주소),/partial/submenu.jsp(절대주소)-->
		<jsp:include page="/partial/mainMenu.jsp"></jsp:include><!-- jsp액션태그 -->
	</div>
	<!-- submenu 인클루드 끝 -->
	<div>
	<h1>index</h1>
		
		<!-- 로그인 작업 -->
			<%
				if(session.getAttribute("loginMember") == null) {
			%>
					<div><a href="<%=request.getContextPath() %>/loginForm.jsp" class="btn btn-primary">로그인</a></div>
					<div><a href="<%=request.getContextPath() %>/insertMemberForm.jsp" class="btn btn-primary">회원가입</a></div>
			<%		
				} else {
					Member loginMember = (Member)session.getAttribute("loginMember");
			%>
				<!-- 로그인 -->
				<div><%=loginMember.getMemberId()%>님 반갑습니다.<a href="./logout.jsp">로그아웃</a></div>
				<!-- 관리자 페이지로 가는 링크 -->
			<%
					if(loginMember.getMemberLevel() > 0) {
			%>
						<div><a href="<%=request.getContextPath()%>/admin/adminIndex.jsp">관리자 페이지</a></div>
			<%
					}
				}
			%>
	</div>
</div>
</body>
</html>