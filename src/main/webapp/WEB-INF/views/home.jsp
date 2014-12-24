<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>GuestBook</title>

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
       <form class="form" action = "addGuestbook" method = POST >
				  <div class="form-group form-inline" style = "position : relative; left : 0px; ">
				  	<input type = "hidden" name = "number" value = "\${number}">
				    <label class="sr-only" for="email">Email address</label>
				    <input type="email" class="form-control" disabled="disabled" id="email" name = "email" placeholder="Enter email" value = "\${email}">
					<div class = "form-group form-inline" style = "min-width : 150px; text-align : right;">
					    <h5>Regist : <span class = "label label-default">\${registTime}</span></h5>
						<h5>Update : <span class = "label label-default">{{if updateTime }}\${updateTime}{{else}}- - -  - -,  - - - -   - - : - - : - - - -{{/if}}</span></h5>
					</div>
				  
				  </div>
			 <div class = "form-group"> 
			  	<textarea class="form-control" name = "content" disabled="disabled" rows="3">\${content}</textarea>
			  </div>
			  <div class = "form-group form-inline" style = "text-align : right; display : none;">
					<label class="sr-only" for="password" >Password</label>
					<input type="password" class="form-control" id="password" name = "password" placeholder="Password">
					<button type="submit" class="btn btn-default" >Update</button>
					<button class="btn btn-default" onclick="$(this).parent().hide(); $(this).parent().next().show(); $(this).parent().siblings().children('textarea').attr('disabled','disabled'); return false;">Cancel</button>
			  </div>
			  <div class = "form-group form-inline" style = "text-align : right">
			  		<button class = "btn btn-default" onclick = "$(this).parent().prev().show(); $(this).parent().hide(); $(this).parent().siblings().children('textarea').removeAttr('disabled'); return false;">Update</button>
			  </div>
		 </form>
	 </div>
  </div>
  </script>
  
  <script type="text/javascript">
  	var guestbookList = ${guestbookList};
  	$("#guestbook_temp").tmpl(guestbookList).appendTo("#guestbookRow");
  	
  </script>
  
  
</html>
