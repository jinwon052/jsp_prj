<%@page import="org.json.simple.JSONObject"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info=""
    trimDirectiveWhitespaces="true"%><%
    String name="이장훈";
    int age=25;
    
    //1.JSONObject 생성: Map 기반
    JSONObject json=new JSONObject();
    //2.값 할당
    json.put("name",name);
    json.put("age",age);
    //3.값을 가진 JSONObject 객체를 String로 얻는다
    String jsonStr=json.toJSONString();
%><%= jsonStr %>