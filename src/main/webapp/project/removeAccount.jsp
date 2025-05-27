<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>회원탈퇴</title>
    <link rel="stylesheet" href="http://192.168.10.72/jsp_prj/project/common.css">
</head>
<body class="login">
<!-- 상단 메뉴 등 -->
  <jsp:include page="header.jsp" />
<div class="login-container" style="width: 450px; height: 290px;">
    <h2>회원탈퇴</h2>
    <form action="login.do" method="post">
    	 <label style="position: absolute; left: 50px;">아이디 :</label>
  <span style="position: absolute; left: 120px;">honghong</span>
        <input type="hidden" style="display: none;"><br>
        <input type="text" name="username" placeholder="비밀번호" required><br>
        <input type="hidden" style="display: none;"><br>
        <button type="submit">회원탈퇴</button>
    </form>

</div>
<!-- 푸터 -->
  <jsp:include page="footer.jsp" />
</body>
</html>
