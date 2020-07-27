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
function payment_delete(payment_no){	   
	var confirm_val = confirm("렬루삭제?");

	if(confirm_val){
	  var mem_no = $('#mem_no').val();
	  var params ='mem_no='+mem_no+'&payment_no=' + payment_no ;
	  alert(params); 
	  
	  $.ajax({ 
	    url: './delete.do',
	    type: 'post',  //다른타입은 get
	    cache: false,  //응답결과를 브라우저에 임시저장하냐마냐 (취소 새로운값을 계속받을떈 취소함)
	    async: true, //true: 비동기통신
	    dataType: 'json', //응답형식: json, html, xml ...(응답많은순)
	    data: params, //데이터
	    success: function(data) { // 서버로부터 성공적으로 응답이 온경우
	      // var msg = "";
	      alert ('cnt:' + data.cnt); // 정상적 전달 확인
	      alert ('mem_no:' + data.mem_no); // 정상적 전달 확인
	     if (data.cnt > 0) {
	         alert("삭제?");
	       location.reload();

	      } else {
	        alert("삭제못함");
	      }
	    },
	    // Ajax 통신 에러, 응답 코드가 200이 아닌경우, dataType이 다른경우 
	    error: function(request, status, error) { // callback 함수
	      var msg = 'ERROR<br><br>';
	      msg += '<strong>request.status</strong><br>'+request.status + '<hr>';
	      msg += '<strong>error</strong><br>'+error + '<hr>';
	      console.log(msg);
	    }
	  });
	}else
		return false;
	}

    // 리뷰 작성 모달 review modal 
    $(document).ready(function(){
      $("#btn_payment_review").click(function(){
        $("#myModal").modal();
      });
    });
</script>

 

</head> 

<%-- 리뷰 작성 모달 --%>
<div class="container">

  <!-- Modal -->
  <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header" style="padding:35px 50px;">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4><span class="glyphicon glyphicon-lock"></span> Login</h4>
        </div>
        <div class="modal-body" style="padding:40px 50px;">
          <form role="form">
            <div class="form-group">
              <label for="usrname"><span class="glyphicon glyphicon-user"></span> Username</label>
              <input type="text" class="form-control" id="usrname" placeholder="Enter email">
            </div>
            <div class="form-group">
              <label for="psw"><span class="glyphicon glyphicon-eye-open"></span> Password</label>
              <input type="text" class="form-control" id="psw" placeholder="Enter password">
            </div>
            <div class="checkbox">
              <label><input type="checkbox" value="" checked>Remember me</label>
            </div>
              <button type="submit" class="btn btn-success btn-block"><span class="glyphicon glyphicon-off"></span> Login</button>
          </form>
        </div>
        <div class="modal-footer">
          <button type="submit" class="btn btn-danger btn-default pull-left" data-dismiss="modal"><span class="glyphicon glyphicon-remove"></span> Cancel</button>
          <p>Not a member? <a href="#">Sign Up</a></p>
          <p>Forgot <a href="#">Password?</a></p>
        </div>
      </div>
    </div>
  </div> 
</div>
 
<body>
<jsp:include page="/menu/top.jsp" flush='false' />
    <DIV class='menu_line' style='clear: both;'></DIV>
  <div class='menu_line'></div>
  
  <br>
  <br>
<c:import url="../mem_wish/list_index_left.do" />
<DIV class="col-sm-9 col-md-10 cont">  <!-- 내용 출력 컬럼 --> 
 
<form name='frm' id='frm'>
  <input type='hidden' name='mem_no' id='mem_no' value='${sessionScope.mem_no }'>
  <input type='hidden' name='payment_no' id='payment_no' value='${payment_no }'>
   <c:choose>
      <c:when test="${search_count == 0 }">
        결제내역이 없습니다.!
      </c:when>
      <c:otherwise> 
        <div style='width: 100%; margin-top:50px;' >
          <table class="table table-striped" style='width: 100%;'>
            <colgroup>
              <col style="width: 5%;"></col>
              <col style="width: 15%;"></col>
              <col style="width: 10%;"></col>
              <col style="width: 20%;"></col>
              <col style="width: 20%;"></col>
              <col style="width: 50%;"></col>
            </colgroup>
            <%-- table 컬럼 --%>
            <thead>
              <tr>
                <th style='text-align: center;'>번호</th>
                <th style='text-align: center;'>상품</th>
                <th style='text-align: center;'>총액</th>
                <th style='text-align: center;'>결제방법</th>
                <th style='text-align: center;'>결제일</th>
                <th style='text-align: center;'></th>
              </tr>
            </thead>
            
            <%-- table 내용 --%>
            <tbody>
              <c:forEach var="paymentVO" items="${list }">
                <c:set var="payment_no" value="${paymentVO.payment_no }" />
                <c:set var="at_price" value="${paymentVO.at_price }" />
                <c:set var="at_name" value="${paymentVO.at_name }" />
                <c:set var="at_no" value="${paymentVO.at_no }" />
                <c:set var="payment_total" value="${paymentVO.payment_total }" />
                <c:set var="payment_way" value="${paymentVO.payment_way }" />
                <c:set var="payment_date" value="${paymentVO.payment_date }" />
                <c:set var="cart_cnt" value="${paymentVO.cart_cnt }" />
                <c:set var="mem_no" value="${memVO.mem_no }" />
                <tr> 
                
                 <td style='text-align: center;'> 
                    ${payment_no } 
                 </td>
                 <td style='text-align: center;'>
                  <a href="../at/read.do?at_no=${at_no }">
                   ${at_name} 
                  </a> 
                 </td>
                 <td style='text-align: center;'>${payment_total} </td>
                 <td style='text-align: center;'>${payment_way }</td>
                 <td style='text-align: center;'>${payment_date}</td>
                 <td  style='text-align: center;'>
                   <button type="button" id='btn_payment_delete_${payment_no }' name='btn_payment_delete_${payment_no }'  class="btn btn-info"
                                  onclick="payment_delete(${payment_no})">삭제</button>
                   <button type="button" id='btn_payment_read_${payment_no }' name='btn_payment_read_${payment_no }'  class="btn btn-info"
                                  onclick="location.href='./read.do?payment_no=${payment_no }'">상세 내역</button>
                                  
                   <c:choose>
                    <c:when test="">
                    
                    </c:when>
                    <c:otherwise>
                    
                    </c:otherwise>
                   
                   </c:choose>
                   
<%--                    <button type="button" id='btn_payment_review_${payment_no }' name='btn_payment_review_${payment_no }'  class="btn btn-info">
 --%>                   <button type="button" id='btn_payment_review' name='btn_payment_review'  class="btn btn-info">
                    리뷰 쓰기
                   </button>
                   
                 </td>
                </tr>
              </c:forEach>
            </tbody>
          </table>
         </div>
        </c:otherwise>
      </c:choose>
  </form>
  </DIV>
  <div style='margin-bottom:50px;'>${paging }</div>
  
  <br>
  <br>
  <br>
  <br>
  <br>
  <br>
  <br>
  <br>
<jsp:include page="/menu/bottom.jsp" flush='false' />
</body>
</html> 