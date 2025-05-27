<%@page import="kr.co.sist.member.login.LoginDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info=""
    trimDirectiveWhitespaces="true"%><%
    //세션에 존재하는 값 얻기
    //String name=(String)session.getAttribute("name");
    LoginDTO lDTO=(LoginDTO)session.getAttribute("userData");
    if(lDTO == null){
    	//세션에 값이 없다면 페이지를 이동
    	response.sendRedirect("http://192.168.10.73/jsp_prj/index.html");
    	return;
    }
    %>
