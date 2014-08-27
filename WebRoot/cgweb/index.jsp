<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<!--[if lt IE 7 ]> <html lang="en" class="ie6 ielt8"> <![endif]-->
<!--[if IE 7 ]>    <html lang="en" class="ie7 ielt8"> <![endif]-->
<!--[if IE 8 ]>    <html lang="en" class="ie8"> <![endif]-->
<!--[if (gte IE 9)|!(IE)]><!--> <html lang="en"> <!--<![endif]-->
<head>
<meta charset="utf-8">
<title>卡牌定制下单系统——猫萌公社</title>
<link rel="stylesheet" type="text/css" href="../resources/css/cgweb/login/style.css" />
</head>
<body>
<div class="container">
	<section id="content">
		<form id="cgwebForm" action="../cgweb/login.action" method="post">
			<h1>登 陆</h1>
			<div>
				<input type="text" placeholder="用户名" required="" id="username" name="userReq.username" />
			</div>
			<div>
				<input type="password" placeholder="密码" required="" id="password" name="userReq.password" />
			</div>
			<div>
				<label style="color:red;">${message }</label>
			</div>
			<div>
				<input type="button" id="cgweb_login" value="登陆" onclick="login();"/>
				<a href="#">忘记密码?</a>
				<a href="register.jsp">注册账号</a>
			</div>
		</form><!-- form -->
		<div class="button">
			<a href="#" onclick="window.open('http://moemao.taobao.com/');">卡牌定制首选——猫萌公社</a>
		</div><!-- button -->
	</section><!-- content -->
</div><!-- container -->

<script type="text/javascript">
function login()
{
	if (document.getElementById("username").value == "")
	{
		alert("请填入账号");
		return;
	}
	if (document.getElementById("password").value == "")
	{
		alert("请填入密码");
		return;
	}
	
	document.getElementById("cgwebForm").submit();
}
</script>
</body>
</html>