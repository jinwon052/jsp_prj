<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <link rel="shortcut icon" href="http://192.168.10.72/jsp_prj/common/images/favicon.ico"/>
  <title>회원가입</title>
</head>
<body class="signup-body">
  <jsp:include page="header.jsp" />

  <body class="signup-body">

  <jsp:include page="header.jsp" />

  <form method="post" action="process.jsp" class="signup-form">
    
    <!-- 약관 -->
    <div class="terms-box">
      <p><strong>제1장 총칙</strong><br>제1조 목적<br>이 약관은 ...</p>
    </div>
    <div class="checkbox">
      <input type="checkbox" id="agree1" name="agree1">
      <label for="agree1">회원가입약관에 동의합니다.</label>
    </div>

    <div class="terms-box">
      <p><strong>개인정보 수집 및 이용</strong><br>공단은 회원의 개인정보를 안전하게 보호합니다...</p>
    </div>
    <div class="checkbox">
      <input type="checkbox" id="agree2" name="agree2">
      <label for="agree2">개인정보취급방침에 동의합니다.</label>
    </div>

    <!-- 회원정보 입력 -->
    <table class="signup-table">
      <tr>
        <th>*아이디</th>
        <td>
          <div class="id-row">
            <input type="text" id="id" name="id">
            <button type="button" class="btn btn-success">ID 중복확인</button>
          </div>
        </td>
      </tr>

      <tr>
        <th>*비밀번호</th>
        <td>
          <input type="password" id="password" name="password" placeholder="6~12자의 영문, 숫자, 특수문자 조합" style="width: 76%">
        </td>
        
        </tr>
        
       
      <tr>
        <th>*비밀번호 확인</th>
        <td>
          <input type="password" id="password2" name="password2" style="width: 76%">
        </td>
      </tr>
      <tr>
        <td>
        </td>
        <td>
          <span id="errMsg">오류 나올 메세지</span>
        </td>
        </tr>

      <tr>
        <th>*이름</th>
        <td><input type="text" id="name" name="name" style="width: 76%"></td>
      </tr>

      <tr>
        <th>*휴대폰</th>
        <td><input type="text" id="phone" name="phone" style="width: 76%"></td>
      </tr>

      <tr>
        <th>*이메일</th>
        <td class="email-domain">
          <input type="text" id="email1" name="email1" style="width: 34.3%"> &nbsp; @
          <select id="email2" name="email2" style="width: 34.3%">
            <option value="">선택해주세요.</option>
            <option value="naver.com">naver.com</option>
            <option value="daum.net">daum.net</option>
            <option value="gmail.com">gmail.com</option>
            <option value="direct">직접입력</option>
          </select>
        </td>
      </tr>
    </table>

    <div class="submit-buttons">
      <button type="submit" class="submit">확인</button>
      <button type="reset" class="reset">취소</button>
    </div>

  </form>
  
  <!-- 푸터 -->
  <jsp:include page="footer.jsp" />
</body>
</html>
