<%@ page contentType="text/html; charset=UTF-8" %>
 
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<title></title> 
<link href="../css/style.css" rel="Stylesheet" type="text/css">
</head> 
 
<body>
 
<DIV class='title_line'>쿠키 기록</DIV>
<%
Cookie ck_email = new Cookie("email", "user1@gmail.com");
ck_email.setMaxAge(30); // 30초
response.addCookie(ck_email); 
%>
쿠키를 기록 했습니다. <br><br>
【<A href='./read.jsp'>쿠키 읽기</A> 】
  
</body>
 
</html>