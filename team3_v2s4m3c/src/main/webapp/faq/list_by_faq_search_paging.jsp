<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>FAQ 목록</title>
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

  <DIV class='title_line'>
    자주 묻는 질문
  </DIV>

  <form name='frm' id='frm' method='get' action='./list.do'>
      
    <ASIDE style='float: left;'>
      FAQ
      <c:choose>
        <c:when test="${param.word != ''}"> <%-- 검색하는 경우 --%>
          > '${param.word }' ${search_count } 건 검색됨.
        </c:when>
        <c:otherwise> <%-- 검색하지 않는 경우 --%>
          > ${search_count } 건 등록됨
        </c:otherwise>
      </c:choose>    
    </ASIDE>
    <ASIDE style='float: right;'>
      <A href="./create.do?faqno=${faqVO.faqno }">등록</A>
      <span class='top_menu_sep'>&nbsp;</span>    
      <A href="javascript:location.reload();">새로고침</A>
      
      <c:choose>
        <c:when test="${param.word != '' }"> <%-- 검색하는 경우 --%>
          <input type='text' name='word' id='word' value='${param.word }' 
                     style='width: 35%;'>
        </c:when>
        <c:otherwise> <%-- 검색하지 않는 경우 --%>
          <input type='text' name='word' id='word' value='' style='width: 35%;'>
        </c:otherwise>
      </c:choose>
      <button type='submit'>검색</button>
      <c:if test="${param.word.length() > 0 }">
        <button type='button' 
                     onclick="location.href='./list.do?word='">검색 취소</button>  
      </c:if>
      
    </ASIDE> 
    <DIV class='menu_line' style='clear: both;'></DIV>
  </form>
 
 
  <div style='width: 100%;'>
    <table class="table table-striped" style='width: 100%;'>
      <c:choose>
        <c:when test="${sessionScope.id_admin != null}">
          <colgroup>
            <col style='width: 10%;' />
            <col style="width: 15%;" />
            <col style='width: 55%;' />
            <col style='width: 20%;' />
          </colgroup>

          <thead>
            <TR>
              <th class="th_bs">번호</th>
              <th class="th_bs">구분</th>
              <th class="th_bs">제목</th>
              <th class="th_bs">기타</TH>
            </TR>
          </thead>

          <tbody>
            <c:forEach var="faqVO" items="${list }">
              <c:set var="faqno" value="${faqVO.faqno }" />

              <tr>
                <td class="td_bs">${faqVO.faqno}
                  [${faqVO.faq_seqno}]</td>
                <td class="td_bs">${faqVO.faq_division}</td>
                <td class="td_bs"><a
                  href="./read.do?faqno=${faqno}">${faqVO.faq_title}</a>
                </td>
                <td class="td_bs"><A
                  href="./update.do?faqno=${faqno }"><span
                    class="glyphicon glyphicon-pencil"></span></A> <A
                  href="./delete.do?faqno=${faqno }"><span
                    class="glyphicon glyphicon-trash"></span></A> <A
                  href="./update_seqno_up.do?faqno=${faqno }"><span
                    class="glyphicon glyphicon-arrow-up"></span></A> <A
                  href="./update_seqno_down.do?faqno=${faqno }"><span
                    class="glyphicon glyphicon-arrow-down"></span></A></td>
              </tr>
            </c:forEach>
          </tbody>
        </c:when>
        <c:otherwise>
          <colgroup>
            <col style="width: 15%;"></col>
            <col style="width: 20%;"></col>
            <col style="width: 65%;"></col>
          </colgroup>
          <%-- table 컬럼 --%>
          <thead>
            <tr>
              <th class="th_bs">번호</th>
              <th class="th_bs">구분</th>
              <th class="th_bs">제목</th>
            </tr>

          </thead>

          <%-- table 내용 --%>
          <tbody>
            <c:forEach var="faqVO" items="${list }">
              <c:set var="faqno" value="${faqVO.faqno }" />

              <tr>
                <td class="td_bs">${faqVO.faqno}</td>
                <td class="td_bs">${faqVO.faq_division}</td>
                <td class="td_bs"><a
                  href="./read.do?faqno=${faqno}">${faqVO.faq_title}</a>
                </td>
              </tr>
            </c:forEach>

          </tbody>
        </c:otherwise>
      </c:choose>  
               
    </table>
    <DIV class='bottom_menu'>${paging }</DIV>
    <br><br>
  </div>
 
<jsp:include page="/menu/bottom.jsp" flush='false' />
</body>
 
</html>
    
 