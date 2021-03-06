<%@ page contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title>Resort world</title>

<link href="../css/style.css" rel="Stylesheet" type="text/css">

<script type="text/JavaScript" src="http://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<script type="text/javascript">

  $(function () { // 자동 실행
    
  	// ↓ 'id=btn_send' 태그를 찾아 'click' 이벤트 처리자(Handler)로 send 함수를 등록
  	// ↓ 동일: document.getElementById('btn_basic').addEventListener('click', basic);
    $('#btn_checkID').on('click', checkID); // (아이디) 중복 확인
    $('#btn_checkNick').on('click', checkNick); // 닉네임 중복 확인
    $('#btn_DaumPostcode').on('click', DaumPostcode); // 우편번호 찾기 button
    $('#btn_send').on('click', send); // 가입 button
  });

  // 아이디 중복 확인
  function checkID () {
    
    var frm = $('#frm');
    var mem_id = $('#mem_id', frm).val(); //frm 폼에서 mem_id를 찾아 가져와서 할당
    var params = '';
    var msg = '';
    
    // ▼ mem_id를 입력받지 않은 경우
    if ($.trim(mem_id).length == 0) { 
      
      msg = 'ID를 입력하세요.<br>ID 입력은 필수입니다<br>ID는 3자 이상 권장합니다.';
      $('#modal_content').attr('class', 'alert alert-danger'); // Bootstrap CSS 변경
      $('#modal_title').html('ID 중복 확인'); // 제목 
      $('#modal_content').html(msg);        // 내용
      $('#modal_panel').modal();              // 다이얼로그 출력
      
    // ▼ id를 입력받은 경우
  	} else {
      params = 'mem_id=' + mem_id;
      // var params = $('#frm').serialize(); // 직렬화, form의 데이터를 key:value 구조로 조합
      // var params ='id=' +  $('#id', frm).val(); // key:value 구조
      // alert ('params ' + params);
      
      $.ajax ({
        
      	url: './checkID.do', 
      	type: 'get', // type: post / get
      	cache: false, // 브라우저 메모리에 응답 결과 임시저장 X (계속 새로운 결과를 응답받음)
      	async: true, // 비동기 통신
      	dataType: 'json', // 응답 형식: json / html / xml
      	data: params, // 데이터
      	
      	// ▼ 서버로부터 성공적으로 응답이 온경우
      	success: function (rdata) { 
      	  
          // alert(rdata);
          var msg = "";
          
          if (rdata.cnt > 0) {
            
            $('#modal_content').attr('class', 'alert alert-danger'); // Bootstrap CSS 변경
            msg = "이미 사용중인 ID 입니다.";
            
          } else {
            
            $('#modal_content').attr('class', 'alert alert-success'); // Bootstrap CSS 변경
            msg = "사용 가능한 ID 입니다.";
            
            // $.cookie ('checkID', 'TRUE'); // Cookie 기록
          }
          
          $('#modal_title').html('ID 중복 확인'); // 제목 
          $('#modal_content').html(msg);        // 내용
          $('#modal_panel').modal();              // 다이얼로그 출력
        },
      	
    	// ▼ callback 함수, ajax 엔진이 호출 (Ajax 통신 에러, 응답 코드가 200이 아닌경우, dataType이 다른경우)
      	error: function(request, status, error) { 
      	  var msg = 'ERROR<br><br>';
      	  msg += '<strong>request.status</strong><br>'+request.status + '<hr>';
      	  msg += '<strong>error</strong><br>'+error + '<hr>';
      	  console.log(msg);
          }
        });
    }
        /* 
        ▽ 처리중 출력
        var gif = '';
        gif +="<div style='margin: 0px auto; text-align: center;'>";
        gif +="  <img src='./images/6lxr.gif' style='width: 30%;'>";
        gif +="</div>";
        
        $('#panel2').html(gif);
        $('#panel2').show(); // 숨겨진 출력
        */
  }


  // 닉네임 중복 확인
  function checkNick () {
    
    var frm = $('#frm');
    var mem_nick = $('#mem_nick', frm).val(); //frm 폼에서 mem_id를 찾아 가져와서 할당
    var params = '';
    var msg = '';
    
    // ▼ mem_id를 입력받지 않은 경우
    if ($.trim(mem_nick).length == 0) { 
      
      msg = '닉네임을 입력하세요.<br>닉네임 입력은 필수입니다<br>닉네임는 3자 이상 권장합니다.';
      $('#modal_content').attr('class', 'alert alert-danger'); // Bootstrap CSS 변경
      $('#modal_title').html('닉네임 중복 확인'); // 제목 
      $('#modal_content').html(msg);        // 내용
      $('#modal_panel').modal();              // 다이얼로그 출력
      
    // ▼ id를 입력받은 경우
    } else {
      params = 'mem_nick=' + mem_nick;
      // var params = $('#frm').serialize(); // 직렬화, form의 데이터를 key:value 구조로 조합
      // var params ='id=' +  $('#id', frm).val(); // key:value 구조
      // alert ('params ' + params);
      
      $.ajax ({
        
        url: './checkNick.do', 
        type: 'get', // type: post / get
        cache: false, // 브라우저 메모리에 응답 결과 임시저장 X (계속 새로운 결과를 응답받음)
        async: true, // 비동기 통신
        dataType: 'json', // 응답 형식: json / html / xml
        data: params, // 데이터
        
        // ▼ 서버로부터 성공적으로 응답이 온경우
        success: function (rdata) { 
          
          // alert(rdata);
          var msg = "";
          
          if (rdata.cnt > 0) {
            
            $('#modal_content').attr('class', 'alert alert-danger'); // Bootstrap CSS 변경
            msg = "이미 사용중인 닉네임 입니다.";
            
          } else {
            
            $('#modal_content').attr('class', 'alert alert-success'); // Bootstrap CSS 변경
            msg = "사용 가능한 닉네임 입니다.";
            
            // $.cookie ('checkID', 'TRUE'); // Cookie 기록
          }
          
          $('#modal_title').html('닉네임 중복 확인'); // 제목 
          $('#modal_content').html(msg);        // 내용
          $('#modal_panel').modal();              // 다이얼로그 출력
        },
        
        // ▼ callback 함수, ajax 엔진이 호출 (Ajax 통신 에러, 응답 코드가 200이 아닌경우, dataType이 다른경우)
        error: function(request, status, error) { 
          var msg = 'ERROR<br><br>';
          msg += '<strong>request.status</strong><br>'+request.status + '<hr>';
          msg += '<strong>error</strong><br>'+error + '<hr>';
          console.log(msg);
          }
        });
    }
  }

  
  // 가입
  function send () {

    var idx = false;


    var frm = $('#frm');
    var mem_id = $('#mem_id', frm).val(); //frm 폼에서 mem_id를 찾아 가져와서 할당
    var mem_nick = $('#mem_nick', frm).val(); //frm 폼에서 mem_id를 찾아 가져와서 할당

    
    // ↓ 패스워드 일치 여부 확인
    if ($('#passwd').val() != $('#passwd2').val()) {
      msg = '입력된 패스워드가 일치하지 않습니다.<br>';
      msg += "패스워드를 다시 입력해주세요.<br>"; 
      
      $('#modal_content').attr('class', 'alert alert-danger'); // CSS 변경
      $('#modal_title').html('패스워드 일치 여부  확인'); // 제목 
      $('#modal_content').html(msg);  // 내용
      $('#modal_panel').modal();         // 다이얼로그 출력
      
      return false; // submit 중지
    }
    $('#frm').submit(); // submit
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
          <h4 class="modal-title" id='modal_title'></h4><!-- ▶ 제목 -->
        </div>
        <div class="modal-body">
          <p id='modal_content'></p>  <!-- ▶ 내용 -->
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
        </div>
      </div>
    </div>
  </div> 
<!-- Modal 알림창 종료 --> 

  <DIV class='title_line'>회원가입</DIV>

  <ASIDE style='float: left;'>
      *: 필수 입력  
  </ASIDE>
  <ASIDE style='float: right;'>
    <A href="javascript:location.reload();">새로고침</A>
    <span class='menu_divide' >│</span> 
    <A href='./create.do'>회원 가입</A>
    <span class='menu_divide' >│</span> 
    <A href='./list.do'>목록</A>
  </ASIDE> 

  <div class='menu_line'></div>

  <FORM name='frm' id='frm' method='POST' action='./create.do' enctype="multipart/form-data" class="form-horizontal">
  
    <br><br>
    
    <div class="form-group">
      <label for="id" class="col-md-2 control-label">아이디*</label>    
      <div class="col-md-10">
        <input type='text' class="form-control" name='mem_id' id='mem_id' value='' required="required" style='width: 30%;' placeholder="아이디" autofocus="autofocus">
        <button type='button' id="btn_checkID" class="btn btn-info btn-md">중복확인</button>
        <SPAN id='id_span'></SPAN> <!-- ID 중복 관련 메시지 -->        
      </div>
    </div>   
                
    <div class="form-group">
      <label for="passwd" class="col-md-2 control-label">패스워드*</label>    
      <div class="col-md-10">
        <input type='password' class="form-control" name='mem_pw' id='mem_pw' value='' required="required" style='width: 30%;' placeholder="패스워드">
      </div>
    </div>   

    <div class="form-group">
      <label for="passwd2" class="col-md-2 control-label">패스워드 확인*</label>    
      <div class="col-md-10">
        <input type='password' class="form-control" name='mem_pw2' id='mem_pw2' value='' required="required" style='width: 30%;' placeholder="패스워드">
      </div>
    </div>
    
    <br><br>
    
    <div class="form-group">
      <label for="id" class="col-md-2 control-label">닉네임*</label>    
      <div class="col-md-10">
        <input type='text' class="form-control" name='mem_nick' id='mem_nick' value='' required="required" style='width: 30%;' placeholder="아이디" autofocus="autofocus">
        <button type='button' id="btn_checkNick" class="btn btn-info btn-md">중복확인</button>
        <SPAN id='id_span'></SPAN> <!-- ID 중복 관련 메시지 -->        
      </div>
    </div>   
    
    <div class="form-group">
      <label for = "mem_pic" class="col-md-2 control-label">프로필 사진</label>
        <div class="col-md-10">
          <input type='file' class="form-control" name='mem_pic_nameMF' id='mem_pic_nameMF'  value='' placeholder="파일 선택" multiple="multiple" style='width: 30%;' >
        </div>
    </div>
    
    <div class="form-group">
      <label for="mem_name" class="col-md-2 control-label">성명</label>    
      <div class="col-md-10">
        <input type='text' class="form-control" name='mem_name' id='mem_name' value='' required="required" style='width: 30%;' placeholder="성명">
      </div>
    </div>   

    <div class="form-group">
      <label for="tel" class="col-md-2 control-label">전화번호*</label>    
      <div class="col-md-10">
        <input type='text' class="form-control" name='mem_tel' id='mem_tel' value='' required="required" style='width: 30%;' placeholder="전화번호"> 예) 010-0000-0000
      </div>
    </div>   

    <div class="form-group">
      <label for="zipcode" class="col-md-2 control-label">우편번호</label>    
      <div class="col-md-10">
        <input type='text' class="form-control" name='mem_zip' id='mem_zip' value=''  style='width: 30%;' placeholder="우편번호">
        <input type="button"  id="btn_DaumPostcode" value="우편번호 찾기" class="btn btn-info btn-md">
      </div>
    </div>  

    <div class="form-group">
      <label for="address1" class="col-md-2 control-label">주소</label>    
      <div class="col-md-10">
        <input type='text' class="form-control" name='mem_addr1' id='mem_addr1' value=''  style='width: 50%;' placeholder="주소">
      </div>
    </div>   

    <div class="form-group">
      <label for="address2" class="col-md-2 control-label">상세 주소</label>    
      <div class="col-md-10">
        <input type='text' class="form-control" name='mem_addr2' id='mem_addr2' value=''  style='width: 50%;' placeholder="상세 주소">
      </div>
    </div>   

    <div class="form-group">
      <div class="col-md-12">

<!-- ----- DAUM 우편번호 API 시작 ----- -->
<!-- iframe 기법 → 특정 영역만큼 타 사이트 띄우기 -->
<div id="wrap" style="display:none;border:1px solid;width:500px;height:300px;margin:5px 110px;position:relative">
  <img src="//i1.daumcdn.net/localimg/localimages/07/postcode/320/close.png" id="btnFoldWrap" style="cursor:pointer;position:absolute;right:0px;top:-1px;z-index:1" onclick="foldDaumPostcode()" alt="접기 버튼">
</div>

<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>

<script>
    // 우편번호 찾기 화면을 넣을 element
    var element_wrap = document.getElementById('wrap');

    function foldDaumPostcode() {
        // iframe을 넣은 element를 안보이게 한다.
        element_wrap.style.display = 'none';
    }

    function DaumPostcode() {
        // 현재 scroll 위치를 저장해놓는다.
        var currentScroll = Math.max(document.body.scrollTop, document.documentElement.scrollTop);
        new daum.Postcode({
            oncomplete: function(data) {
                // 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var fullAddr = data.address; // 최종 주소 변수
                var extraAddr = ''; // 조합형 주소 변수

                // 기본 주소가 도로명 타입일때 조합한다.
                if(data.addressType === 'R'){
                    //법정동명이 있을 경우 추가한다.
                    if(data.bname !== ''){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있을 경우 추가한다.
                    if(data.buildingName !== ''){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
                    fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('zipcode').value = data.zonecode; //5자리 새우편번호 사용
                document.getElementById('mem_addr1').value = fullAddr;

                // iframe을 넣은 element를 안보이게 한다.
                // (autoClose:false 기능을 이용한다면, 아래 코드를 제거해야 화면에서 사라지지 않는다.)
                element_wrap.style.display = 'none';

                // 우편번호 찾기 화면이 보이기 이전으로 scroll 위치를 되돌린다.
                document.body.scrollTop = currentScroll;
                
                $('#mem_addr2').focus();
            },
            // 우편번호 찾기 화면 크기가 조정되었을때 실행할 코드를 작성하는 부분. iframe을 넣은 element의 높이값을 조정한다.
            onresize : function(size) {
                element_wrap.style.height = size.height+'px';
            },
            width : '100%',
            height : '100%'
        }).embed(element_wrap);

        // iframe을 넣은 element를 보이게 한다.
        element_wrap.style.display = 'block';
    }
</script>
<!-- ----- DAUM 우편번호 API 종료----- -->

      </div>
    </div>
    
    <div class="form-group">
      <div class="col-md-offset-2 col-md-10">
        <button type="button" id='btn_send' class="btn btn-primary btn-md">가입</button>
        <button type="button" onclick="location.href='../index.jsp'" class="btn btn-primary btn-md">취소</button>
      </div>
    </div>   
  </FORM>
  
<jsp:include page="/menu/bottom.jsp" flush='false' />
</body>
</html>
 