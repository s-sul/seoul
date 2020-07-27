<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>서울여행</title>
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- <link rel="manifest" href="site.webmanifest"> -->
<link rel="shortcut icon" type="image/x-icon" href="../img/favicon.png">
<!-- Place favicon.ico in the root directory -->
<script type="text/JavaScript"
          src="http://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
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

<link rel="stylesheet" href="../css/style.css">
<!-- <link rel="stylesheet" href="css/responsive.css"> -->

 <script type="text/javascript">
 
 </script>
</head> 

<body>
<jsp:include page="/menu/top.jsp" flush='false' />

  <DIV style='width: 90%;' >
    <FORM name='frm'  id='frm' method='POST' action='./delete.do'  >

      
      <input type='hidden' name='mem_no' id='mem_no'  value='1'>
      <input type='hidden' name='payment_no' id='payment_no'  value='${param.payment_no }'>
      
    
      
  <div style='width: 100%; margin-top:50px;' >
  
  <h2 style='margin-left:40px;'>구매 정보 </h2>
  <hr>
  
    <table style='width: 80%;'>
      <colgroup>
        <col style="width: 20%;"></col>
        <col style="width: 80%;"></col>
      </colgroup>
      <%-- table 컬럼 --%>
      
       <%-- <c:forEach var="paymentVO" items="${list }"> --%>
      
        <tr>
          <th style='text-align: right; font-size:16px; padding-right:10px;'>이름</th>
          <td style='text-align:left; padding-left:15px;'>
          ${memVO.mem_name }
         </td>   
        </tr>
        
        <tr>
          <th style='text-align: right; font-size:16px;'>전화번호</th>
          <td style='text-align:left; padding-left:15px;'>
         ${memVO.mem_tel }
          </td>
        </tr>      

   <%-- </c:forEach>      --%>
    </table>
    
    <!--dd  -->
    <h2 style='margin-left:40px; margin-top:60px;'>결제 정보</h2>
  <hr>
  
    <table style='width: 80%;'>
      <colgroup>
        <col style="width: 20%;"></col>
        <col style="width: 80%;"></col>
      </colgroup>
      <%-- table 컬럼 --%>

        
        <tr>
          <th style='text-align: right; font-size:16px;'>총결제금액</th>
          <td style='text-align:left; padding-left:15px;'>
         ${paymentVO.payment_total } 원
          </td>
        </tr>      
        
            <tr>
          <th style='text-align: right; font-size:16px;'>결제 수단</th>
          <td style='text-align:left; padding-left:15px;'>
         ${paymentVO.payment_way }
          </td>
        </tr>   
        
        
        
            <tr>
          <th style='text-align: right; font-size:16px;'>구매일자</th>
          <td style='text-align:left; padding-left:15px;'>
         ${paymentVO.payment_date }
          </td>
        </tr>   
        
    </table>
    
    
        
    </table>
      
     
 
  </div>     
     

    </FORM>
  </DIV>
      
        

  












<jsp:include page="/menu/bottom.jsp" flush='false' />
</body>
</html>