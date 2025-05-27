<%@page import="kr.co.sist.board.BoardUtil"%>
<%@page import="kr.co.sist.board.PaginationDTO"%>
<%@page import="kr.co.sist.board.BoardDTO"%>
<%@page import="java.util.List"%>
<%@page import="kr.co.sist.board.BoardService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info=""%>
<%@ include file="../common/jsp/site_config.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="../common/jsp/login_chk.jsp" %>

<jsp:useBean id="rDTO" class="kr.co.sist.board.RangeDTO" scope="page"/>
<jsp:setProperty name="rDTO" property="*"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${ site_name }</title>
<c:import url="${url}/common/jsp/external_file.jsp"/>

<style type="text/css">
 #container{ min-height: 600px; margin-top: 30px; margin-left: 20px}
 a{text-decoration: none; color: #333}
 a:hover{ color: #5A90D0}
 .pagiPrevMark{color: #FF0000}
 .pagiCurrent{font-weight: bold; font-size: 20px}
 .pagiNotCurrent{font-weight: normal; }
 .pagiNextMark{color: #FF0000;}
</style>

<script type="text/javascript">
$(function(){
	$("#btnSearch").click(function(){
		var keyword=$("#keyword").val();
		if(keyword == ""){
			alert("검색 키워드는 필수 입력")
			return;
		}
		$("#searchFrm").submit();
	});//click
});//ready


</script>
</head>
<body>
<header data-bs-theme="dark">
<c:import url="${ url }/common/jsp/header.jsp"/>
</header>
<main>
<div id="container">
<div style="width: 1200px">
<h3>자유게시판</h3>
<div id= "boardWrap" style="margin: 0px auto; width: 1200px; height: 540px">
<%
BoardService bs = new BoardService();
int totalCount=0;//총 게시물의 수
totalCount =bs.totalCount(rDTO);

int pageScale=0;// 한 화면에 보여줄 게시물의 수
pageScale= bs.pageScale();

int totalPage=0;// 총 페이지의 수
totalPage= bs.totalPage(totalCount, pageScale);

//int totalPage=(int)Math.ceil((double)totalCount/pageScale);// 1,2,3,4,5
//int totalPage=totalCount/pageScale;// 1,2,3,4,5
//0,1,2,3,4,5,6,7,8,9
//if(totalCount%pageScale != 0){//
//	totalPage++;//나머지가 존재 (16 / 10 = 1 + 1(나머지 6개의 글을 보여주기 위한 페이지))2장으로 보이게
//}//end else
	
//String tempPage=request.getParameter("currentPage");

//System.out.println(rDTO.getCurrentPage());
int startNum =1;;//시작번호
startNum = bs. startNum(pageScale, rDTO);
	
int endNum=0;
endNum =bs.endNum(pageScale, rDTO);

List<BoardDTO> boardList = bs.searchBoard(rDTO);

pageContext.setAttribute("totalCount", totalCount);
pageContext.setAttribute("pageScale", pageScale);
pageContext.setAttribute("totalPage", totalPage);
pageContext.setAttribute("startNum", rDTO.getStartNum());
pageContext.setAttribute("endNum", rDTO.getEndNum());
pageContext.setAttribute("fieldText", rDTO.getFieldText());
pageContext.setAttribute("boardList", boardList);

session.setAttribute("cntFlag", true);

%>
전체 <c:out value="${ totalPage }"/>페이지에서 <br>
현재 <c:out value="${ rDTO.currentPage }"/>페이지
<%-- 총게시물의 수 : ${ totalCount }<br>
한 화면에 보여줄 게시물의 수 : ${ pageScale }<br>
총 페이지 수 : ${ totalPage }<br>
시작 번호 : ${ startNum }<br>
끝 번호 : ${ endNum }<br> --%>

<div style="text-align: right;">
<a href="write_frm.jsp" class="btn btn-info btn-sm">글 작성</a>
</div>

<table class="table table-hover">

<thead>
<tr style="text-align: center;">
<th style="width:80px">번호</th>
<th style="width:650px">제목</th>
<th style="width:120px">작성자</th>
<th style="width:250px">작성일</th>
<th style="width:100px">조회수</th>
</tr>
</thead>
<tbody>
<c:if test="${empty boardList }">
<tr>
<td colspan="5" style="text-align: center;">게시물이 없습니다. <br>
<img src="../login/images/login_fail.jpg" style="width: 60px"></td>
</tr>
</c:if>
<%
StringBuilder searchQueryString=new StringBuilder();
if(rDTO.getKeyword() != null && !rDTO.getKeyword().isEmpty()){
	searchQueryString.append("&field=").append(rDTO.getField())
	.append("&keyword=").append(rDTO.getKeyword())
	;
}//end if

pageContext.setAttribute("queryStr", searchQueryString);
%>
<c:forEach var="bDTO" items="${ boardList }" varStatus="i">
<tr>
<td><c:out value="${ totalCount-(rDTO.currentPage-1)*pageScale-i.index }"/></td>
<td><a href ="board_detail.jsp?num=${ bDTO.num }&currentPage=${ rDTO.currentPage }${ queryStr }"><c:out value="${ bDTO.subject }"/></a></td>
<td><c:out value="${ bDTO.id }"/></td>
<td><fmt:formatDate value="${ bDTO.input_date }" 
pattern="yyyy-MM-dd a HH:mm:ss"/></td>
<td><c:out value="${ bDTO.cnt }"/></td>
</tr>
</c:forEach>
</tbody>
</table>
</div>

<div id = "searchDiv" style="text-align: center;">
<form action="board_list.jsp" method="get" id ="searchFrm">
<select name="field" id="field">
<c:forEach var="field" items="${ fieldText }" varStatus="i">
<option value="${ i.index }"><c:out value="${ field }"/></option>
</c:forEach>
</select>
<input type="text" name="keyword" id="keyword"/>
<input type="text" style="display: none;"/>
<input type="button" value="검색" id="btnSearch" class= "btn btn-success btn-sm"/>
</form>
</div>

<div id="paginationDiv" style="text-align: center;">
<br>
<%
PaginationDTO pDTO=new PaginationDTO(3, rDTO.getCurrentPage(),
		totalPage,"board_list.jsp",rDTO.getField(),rDTO.getKeyword());
%>
<%= BoardUtil.pagination(pDTO) %>
</div>

</div>
</div>
</main>

<footer class="text-body-secondary py-5">
<c:import url="${ url }/common/jsp/footer.jsp"/>
  
</footer>

</body>
</html>