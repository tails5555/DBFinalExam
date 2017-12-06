<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:url var="R" value="/" />
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
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
        <li><a href="${R}user/index"><i class="glyphicon glyphicon-home"></i> 홈</a></li>
        <li class="active"><a href="${R}user/mentoApplication"><i class="glyphicon glyphicon-education"></i> 멘토 신청</a></li>
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
   	<h1 class="my-4"><strong>멘토 신청</strong></h1>
      <hr/>
      <sec:authorize access="hasAnyRole({'ROLE_MENTO', 'ROLE_MENTI'})">
		<div class="panel panel-warning">
		  <div class="panel-heading">
    		<h3 class="panel-title">멘토와 멘티는 신청이 불가능합니다.</h3>
  		  </div>
	      <div class="panel-body">
			 멘토 신청은 한 번만 가능합니다. 다음에 시도해주세요.
		  </div>
		</div>
       </sec:authorize>
       <sec:authorize access="hasRole('ROLE_STUDENT')">
       <form:form method="post" modelAttribute="mento">
           <div class="row">
             <div class="col-md-2">
               <label>이름</label>
             </div>
             <div class="col-md-8">
               <sec:authentication property="user.userName"/>
             </div>
           </div>
	       <br/><br/>
	       <div class="row">
	         <div class="col-md-2">
	           <label>멘토링 교과목(주제)</label>
	         </div>
	         <div class="col-md-8">
	         	<form:input path="subject" placeholder="멘토링 할 과목을 입력하세요" class="form-control w300"/>
	         </div>
           </div>
           <br/><br/>
           <div class="row">
             <div class="col-md-2">
               <label>팀 이름</label>
             </div>
             <div class="col-md-8">
             	<form:input path="teamName" placeholder="적당한 팀 이름을 입력하세요" class="form-control w300"/>
             </div>
           </div>
           <br/><br/>
           <div class="row">
             <label>주제 소개(팀 광고)</label>
           </div>
           <div class="row">
             <div class="col-md-12">
            	<form:textarea path="advertiseContext" placeholder="멘토링에 대한 팀 광고를 입력하세요" class="form-control w400"/>
             </div>
           </div>
           <br/><br/>
           <div class="row">
             <div class="col-md-2">
               <label>자격 증명</label>
             </div>
             <div class="col-md-8">
             	<form:input path="qualificContext" placeholder="자격 증명할 사항에 대해 입력하세요" class="form-control w300"/>
             </div>
           </div>
	    <div style="margin-top: 40px">
	    <h3>멘토 신청하시려면 밑에 신청 버튼을 눌러 주세요.</h3>
	    <button id="btn_ok" type="submit" class="btn btn-primary" data-confirm-insert>신청</button>
	    <script>
		$(document).ready( function(){
		    $("#btn_ok").click( function() {
		        if(confirm("추가를 하면 수정이 불가능합니다. 계속 하시겠습니까??")) {
		            $(this).parent().click();
		        } else {
		            return false;
		        }
		    });
		});
		</script>
	   </div>
   	 </form:form>
   	</sec:authorize>
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
