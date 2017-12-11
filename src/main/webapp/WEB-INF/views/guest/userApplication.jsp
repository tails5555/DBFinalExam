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
    <script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
	<script type="text/javascript" src="${R}res/jquery.validate.min.js"></script>
	<script type="text/javascript" src="${R}res/additional-methods.min.js"></script>
	<script type="text/javascript" src="${R}res/messages_ko.js"></script>
    <c:if test="${ param.fileError eq true }">
	<script>
		alert('현재 올린 파일에 문제가 있습니다. 다시 한번 확인하시길 바랍니다.');
		document.location.replace('/DBFinalExam/guest/userApplication');      
	</script>
	</c:if>
	   <c:if test="${ param.nonUnique eq true }">
	<script>
		alert('이미 등록된 학생이 엑셀에 있습니다. 엑셀 파일을 다시 확인하시길 바랍니다.');
		document.location.replace('/DBFinalExam/guest/userApplication');
	</script>
	</c:if>
</head>
<body>
  <nav class="navbar navbar-default navbar-fixed-top">
    <div class="navbar-header">
      <a class="navbar-brand" href="${R}guest/index"><img src="${R}img/title.png"/></a>
    </div>
    <div class="container-fluid">
      <ul class="nav navbar-nav">
        <li><a href="${R}guest/index"><i class="glyphicon glyphicon-home"></i> 홈</a></li>
        <li><a href="${R}guest/userList"><i class="glyphicon glyphicon-list-alt"></i> 회원 목록 보기</a></li>
        <li class="active"><a href="${R}guest/userApplication"><i class="glyphicon glyphicon-plus"></i> 학생 등록</a></li>
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
   		<h1><strong>학생 등록</strong></h1>
   		<hr/>
   		<div class="form-group floating-label-form-group controls">
	     <form method="post" enctype="multipart/form-data" action="${R}guest/excelUpload">
	  	  <input type="file" name="uploadFile"/><br/>
	  	  <button type="submit" class="btn btn-primary">등록하기</button>
	     </form>
	     <script>
	    	$(function(){
	    		$("form").validate({
	    			submitHandler: function() {
	                    var f = confirm("학생들을 등록하겠습니까?");
	                    if(f){
	                        return true;
	                    } else {
	                        return false;
	                    }
	                },
	    			rules :{
	    				uploadFile : {
	    					required : true,
	    					extension : 'xlsx'
	    				}	
	    			},
	    			messages : {
	    				uploadFile : {
	                    	required : "엑셀 파일을 올려주세요.",
	                    	extension : "엑셀 파일만 업로드 가능합니다."
	                    }
	    			}
	    		})
	    	})
	    </script>
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
