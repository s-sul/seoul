<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport"
  content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" />
<title>Resort world</title>

<link href="../css/style.css" rel="Stylesheet" type="text/css">

<script type="text/JavaScript"
  src="http://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<link rel="stylesheet"
  href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet"
  href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<style>
.checked {
		color: orange;
}
</style>

<!-- rating star -->
<link rel="stylesheet"
  href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<script
  src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>


<script type="text/javascript">
  $(function() {
    $('#review_delete').on('click', review_delete);
    $('#review_update').on('click', review_update);
  });

  // ▶ 리뷰 삭제 비밀번호 입력 레이어 호출
  function review_delete(review_no) {
    alert('삭제 레이어 review_no: ' + review_no);
    var review_delete_frm = $('#review_delete_frm');
    $('#review_no', review_delete_frm).val(review_no); // 삭제할 댓글 번호 저장
    $('#modal_panel_delete').modal(); // 삭제폼 다이얼로그 출력
  }

  //▶ 리뷰 삭제
  function review_delete_proc() {

    var params = $('#review_delete_frm').serialize();

    $.ajax({
      url : "../review/delete.do",
      type : "post",
      cache : false, // 브러우저의 캐시영역 사용안함.
      async : true, // true: 비동기
      dataType : "json",
      data : params,
      success : function(rdata) {
        var msg = ""; // 메시지 출력
        if (rdata.pw_cnt == 1) {
          if (rdata.delete_cnt == 1) { // 패스워드 일치, 삭제 성공
            $('#btn_review_delete_frm_close').trigger("click"); // 삭제폼 닫기, click 강제 발생 

            msg = "리뷰를 삭제했습니다";
            $('#modal_content').attr('class', 'alert alert-success'); // Bootstrap CSS 변경
            $('#modal_title').html('성공'); // 제목 

          } else { // 패스워드 일치, 삭제 실패
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
        $('#modal_content').html(msg); // 내용
        $('#modal_panel_msg').modal(); // 다이얼로그 출력
      },
      // Ajax 통신 에러, 응답 코드가 200이 아닌경우, dataType이 다른경우 
      error : function(request, status, error) { // callback 함수
        var msg = 'ERROR request.status: ' + request.status + '/ ' + error;
        console.log(msg); // Chrome에 출력
      }
    });
  }

  // ▶ 리뷰 수정 레이어 
  function review_update(review_no) {

    var layer = '';

    layer += "<DIV id='"+row.review_no+"' style='border-bottom: solid 1px #EEEEEE; margin-bottom: 10px;'>";
    layer += "<span style='font-weight: bold;'>" + row.mem_nick + "</span>";
    layer += "  " + row.rdate;
    msg += " <A href='javascript:review_update_proc(" + row.review_no
        + ")'>[x]</A>";
    layer += "  " + "<br>";
    layer += row.review_word;
    layer += "  " + "<br>";
    layer += row.review_rate;
    layer += "</DIV>";
  }

  // ▶ 리뷰 수정
  function review_update_proc(mem_wish_no) {

    alert('review_no: ' + review_no);
    var params = 'review_no=' + review_no;

    $.ajax({
      url : './update.do',
      type : 'post', // type: post / get
      cache : false, // 브라우저 메모리에 응답 결과 임시저장 X (계속 새로운 결과를 응답받음)
      async : true, // 비동기 통신
      dataType : 'json', // 응답 형식: json / html / xml
      data : params, // 데이터

      // ▼ 서버로부터 성공적으로 응답이 온경우
      success : function(rdata) {

        if (rdata.cnt > 0) {
          msg = "위시리스트 삭제 성공";
          $('#modal_content').attr('class', 'alert alert-success'); // Bootstrap CSS 변경
          $('#modal_title').html('삭제 성공'); // 제목 
          $('#modal_content').html(msg); // 내용
          $('#modal_panel_2').modal(); // 다이얼로그 출력
        }
      },

      error : function(request, status, error) {
        var msg = 'ERROR<br><br>';
        msg += '<strong>request.status</strong><br>' + request.status + '<hr>';
        msg += '<strong>error</strong><br>' + error + '<hr>';
        console.log(msg);
      }
    })
  }
</script>
</head>

<body>
  <jsp:include page="/menu/top.jsp" flush='false' />

  <!-- ▼ 리뷰 등록 / 삭제 관련 메시지 Modal 'modal_panel_msg' ▼-->
  <div class="modal fade" id="modal_panel_msg" role="dialog">
    <div class="modal-dialog">
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">×</button>
          <h4 class="modal-title" id='modal_title'></h4>
          <!-- 제목 -->
        </div>
        <div class="modal-body">
          <p id='modal_content'></p>
          <!-- 내용 -->
        </div>
        <div class="modal-footer">
          <button type="button" id='modal_panel_close'
            onclick="window.location.reload();" class="btn btn-default"
            data-dismiss="modal">확인</button>
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
          <h4 class="modal-title">댓글 삭제</h4>
          <!-- 제목 -->
        </div>
        <div class="modal-body">
          <form name='review_delete_frm' id='review_delete_frm'>
            <input type='hidden' name='review_no' id='review_no'
              value=''> <label>패스워드</label> <input
              type='password' name='mem_pw' id='mem_pw'
              class='form-control'>
            <DIV id='modal_panel_delete_msg'
              style='color: #AA0000; font-size: 1.1em;'></DIV>
          </form>
        </div>
        <div class="modal-footer">
          <button type='button' class='btn btn-danger'
            onclick="review_delete_proc(review_delete_frm.review_no.value); review_delete_frm.mem_pw.value='';">삭제</button>
          <button type="button" class="btn btn-default"
            data-dismiss="modal" id='btn_review_delete_frm_close'>Close</button>
        </div>
      </div>
    </div>
  </div>






  <DIV class='title_line'>회원</DIV>

  <ASIDE style='float: right;'>
    <A href='./mem/list.do'>회원 목록</A>
  </ASIDE>

  <ASIDE style='float: right;'>
    <A href="javascript:location.reload();">새로고침</A> <span
      class='menu_divide'>│</span> <A href='./create.do'>회원 가입</A> <span
      class='menu_divide'>│</span> <A href='./create.do'>목록</A>
  </ASIDE>

  <form name='frm' id='frm' method='get'
    action='./list_search_paging.do'>

    <ASIDE style='float: left;'>
      <c:choose>
        <c:when test="${param.word != ''}">
            > '${param.word }' ${search_count } 건
          </c:when>
        <c:otherwise> 
            > ${search_count } 건
          </c:otherwise>
      </c:choose>
    </ASIDE>

    <input type='hidden' name='mem_no' id='mem_no' value='${mem_no }'
      style='width: 35%;'>

    <c:choose>
      <c:when test="${param.word != '' }">
        <%-- 검색하는 경우 --%>
        <input type='text' name='word' id='word' value='${word }'
          style='width: 35%;'>
      </c:when>
      <c:otherwise>
        <%-- 검색하지 않는 경우 --%>
        <input type='text' name='word' id='word' value=''
          style='width: 35%;'>
      </c:otherwise>
    </c:choose>

    <button type='submit'>검색</button>
    <c:if test="${param.word.length() > 0 }">
      <button type='button'
        onclick="location.href='./list_search_paging.do?mem_no=${param.mem_no}&word='">검색
        취소</button>
    </c:if>

    <DIV class='menu_line' style='clear: both;'></DIV>
  </form>
  <div class='menu_line'></div>


  <br>
  <br>

  <c:import url="/mem_wish/list_index_left.do" />

  <DIV>
    <!-- 내용 출력 컬럼 -->

    <DIV id='review_update' data-reviewPage='1'>
      <%-- 댓글 수정 레이어 --%>
    </DIV>

    <table class="table table-striped" style='width: 100%;'>
      <caption>관리자만 접근가능합니다.</caption>
      <colgroup>
        <col style='width: 10%;' />
        <col style='width: 15%;' />
        <col style='width: 10%;' />
        <col style='width: 35%;' />
        <col style='width: 10%;' />
        <col style='width: 10%;' />
        <col style='width: 10%;' />
      </colgroup>
      <TR>
        <TH class='th'>결제 번호</TH>
        <TH class='th'>상품</TH>
        <TH class='th'>결제 가격</TH>
        <TH class='th'>리뷰</TH>
        <TH class='th'>평점</TH>
        <TH class='th'></TH>
      </TR>

      <c:forEach var="list" items="${list }">
        <c:set var="payment_no" value="${list.r_payment_no}" />
        <c:set var="at_no" value="${list.r_at_no}" />
        <c:set var="at_name" value="${list.at_name}" />
        <c:set var="payment_total" value="${list.payment_total}" />
        <c:set var="review_no" value="${list.review_no}" />
        <c:set var="review_word" value="${list.review_word}" />
        <c:set var="review_rate" value="${list.review_rate}" />

        <TR>
          <TD class='td'><A
            href="../payment/read.do?payment_no=${payment_no}">${payment_no}</A></TD>
          <TD class='td'><A href="./read.do?mem_wish_no=${at_no}">${at_name}</A></TD>
          <TD class='td'>${payment_total}</TD>
          <TD class='td'>${review_word}</TD>
          <TD class='td'><script type="text/javascript">
                      function rate_to_star(review_rate) {
                        var star = '';
                        for (var i = 0; i < review_rate; i++) {
                          star += "<span class='fa fa-star checked'></span>";
                        }
                        for (var i = 0; i < 5 - review_rate; i++) {
                          star += "<span class='fa fa-star'></span>";
                        }
                        // rating.innerHTML=star;
                        document.write(star);
                      }
                    </script> <span id='rating'> </span> <script>
                  rate_to_star('${review_rate}');
                </script></TD>
          <TD class='td'>
            <button type="button"
              onclick="review_delete ('${review_no}')">삭제</button>
            <button type="button"
              onclick="review_update ('${review_no}')">수정</button>
          </TD>
        </TR>
      </c:forEach>

    </TABLE>
  </DIV>


  <DIV class='bottom_menu'>${paging }</DIV>

  <jsp:include page="/menu/bottom.jsp" />
</body>

</html>