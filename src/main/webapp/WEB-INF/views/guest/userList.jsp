<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:url var="R" value="/" />
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <link rel="stylesheet" href="${R}res/common.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <style>
    .search{
        margin-top : 20px;
        margin-bottom : 10px;
        text-align : right;
      }
      .page{
      	text-align : center;
      }
    </style>

    <script src="${R}res/common.js"></script>
</head>
<body>
  <nav class="navbar navbar-default navbar-fixed-top">
    <div class="navbar-header">
      <a class="navbar-brand" href="${R}guest/index"><img src="${R}img/title.png"/></a>
    </div>
    <div class="container-fluid">
      <ul class="nav navbar-nav">
        <li><a href="${R}guest/index"><i class="glyphicon glyphicon-home"></i> 홈</a></li>
        <li class="active"><a href="${R}guest/userList"><i class="glyphicon glyphicon-list-alt"></i> 회원 목록 보기</a></li>
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
   		<h1><strong>회원 목록 검색</strong></h1>
   		<hr/>
   		<div class="search">
          <form:form method="get" modelAttribute="pagination" class="form-inline">
          	<form:select path="ob" class="form-control autosubmit" itemValue="value" itemLabel="label" items="${ orderBy }"/>
          	<form:select path="sb" class="form-control" itemValue="value" itemLabel="label" items="${ searchBy }"/>
            <form:input path="st" class="form-control" placeholder="검색할 문자열" />
            <button type="submit" class="btn btn-primary"><i class="glyphicon glyphicon-search"> 검색하기</i></button>
            <c:if test="${ pagination.sb > 0 || pagination.ob > 0}">
		      <a class="btn btn-default" href="userList?&pg=1">
		        <i class="glyphicon glyphicon-ban-circle"></i> 검색취소</a>
		    </c:if>      
          </form:form>
       	</div>
	   <table class="table table-bordered">
	        <thead>
	          <tr class="info">
	            <th><center>학번</center></th>
	            <th><center>학과</center></th>
	            <th><center>이름</center></th>
	            <th><center>학년</center></th>
	            <th><center>회원 종류</center></th>
	            <th style="width: 100px"><center>삭제</center></th>
	            
	          </tr>
	        </thead>
	        <tbody>
	        	<c:forEach var="user" items="${users }">
	        		<tr data-url="userView?id=${ user.id }&${pagination.queryString}">
	        			<td><center>${ user.studentNumber }</center></td>
	        			<td><center>${ user.departmentName }</center></td>
	        			<td><center>${ user.studentName}</center></td>
	        			<td><center>${ user.grade }</td>
	        			<td><center>${ user.userType }</center></td> 	       	 
	        			<td>
	        			      		      <c:if test="${ user.id > 0 }">
      <a href="delete.do?id=${ user.id }" class="btn btn-danger" data-confirm-delete>
          <center>  <i class="glyphicon glyphicon-remove"></i> 삭제  </center></a>
      </c:if>
	        			</td>     			
	        		</tr>
	        		

  
	        	</c:forEach>
	        </tbody>
	     </table>
	     <div class="page">
          	<my:pagination pageSize="${ pagination.sz }" recordCount="${ pagination.recordCount }" />
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
