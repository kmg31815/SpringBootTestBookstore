<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!--输出,条件,迭代标签库-->
<%@ page isELIgnored="false"%>
<!--支持EL表达式，不设的话，EL表达式不会解析-->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>login</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
</head>
<body>
	<nav aria-label="breadcrumb">
		<ol class="breadcrumb">
			<li class="breadcrumb-item active" aria-current="page">登入</li>
		</ol>
	</nav>
	<c:if test="${respError != null}">
		<div class="alert alert-warning" role="alert">${respError}</div>
	</c:if>
	<div class="container">
		<form action="login" method="post">
			帳號 : <input type="text" id="user" name="user" placeholder="請輸入帳號"><br>
			<br> 密碼 : <input type="password" id="pass" name="pass"
				placeholder="請輸入密碼"><br>
			<br> <input class="btn btn-primary" type="submit" value="登入">
		</form>
	</div>
</body>
</html>