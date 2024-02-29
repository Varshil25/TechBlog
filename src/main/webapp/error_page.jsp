<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Sorry ! Something went Wrong...</title>
<!-- CSS -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/css/bootstrap.min.css"
	integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO"
	crossorigin="anonymous">

<link href="CSS/mystyle.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<style type="text/css">
	.banner-background{
		clip-path: polygon(30% 0%, 70% 0%, 100% 0, 100% 100%, 64% 91%, 31% 100%, 0 93%, 0 0);
	}
</style>
</head>
<body>
	<div class="container text-center">
		<img alt="Error" src="img/error.png" class="img-fluid">
		<h3 class="display-3">Sorry ! Something went Wrong...</h3>
		<%= exception %>
		<br>
		<a href="index.jsp" class="btn primary-background btn-lg text-white mt-3">Home</a>
	</div>
</body>
</html>