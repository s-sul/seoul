<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
 
<style type="text/css">
* {box-sizing: border-box}
body {font-family: "Lato", sans-serif;}

/* Style the tab */
.tab {
  float: center;
  margin-left: 40px;
  border: 1px solid #ccc;
  background-color: #f1f1f1;
  width: 80%;
  height: 300px;
}

/* Style the buttons inside the tab */
.tab button {
  display: block;
  background-color: inherit;
  color: black;
  padding: 22px 16px;
  width: 100%;
  border: none;
  outline: none;
  text-align: center;
  cursor: pointer;
  transition: 0.3s;
  font-size: 17px;
}

/* Change background color of buttons on hover */
.tab button:hover {
  background-color: #ddd;
}

/* Create an active/current "tab button" class */
.tab button.active {
  background-color: #ccc;
}


</style>
 
 
    <DIV class="col-md-2"> <!-- 메뉴 출력 컬럼-->
                  <UL class='categrp_cate_list_left' >
      	        <c:choose>
      	          <c:when test="${mem_pic_th != null }">
      	            <IMG src="${root}/team3/mem/storage/${mem_pic_th }" class="img-circle" alt="Cinque Terre"
      	                    style = 'padding : 0px auto;'> 
      	          </c:when>
      	          <c:otherwise>
      	            <IMG src="./images/profpic.png" width="180px;" height="180px;"> 
      	          </c:otherwise>
      	        </c:choose> 
      	        <br>
      	        <br>
      		       [ ${mem_nick} ] 님
                  </UL>
      
              <div class="tab" >
        		  <button class="tablinks" onclick="location.href='/team3/payment/list.do?mem_no=${sessionScope.mem_no}'">내 구매</button>
        		  <button class="tablinks" onclick="location.href='/team3/mem_wish/list_search_paging.do?mem_no=${sessionScope.mem_no}'">내 위시</button>
        		  <button class="tablinks" onclick="location.href='/team3/review/list_by_mem_no.do?mem_no=${sessionScope.mem_no}'">내 리뷰</button>
        		  <button class="tablinks" onclick="location.href='/team3/inquire/list.do?mem_no=${sessionScope.mem_no}'">내 문의</button>
        		  <button class="tablinks" onclick="location.href='/team3/mem/read.do?mem_no=${sessionScope.mem_no}'">내 계정</button>
        	  </div>
    
   </DIV>
   