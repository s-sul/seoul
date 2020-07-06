<%@ page contentType="text/html; charset=UTF-8" %>
 
<%
String windowOpen = "open";

Cookie[] cookies = request.getCookies();
Cookie cookie = null;

if (cookies != null) {
  for (int index=0; index < cookies.length; index++) {
    cookie = cookies[index];  // 쿠키 목록에서 쿠키 추출
    if (cookie.getName().equals("windowOpen")) { // 이름 비교
      windowOpen = cookie.getValue();  // 쿠키 값
    }
  }
}
%>
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<title></title> 
 
<link href="../css/style.css" rel="Stylesheet" type="text/css">
 
<script type="text/javascript">
//jsp와 javascript 연동
window.onload = function() {
  if ('<%=windowOpen %>' == 'open') { 
    openNotice();  
  }  
}

function openNotice(){
  var url = './notice.jsp';
  var win = window.open(url, '공지 사항', 'width=380px, height=400px');
  
  var x = (screen.width - 380) / 2;
  var y = (screen.height - 400) / 2;
  
  win.moveTo(x, y); // 화면 이동
}

</script>
</head> 
 
 
<body>
 
  2019 자격증 취득 안내<br><br>
  2019년 새해를 맞아 자격증 취득을 추천합니다.<br><br>
  【<A href='javascript: openNotice();'>자격증 취득 정보 조회</A>】
 
</body>
 
 
</html>