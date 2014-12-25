<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>GuestBook</title>
	<style type="text/css">
	.text-gray{ color : #cccccc};
	</style>
    <link href="<%=request.getContextPath() %>/resources/css/bootstrap.min.css" rel="stylesheet">
    <link href="<%=request.getContextPath() %>/resources/css/guestbook.css" rel="stylesheet">

  </head>

  <body>

    <div class="container">
      <div class="header">
        <h3 class="text-muted">Gwiyeong's GuestBook</h3>
      </div>

      <div class="row" id = "guestbookRow">
        <div class="col-lg-12">
        <div class = "panel panel-info">
	         <div class="panel-heading">
	         	<h3 class = "panel-title">Write Guestbook</h3>
	         </div>
	         <div class = "panel-body">
		          <form class="form" action = "addGuestbook" method = POST>
						  <div class="form-group form-inline">
						    <label class="sr-only" for="email">Email address</label>
						    <input type="email" class="form-control" id="email" name = "email" placeholder="Enter email">
						    <label class="sr-only" for="password">Password</label>
						    <input type="password" class="form-control" id="password" name = "password" placeholder="Password">
						  </div>
					 <div class = "form-group"> 
					  	<textarea class="form-control" name = "content" rows="3"></textarea>
					  </div>
					  <div style = "text-align : right;">
					  	<button type="submit" class="btn btn-default" style = "width : 100px;">Write</button>
					  </div>
				 </form>
			 </div>
		 </div>
	   </div>
	   
      </div>

      <footer class="footer">
        <p>&copy; Company 2014</p>
      </footer>

    </div> <!-- /container -->


  </body>
  <script src="<%=request.getContextPath()%>/resources/js/jquery-2.1.3.min.js"></script>
  <script src="<%=request.getContextPath()%>/resources/js/jquery.tmpl.js"></script>
	
  <script id = "guestbook_temp" type = "text/x-jquery-tmpl">
  <div class="col-lg-12">
	 <div class = "panel panel-default">
		
       <form class="form" action = "updateGuestbook" method = POST>
				  <div class="form-group form-inline" style = "text-align: right">
				  	<input type = "hidden" name = "number" value = "\${number}">
					<h3 class = "form-group" style = "vertical-align: text-bottom;" ><span class = "label label-success">\${email}</span></h3>				    
					<div class = "form-group form-inline" style = "min-width : 150px; text-align : right;">
					    <h5>Regist : <span class = "label label-default">\${registTime}</span></h5>
						<h5>Update : <span class = "label label-default">{{if updateTime }}\${updateTime}{{else}}- - -  - -,  - - - -   - - : - - : - - - -{{/if}}</span></h5>
					</div>
					<div class = "form-group form-inline" style = "text-align : right;" >
						<div style = "display : inline-block">
						<label class="sr-only" for="password" >Password</label>
						<input type="password" class="form-control form-inline" id="password" name = "password" placeholder="Password" style = "max-width : 150px;">
						</div>
						<div style = "display : inline;">
							<button class = "okbtn text-gray" onclick = "fnupdateGuestbook(this,\${number});return false;" disabled = 'disabled'><span class="glyphicon glyphicon-ok" aria-hidden="true"></span></button>
							<button onclick = "fnmakeUpdateForm(this); return false;"><span class="glyphicon glyphicon-pencil" aria-hidden="true"></span></button>	
							<button onclick = "fndeleteGuestbook(this,\${number}); return false;"><span class="glyphicon glyphicon-remove" aria-hidden="true"></span></button>
						</div>
					</div>
				  </div>
			 <div class = "form-group"> 
			  	<textarea class="form-control" name = "content" disabled="disabled" rows="3">\${content}</textarea>
			  </div>
		 </form>
	 </div>
  </div>
  </script>
  
  <script type="text/javascript">
  	var guestbookList = ${guestbookList};
  	$("#guestbook_temp").tmpl(guestbookList).appendTo("#guestbookRow");
  	
  	function fnmakeUpdateForm(btn) {
  		if($(btn).parents("form").children().children("textarea").attr('disabled')) {
  			$(btn).parents("form").children().children("textarea").removeAttr('disabled');
  			$(btn).siblings(".okbtn").removeAttr('disabled');
	  		$(btn).siblings(".okbtn").removeClass("text-gray");
  		}
  		else {
  			$(btn).parents("form").children().children("textarea").attr('disabled','disabled');
  			$(btn).siblings(".okbtn").attr('disabled','disabled');
  			$(btn).siblings(".okbtn").addClass('text-gray');
  		}
  	}
  	
  	function fnupdateGuestbook(btn, number) {
		if(confirm("수정하시겠습니까?")) {
	  		var result;
	  		var password = $(btn).parents("form").find("[type=password]").val();
	  		if(password == "") {
	  			alert("패스워드를 입력하세요");
	  			return false;
	  		} 
	  		$.ajax({
	  			url : 'checkPasswordAjax',
	  			type : 'post',
	  			dataType : 'json',
	  			data : {'number':number, 'password':password},
	  			success: function(data){
	  						if(Boolean(data)) {
	  							$(btn).parents("form").submit();
	  							return true;
	  						} else {
	  							alert("비밀번호가 틀렸습니다.");
	  							return false;
	  						}
		            }
	  		});
		}
  	}
  	
	function fndeleteGuestbook(btn, number) {
		if(confirm("정말 삭제하시겠습니까?")) {
			var result;
	  		var password = $(btn).parents("form").find("[type=password]").val();
	  		if(password == "") {
	  			alert("패스워드를 입력하세요");
	  			return false;
	  		} 
	  		$.ajax({
	  			url : 'checkPasswordAjax',
	  			type : 'post',
	  			dataType : 'json',
	  			data : {'number':number, 'password':password},
	  			success: function(data){
	  						if(Boolean(data)) {
	  							var myform = document.createElement("form"); 
	  							myform.setAttribute("method","post"); 
	  							myform.setAttribute("action","deleteGuestbook");
	  							document.body.appendChild(myform); 

	  							var myinput = document.createElement("input"); 
	  							myinput.setAttribute("type","hidden"); 
	  							myinput.setAttribute("name","number"); 
	  							myinput.setAttribute("value",number); 
	  							myform.appendChild(myinput); 
	  							
	  							var myinput2 = document.createElement("input");
	  							myinput2.setAttribute("type","hidden"); 
	  							myinput2.setAttribute("name","password");
	  							myinput2.setAttribute("value",$(btn).parents("form").find("[type=password]").val());
	  							myform.appendChild(myinput2); 

	  							myform.submit(); 
	  							return true;
	  						} else {
	  							alert("비밀번호가 틀렸습니다.");
	  							return false;
	  						}
		            }
	  		});
		}
  	}
  	
  </script>
  
  
</html>
