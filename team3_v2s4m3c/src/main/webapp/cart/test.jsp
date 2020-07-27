<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>

<script type="text/JavaScript"
          src="http://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
          
        <script type="text/javascript">
        function allCheckFunc( obj ) {
      		$("[name=checkOne]").prop("checked", $(obj).prop("checked") );
      		
      }

      /* üũ�ڽ� üũ�� ��ü���� üũ ���� */
      function oneCheckFunc( obj )
      {
      	var allObj = $("[name=checkAll]");
      	var objName = $(obj).attr("name");

      	if( $(obj).prop("checked") )
      	{
      		checkBoxLength = $("[name="+ objName +"]").length;
      		checkedLength = $("[name="+ objName +"]:checked").length;

      		if( checkBoxLength == checkedLength ) {
      			allObj.prop("checked", true);
      		} else {
      			allObj.prop("checked", false);
      		}
      	}
      	else
      	{
      		allObj.prop("checked", false);
      	}
      }

      $(function(){
      	$("[name=checkAll]").click(function(){
      		allCheckFunc( this );
      	});
      	$("[name=checkOne]").each(function(){
      		$(this).click(function(){
      			oneCheckFunc( $(this) );
      		});
      	});
      });

      
      
      $(function() { // �ڵ� ����
        $('#btn_select_delete').on('click', select_del); 
      });

      function select_del(){
      
        
         var confirm_val = confirm("���� �����Ͻðڽ��ϱ�?");
         
         if(confirm_val) {
          
          $("input[id='checkOne']:checked").each(function(){
            alert($(this).val());
            
          });

 
         } else{
           return false;
         }

  
        
      }
      
      
      
      ��������
      $.ajax({
        url : "/shop/deleteCart",
        type : "post",
        data : { chbox : checkArr },
        success : function(){
         location.href = "/shop/cartList";
        }
       });
  
        
 
     
        </script>
    </head>
    <body>
    <button type="button" id='btn_select_delete' name='btn_select_delete' class="btn_select_delete">����</button>
        <table>
	<thead>
		<tr>
    
			<th><input type="checkbox" name="checkAll" id="checkAll"></th>
			<th>��ü����</th>
		</tr>
	</thead>
	<tbody>
		<tr>
			<td><input type="checkbox" name="checkOne" id="checkOne" value="A"></td>
			<td>A</td>
		</tr>
		<tr>
			<td><input type="checkbox" name="checkOne" id="checkOne" value="B"></td>
			<td>B</td>
		</tr>
		<tr>
			<td><input type="checkbox" name="checkOne" id="checkOne" value="C"></td>
			<td>C</td>
		</tr>
		<tr>
			<td><input type="checkbox" name="checkOne" id="checkOne" value="D"></td>
			<td>D</td>
		</tr>
	</tbody>
</table>
        <br>

    </body>
</html>