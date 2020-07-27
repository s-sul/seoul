<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}" />

<script
  src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<link rel="stylesheet"
  href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet"
  href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap-theme.min.css">
<script
  src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>



<!-- header-start -->
<header>
  <div class="header-area ">
    <div id="sticky-header" class="main-header-area">
      <div class="container-fluid">
        <div class="header_bottom_border">
          <div class="row align-items-center">
            <div class="col-xl-2 col-lg-2">
              <div class="logo">
                <a href=""> <img src="${root}/img/logo.png" alt="">
                </a>
              </div>
            </div>
            <div class="col-xl-10 col-lg-10">
              <div class="main-menu  d-none d-lg-block">
                <nav>
                
                  <ul id="navigation">
                    <li><a class="active" href="${root }">home</a></li>
                    <li><a href='${root }/at/list.do'>상품 <i class="ti-angle-down"></i></a>
                      <ul class="submenu">
                        <li><a href="${root}/at/list.do?">전체 상품 (개선중)</a></li>
                        <li><a href="${root}/at/list.do?at_grp_no=1">인기 맛집</a></li>
                        <li><a href="${root}/at/list.do?at_grp_no=2">체험</a></li>
                        <li><a href="${root}/at/list.do?at_grp_no=3">명소</a></li>
                      </ul>
                    </li>
                    
                    <li><a href="${root}/cart/at_cart_mem_list.do?${sessionScope.mem_no}">장바구니<i class="ti-angle-down"></i></a>
                    <ul class="submenu">
                        <li><a href="${root}/cart/create.do">등록</a></li>
                        <li><a href="${root}/cart/at_cart_mem_list.do?mem_no=1">목록</a></li>
                        <li><a href="#">수정</a></li>
                        <li><a href="#">삭제</a></li>
                      </ul>
                    </li>
                    
                    <li><a href="#">고객센터 <i class="ti-angle-down"></i></a>
                      <ul class="submenu">
                        <li><a href="${root}/faq/list.do">FAQ</a></li>
                        <li><a href="${root}/inquire/create.do?mem_no=${sessionScope.mem_no}">1:1문의</a></li>
                      </ul>
                    </li>

                    <li> <a href="#">회원 <i class="ti-angle-down"></i> </a>
                      <ul class="submenu">
                        <li><a href="${root}/mem/create.do">회원 가입</a></li>
                        
                        <c:choose>
                          <c:when test="${sessionScope.admin_id != null}"> <!-- 관리자 로그인 -->
                            <li><a href="${root}/mem/list_search_paging.do">회원 목록</a></li>
                          </c:when>
                        </c:choose>
                        
                        <c:choose>
                          <c:when test="${sessionScope.mem_id != null}"> <!-- 회원 로그인 -->
                            <li><a href="${root}/payment/list.do?mem_no=${sessionScope.mem_no}">내 구매 내역</a></li>
                            <li><a href="${root}/mem_wish/list_search_paging.do?">내 위시리스트</a></li>
                            <li><a href="${root}/review/list_by_mem_no.do?mem_no=${sessionScope.mem_no}">내 리뷰</a></li>
                            <li><a href="${root}/inquire/list_by_mem_no.do?mem_no=${sessionScope.mem_no}">내 문의</a></li>
                            <li><a href="${root}/mem/read.do?mem_no=${sessionScope.mem_no}">계정</a></li>
                          </c:when>
                        </c:choose>
                      </ul></li>
                      
                    <li><a href="contact.html">Contact</a></li>
                  </ul>
                </nav>
              </div>
            </div>
            
            <div class="col-xl-2 col-lg-2 d-none d-lg-block" >
              <div class="social_wrap d-flex align-items-center justify-content-end" >
                <div class="social_links d-none d-xl-block" >
                
                  <%-- 회원가입 --%>
                  <span class="glyphicon glyphicon-user"> <a href="${root}/mem/create.do"> 회원가입</a> | </span>
                   
                  <%--로그인 --%> 
                  <c:choose>
                    <c:when test="${sessionScope.mem_id == null}"> 
                      <A class='menu_link'> <span class="glyphicon glyphicon-off" id='mem_login'> 로그인 </span></A> 
                      <span class='top_menu1'> | </span>
                    </c:when>
                    
                    <%-- 로그아웃 --%>
                    <c:otherwise>
                      ${sessionScope.mem_id } <A class='menu_link'  href='${root}/mem/logout.do' >Logout</A> <span class='top_menu1'> | </span>
                      ${sessionScope.mem_id } <A class='menu_link'  href='${root}/mem/logout.do' >Logout</A> <span class='top_menu1'> | </span>
                    </c:otherwise>
                  </c:choose>
                  
                  <br>
                  <c:choose>
                    <c:when test="${sessionScope.id_admin == null}">
                      <A class='menu_link'  href='${root}/admin/login.do' >관리자 Login</A>
                    </c:when>
                    <c:otherwise>
                      ${sessionScope.id_admin } <A class='menu_link'  href='${root}/admin/logout.do' >관리자 Logout</A> 
                    </c:otherwise>
                  </c:choose>
                </div>
              </div>
            </div>
           
            <div class="col-12">
              <div class="mobile_menu d-block d-lg-none"></div>
            </div>
          </div>
        </div>

      </div>
    </div>
  </div>
  
<script type="text/javascript">
    // 로그인 모달
    $(document).ready(function(){
      $("#mem_login").click(function(){
        $("#login_modal").modal();
      });
    });


  // 로그인 처리
  function login_proc(mem_id) {

    var params = $('#login_modal').serialize();

    $.ajax({
      url: "./mem/login.do", // action 대상 주소
      type: "post",           // get, post
      cache: false,          // 브러우저의 캐시영역 사용안함
      async: true,           // true: 비동기
      dataType: "json",   // 응답 형식: json, xml, html...
      data: params,        // 서버로 전달하는 데이터
      
      success: function(rdata) { // 서버로부터 성공적으로 응답이 온경우
        $('#btn_login_modal_close').trigger("click"); // 삭제폼 닫기, click 발생 
        location.href = "/team3/index.jsp";
        return; // 함수 실행 종료
      },
      // Ajax 통신 에러, 응답 코드가 200이 아닌경우, dataType이 다른경우 
      error: function(request, status, error) { // callback 함수
        location.reload(true);
        var msg = 'ERROR request.status: '+request.status + '/ ' + error;
        console.log(msg);
      }
    });
  }

</script>
  
  <%-- 로그인 모달 --%>
<div class="container">

  <!-- Modal -->
  <div class="modal fade" id="login_modal" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header" style="padding:35px 50px;">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4><span class="glyphicon glyphicon-lock"></span> 로그인</h4>
        </div>
        
        <div class="modal-body" style="padding:40px 50px;">
          <form role="form" name='frm' method='POST' action='./mem/login.do'>
          
            <div class="form-group">
              <label ><span class="glyphicon glyphicon-user"></span> 아이디</label>
              <input type="text" class="form-control" id="mem_id" name="mem_id" placeholder="" value='${ck_id }'>
            </div>
            <div class="checkbox">
              <label><input type="checkbox" name='id_save' value='Y' ${ck_id_save == 'Y' ? "checked='checked'" : "" }>저장</label>
            </div>
            
            <div class="form-group">
              <label ><span class="glyphicon glyphicon-eye-open"></span> 비밀번호</label>
              <input type="password" class="form-control" id="mem_pw" name="mem_pw" value='${ck_passwd }' required="required"  placeholder="">
            </div>
            
            <div class="checkbox">
              <label><input type="checkbox" name='passwd_save' value='Y' ${ck_passwd_save == 'Y' ? "checked='checked'" : "" }>저장</label>
            </div>
              <button type="submit" 
                            class="btn btn-success btn-block"
                             onclick="login_proc(login_modal.mem_id.value); login_modal.mem_pw.value='';" > 
                    <span class="glyphicon glyphicon-off"></span> 로그인 </button>
                    
          </form>
        </div>
        <div class="modal-footer">
          <p>회원이 아니라면 <a href="./mem/create.do"> 가입</a></p>
          <p>비밀번호를 잊어렸다면<a href="#">찾기</a></p>
          <br>
          <button type="submit" class="btn btn-danger btn-default pull-left" data-dismiss="modal" id='btn_login_modal_close'>닫기 </button>
        </div>
      </div>
    </div>
  </div> 
</div>
  
  
</header>
<!-- header-end -->