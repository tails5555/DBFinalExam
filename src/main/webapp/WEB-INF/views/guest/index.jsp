<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:url var="R" value="/" />
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
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
      <a class="navbar-brand" href="${R}guest/index"><img src="${R}img/title.png"/></a>
    </div>
    <div class="container-fluid">
      <ul class="nav navbar-nav">
        <li class="active"><a href="${R}guest/index"><i class="glyphicon glyphicon-home"></i> 홈</a></li>
        <li><a href="${R}guest/userList"><i class="glyphicon glyphicon-list-alt"></i> 회원 목록 보기</a></li>
        <li><a href="${R}guest/userApplication"><i class="glyphicon glyphicon-plus"></i> 학생 등록</a></li>
      </ul>
      <ul class="nav navbar-nav navbar-right">
        <li><a href="${R}guest/login"><i class="glyphicon glyphicon-user"> 로그인</i></a></li>
      </ul>
    </div>
   </nav>
   <div>
      <img src="${R}img/topimage.jpg" class="img-responsive"/>
   </div>
   <br/>
   <div class="container">
   	<h1><strong>데이터베이스 캡스톤 디자인 기말고사 구현01</strong></h1>
   	<hr/>
   	<div class="row">
   		<div class="panel panel-success">
		  <div class="panel-heading">
		    <h3 class="panel-title">멘토링의 정보를 보고 싶으면 로그인을 해주시길 바랍니다.</h3>
		  </div>
		  <div class="panel-body">
		   로그인 이후에 진행이 가능합니다.
		  </div>
		</div>
   	</div>
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
