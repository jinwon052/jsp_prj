<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info=""
    trimDirectiveWhitespaces="true"%><%
    String method=request.getMethod();
    
    if(!"POST".equals(method.toUpperCase())){
    	System.out.println("method----"+method);
    	response.sendRedirect("http://192.168.10.73/jsp_prj/index.html");
    	return;
    }//end if
    %>
