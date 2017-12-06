<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:url var="R" value="/" />
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
  <nav class="navbar navbar-default navbar-fixed-top">
    <div class="navbar-header">
      <a class="navbar-brand" href="${R}user/index"><img src="${R}img/title.png"/></a>
    </div>
    <div class="container-fluid">
      <ul class="nav navbar-nav">
        <li class="active"><a href="${R}user/index"><i class="glyphicon glyphicon-home"></i> 홈</a></li>
        <li><a href="${R}user/mentoApplication"><i class="glyphicon glyphicon-education"></i> 멘토 신청</a></li>
      </ul>
      <ul class="nav navbar-nav navbar-right">
      	<li style="text-align : right;"><sec:authentication property="user.userName"/><br/><b><sec:authentication property="user.userType"/></b>님 환영합니다.</li>
      	<li><a href="${R}user/logout_processing"><i class="glyphicon glyphicon-remove-sign"> 로그아웃</i></a></li>
      </ul>
    </div>
   </nav>
   <div>
      <img src="${R}img/topimage.jpg" class="img-responsive"/>
   </div>
   <br/>
   <div class="container">
   	<h1 class="my-4"><strong>멘토링 목록</strong></h1>
      <hr/>
      <table class="table table-bordered">
        <thead>
          <tr class="warning">
            <th><center>팀 이름</center></th>
            <th><center>멘토 이름</center></th>
            <th><center>과목</center></th>
            <th><center>등록 날짜</center></th>
          </tr>
        </thead>
        <tbody>
        	<c:forEach var="mento" items="${mentos }">
        		<tr>
        			<td><center>${ mento.teamName }</center></td>
        			<td><center>${ mento.mentoName }</center></td>
        			<td><center>${ mento.subject }</center></td>
        			<td><center><fmt:formatDate value="${mento.applicationDate}" pattern="yyyy-MM-dd"/></center></td>
        		</tr>
        	</c:forEach>
        </tbody>
      </table>
   </div>
   <div class="row">
   	<hr/>
   	<div class="col-md-3" align="center">
       <img src="${R}img/skhuniv.jpg"/>
     </div>
    <div class="col-md-9">
      <p>08359 서울시 구로구 연동로 320 / 지하철 1, 7호선 온수역(성공회대입구역)</p>
      <p><i class="glyphicon glyphicon-earphone"></i> TEL : 02-2610-4114 &nbsp;&nbsp;|&nbsp;&nbsp; <i class="glyphicon glyphicon-print"></i> FAX : 02-2683-8858</p>
    </div>
  </div>
</body>
</html>
