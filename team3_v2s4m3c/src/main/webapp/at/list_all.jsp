<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport"
  content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" />
<title>Resort world</title>

<link href="../css/style.css" rel="Stylesheet" type="text/css">

<script
  src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<link rel="stylesheet"
  href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet"
  href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap-theme.min.css">
<script
  src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>


</head>


<body>
  <jsp:include page="/menu/top.jsp" />

  <DIV class='title_line'>전체 상품 조회<br> 
  </DIV>


  <TABLE class='table table-striped'>
    <!-- TABLE 전체에 bootstrap 적용 -->
    <colgroup>
      <col style='width: 10%;' />
      <col style='width: 10%;' />
      <col style='width: 40%;' />
      <col style='width: 10%;' />
      <col style='width: 5%;' />
      <col style='width: 5%;' />
      <col style='width: 10%;' />
      <col style='width: 10%;' />
    </colgroup>

    <thead>
      <TR>
        <TH class="th_bs">상품카테고리</TH>
        <TH class="th_bs">상품번호</TH>
        <TH class="th_bs">상품명</TH>
        <TH class="th_bs">출력모드</TH>
        <TH class="th_bs">수정</TH>
        <TH class="th_bs">삭제</TH>


      </TR>
    </thead>

    <tbody>

      <c:forEach var="at_all" items="${at_all }">
        

        <tr>

          <td class="td_bs">${at_all.at_grp_name}</td>
          <td class="td_bs">${at_all.at_no}</td>
           <td class="td_bs"><a href="${root }/at/read.do?at_grp_no=${at_all.at_grp_no }&at_no=${at_all.at_no }">${at_all.at_name}</a></td>
           
           
           
           
          <td class="td_bs">
          <c:choose>
              <c:when test="${at_all.at_visible =='Y'}">
                <a
                  href="./update_visible.do?at_no=${at_all.at_no }&at_visible=${at_all.at_visible}"><img
                  src='${root}/menu/images/visible_Y.png'></a>
              </c:when>

              <c:otherwise>
                <a
                  href="./update_visible.do?at_no=${at_all.at_no  }&at_visible=${at_all.at_visible}"><img
                  src='${root}/menu/images/visible_N.png'></a>
              </c:otherwise>
            </c:choose></td>
        
          <td class="td_bs"><a
            href="./update.do?at_no=${at_all.at_no }"><img
              src='${root}/menu/images/update.png' style="width: 20px;"></a></td>
              
           <td class="td_bs"><a
            href="./delete.do?at_no=${at_all.at_no }"><img
              src='${root}/menu/images/delete.png' style="width: 20px;"></a></td>


        </tr>
      </c:forEach>

    </tbody>

  </TABLE>
  <DIV class='bottom_menu'>${paging }</DIV>

  <jsp:include page="/menu/bottom.jsp" />
</body>

</html>