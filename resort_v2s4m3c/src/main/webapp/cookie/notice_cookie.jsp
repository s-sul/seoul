<%@ page contentType="text/html; charset=UTF-8" %>
 
<%
Cookie cookie = new Cookie("windowOpen", "close"); // 이름, 값
//windowOpen의 close 값을 30초 동안만 쿠키에 저장
cookie.setMaxAge(30); // 30초
response.addCookie(cookie);
%>
 
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<title></title> 
</head> 
<body>

<script type="text/javascript">
  window.close();
</script>
 
</body>
 
</html>