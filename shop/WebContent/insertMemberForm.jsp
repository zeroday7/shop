<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
	<!-- submenu 인클루드(include) 시작 -->
	<div>
		<!-- ./같은위치/partial폴더/submenu.jsp(webContent,상대주소) , /shop/partial/submenu.jsp(프로젝트기준,절대주소),/partial/submenu.jsp(절대주소)-->
		<jsp:include page="/partial/mainMenu.jsp"></jsp:include><!-- jsp액션태그 -->
	</div>
	<!-- submenu 인클루드 끝 -->
	<div class="container">
		<h1>회원가입</h1>
		<form action="<%=request.getContextPath() %>/insertMemberAction.jsp" method="post">
			<table class="table">
				<tr>
					<td>회원아이디</td>
					<td><input type="text" class="form-control form-control-lg" id="memberId" name="memberId"></td>
				</tr>
				<tr>
					<td>회원비밀번호</td>
					<td><input type="password" class="form-control form-control-lg" id="memberPw" name="memberPw"></td>
				</tr>
				<tr>
					<td>회원이름</td>
					<td><input type="text" class="form-control form-control-lg" id="memberName" name="memberName"></td>
				</tr>
				<tr>
					<td>회원나이</td>
					<td><input type="text" class="form-control form-control-lg" id="memberAge" name="memberAge"></td>
				</tr>
				<tr>
					<td>성별</td>
					<td><input type="radio" id="memberGender" name="memberGender" value="남">남<input type="radio" id="memberGender" name="memberGender" value="여">여</td>
				</tr>
			</table>
			<button type="submit" class="btn btn-primary">입력</button>
		</form>
	</div>
</body>
</html>