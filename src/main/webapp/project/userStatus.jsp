<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%
  String loginUser = (String) session.getAttribute("loginUser");
%>
<div class="header">
<div class="user-status-bar">
  <% if (loginUser != null) { %>
    <div class="user-status-logged-in">
      <span class="user-name"><strong><%= loginUser %></strong>님</span>
      <a href="#"><img src="http://192.168.10.72/jsp_prj/common/images/user_profile.png">
      <strong>  마이페이지</strong></a>
      <a href="#"><img src="http://192.168.10.72/jsp_prj/common/images/logout.png">
      <strong>  로그아웃</strong></a>
    </div> 
  <% } else { %>
    <div class="user-status-guest">
      <a href="http://192.168.10.72/jsp_prj/project/sign_up.jsp"><img src="http://192.168.10.72/jsp_prj/common/images/user_profile.png">
      <strong>  회원가입</strong></a>
      <a href="http://192.168.10.72/jsp_prj/project/login.jsp"><span class="login-icon"><i class="fa fa-user"></i></span>
      <img src="http://192.168.10.72/jsp_prj/common/images/login.png"><strong>  로그인</strong></a>
      
    </div>
  <% } %>
</div>
</div>
