<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Login</title>
<link rel="stylesheet" type="text/css" href="css/style.css" />
</head>
<body>
	<div class="container">
		<section id="content">
			<form action="login" method="post">
				<h1>KK Bank</h1>
				<div>
					<input type="text" name="ad_id" placeholder="Admin ID"/>
				</div>
				<div>
					<input type="password" name="psd" placeholder="Password"/>
				</div>
				<div>
					${msg}
				</div>
				<div>
					<input type="submit" value="Log in" />
				</div>
			</form><!-- form -->
		</section><!-- content -->
	</div><!-- container -->
	
   <!-- <form action="login" method="post">
      Admin ID: <input type="text" name="ad_id"/><br/>
      Password: <input type="password" name="psd"/><br/>
      ${msg}<br/>
      <input type="submit" value="Login"/>
   </form> -->
</body>
</html>