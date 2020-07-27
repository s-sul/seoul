<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>1:1문의 조회</title>
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
 
<link href="../css/style.css" rel="Stylesheet" type="text/css">
<script type="text/JavaScript"
          src="http://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript">
  $(function() { // 자동 실행
    list_by_inquireno(${inquireVO.inquireno });  // 댓글 목록 출력
    $('#btn_create').on('click', reply_create);  // 댓글 등록

    if ('${sessionScope.mem_no}' != '') { // 로그인된 경우
      // alert('sessionScope.mem_no: ' + '${sessionScope.mem_no}');

      var frm_reply = $('#frm_reply');
      $('#reply_content', frm_reply).attr('placeholder', '댓글 작성');
    }

    $('#modal_panel').on('keypress', function (event) {
      // alert("닫기 버튼을 클릭하지 않으셨네요~");
      var keycode = (event.keyCode ? event.keyCode : event.which);
      if(keycode == '13'){
        // alert("ENTER 눌렀네요~");
        $('#modal_panel_close').click();  // 모달 창 닫기 
      }
    });

    // 댓글 삭제 modal 창이 open 됐을 때 focus 자동 설정
    $('#modal_panel_delete').on(
        'shown.bs.modal', function() {
          $('#reply_passwd', '#frm_reply_delete').focus();  
        }
    );
    
  });

  function panel_img(file) {
    var tag = "";
    tag   = "<A href=\"javascript: $('#attachfile_panel').hide();\">"; // 이미지 감추기
    tag += "  <IMG src='../attachfile/storage/" + file + "' style='width: 100%;'>";
    tag += "</A>";

    $('#attachfile_panel').html(tag);  // 문자열을 태그로 적용
    $('#attachfile_panel').show();      // 패널 출력
  }

  //  댓글 등록 처리
  function reply_create() {
    $('#modal_panel_close').focus();    // 모달 창 닫기
    
    var frm_reply = $('#frm_reply');
    var params = frm_reply.serialize();
    // alert('checkId() 호출됨: ' + params);
    // return;
    
    if ($('#mem_no', frm_reply).val().length == 0) {
      $('#modal_title').html('댓글 등록'); // 제목 
      $('#modal_content').html("로그인해야 등록 할 수 있습니다."); // 내용
      $('#modal_panel').modal();            // 다이얼로그 출력
      return;  // 실행 종료
    }
    
    // 영숫자, 한글, 공백, 특수문자: 글자수 1로 인식, 오라클은 1자가 3바이트임으로 300자로 제한
    // alert('내용 길이: ' + $('#reply_content', frm_reply).val().length);
    // return;
    if ($('#reply_content', frm_reply).val().length > 300) {
      $('#modal_title').html('댓글 등록'); // 제목 
      $('#modal_content').html("댓글 내용은 300자이상 입력 할 수 없습니다."); // 내용
      $('#modal_panel').modal();           // 다이얼로그 출력
      return;  // 실행 종료
    }
    
    $.ajax({
      url: "../inquire_reply/create.do", // action 대상 주소
      type: "post",          // get, post
      cache: false,          // 브러우저의 캐시영역 사용안함.
      async: true,           // true: 비동기
      dataType: "json",   // 응답 형식: json, xml, html...
      data: params,        // 서버로 전달하는 데이터
      success: function(rdata) { // 서버로부터 성공적으로 응답이 온경우
        // alert(rdata);
        var msg = "";
        
        if (rdata.count > 0) {
          $('#modal_content').attr('class', 'alert alert-success'); // CSS 변경
          msg = "댓글을 등록했습니다.";
          $('#reply_content', frm_reply).val('');
          $('#reply_passwd', frm_reply).val('');
          
          list_by_inquireno(${inquireVO.inquireno });  // 댓글 목록 새로 출력
          
        } else {
          $('#modal_content').attr('class', 'alert alert-danger'); // CSS 변경
          msg = "댓글 등록에 실패했습니다.";
        }
        
        $('#modal_title').html('댓글 등록'); // 제목 
        $('#modal_content').html(msg);     // 내용
        $('#modal_panel').modal();           // 다이얼로그 출력
      },
      // Ajax 통신 에러, 응답 코드가 200이 아닌경우, dataType이 다른경우 
      error: function(request, status, error) { // callback 함수
        var msg = 'ERROR request.status: '+request.status + '/ ' + error;
        console.log(msg); // Chrome에 출력
      }
    });
  }

  // inquireno 별 소속된 댓글 목록
  function list_by_inquireno(inquireno) {
    // alert(inquireno);
    var params = 'inquireno=' + inquireno;

    $.ajax({
      url: "../inquire_reply/list_by_inquireno_join.do", // action 대상 주소
      type: "get",           // get, post
      cache: false,          // 브러우저의 캐시영역 사용안함.
      async: true,           // true: 비동기
      dataType: "json",   // 응답 형식: json, xml, html...
      data: params,        // 서버로 전달하는 데이터
      success: function(rdata) { // 서버로부터 성공적으로 응답이 온경우
        // alert(rdata);
        var msg = '';
        
        $('#panel_reply').html(''); // 패널 초기화, val(''): 안됨
        
        for (i=0; i < rdata.list.length; i++) {
          var row = rdata.list[i];
          
          msg += "<DIV style='border-bottom: solid 1px #EEEEEE; margin-bottom: 10px;'>";
          msg += "<span style='font-weight: bold;'>" + row.id + "</span>";
          msg += "  " + row.reply_rdate;
          if ('${sessionScope.mem_no}' == row.mem_no) { // 글쓴이 일치여부 확인
            msg += " <A href='javascript:reply_delete("+row.inquire_replyno+")'><IMG src='./images/delete.png'></A>";
          }
          msg += "  " + "<br>";
          msg += row.reply_content;
          msg += "</DIV>";
        }
        // alert(msg);
        $('#panel_reply').append(msg);
      },
      // Ajax 통신 에러, 응답 코드가 200이 아닌경우, dataType이 다른경우 
      error: function(request, status, error) { // callback 함수
        var msg = 'ERROR request.status: '+request.status + '/ ' + error;
        console.log(msg);
      }
    });
    
  }

  // 댓글 삭제 레이어 출력
  function reply_delete(inquire_replyno) {
    // alert('inquire_replyno: ' + inquire_replyno);
    var frm_reply_delete = $('#frm_reply_delete');
    $('#inquire_replyno', frm_reply_delete).val(inquire_replyno); // 삭제할 댓글 번호 저장
    $('#modal_panel_delete').modal();               // 삭제폼 다이얼로그 출력
  }

  // 댓글 삭제 처리
  function reply_delete_proc(inquire_replyno) {
    // alert('inquire_replyno: ' + inquire_replyno);
    var params = $('#frm_reply_delete').serialize();
    $.ajax({
      url: "../inquire_reply/delete.do", // action 대상 주소
      type: "post",           // get, post
      cache: false,          // 브러우저의 캐시영역 사용안함.
      async: true,           // true: 비동기
      dataType: "json",   // 응답 형식: json, xml, html...
      data: params,        // 서버로 전달하는 데이터
      success: function(rdata) { // 서버로부터 성공적으로 응답이 온경우
        // alert(rdata);
        var msg = "";
        
        if (rdata.count ==1) { // 패스워드 일치
          if (rdata.delete_count == 1) { // 삭제 성공

            $('#btn_frm_reply_delete_close').trigger("click"); // 삭제폼 닫기, click 발생 
            
            list_by_inquireno(${inquireVO.inquireno }); // 목록을 다시 읽어옴
            
            return; // 함수 실행 종료
          } else {  // 삭제 실패
            msg = "패스 워드는 일치하나 댓글 삭제에 실패했습니다. <br>";
            msg += " 다시한번 시도해주세요."
          }
        } else { // 패스워드 일치하지 않음.
          // alert('패스워드 불일치');
          // return;
          
          msg = "패스워드가 일치하지 않습니다.";
          $('#modal_panel_delete_msg').html(msg);

          $('#reply_passwd', '#frm_reply_delete').focus();
          
        }
      },
      // Ajax 통신 에러, 응답 코드가 200이 아닌경우, dataType이 다른경우 
      error: function(request, status, error) { // callback 함수
        var msg = 'ERROR request.status: '+request.status + '/ ' + error;
        console.log(msg);
      }
    });

    
  }  
</script>
</head>

<body>

<jsp:include page="/menu/top.jsp" flush='false' />
  
  <!-- Modal 알림창 시작 -->
  <div class="modal fade" id="modal_panel" role="dialog">
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
          <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
        </div>
      </div>
    </div>
  </div> <!-- Modal 알림창 종료 -->

  <!-- 댓글 삭제폼 -->
  <div class="modal fade" id="modal_panel_delete" role="dialog">
    <div class="modal-dialog">
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">×</button>
          <h4 class="modal-title">댓글 삭제</h4><!-- 제목 -->
        </div>
        <div class="modal-body">
          <form name='frm_reply_delete' id='frm_reply_delete'>
            <input type='hidden' name='inquire_replyno' id='inquire_replyno' value=''>
            
            <label>패스워드</label>
            <input type='password' name='reply_passwd' id='reply_passwd' class='form-control'>
            <DIV id='modal_panel_delete_msg' style='color: #AA0000; font-size: 1.1em;'></DIV>
          </form>
        </div>
        <div class="modal-footer">
          <button type='button' class='btn btn-danger' 
                       onclick="reply_delete_proc(frm_reply_delete.inquire_replyno.value); frm_reply_delete.reply_passwd.value='';">삭제</button>

          <button type="button" class="btn btn-default" data-dismiss="modal" 
                       id='btn_frm_reply_delete_close'>Close</button>
        </div>
      </div>
    </div>
  </div> <!-- 댓글 삭제폼 종료 -->    
  
  <DIV class='title_line'>
    조회
  </DIV>
  
  <FORM name='frm' method="get" action='./read.do'>
      <input type="hidden" name="mem_no" value="1">
      <fieldset class="fieldset">
        <ul>
          <li class="li_none" style='border-bottom: solid 1px #AAAAAA;'>
            제목: <span>${inquireVO.inquire_title}</span>
            <span>${inquireVO.inquire_rdate.substring(0, 16)}</span>
          </li>
                                     
          <li class="li_none">
            <DIV id='inquire_attachfile_panel' style="width: 80%; margin: 0px auto;"></DIV> <!-- 원본 이미지 출력 -->
          </li>
          <li class="li_none" style='text-align: center;' >
            <c:forEach var="inquire_attachfileVO" items="${inquire_attachfile_list }">
              <c:set var="inquire_thumb" value="${inquire_attachfileVO.inquire_thumb.toLowerCase() }" />
              
              <c:choose>
                <c:when test="${inquire_thumb.endsWith('jpg') || inquire_thumb.endsWith('png') || inquire_thumb.endsWith('gif')}">
                  <A href="javascript:panel_img('${inquire_attachfileVO.inquire_fname }')"><IMG src='../inquire_attachfile/storage/${inquire_thumb }' style='margin-top: 2px;'></A>
                </c:when>
              </c:choose>
            </c:forEach>
          </li>
                    
          <li class="li_none" style='border-bottom: solid 1px #AAAAAA;'>
            <DIV>${inquireVO.inquire_content }</DIV><br>
          </li>         
          
        </ul>
      </fieldset>
      
      <DIV class='content_bottom_menu'>
        <c:choose>
          <c:when test="${sessionScope.id_admin != null}">
            <button type="button" 
                        onclick="location.href='../inquire_attachfile/create.do?inquireno=${inquireVO.inquireno}'"                     
                        class="btn btn">파일 등록</button>
            <button type="button" 
                        onclick="location.href='./list.do?word='" 
                        class="btn btn">
                        <img src="./images/ting3.png">목록</button>
           </c:when>
           <c:otherwise>
            <button type="button" 
                        onclick="location.href='./list.do?word='" 
                        class="btn btn">
                        <img src="./images/ting3.png">목록</button>
           </c:otherwise>      
         </c:choose>              
        </DIV>      
      
  </FORM>
  
  <!-- 댓글 영역 시작 -->
  <DIV style='width: 80%; margin: 0px auto;'>
      <HR>
      <FORM name='frm_reply' id='frm_reply'> <%-- 댓글 등록 폼 --%>
          <input type='hidden' name='inquireno' id='inquireno' value='${inquireVO.inquireno}'>
          <input type='hidden' name='mem_no' id='mem_no' value='${sessionScope.mem_no}'>
          
          <textarea name='reply_content' id='reply_content' style='width: 100%; height: 60px;' placeholder="댓글 작성, 로그인해야 등록 할 수 있습니다."></textarea>
          <input type='password' name='reply_passwd' id='reply_passwd' placeholder="비밀번호">
          <button type='button' id='btn_create'>등록</button>
      </FORM>
      <HR>
      <DIV id='panel_reply'>  <%-- 댓글 목록 --%>
      
      </DIV>
    
  </DIV>
  
  <!-- 댓글 영역 종료 --> 
    
<jsp:include page="/menu/bottom.jsp" flush='false' />
</body>

</html>