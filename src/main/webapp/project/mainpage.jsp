<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <title>궁온 메인</title>
	<link rel="shortcut icon" href="http://192.168.10.72/jsp_prj/common/images/favicon.ico"/>
  <!-- Swiper CSS -->
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.css"/>

  <!-- 기타 공통 스타일 -->
  <link rel="stylesheet" href="http://192.168.10.72/jsp_prj/project/common.css">
  <link rel="stylesheet" type="text/css"
href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.5/dist/css/bootstrap.min.css">
 <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@docsearch/css@3">
  
  <!-- <style>
  .header-nav-link {
  font-size: 20px;
  }
  </style> -->
  
<!-- Swiper JS -->
  <script src="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.js"></script>
	<script src="http://localhost/jsp_prj/project/slide.js"></script>
  <script>
    
  </script>
</head>
<body class="main">

  <!-- 상단 메뉴 등 -->
  <jsp:include page="header.jsp" />

  <!-- 본문: 캐러셀 포함 -->
  <main>

	<div style="margin-left:250px;padding-top:20px; margin-bottom: 30px; ">
	<span style="font-size: 20px;">궁궐을 보존·활용하고 그 가치를 새롭게 창출해 나가는</span><br>
	<h2 style="font-size: 60px;">궁온</h2>
	</div>

    <div> 
    <jsp:include page="banner.jsp" />
    </div>
    <div class= "banner2-main">
    <jsp:include page="banner2.jsp" />
    </div>
    
    <div style="padding-left: 300px; padding-right: 300px">
    <jsp:include page="bboard.jsp" />
    </div>
  </main>

  <!-- 푸터 -->
  <jsp:include page="footer.jsp" />
<div> 아이콘 제작자 <a href="https://www.flaticon.com/kr/authors/mike-zuidgeest" title="Mike Zuidgeest"> Mike Zuidgeest </a> from <a href="https://www.flaticon.com/kr/" title="Flaticon">www.flaticon.com'</a></div>
</body>
</html>
