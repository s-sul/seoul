<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8"> 
<title>���￩��</title>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<script type="text/javascript">
window.onload = function(){
  document.getElementById('delete_btn').onclick=send; //id�� btn_basic�� �±׸� ã�Ƽ� basic�Լ� ����
}
 
 // jQuery ajax��û
  function send(){
   var frm = $('#frm'); //frm ã��
   var surv_item_no = $('#surv_item_no',frm).val();
   var surv_item_passwd = $('#surv_item_passwd',frm).val();

   var params='surv_item_no=' + surv_item_no + '&surv_item_passwd=' + surv_item_passwd;
  
   
    //alert('params: ' + params);
   // return;
   //alert("dddd");

   $.ajax({
       url: './passwd.do',  //�̷��� �Ϸ��� Controller���� �ش��ϴ� ���� �����ؾ� �� './cehckID.jsp'�� ������ �ϴ��� $('#panel').html(rdata)�� ���� panel���̵�� �ϴ��� html�� ����
       type: 'get', // get���
       cache: false, // ������ �ӽ� ���� ���:, ��� ���ο� ���븸 ����ް� ���� �� ���
       async: true, // �񵿱����
       dataType: 'json', 
       data: params, //�����µ�����, �Ķ���� ���� �� // ������� ���� �����ؼ� ����ȭ ��
       success: function(rdata) { //�����κ��� ���������� ������ �°��
         var msg ='';
       
       if (rdata.cnt > 0) { // �н�������ġ
          alert('������ �����Ͽ����ϴ�. ������� �̵��մϴ�.')
         
          frm.submit(); //submit�� post��� ����
          
          } else { // �н����� �� ��ġ
            
            msg = "�н����尡 ��ġ���� �ʽ��ϴ�.";
          
            $('#modal_content').attr('class', 'alert alert-danger'); // Bootstrap CSS ����
            $('#modal_title').html('�н����� ����'); // ���� : modal_title ��ҳ����� ID �ߺ� Ȯ������ �ٲ�
            $('#modal_content').html(msg);        // ����
            $('#modal_panel').modal();              // ���̾�α� ���(���� �����Ǿ�����)
          }
        },
        // Ajax ��� ����, ���� �ڵ尡 200�� �ƴѰ��, dataType�� �ٸ���� , ������� ���� �ִ� �� �̰� �ҽ��� ���� �̴�� ����
         error: function(request, status, error) { // callback �Լ�, ajax�� ȣ���ϴ� �Լ�, ajax������ ȣ�� ��
             var msg = 'ERROR<br><br>';
             msg += '<strong>request.status</strong><br>'+request.status + '<hr>'; // ���°�.
             msg += '<strong>error</strong><br>'+error + '<hr>'; // �����޼��� 
               console.log(msg);
             } //������ �ֿܼ� ����
             
           }); 
      }
    
</script>
</head>
<body>
<jsp:include page="/menu/top.jsp" flush='false' />

<!-- Modal �˸�â ����, �˸�â �ʿ�� ��� ����� �� ����-->
  <div class="modal fade" id="modal_panel" role="dialog">
    <div class="modal-dialog">
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">��</button>
          <h4 class="modal-title" id='modal_title'></h4><!-- �ٽ�)���� �ΰ��� ��ġ�� �� �˰� �־�� ��-->
        </div>
        <div class="modal-body">
          <p id='modal_content'></p>  <!-- �ٽ�)���� -->
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">�ݱ�</button>
        </div>
      </div>
    </div>
  </div> <!-- Modal �˸�â ���� -->
  
  <ASIDE style='float: left;'>
    <A href='../index.jsp'>���￩��</A> > 
    <A href='./surv_item_delete.do'>�������� �׸� ����</A>
    </ASIDE>
    
    <ASIDE style='float: right;'>
    <A href="javascript:location.reload();">���ΰ�ħ</A>
    <span class='menu_divide' > | </span> 
    <A href='./surv_item_list.do'>���</A>
    <span class='menu_divide' > | </span>
  </ASIDE>
  
   <div class='menu_line'></div>
 
  <FORM name='frm' id='frm' method='POST' action='./surv_item_delete.do'>
      <input type='hidden' name='surv_item_no' id='surv_item_no' value='${param.surv_item_no }'>
      <input type="hidden" name="mem_no" value='1'>
      
      <div class="form-group">   
        <div class="col-md-12" style='text-align: center; margin: 30px;'>
          ���� �Ǵ±�: ${surv_Item_VO.surv_item_ques }<br><br>
          �����Ͻðڽ��ϱ�? �����Ͻø� ���� �� �� �����ϴ�.<br><br>
        </div>
        
        <div class="form-group">   
          <div class="col-md-12">
            <input type='password' class="form-control" name='surv_item_passwd' id='surv_item_passwd' value='' placeholder="�н�����" 
                    style="width: 20%; margin: 10px auto;">
          </div>
        </div>
        
        <div style="margin-left: 550px;">  
          <button type = "button" id='delete_btn' class="btn btn-info">���� ����</button>
          <button type = "button" onclick = "history.back()" class="btn btn-info">���</button>
        </div>
      </div>
          
  </FORM>
  <jsp:include page="/menu/bottom.jsp" flush='false' />
</body>
</html>