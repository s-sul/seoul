<%@ page contentType="text/html; charset=UTF-8" %>
 
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<title></title> 
 
<link href="../css/style.css" rel="Stylesheet" type="text/css">
 
</head> 
<body>
<DIV class='title' style='margin: 10px auto; width: 50%; font-weight: bold; text-decoration: underline;'>자격증 안내</DIV>
  <DIV style='margin: 0px auto; width: 80%;'> 
 
    <UL>
      <LI>빅데이터분석 기사</LI>       <!-- 2020 국가기술 예정 -->  
      <LI>정보처리 관련 자격</LI>      <!-- 국가기술 -->
      <LI>SQL 개발자</LI>                <!-- 국가공인 -->
      <LI>리눅스 마스터</LI>             <!-- 국가공인 -->
    </UL>
  </DIV>
  <br>
  <DIV style='text-align: right; padding-right: 10px;'>
    <form name='frm' method='post' action='./notice_cookie.jsp'>
      <label>
        <input type='checkbox' name='windowOpenCheck' onclick="this.form.submit()">
        30초간 창 열지 않기
      </label>
    </form>
  </DIV>
</body>
</html> 
  