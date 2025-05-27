<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>로그인</title>
    <link rel="stylesheet" href="http://192.168.10.72/jsp_prj/project/common.css">
</head>
<body class="login">
<!-- 상단 메뉴 등 -->
  <jsp:include page="header.jsp" />
<div class="login-container">
    <h2>로그인</h2>
    <form action="login.do" method="post">
        <input type="text" name="username" placeholder="아이디" required><br>
        <input type="password" name="password" placeholder="비밀번호" required><br>
        <button type="submit">로그인</button>
    </form>

    <div class="link-container">
        <div class="link-box">
            <a href="http://192.168.10.72/jsp_prj/project/searchAccount.jsp" style="margin-right: 20px; ">아이디/비밀번호 찾기</a>
            <span class="divider"></span>
            <a href="http://192.168.10.72/jsp_prj/project/sign_up.jsp" style="margin-left: 10px; ">회원가입</a>
        </div>
    </div>
</div>
<!-- 푸터 -->
  <jsp:include page="footer.jsp" />
</body>
</html>
