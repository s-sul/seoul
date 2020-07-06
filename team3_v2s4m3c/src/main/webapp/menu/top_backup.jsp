<%@ page contentType="text/html; charset=UTF-8" %>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath}" /> 

<meta charset="UTF-8">
<meta name="viewport"
  content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" />
<link href="../css/style.css" rel="Stylesheet" >

<script
  src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<link rel="stylesheet"
  href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet"
  href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap-theme.min.css">
<script
  src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

  
<DIV class='container-fluid'  style="width:95%; margin-bottom:100px;">

      <!-- 상단메뉴 -->
<nav class="navbar-default navbar-fixed-top"  >
  <div class="container-fluid">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>                        
      </button>
      <a class="navbar-brand" href="${root }">서율서율</a>
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav">
        <li><a href="${root }"><span class="glyphicon glyphicon-home"></span></a></li>
        <li class="dropdown">
          <a class="dropdown-toggle" data-toggle="dropdown" href='${root }/at_grp/list.do'>상품<span class="caret"></span></a>
          <ul class="dropdown-menu">
          
    <c:forEach var="at_grp_VO" items="${list }">
        <c:set var="at_grp_no" value="${at_grp_VO.at_grp_no }" />
            <c:choose>
            <c:when test="${at_grp_VO.at_grp_visible =='Y' }">   
           <li><a href="../at/list.do?at_grp_no=${at_grp_no }">${at_grp_VO.at_grp_name }</a></li>
            </c:when> 
            </c:choose>     
    </c:forEach>
    
          </ul>
        </li>
        <li><a href="#">설문조사</a></li>
        
         <li class="dropdown">
          <a class="dropdown-toggle" data-toggle="dropdown" href="${root}/cart/at_cart_mem_list.do?mem_no=1">장바구니 <span class="caret"></span></a>
          <ul class="dropdown-menu">
            <li><a href="${root}/cart/create.do">등록</a></li>
            <li><a href="${root}/cart/at_cart_mem_list.do?mem_no=1">목록</a></li>
            <li><a href="#">수정</a></li>
            <li><a href="#">삭제</a></li>
          </ul>
        </li>
        
        <li class="dropdown">
          <a class="dropdown-toggle" data-toggle="dropdown" href="#">고객센터 <span class="caret"></span></a>
          <ul class="dropdown-menu">
            <li><a href="#">1:1문의</a></li>
            <li><a href="#">자주묻는질문</a></li>
          </ul>
        </li>
       
      </ul>
      <ul class="nav navbar-nav navbar-right">
         <a href="${root}/mem/create.do"  style="text-decoration:none;">
         <span class="glyphicon glyphicon-user" style="font-size:14px; margin-top:16px; ">회원가입</a> / </span>
          <span class="glyphicon glyphicon-log-in"  style="font-size:14px; margin-top:16px; margin-right:10px;"> 로그인</span>
      </ul>
    </div>
  </div>
</nav>
</DIV>
