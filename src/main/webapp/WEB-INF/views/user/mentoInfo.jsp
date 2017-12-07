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
    <style>
    td.entity{
        background-color : #E0F8F1;
        padding-left : 8px;
        padding-right : 8px;
        padding-top : 8px;
        padding-bottom : 8px;
        text-align : center;
    }
    td.context{
        padding-left : 8px;
        padding-right : 8px;
        padding-top : 8px;
        padding-bottom : 8px;
        text-align : left;
    }
    .buttonList{
    	text-align : right;
    }
    </style>
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
   	<h1 class="my-4"><strong>멘토링 목록</strong> - 멘토 소개</h1>
    <hr/>
    <div class="row">
      <div class="col-md-4 col-sm-6 text-center mb-4">
        <img class="rounded-circle img-fluid d-block mx-auto" 
        src="${R}img/mento_photo.jpg" alt="" width="200" height="200">
        <h3>${mento.mentoName}
          <small>${mento.departmentName }</small>
        </h3>
        <p>${mento.advertiseContext }</p>
      </div>
      <div class="col-md-8">
        <table class="table-bordered" width="100%">
          <tr>
            <td class="entity">멘토링 주제</td>
            <td colspan="4" class="context">${mento.subject }</td>
          </tr>
          <tr>
            <td class="entity">전화번호</td>
            <td colspan="4" class="context">${mento.phoneNumber }</td>
          </tr>
          <tr>
            <td class="entity">이메일</td>
            <td colspan="4" class="context">${mento.email }</td>
          </tr>
          <tr>
            <td class="entity">멘토링 자격 증명</td>
            <td colspan="4" class="context">${mento.qualificContext }</td>
          </tr>
          <c:if test="${ mentis.size() ne 0 }">
          <tr>
            <td colspan="5" class="entity">
            	  멘티 목록
            </td>
          </tr>
          <tr>
            <td class="entity">학번</td>
            <td class="entity">학년</td>
            <td class="entity">이름</td>
            <td class="entity">이메일</td>
			<td class="entity">전화번호</td>
          </tr>
          <c:forEach var="menti" items="${ mentis }">
          <tr>
          	<td class="context">${ menti.studentNumber }</td>
            <td class="context">${ menti.grade }</td>
            <td class="context">${ menti.studentName }</td>
            <td class="context">${ menti.email }</td>
			<td class="context">${ menti.phoneNumber }</td>
		  </tr>
          </c:forEach>
          </c:if>
        </table>
        <hr/>
        <div class="buttonList">
        	<c:if test="${ mentoBoolean eq true }">
        		<button type="button" class="btn btn-info"><i class="glyphicon glyphicon-education"></i> 이미 멘토입니다.</button>
        	</c:if>
        	<c:if test="${ mentoBoolean eq false and mentiBoolean eq false }">
        		<a href="mentiApplication?id=${ mento.id }" data-confirm-menti-application><button type="button" class="btn btn-info"><i class="glyphicon glyphicon-plus"></i> 멘티 신청</button></a>
        	</c:if>
        	<c:if test="${ mentoBoolean eq false and mentiBoolean eq true }">
        		<a href="mentiCancel?id=${ mento.id }" data-confirm-menti-cancel><button type="button" class="btn btn-danger"><i class="glyphicon glyphicon-remove"></i> 멘티 취소</button></a>
        	</c:if>
        	<a href="index"><button type="button" class="btn btn-success"><i class="glyphicon glyphicon-home"></i> 홈으로</button></a>
        	<script>
        	  $("[data-confirm-menti-application]").click(function() {
        	    return confirm("멘티 신청을 합니다. 계속 하시겠습니까?");
        	  })
        	  $("[data-confirm-menti-cancel]").click(function() {
			    return confirm("멘티 취소를 합니다. 계속 하시겠습니까?");
			  })
        	</script>
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
