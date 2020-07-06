<%@ page contentType="text/html; charset=UTF-8" %>
 
<% 
request.setCharacterEncoding("utf-8"); 
String root = request.getContextPath();
%>
 
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title></title>
<link href="<%=root%>/css/style.css" rel="Stylesheet" type="text/css">
</head>
<body>

<DIV class='title_line'>쿠키 읽기</DIV>

<%
Cookie[] cookies = request.getCookies();
Cookie cookie = null;
String email = "";

if (cookies != null) { 
  for (int index=0; index < cookies.length; index++) {
    cookie = cookies[index];  // 쿠키 목록에서 쿠키 추출
    if (cookie.getName().equals("email")) { // 이름 비교, 이름이 일치하는 쿠키를 가져옴
      email = cookie.getValue();  // 쿠키 값
    }
  }
}
out.println("Email: " + email);
%>

<br><br>
【<A href='./write.jsp'>쿠키 기록</A> 】
【<A href='./read.jsp'>쿠키 읽기</A> 】
【<A href='./delete.jsp'>쿠키 삭제</A> 】  
 
</body>
</html>