<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:url var="R" value="/" />
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
     <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <script src="${R}res/common.js"></script>
    
    <style>
    .search{
        margin-top : 20px;
        margin-bottom : 10px;
        text-align : right;
      }
      .page{
      	text-align : center;
      }
      .userEntity{
	      padding-left : 5px;
	      padding-right : 5px;
	      padding-top : 5px;
	      padding-bottom : 5px;
	      border : 1px solid #A4A4A4;
	      background-color : #D8D8D8;
	      font-weight : bold;
	      text-align : center;
	  }
	  .userValue{
	      padding-left : 5px;
	      padding-right : 5px;
	      padding-top : 5px;
	      padding-bottom : 5px;
	  }
    </style>
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
   	<h1><strong>회원 목록 검색</strong> - 회원 정보</h1>
   	<hr/>
   	<div class="row">
		<div class="col-md-12">
          <!-- Introduction Row -->
		  <table class="table table-bordered">
            <tr>
              <td rowspan="5">
                <center><img class="img-thumbnail img-responsive" src="${R}img/mento_photo.jpg" width="200" height="200"/></center>
              </td>
              <td class="userEntity">학번(교번, 직번)</td>
              <td class="userValue">${ user.studentNumber }</td>
            	<td class="userEntity">이름</td>
              <td class="userValue">${ user.studentName }</td>
            </tr>
            <tr>
              <td class="userEntity">학과</td>
              <td class="userValue">${ user.departmentName }</td>
            	<td class="userEntity">이메일</td>
              <td class="userValue">${ user.email }</td>
            </tr>
            <tr>
              <td class="userEntity">핸드폰</td>
              <td class="userValue">${ user.phoneNumber}</td>
              <td class="userEntity">회원 유형</td>
              <td class="userValue">${ user.userType }</td>
            </tr>
          </table>
   	  </div>
   	  
 
<form:form method="post" modelAttribute="user">  
    <div class="form-group">
      <label>학번:</label>
      <form:input path="studentNumber" class="form-control w200" />
    </div>
    <div class="form-group">
      <label>이름:</label>
      <form:input path="studentName" class="form-control w200" />
    </div>
    <div class="form-group">
      <label>학과</label>
      <form:select path="departmentId" class="form-control w200"
                   itemValue="id" itemLabel="departmentName" items="${ departments }" />
    </div>
    <div class="form-group">
      <label>학년:</label>
      <form:input path="grade" class="form-control w200" />
    </div>
      <div class="form-group">
      <label>핸드폰:</label>
      <form:input path="phoneNumber" class="form-control w200" />
    </div>
      <div class="form-group">
      <label>이메일:</label>
      <form:input path="email" class="form-control w200" />
    </div>
    <hr />
    <div>
      <button type="submit" class="btn btn-primary">
        <span class="glyphicon glyphicon-ok"></span> 저장</button>

  
   

        <br/>
		
   	  
   	  <hr/>
   	  
   	  
   	  
   	  <a href="${R}guest/userList?${pagination.queryString}"><button type="button" class="btn btn-primary"><i class="glyphicon glyphicon-th-list"></i> 회원 목록으로</button></a>

            <c:if test="${ student.id > 0 }">
        <a href="delete.do?id=${ student.id }" class="btn btn-danger" data-confirm-delete>
          <i class="glyphicon glyphicon-remove"></i> 삭제</a>
      </c:if>
</form:form>
   </div>
  	
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
