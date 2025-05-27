<%@page import="java.time.LocalDate"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info=""%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>달력</title>

<!-- favicon 설정 -->
<link rel="shortcut icon" href="http://192.168.10.73/jsp_prj/common/images/favicon.ico"/>
<!--  bootstrap CDN -->
<link rel="stylesheet" type="text/css"
href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.5/dist/css/bootstrap.min.css">
 <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@docsearch/css@3">
 <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>

<style type="text/css">
 #container{ min-height: 600px; margin-top: 30px; margin-left: 20px}
 #sat{co}
 #sun{}
</style>
<!-- jquery CDN -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script> 
<script type="text/javascript">
$(function() {
	
});//ready

function submit(obj){
	obj.submit();
}


</script>
</head>
<body>
<header data-bs-theme="dark">
  <div class="collapse text-bg-dark" id="navbarHeader">
    <div class="container">
      <div class="row">
        <div class="col-sm-8 col-md-7 py-4">
          <h4>템플릿</h4>
          <p class="text-body-secondary">모름.</p>
        </div>
        <div class="col-sm-4 offset-md-1 py-4">
          <h4>Contact</h4>
          <ul class="list-unstyled">
            <li><a href="https://google.com" class="text-white">구글에서 찾기</a></li>
            <li><a href="https://chatgpt.com/" class="text-white">지피티 찾기</a></li>
          </ul>
        </div>
      </div>
    </div>
  </div>
  <div class="navbar navbar-dark bg-dark shadow-sm">
    <div class="container">
      <a href="index.jsp" class="navbar-brand d-flex align-items-center">
        <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" aria-hidden="true" class="me-2" viewBox="0 0 24 24"><path d="M23 19a2 2 0 0 1-2 2H3a2 2 0 0 1-2-2V8a2 2 0 0 1 2-2h4l2-3h6l2 3h4a2 2 0 0 1 2 2z"/><circle cx="12" cy="13" r="4"/></svg>
        <strong>템플릿</strong>
      </a>
      <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarHeader" aria-controls="navbarHeader" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
    </div>
  </div>
</header>
<main>
<div id="container">
<%
	String sYear  = request.getParameter("year");	
	String sMonth = request.getParameter("month");

	LocalDate ld=LocalDate.now();//현재 시간 얻기
	int nowYear=ld.getYear();
	int nowMonth=ld.getMonthValue();
	
	int selectYear = nowYear;
	int selectMonth = nowMonth;
	
	if (sYear != null || sMonth != null)
	{
		selectYear = Integer.parseInt(sYear);
		selectMonth = Integer.parseInt(sMonth);
		
	}//end if
	
	
	String yOptions = ""; // 셀렉트 박스 년도 옵션
	for (int year=(selectYear-10); year<=(selectYear+10); year++)
	{	
		if (sYear==null && year == nowYear)
			yOptions += "<option value ='" + year + "' selected='selected'>" + year +"</option>";
		else if (sYear!=null && Integer.parseInt(sYear)==year)
		{
			yOptions += "<option value ='" + year + "' selected='selected'>" + year +"</option>";
		}
		else
		{
			yOptions += "<option value ='" + year + "'>" + year +"</option>";
		}

	}
	
	String mOptions = ""; // 셀렉트 박스 월 옵션 
	for (int month=1; month<=12; month++)
	{
		if (sMonth == null && month == nowMonth) //선택한 날짜가 없을 때 현재 월을 selected 되도록 한다. 
		{
			mOptions += "<option value ='" + month + "' selected='selected'>" + month +"</option>";
			
		}
		else if (sMonth != null && month==Integer.parseInt(sMonth)) //선택한 월이 있을 때는 그 월을 seleceted 되도록 한다.
		{
			mOptions += "<option value ='" + month + "' selected='selected'>" + month +"</option>";
		}
		else // 나머지 월의 경우라면 selected 되지 않도록 한다. 
		{
			
			mOptions += "<option value ='" + month + "'>" + month +"</option>";
		}	

	}
	
int [] months = {31,28,31,30,31,30,31,31,30,31,30,31};
	
	if (selectYear%4==0 && selectYear%100!=0 || selectYear%400==0) // 윤년일 때는 2월이 29일 이다.
	{
		months[1] = 29;
	}
	
	
	// 총 일 수를 누적시킬 값
	int day;
	
	
	// 요일 항목 배열 구성
	String[] weekName = {"일요일", "월요일", "화요일", "수요일", "목요일", "금요일", "토요일"};
	
	day = (selectYear-1)*365 + (selectYear-1)/4 - (selectYear-1)/100 + (selectYear-1)/400; 
	
	for (int i= 0; i<selectMonth-1; i++)
	{
		day += months[i];
	}
	
	day ++;
	
	int week = day%7; /*1은 월요일 0은 일요일  */	
	int lastDay = months[selectMonth-1]; 
	
	String calStr = "";
	calStr += "<table border='1'>";
	calStr += "<tr>";
	
	for (int i=0; i<weekName.length; i++)
	{
		if (i==0) //일요일
		{
			calStr += "<th style='color:red;'>" + weekName[i] + "</th>";
			
		}
		else if (i==6) //토요일
		{
			calStr += "<th style='color:blue;'>" + weekName[i] +  "</th>";
					
		}
		else // 나머지 요일
		{
			calStr += "<th>" + weekName[i] + "</th>";
		}
		
	}
	
	calStr += "</tr>";
	calStr += "<tr>";
	
	
	// 칸을 하나씩 더해줄때마다 하나씩 늘려줄 변수
	int count=0;
	// 맨 처음 공백 채우기 
	for(int i=0;i<week;i++)
	{
		calStr += "<th></th>";
		count++;
	}
	
	// 1일부터 마지막날까지 채우기
	for(int i=1; i<= lastDay; i++)
	{
		calStr += "<th>"+ i + "</th>";
		count++;
		if (count%7==0 && i != lastDay)
		{
			calStr +="</tr><tr>";
			count=0;
		}
	}
	
	
 	//빈 공백 채우기
	while (count<7) 
	{
		calStr += "<td>*</td>";
		count++;
		
		
	}
	calStr += "</table>";
	
	
%>
<h1>원하는 년도와 달을 선택하세요! </h1>
	<hr>
<form action="" method="post">
<select id="year" name="year" onchange="submit(this.form)">
<option value="none">---선택---</option>
	<% 
		String selected="";
		for(int tempYear=nowYear+25; tempYear > 1999; tempYear--){
		
		selected="";
		if(tempYear == nowYear){
			selected=" selected='selected'";
		}
		
		%>
		<option value="<%= tempYear %>"<%=selected %>><%= tempYear %></option>
		<% }//end for %>
		
	</select>년

	<select id="month" name="month" onchange="sumbit(this.form)">
	<option value="none">---선택---</option>
	<% 

	for(int month=1; month < 13 ; month++){ 
		
		selected="";
		if(month==nowMonth){
			selected=" selected='selected'";
		}
	%>
		<option value="<%=month %>"<%=selected %>><%= month %> </option>
	<%} //end for %>

</select>월
<br>
<br>
<br>
<div id="calendarWrap">
	<div id="calendarHeadar">
	
	<% 
	if (sYear ==null){
		sYear=Integer.toString(nowYear);
	}
	if (sMonth ==null){
		sMonth=Integer.toString(nowMonth);
	}
	
	%>
	선택된 날짜: <%=sYear %>년<%=sMonth %>월
	
	</div>
	
	<div id="calendarContainer">
	<%=calStr %>
	
	</div>

</div>



</div>

</main>
<footer class="text-body-secondary py-5">
  <div class="container">
    <p class="float-end mb-1">
      <a href="#">Back to top</a>
    </p>
    <p class="mb-1"><strong style="font-size: 18px">2강의실</strong> 서울특별시 강남구 테헤란로 132(역삼동) 한독약품빌딩 8층 쌍용교육센터 <strong>Tel_02-3482-4632~5</strong> </p>
  </div>
</footer>


</body>
</html>