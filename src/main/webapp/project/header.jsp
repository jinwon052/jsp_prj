<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info=""%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:import url="http://192.168.10.72/jsp_prj/common/jsp/external_file.jsp" />

  <!-- 사용자 상태 표시 영역 -->
<div class="user-status-bar">
  <jsp:include page="userStatus.jsp"></jsp:include>
</div>
<link rel="stylesheet" href="http://192.168.10.72/jsp_prj/project/common.css">
<style>
  .header-nav-link {
  font-size: 20px;
  }
</style>
<!-- 헤더 네비게이션 -->
<div class="header">
  <nav class="header-nav">
    <ul class="header-nav-list">
      <li class="header-nav-item">
        <a href="#" class="header-nav-link">궁 안내</a>
        <ul class="header-submenu">
          <li><a href="#">경복궁</a></li>
          <li><a href="#">경희궁</a></li>
          <li><a href="#">창덕궁</a></li>
          <li><a href="#">창경궁</a></li>
          <li><a href="#">덕수궁</a></li>
        </ul>
      </li>
      <li class="header-nav-item">
        <a href="#" class="header-nav-link">행사 안내</a>
        <ul class="header-submenu">
          <li><a href="#">행사 안내</a></li>
          <li><a href="#">행사 모아보기</a></li>
          <li><a href="#">행사 조회/취소</a></li>
        </ul>
      </li>
      <li class="header-nav-item">
       <a href="http://192.168.10.72/jsp_prj/project/mainpage.jsp"> <img src="http://192.168.10.72/jsp_prj/common/images/icon.png" alt="로고"></a>
      </li>
      <li class="header-nav-item">
        <a href="http://localhost/jsp_prj/project/course_rule.jsp" class="header-nav-link">관람 안내</a>
        <ul class="header-submenu">
          <li><a href="http://localhost/jsp_prj/project/course/course_rule.jsp">관람 규칙</a></li>
          <li><a href="http://localhost/jsp_prj/project/course/course_time.jsp">관람 시간</a></li>
          <li><a href="http://localhost/jsp_prj/project/course/course.jsp">관람 코스</a></li>
          <li><a href="http://localhost/jsp_prj/project/course/users_course.jsp">사용자 추천 코스</a></li>
        </ul>
      </li>
      <li class="header-nav-item">
        <a href="#" class="header-nav-link">고객센터</a>
        <ul class="header-submenu">
          <li><a href="#">공지사항</a></li>
          <li><a href="#">자주 묻는 질문</a></li>
          <li><a href="#">1:1 문의</a></li>
        </ul>
      </li>
    </ul>
  </nav>
</div>

