<%@page import="day0512.ProductService"%>
<%@page import="day0512.ProductDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info=""%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:import url="http://192.168.10.73/jsp_prj/common/jsp/external_file.jsp"/>
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
<c:import url="http://192.168.10.73/jsp_prj/common/jsp/header.jsp"/>
</header>
<main>
<div id="container">

<%
ProductService ps=new ProductService();

pageContext.setAttribute("data", ps.searchPrd());
%>
<c:if test="${ empty data }">
	<h2>상품 정보가 존재하지 않습니다.</h2>
	<img src="http://192.168.10.73/jsp_prj/common/images/img_5.jpg"/>
</c:if>

<c:if test="${ not empty data }">
	<h2>상품</h2>
	<c:forEach var="prd" items="${ data }">
	<div class="card" style="width: 18rem;">
  <img src="http://192.168.10.73/jsp_prj/common/images/${ prd.img }" class="card-img-top" >
  <div class="card-body">
    <h5 class="card-title"><c:out value="${ prd.prd }"/></h5>
    <p class="card-text"><c:out value="${ prd.code }"/></p>
    <p class="card-text"><fmt:formatDate value="${ prd.date }" pattern="MM-dd-yyyy a HH:mm"/></p>
    <a href="#void" class="btn btn-primary"><fmt:formatNumber value="${ prd.price }" pattern="#,###"/>원 </a>
  </div>
</div>
  </c:forEach>
</c:if>

</div>
</main>
<footer class="text-body-secondary py-5">
<c:import url="http://192.168.10.73/jsp_prj/common/jsp/footer.jsp"/>

</footer>


</body>
</html>