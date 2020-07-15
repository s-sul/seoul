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
<script
  src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<!-- Bootstrap -->
<link rel="stylesheet"
  href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet"
  href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap-theme.min.css">
<script
  src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<link rel="stylesheet"
  href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/css/bootstrap-datepicker3.min.css">
<link rel="stylesheet"
  href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/css/bootstrap-datepicker3.standalone.min.css">

<!-- At_Dates at_dates, int stock -->

<script type="text/javascript">
  $(function() {
    $('#btn_send').on('click', send);
  });

  function send() {
    var frm = $('#frm').serialize(); //At_Dates
    var dates_date = $('#dates_date').val();
    var params = frm + "&dates_date=" + dates_date;
    alert(params);
    $.ajax({
      type : "post",
      url : "./book.do",
      cache : false,
      dataType : "json",
      async : false,
      data : params,
      success : function(rdata) {

        if (rdata.cnt >= 1 && no_book ==1 ) {
          alert("예약 성공");
          location.href = "./book.jsp";
        } else {
          alert("예약 가능한 수량이 없습니다. 날짜와 수량을 다시 확인해 주세요.");
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
</script>




</head>

<body>
  <!--[if lte IE 9]>
            <p class="browserupgrade">You are using an <strong>outdated</strong> browser. Please <a href="https://browsehappy.com/">upgrade your browser</a> to improve your experience and security.</p>
        <![endif]-->

  <!-- header-start -->

  <jsp:include page="/menu/top.jsp" />

  <div class="destination_banner_wrap overlay">
    <div class="destination_text text-center">
      <h3>${at_VO.at_name }</h3>
      <p>${at_VO.at_detail }</p>
    </div>
  </div>

  <div class="destination_details_info">
    <div class="container">
      <div class="row justify-content-center">
        <div class="col-lg-8 col-md-9">
          <div class="destination_info">
            <h3>${at_VO.at_name }</h3>



            <div class="row">
              <c:forEach var="dates_cnt" items="${list }">
         날짜:${dates_cnt.dates_date } | 예약 가능 수량: ${dates_cnt.cnt}<br>
              </c:forEach>

            </div>

            <!-- 데이트 피커 -->

            <FORM name='frm' id='frm' method='POST' action='./book.do'
              class="form-horizontal">
              <!-- 넘겨야 할 값: At_dates, int book -->
              <%--       <input type='hidden' name='at_grp_no' id='at_grp_no'
                value='${at_VO.at_grp_no }'> --%>
              <input type='hidden' name='at_no' id='at_no'
                value='${at_VO.at_no }'>
              <%--  <input type='hidden' name='at_seqno' id='at_seqno' value='${at_VO.at_seqno }'>
        <input type='hidden' name='at_visible' id='at_visible' value='${at_VO.at_visible }'>
        <input type='hidden' name='at_name' id='at_name' value='${at_VO.at_name }'>
        <input type='hidden' name='at_detail' id='at_detail' value='${at_VO.at_detail }'>
        <input type='hidden' name='at_price' id='at_price' value='${at_VO.at_price }'>
        <input type='hidden' name='at_content' id='at_content' value='${at_VO.at_content }'>
        <input type='hidden' name='at_cancle' id='at_cancle' value='${at_VO.at_cancle }'>
        <input type='hidden' name='at_lowest' id='at_lowest' value='${at_VO.at_lowest }'>
        <input type='hidden' name='at_hit' id='at_hit' value='${at_VO.at_hit }'>
        <input type='hidden' name='at_dur' id='at_dur' value='${at_VO.at_dur }'>
        <input type='hidden' name='at_lang' id='at_lang' value='${at_VO.at_lang }'>
        <input type='hidden' name='at_sns' id='at_sns' value='${at_VO.at_sns }'>
        <input type='hidden' name='at_map' id='at_map' value='${at_VO.at_map }'>
        
        <input type='hidden' name='dates_no' id='dates_no' value='${dates__VO.dates_no }'> --%>

    <div class="form-group">
      <label class="control-label col-md-3">날짜</label>
      <div class="col-md-9">
        <input type="text" id="dates_date" value="">
       
      </div>
    </div>


    <script
      src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script
      src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/js/bootstrap-datepicker.min.js">
          
        </script>
    <script
      src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/locales/bootstrap-datepicker.kr.min.js">
          
        </script>
    <script type="text/javascript">
          $('#dates_date').datepicker({
            format : "yyyy-mm-dd", // 달력에서 클릭시 표시할 값 형식
            language : "kr",
          });
        </script>



              <div class="form-group">
                <label class="control-label col-md-3">수량</label>
                <div class="col-md-9">
                  <input type='number' name='book' id='book' value='2'
                    required="required" placeholder="" min="1"
                    max="1000" step="1" style='width: 30%;'
                    class="form-control">
                </div>
              </div>
              <button type="button" class="btn" id="btn_send">예약</button>

            </FORM>



          </div>
          <p>${at_VO.at_detail }|${at_VO.at_price }KRW</p>
          <p>${at_VO.at_content }</p>


        </div>
        <div class="bordered_1px"></div>


      </div>
    </div>
  </div>
 


  <!-- Modal -->
  <div class="modal fade custom_search_pop" id="exampleModalCenter"
    tabindex="-1" role="dialog"
    aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
      <div class="modal-content">
        <div class="serch_form">
          <input type="text" placeholder="Search">
          <button type="submit">search</button>
        </div>
      </div>
    </div>
  </div>


  <jsp:include page="/menu/bottom.jsp" />
</body>

</html>