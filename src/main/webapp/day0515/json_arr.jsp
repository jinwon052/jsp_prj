<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.json.simple.JSONArray"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info=""
    trimDirectiveWhitespaces="true"%><%
    String name="이장훈";
    int age=25;
    String name2="주현석";
    int age2=26;
    
    //1.JSONArray 생성) [ ]
    JSONArray jsonArr=new JSONArray();//List
    JSONObject jsonObj=new JSONObject();
    //2.data를 사용하여 JSONObject 생성
    jsonObj.put("name",name);
    jsonObj.put("age",age);
    JSONObject jsonObj2=new JSONObject();
    jsonObj2.put("name",name2);
    jsonObj2.put("age",age2);
    //3.JSONObject를 JSONArray 배치
    jsonArr.add(jsonObj);
    jsonArr.add(jsonObj2);
    //4.JSONArray값을 출력
    String strJSON=jsonArr.toJSONString();
    %><%= strJSON %>
