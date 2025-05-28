<%@page import="java.io.IOException"%>
<%@page import="org.jdom2.JDOMException"%>
<%@page import="java.util.List"%>
<%@page import="org.jdom2.Element"%>
<%@page import="java.net.URL"%>
<%@page import="org.jdom2.Document"%>
<%@page import="org.jdom2.input.SAXBuilder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info=""%>
<%@ include file="../common/jsp/site_config.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title><c:out value="${ site_name }"/></title>
<c:import url="${ url }/common/jsp/external_file.jsp"/>
<style type="text/css">
 #container{ min-height: 600px; margin-top: 30px; margin-left: 20px}
</style>
<script type="text/javascript">
$(function() {
	
});//ready


</script>
</head>
<body>
<header data-bs-theme="dark">
<c:import url="${ url }/common/jsp/header.jsp"/>
</header>
<main>
<div id="container">
<table class="table table-hover">
<thead>
<tr>
<th>부서번호</th>
<th>부서명</th>
<th>위치</th>
</tr>
</thead>
<tbody>
<%
//1.XML을  로딩할 수 있는 객체 생성
		SAXBuilder builder=new SAXBuilder();
		//2.XML에 접근하여 문서객체로 얻는다
		//Local
		try {
			//Local
			//Document doc=builder.build(new File("C:/dev/workspace/jsp_prj/src/main/webapp/xml0528/db_dept.xml"));
			//Web
			Document doc=builder.build(new URL("http://localhost/jsp_prj/xml0528/db_dept.xml"));
			//최상위 부모노드 얻기
			Element rootNode=doc.getRootElement();
			System.out.println(rootNode);
			//정보를 제공하는 특정자식노드 하나 얻기
			Element resultNode=rootNode.getChild("result");
			Boolean flag=Boolean.valueOf(resultNode.getText());//parsing
			Element pubDateNode=rootNode.getChild("pubDate");
			String pubDate=pubDateNode.getText();//parsing
			if(!flag){
			%>
			
			<tr>
			<td colspan="3">부서정보가 존재하지 않습니다.</td>
			</tr>
			
			<%
			}//end if
			out.println("<tr><td colspan='3'>데이터 생성일: "+pubDate+"</td></tr>");
			if( flag ) {//검색 결과가 있음
				//여러 자식 노드를 가진 반복되는 노드를 얻기
				List<Element> deptList=rootNode.getChildren("dept");
				Element deptnoNode=null;
				Element dnameNode=null;
				Element locNode=null;
				
				for( Element deptNode : deptList) {
					deptnoNode=deptNode.getChild("deptno");
					dnameNode=deptNode.getChild("dname");
					locNode=deptNode.getChild("loc");
				%>
				<tr>
				<td><%= deptnoNode.getText() %></td>
				<td><%= dnameNode.getText() %></td>
				<td><%= locNode.getText() %></td>
				</tr>
				<%
				}//end for
			}//end if
		} catch (JDOMException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}//end catch
%>
</tbody>
</table>
</div>
</main>
<footer class="text-body-secondary py-5">
<c:import url="${ url }/common/jsp/footer.jsp"/>

</footer>


</body>
</html>