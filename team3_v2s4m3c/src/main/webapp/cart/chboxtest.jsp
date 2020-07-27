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
<link rel="stylesheet" href="../css/style_con.css">
<!-- <link rel="stylesheet" href="css/responsive.css"> -->

 <script type="text/javascript">

 function itemSum(frm)
 {
    var sum = 0;
    var count = frm.chkbox.length;
    for(var i=0; i < count; i++ ){
        if( frm.chkbox[i].checked == true ){
 	    sum += parseInt(frm.chkbox[i].value);
        }
    }
    frm.total_sum.value = sum;
 }

 </script>
</head> 

<body>
<jsp:include page="/menu/top.jsp" flush='false' />




<form name="form">
<table width="500" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="25">&nbsp;<input name="chkbox" type="checkbox" value="1000" onClick="itemSum(this.form);">&nbsp;1000원</td>
  </tr>
  <tr>
    <td height="25">&nbsp;<input name="chkbox" type="checkbox" value="2000" onClick="itemSum(this.form);">&nbsp;2000원</td>
  </tr>
  <tr>
    <td height="25">&nbsp;<input name="chkbox" type="checkbox" value="3000" onClick="itemSum(this.form);">&nbsp;3000원</td>
  </tr>
  <tr>
    <td height="25">&nbsp;<input name="chkbox" type="checkbox" value="4000" onClick="itemSum(this.form);">&nbsp;4000원</td>
  </tr>
  <tr>
    <td height="25">&nbsp;<input name="chkbox" type="checkbox" value="5000" onClick="itemSum(this.form);">&nbsp;5000원</td>
  </tr>
  <tr>
    <td height="25">&nbsp;합계:&nbsp;<input name="total_sum" type="text" size="20" readonly></td>
  </tr>
</table>
</form>





<jsp:include page="/menu/bottom.jsp" flush='false' />
</body>
</html>