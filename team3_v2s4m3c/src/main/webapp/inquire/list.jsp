<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>1:1문의 목록</title>
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- <link rel="manifest" href="site.webmanifest"> -->
<link rel="shortcut icon" type="image/x-icon" href="../img/favicon.png">
<!-- Place favicon.ico in the root directory -->

<!-- CSS here -->
<link rel="stylesheet" href="../css/bootstrap.min.css">
<link rel="stylesheet" href="../css/owl.carousel.min.css">
<link rel="stylesheet" href="../css/magnific-popup.css">
<link rel="stylesheet" href="../css/font-awesome.min.css">
<link rel="stylesheet" href="../css/themify-icons.css">
<link rel="stylesheet" href="../css/nice-select.css">
<link rel="stylesheet" href="../css/flaticon.css">
<link rel="stylesheet" href="../css/jquery-ui.css">
<link rel="stylesheet" href="../css/gijgo.css">
<link rel="stylesheet" href="../css/animate.css">
<link rel="stylesheet" href="../css/slick.css">
<link rel="stylesheet" href="../css/slicknav.css">

<link href="../css/style.css" rel="Stylesheet" type="text/css">
<script type="text/JavaScript"
  src="http://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

</head>

<body>
  <jsp:include page="/menu/top.jsp" flush='false' />

  <DIV class='title_line'>1:1문의 목록</DIV>

  <c:choose>
    <c:when test="${sessionScope.mem_id != null || sessionScope.id_admin != null}">
      <ASIDE style='float: left;'>전체 보기</ASIDE>
      <ASIDE style='float: right;'>
        <A href="./create.do">등록</A>
        <span class='menu_divide'>│</span>
        <A href="javascript:location.reload();">새로고침</A>
      </ASIDE>
      <DIV class='menu_line' style='clear: both;'></DIV>
    </c:when>
    <c:otherwise>
      <!--  <span class='menu_divide' >│</span> -->
    </c:otherwise>
  </c:choose>
    
    <!-- FK mem_no 지정 -->
    <input type='hidden' name='mem_no' id='mem_no' value='1'>
      
  <div style='width: 100%;'>
    <table class="table table-striped" style='width: 100%;'>
      <!-- 로그인 한 경우 -->  
      <c:choose>
        <c:when test="${sessionScope.mem_id != null || sessionScope.id_admin != null}">
          <colgroup>
            <col style='width: 10%;' />
            <col style="width: 50%;" />
            <col style='width: 15%;' />
            <col style='width: 15%;' />
            <col style='width: 10%;' />
          </colgroup>

          <thead>
            <TR>
              <th class="th_bs">번호</th>             
              <th class="th_bs">제목</th>
              <th class="th_bs">등록자</th>
              <th class="th_bs">등록일</th>
              <th class="th_bs">기타</TH>
            </TR>
          </thead>

          <tbody>
            <c:forEach var="inquireVO" items="${list }">
              <c:set var="inquireno" value="${inquireVO.inquireno }" />

              <tr>
                <td class="td_bs">${inquireVO.inquireno}</td>
                <td class="td_bs"><a href="./read.do?inquireno=${inquireno}">${inquireVO.inquire_title}</a>
                </td>
                <td class="td_bs">${inquireVO.inquire_rname}</td>
                <td class="td_bs">${inquireVO.inquire_rdate.substring(0, 10)}</td>
                <td class="td_bs"><A
                  href="./update.do?inquireno=${inquireno }"><span
                    class="glyphicon glyphicon-pencil"></span></A> <A
                  href="./delete.do?inquireno=${inquireno }"><span
                    class="glyphicon glyphicon-trash"></span></A></td>
              </tr>
            </c:forEach>
          </tbody>
        </c:when>
        <c:otherwise>
          <DIV class='message'>
            <fieldset class='fieldset_basic'>
              <LI class='li_none'>
                <span class='span_fail'>로그인이 필요합니다.</span>
              </LI>
            </fieldset>
          </DIV>          
        </c:otherwise>
      </c:choose>
    </table>

    <br>
    <br>
  </div>

  <jsp:include page="/menu/bottom.jsp" flush='false' />
</body>

</html>

