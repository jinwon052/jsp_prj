<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <title>마이페이지</title>
  <link rel="shortcut icon" href="http://192.168.10.72/jsp_prj/common/images/favicon.ico"/>
  <!-- 기타 공통 스타일 -->
  <link rel="stylesheet" href="http://192.168.10.72/jsp_prj/project/common.css">

  

  <script>
    function showTab(tabId) {
      const tabs = document.querySelectorAll('.tab-content');
      const buttons = document.querySelectorAll('.tab-button');

      tabs.forEach(tab => tab.classList.add('hidden'));
      buttons.forEach(btn => btn.classList.remove('active'));

      document.getElementById(tabId).classList.remove('hidden');
      document.getElementById(tabId + '-btn').classList.add('active');
    }

    window.addEventListener('DOMContentLoaded', () => {
      showTab('info-tab');
    });
  </script>
</head>
<body>

<jsp:include page="header.jsp" />

<!-- ✅ 탭 버튼 -->
<div class="tab-container" style="position: relative; right: 70px">
  <div id="info-tab-btn" class="tab-button" onclick="showTab('info-tab')">회원정보수정</div>
  <div id="reserve-tab-btn" class="tab-button" onclick="showTab('reserve-tab')">예약내역</div>
</div>


<!-- ✅ 탭 내용 1: 회원정보수정 -->
<div id="info-tab" class="tab-content" style="position: relative; right: 70px">
  <form method="post" action="process.jsp" class="signup-form" style="width: 900px;">
    <table class="signup-table">
      <tr>
        <th>아이디</th>
        <td><div class="id-row"><span>honghong</span></div></td>
      </tr>
      <tr>
        <th>비밀번호</th>
        <td><input style="width: 73%" type="password" id="password" name="password" placeholder="6~12자의 영문, 숫자, 특수문자 조합"></td>
      </tr>
      <tr>
        <th>비밀번호 확인</th>
        <td><input style="width: 73%" type="password" id="password2" name="password2"></td>
      </tr>
      <tr>
        <td></td>
        <td><span id="errMsg">오류 나올 메세지</span></td>
      </tr>
      <tr>
        <th>이름</th>
        <td><input style="width: 73%" type="text" id="name" name="name"></td>
      </tr>
      <tr>
        <th>휴대폰</th>
        <td><input style="width: 73%" type="text" id="phone" name="phone"></td>
      </tr>
      <tr>
        <th>이메일</th>
        <td class="email-domain">
          <input type="text" id="email1" name="email1" style="width: 34.5%"> @
          <select id="email2" name="email2" style="width: 34.5%">
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
      <button type="submit" class="submit">수정</button>
    </div>
    <a href="#" class="withdraw-link">회원탈퇴</a>
  </form>
</div>

<!-- ✅ 탭 내용 2: 예약내역 -->
<div id="reserve-tab" class="tab-content hidden"  >
  <form class="signup-form" style="width: 900px; position: relative; right: 70px"  >
    <table style="width: 100%; border: 1px solid #ccc; border-collapse: collapse; text-align: center;">
      <thead style="background-color: #f9f9f9;">
        <tr>
          <th style="border: 1px solid #ccc; padding: 8px;">예매 정보</th>
          <th style="border: 1px solid #ccc; padding: 8px;">관람</th>
          <th style="border: 1px solid #ccc; padding: 8px;">예약 일자</th>
          <th style="border: 1px solid #ccc; padding: 8px;">해설 언어</th>
          <th style="border: 1px solid #ccc; padding: 8px;">예약 인원</th>
          <th style="border: 1px solid #ccc; padding: 8px;">결제 금액</th>
        </tr>
      </thead>
      <tbody>
        <tr>
          <td style="border: 1px solid #ccc; padding: 8px;">20250501133211</td>
          <td style="border: 1px solid #ccc; padding: 8px;">경복궁 공식 해설</td>
          <td style="border: 1px solid #ccc; padding: 8px;">2025-05-05 11:00</td>
          <td style="border: 1px solid #ccc; padding: 8px;">한국어</td>
          <td style="border: 1px solid #ccc; padding: 8px;">대인 3명</td>
          <td style="border: 1px solid #ccc; padding: 8px;">15,000원</td>
        </tr>
      </tbody>
    </table>
  </form>
</div>
<jsp:include page="footer.jsp" />

</body>
</html>
