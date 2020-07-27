<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
<link rel="shortcut icon" type="image/x-icon"  href="../../img/favicon.png">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<!-- <link rel="stylesheet" href="../css/rating.css" > -->
<!-- Place favicon.ico in the root directory -->

<style>
.checked {
  color: orange;
}
.star-rating {
  font-size: 0;
  white-space: nowrap;
  display: inline-block;
  height: 50px;
  overflow: hidden;
  position: relative;
  background: url('data:image/svg+xml;base64,PHN2ZyB2ZXJzaW9uPSIxLjEiIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyIgeG1sbnM6eGxpbms9Imh0dHA6Ly93d3cudzMub3JnLzE5OTkveGxpbmsiIHg9IjBweCIgeT0iMHB4IiB3aWR0aD0iMjBweCIgaGVpZ2h0PSIyMHB4IiB2aWV3Qm94PSIwIDAgMjAgMjAiIGVuYWJsZS1iYWNrZ3JvdW5kPSJuZXcgMCAwIDIwIDIwIiB4bWw6c3BhY2U9InByZXNlcnZlIj48cG9seWdvbiBmaWxsPSIjREREREREIiBwb2ludHM9IjEwLDAgMTMuMDksNi41ODMgMjAsNy42MzkgMTUsMTIuNzY0IDE2LjE4LDIwIDEwLDE2LjU4MyAzLjgyLDIwIDUsMTIuNzY0IDAsNy42MzkgNi45MSw2LjU4MyAiLz48L3N2Zz4=');
  background-size: contain;
}
.star-rating i {
  opacity: 0;
  position: absolute;
  left: 0;
  top: 0;
  height: 100%;
  z-index: 1;
  background: url('data:image/svg+xml;base64,PHN2ZyB2ZXJzaW9uPSIxLjEiIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyIgeG1sbnM6eGxpbms9Imh0dHA6Ly93d3cudzMub3JnLzE5OTkveGxpbmsiIHg9IjBweCIgeT0iMHB4IiB3aWR0aD0iMjBweCIgaGVpZ2h0PSIyMHB4IiB2aWV3Qm94PSIwIDAgMjAgMjAiIGVuYWJsZS1iYWNrZ3JvdW5kPSJuZXcgMCAwIDIwIDIwIiB4bWw6c3BhY2U9InByZXNlcnZlIj48cG9seWdvbiBmaWxsPSIjRkZERjg4IiBwb2ludHM9IjEwLDAgMTMuMDksNi41ODMgMjAsNy42MzkgMTUsMTIuNzY0IDE2LjE4LDIwIDEwLDE2LjU4MyAzLjgyLDIwIDUsMTIuNzY0IDAsNy42MzkgNi45MSw2LjU4MyAiLz48L3N2Zz4=');
  background-size: contain;
}
.star-rating input {
  -moz-appearance: none;
  -webkit-appearance: none;
  opacity: 0;
  display: inline-block;
  height: 100%;
  margin: 0;
  padding: 0;
  z-index: 2;
  position: relative;
}
.star-rating input:hover + i,
.star-rating input:checked + i {
  opacity: 1;
}
.star-rating i ~ i {
  width: 40%;
}
.star-rating i ~ i ~ i {
  width: 60%;
}
.star-rating i ~ i ~ i ~ i {
  width: 80%;
}
.star-rating i ~ i ~ i ~ i ~ i {
  width: 100%;
}

.star-rating.star-5 {width: 250px;}
.star-rating.star-5 input,
.star-rating.star-5 i {width: 20%;}
.star-rating.star-5 i ~ i {width: 40%;}
.star-rating.star-5 i ~ i ~ i {width: 60%;}
.star-rating.star-5 i ~ i ~ i ~ i {width: 80%;}
.star-rating.star-5 i ~ i ~ i ~ i ~i {width: 100%;}

.star-rating.star-3 {width: 150px;}
.star-rating.star-3 input,
.star-rating.star-3 i {width: 33.33%;}
.star-rating.star-3 i ~ i {width: 66.66%;}
.star-rating.star-3 i ~ i ~ i {width: 100%;}
::after,
::before {
  height: 100%;
  padding: 0;
  margin: 0;
  box-sizing: border-box;
  text-align: center;
  vertical-align: middle;
}


</style>

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
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<!-- Bootstrap -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<!-- Datepicker -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/css/bootstrap-datepicker3.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/css/bootstrap-datepicker3.standalone.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>


<script type="text/javascript">

  $(function() {

    list_by_at_no_join_add_view()  // 댓글 목록 (상품별) 출력

    if ('${sessionScope.mem_no}' != '') { // 로그인된 경우

      var frm_reply = $('#frm_reply');
      $('#review_word', review_frm).attr('placeholder', '댓글 작성');
    }
    
    $("#addBtn").on("click", list_by_at_no_join_add_view); // 더보기 페이징 
    $('#btn_send').on('click', send);
    $('#btn_wish').on('click', wish);
    $('#btn_img_dlt').on('click', img_dlt);
    
    $( '#fa fa-star' ).mouseenter( handlerIn ).mouseleave( handlerOut );
  });

  // ▼ 장바구니 담기
  function send() {
    var frm = $('#frm').serialize(); //At_Dates
    var dates_date = $('#dates_date').val();
    var params = frm + "&dates_date=" + dates_date;
    alert(params);
    $.ajax({
      type : "post",
      url : "../cart/create.do",
      cache : false,
      dataType : "json",
      async : false,
      data : params,
      success : function(rdata) {
        var msg = '';
        if (rdata.cnt >= 1) {
          msg = "예약 성공";
        } else if (rdata.no_book == 1) {
          msg = "예약 가능한 수량이 없습니다. 날짜와 수량을 다시 확인해 주세요.";
        }
        $('#modal_title').html('댓글 등록'); // 제목 
        $('#modal_content').html(msg);     // 내용
        $('#modal_panel_cart').modal();            // 다이얼로그 출력

      },
      error : function(request, status, error) { // callback 함수, 전형적인 에러함수
        var msg = 'ERROR<br><br>';
        msg += '<strong>request.status</strong><br>' + request.status + '<hr>';
        msg += '<strong>error</strong><br>' + error + '<hr>'; //에러메시지
        console.log(msg);
      }
    });
  }

  // ▼ 이미지 삭제
  function img_dlt() {
    var frm = $('#frm');
    var at_no = $('#at_no', frm).val();
    var param = "at_no=" + at_no;
    alert(at_no);
    $.ajax({
          type : "post",
          url : "../at_img/delete.do",
          cache : false,
          dataType : "json",
          async : false,
          data : param,
          success : function(rdata) {

            if (rdata.cnt >= 1) {
              alert("이미지 삭제 성공");
              location.href = "./read.do?at_grp_no=${at_VO.at_grp_no }&at_no=${at_VO.at_no }";
            } else {
              alert("이미지 삭제 실패");
            }

          },
          error : function(request, status, error) { // callback 함수, 전형적인 에러함수
            var msg = 'ERROR<br><br>';
            msg += '<strong>request.status</strong><br>' + request.status
                + '<hr>';
            msg += '<strong>error</strong><br>' + error + '<hr>'; //에러메시지
            console.log(msg);
          }
        });
  }

  
  // ▶ 위시리스트 등록
  function wish() {
    var frm = $('#frm');
    var at_no = $('#at_no', frm).val();
    var mem_no = ${sessionScope.mem_no};
    
    // alert('at_no: ' + $('#at_no', frm).val());
    // alert('mem_no: ' + ${sessionScope.mem_no});
    
    $.ajax({
          url : "../mem_wish/create.do",
          type : "post",
          cache : false,
          async : false,
          dataType : "json",
          data :{ 
            "at_no" : at_no,
            "mem_no" : mem_no
            },
          success : function(rdata) {
            if (rdata.cnt >= 1) {
              alert("위시리스트 등록 성공");
              location.href = "./read.do?at_grp_no=${at_VO.at_grp_no }&at_no=${at_VO.at_no }";
            } else {
               alert("등록 실패");
                /* 
                if (rdate.msg > 0) {
                alert("등록 실패2");
                alert ('이미 위시리스트에 저장되어 있습니다.');
                } 
                */
            }
          },
          error : function(request, status, error) { // callback 함수, 전형적인 에러함수
            var msg = 'ERROR<br><br>';
            msg += '<strong>request.status</strong><br>' + request.status + '<hr>';
            msg += '<strong>error</strong><br>' + error + '<hr>'; //에러메시지
            console.log(msg);
          }
        });
  }

  
  // ▶ at_no 별 댓글 목록 + 더보기 버튼 (페이징)
  function list_by_at_no_join_add_view(at_no) {
    
    var reviewPage = parseInt($("#review_list").attr("data-reviewPage")); // 현재 페이지 
    var params = 'at_no=' + ${at_VO.at_no } + "&reviewPage="+reviewPage;
    // alert('params: ' + params);

    $.ajax({
      url: "../review/list_by_at_no_join_add_view.do", // action 대상 주소
      type: "get",           // get, post
      cache: false,          // 브러우저의 캐시영역 사용안함.
      async: true,           // true: 비동기
      dataType: "json",   // 응답 형식: json, xml, html...
      data: params,        // 서버로 전달하는 데이터
      success: function(rdata) { // 서버로부터 성공적으로 응답이 온경우
        
        $("#review_list").attr("data-reviewPage", reviewPage+1);  // 개발자정의 속성 쓰기
        var msg = '';
        var rate = '';
        // $('#reply_list').html(''); // 패널 초기화, val(''): 안됨
        
        
        for (i=0; i < rdata.list.length; i++) {
          
          var row = rdata.list[i];
          row.review_rate = parseInt(row.review_rate);

          msg += "<DIV id='"+row.review_no+"' style='border-bottom: solid 1px #EEEEEE; margin-bottom: 10px;'>";
          msg += "<span style='font-weight: bold;'>" + row.mem_nick + "</span>";
          msg += "  " + row.rdate;
          if ('${sessionScope.mem_no}' == row.m_mem_no) { // 글쓴이 일치여부 확인
            msg += " <A href='javascript:review_delete("+row.review_no+")'>[x]</A>";
          }
          msg += "  " + "<br>";
          msg += row.review_word;
          msg += "  " + "<br>";
          for (j = 0; j<row.review_rate; j++) {
            msg += "<span class='fa fa-star checked'></span>";
          }
          for (j = 0; j<5-row.review_rate; j++) {
            msg += "<span class='fa fa-star'></span>";
          }
          msg += "  " + rate;
          
          /* msg += row.review_rate; */
          msg += "</DIV>";
        }
        // alert(msg);
        $('#review_list').append(msg);
      },
      // Ajax 통신 에러, 응답 코드가 200이 아닌경우, dataType이 다른경우 
      error: function(request, status, error) { // callback 함수
        var msg = 'ERROR request.status: '+request.status + '/ ' + error;
        console.log(msg);
      }
    });
  }

  // ▶ 리뷰 등록
  function review_create() {
    $('#modal_panel_close').focus();    // 모달 창 닫기
    
    var review_frm = $('#review_frm');
    var params = review_frm.serialize();
    
    var mem_no  = $('#mem_no', review_frm );
    var at_no  = $('#at_no', review_frm );
    
    if ($('#mem_no', review_frm).val().length == 0) {
      $('#modal_title').html('댓글 등록'); // 제목 
      $('#modal_content').html("로그인해야 등록 할 수 있습니다."); // 내용
      $('#modal_panel').modal();            // 다이얼로그 출력
      return;  // 실행 종료
    }
    
    // 영숫자, 한글, 공백, 특수문자: 글자수 1로 인식, 오라클은 1자가 3바이트임으로 300자로 제한
    // alert('내용 길이: ' + $('#review_word', review_frm).val().length);
    
    
    // 리뷰 내용 review_word는 300자 이내 
    if ($('#review_word', review_frm).val().length > 300) {
      $('#modal_title').html('댓글 등록'); // 제목 
      $('#modal_content').html("댓글 내용은 300자이상 입력 할 수 없습니다."); // 내용
      $('#modal_panel').modal();           // 다이얼로그 출력
      return;  // 실행 종료
    }

    // 리뷰 평점 review_rate의 범위는  0~5
    if ($('#review_rate', review_frm).val() < 0 ||  $('#review_rate', review_frm).val() >6) {
      return;
    }
    
    $.ajax({
      url: "../review/create.do", // action 대상 주소
      type: "post",          // get, post
      cache: false,          // 브러우저의 캐시영역 사용안함.
      async: true,           // true: 비동기
      dataType: "json",   // 응답 형식: json, xml, html...
      data: params,        // 서버로 전달하는 데이터
      success: function(rdata) { // 서버로부터 성공적으로 응답이 온경우

        var msg = ""; // 메시지 출력
        
        if (rdata.count > 0) {
          msg = "댓글을 등록했습니다";
          $('#modal_content').attr('class', 'alert alert-success'); // Bootstrap CSS 변경
          $('#modal_title').html('성공'); // 제목 
        } else {
          msg = "댓글 등록에 실패했습니다.";
          $('#modal_content').attr('class', 'alert alert-danger'); // CSS 변경
          $('#modal_title').html('실패'); // 제목 
        }
        $('#modal_content').html(msg);     // 내용
        $('#modal_panel_msg').modal();           // 다이얼로그 출력
      },
      // Ajax 통신 에러, 응답 코드가 200이 아닌경우, dataType이 다른경우 
      error: function(request, status, error) { // callback 함수
        var msg = 'ERROR request.status: '+request.status + '/ ' + error;
        console.log(msg); // Chrome에 출력
      }
    });
  }

  // ▶ 리뷰 삭제 비밀번호 입력 레이어 호출
  function review_delete(review_no) {
    alert('삭제 레이어 review_no: ' + review_no);
    var review_delete_frm = $('#review_delete_frm');
    $('#review_no', review_delete_frm).val(review_no); // 삭제할 댓글 번호 저장
    $('#modal_panel_delete').modal();               // 삭제폼 다이얼로그 출력
  }

  // ▶ 리뷰 삭제
  function review_delete_proc() {
    
    var params =$('#review_delete_frm').serialize();
    
    $.ajax({
      url: "../review/delete.do", 
      type: "post",          
      cache: false,          // 브러우저의 캐시영역 사용안함.
      async: true,           // true: 비동기
      dataType: "json",   
      data: params, 
      success: function(rdata) {
        var msg = ""; // 메시지 출력
        if (rdata.pw_cnt == 1) {
          if (rdata.delete_cnt == 1) { // 패스워드 일치, 삭제 성공
            $('#btn_review_delete_frm_close').trigger("click"); // 삭제폼 닫기, click 강제 발생 

            msg = "리뷰를 삭제했습니다";
            $('#modal_content').attr('class', 'alert alert-success'); // Bootstrap CSS 변경
            $('#modal_title').html('성공'); // 제목 
            
          } else {  // 패스워드 일치, 삭제 실패
            $('#btn_review_delete_frm_close').trigger("click"); // 삭제폼 닫기, click 강제 발생 
            
            msg = "리뷰 삭제에 실패했습니다.";
            $('#modal_content').attr('class', 'alert alert-danger'); // CSS 변경
            $('#modal_title').html('실패'); // 제목 
          }
        } else {
          $('#btn_review_delete_frm_close').trigger("click"); // 삭제폼 닫기, click 강제 발생 
          
          msg = "패스워드가 일치하지 않습니다.";
          $('#modal_content').attr('class', 'alert alert-danger'); // CSS 변경
          $('#modal_title').html('실패'); // 제목 
        }   
        $('#modal_content').html(msg);     // 내용
        $('#modal_panel_msg').modal();           // 다이얼로그 출력
      },
      // Ajax 통신 에러, 응답 코드가 200이 아닌경우, dataType이 다른경우 
      error: function(request, status, error) { // callback 함수
        var msg = 'ERROR request.status: '+request.status + '/ ' + error;
        console.log(msg); // Chrome에 출력
      }
    });
  }
</script>
</head>

<body>

  <!-- ▼ 장바구니 성공여부 Modal 'modal_panel_cart' ▼-->
  <div class="modal fade" id="modal_panel_cart" role="dialog">
     <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">×</button>
          <h4 class="modal-title" id='modal_title'></h4><!-- 제목 -->
        </div>
        <div class="modal-body">
          <p id='modal_content'></p>  <!-- 내용 -->
        </div>
        <div class="modal-footer">
          <button type='button' class='btn btn-default' onclick="location.href='../cart/at_cart_mem_list.do?mem_no=${sessionScope.mem_no}'">장바구니</button>
          <button type="button" class="btn btn-default" data-dismiss="modal" id='btn_review_delete_frm_close'>닫기</button>
        </div>
      </div>
    </div>
  </div> 

  <!-- ▼ 리뷰 등록 / 삭제 관련 메시지 Modal 'modal_panel_msg' ▼-->
  <div class="modal fade" id="modal_panel_msg" role="dialog">
    <div class="modal-dialog">
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">×</button>
          <h4 class="modal-title" id='modal_title'></h4><!-- 제목 -->
        </div>
        <div class="modal-body">
          <p id='modal_content'></p>  <!-- 내용 -->
        </div>
        <div class="modal-footer">
          <button type="button" id='modal_panel_close' onclick="window.location.reload();" class="btn btn-default" data-dismiss="modal">확인</button>
        </div>
      </div>
    </div>
  </div> 
  
  <!-- ▼ 리뷰 삭제 비밀번호 입력 레이어 Modal 'modal_panel_delete' ▼-->
  <div class="modal fade" id="modal_panel_delete" role="dialog">
    <div class="modal-dialog">
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">×</button>
          <h4 class="modal-title">댓글 삭제</h4><!-- 제목 -->
        </div>
        <div class="modal-body">
          <form name='review_delete_frm' id='review_delete_frm'>
            <input type='hidden' name='review_no' id='review_no' value=''>
            <label>패스워드</label>
            <input type='password' name='mem_pw' id='mem_pw' class='form-control'>
            <DIV id='modal_panel_delete_msg' style='color: #AA0000; font-size: 1.1em;'></DIV>
          </form>
        </div>
        <div class="modal-footer">
          <button type='button' class='btn btn-danger' onclick="review_delete_proc(review_delete_frm.review_no.value); review_delete_frm.mem_pw.value='';">삭제</button>
          <button type="button" class="btn btn-default" data-dismiss="modal" id='btn_review_delete_frm_close'>Close</button>
        </div>
      </div>
    </div>
  </div> 

  <!-- header-start -->
  <jsp:include page="/menu/top.jsp" />
  <c:choose>
    <c:when test="${sessionScope.admin_id != null}"> <!-- 관리자 로그인 -->
    <ASIDE style='float: right;'>
      <button type="button" onclick="location.href='${root }/at/update.do?at_no=${at_VO.at_no }'">
        상품 수정
      </button>
    </ASIDE>
    </c:when>
  </c:choose>

  <!--  본문 start -->
  <div class="destination_details_info">
    <div class="container">
      <div class="row justify-content-center">
        <div class="col-md-9">
          <div class="destination_info">

            <h3>${at_VO.at_name }</h3>
            <p>${at_VO.at_detail }|
              <fmt:formatNumber value="${at_VO.at_price }" pattern="#,###" />
              KRW
            </p>
            <p>
              <c:forEach var="dates_cnt" items="${list }">
                예약 가능 날짜:${dates_cnt.dates_date } | 예약 가능 수량: ${dates_cnt.cnt}<br>
              </c:forEach>
            </p>
            
            <!-- ▼ 장바구니 담기 ▼ -->
            <FORM name='frm' id='frm' method='POST' action='../cart/create.do'>
              <input type='hidden' name='at_no' id='at_no' value='${at_VO.at_no }'>
              <input type='hidden' name='at_name' id='at_name' value='${at_VO.at_name }'>
              <input type='hidden' name='mem_no' id='mem_no' value='${sessionScope.mem_no}''>
              <div class="form-group">
                <label class="control-label col-md-3">날짜</label>
                <div>
                  <input type="text" id="dates_date" value="" class="form-control" style="width: 50%;">
                </div>
              </div>
              <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/js/bootstrap-datepicker.min.js"> </script>
              <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/locales/bootstrap-datepicker.kr.min.js"></script>
              <script type="text/javascript">
                              $('#dates_date').datepicker({
                                format : "yyyy-mm-dd", // 달력에서 클릭시 표시할 값 형식
                                language : "kr",
                              });
                            </script>
              <div class="form-group">
                <label class="control-label col-md-3">수량</label>
                <div>
                  <input type='number' name='cart_cnt' id='cart_cnt'' value='' required="required" placeholder="" 
                            min="1" max="1000" step="1" style='width: 30%;' class="form-control" style="width:50%;">
                </div>
              </div>
              <button type="button" class="btn" id="btn_send">장바구니</button>
              <button type="button" class="btn" id="btn_wish">위시리스트</button>
            </FORM>
          </div>
        </div>
      </div>
      <!-- ▲ 장바구니 ▲ -->
      
      <div class="bordered_1px"></div>
      <p>${at_VO.at_content }</p>
      <p>${at_VO.at_map }</p>
      <div class="single_destination">
        <h4>Point</h4>
        <p></p>
      </div>

      <div class="bordered_1px"></div>
      
      <!-- 이미지 갤러리 -->
      <div class="section-top-border">
        <div>
          <h3>Image Gallery</h3>
          <!-- 관리지만 표시 -->
          
          <div class="row gallery-item">

            <!--   <button type="button" class="btn" id="btn_img_dlt">이미지 파일 전체 삭제</button></div> -->
            <!-- 관리자만 표시 -->

            <c:forEach var="img" items="${list_img }">
              <div class="col-md-4 ">
                <a href="./storage/${img.at_img_fupname }"
                  class="img-pop-up">
                  <div class="single-gallery-image" style="background: url(./storage/${img.at_img_fname});"></div>
                </a>
              </div>
            </c:forEach>
          </div>
        </div>
      </div>
      <!-- 이미지 갤러리 -->
    </div>

  <!-- 댓글 영역 시작 -->
  <DIV style='width: 60%; margin: 0px auto;'>
    <HR>
    <FORM name='review_frm' id='review_frm'> <%-- 댓글 등록 폼 --%>
      <input type='hidden' name='at_no' id='at_no' value='${at_VO.at_no}'>
      <input type='hidden' name='mem_no' id='mem_no' value='${sessionScope.mem_no}'>
      <input type='hidden' name='payment_no' id='payment_no' value='${param.payment_no }'> <!-- 나중에 받는 방법 수정 필요 -->
      <textarea name='review_word' id='review_word' style='width: 100%; height: 60px;' placeholder=" 로그인해야 리뷰를 작성 할 수 있습니다."></textarea>
      <!-- <input name='review_rate' id='review_rate' value='5'> --> <!-- 나중에 받는 방법 수정 필요 -->
      <span class="star-rating star-5" >
        <input type="radio" name="review_rate" value="1"><i></i>
        <input type="radio" name="review_rate" value="2"><i></i>
        <input type="radio" name="review_rate" value="3"><i></i>
        <input type="radio" name="review_rate" value="4"><i></i>
        <input type="radio" name="review_rate" value="5"><i></i>
      </span>
      <button type='button' id='btn_review' onclick="review_create();">등록</button>
    </FORM>
    <HR>
    
    <DIV id='review_list' data-reviewPage = '1'>  
      <%-- 댓글 목록 --%>
    </DIV>
    <DIV id='review_list_btn' style='border: solid 1px #EEEEE; margin: 0px auto; width: 70%; background-color: #AAAAAA;'>
      <button id='addBtn' style='width: 100%;'>더보기</button>
    </DIV>  
  </DIV>
  <!-- 댓글 영역 종료 -->
  
    <!--  본문 end -->
    <jsp:include page="/menu/bottom.jsp" />
</body>

</html>