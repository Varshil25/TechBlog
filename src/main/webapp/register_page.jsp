<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Register Page</title>
<!-- CSS -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/css/bootstrap.min.css"
	integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO"
	crossorigin="anonymous">

<link href="CSS/mystyle.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<style type="text/css">
.banner-background {
	clip-path: polygon(30% 0%, 70% 0%, 100% 0, 100% 100%, 64% 91%, 31% 100%, 0 93%, 0 0
		);
}
</style>
</head>
<body>
	<%@include file="normal_navbar.jsp"%>
	<main class="primary-background  banner-background "
		style="padding-bottom: 80px;">
		<div class="container">
			<div class="col-md-6 offset-md-3">
				<div class="card">
					<div class="card-header text-center primary-background text-white">
						<span class="fa fa-user-circle fa-3x"></span> <br> Register
						here
					</div>
					<div class="card-body">
						<form id="reg-form" action="RegisterServlet" method="post">
							<div class="form-group">
								<label for="user_name">User Name</label> <input name="user_name"
									type="text" class="form-control" id="user_name"
									placeholder="Enter name">
							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">Email address</label> <input
									name="user_email" type="email" class="form-control"
									id="exampleInputEmail1" aria-describedby="emailHelp"
									placeholder="Enter email"> <small id="emailHelp"
									class="form-text text-muted">We'll never share your
									email with anyone else.</small>
							</div>
							<div class="form-group">
								<label for="exampleInputPassword1">Password</label> <input
									name="user_password" type="password" class="form-control"
									id="exampleInputPassword1" placeholder="Password">
							</div>
							<div class="form-group">
								<label for="Gender">Select Gender :</label> <input type="radio"
									id="gender" name="gender" value="Male"> Male <input
									type="radio" id="gender" name="gender" value="Female">
								Female
							</div>
							<div class="form-group">
								<textarea name="about" class="form-control" rows="5"
									placeholder="Enter something about yourself"></textarea>
							</div>
							<div class="form-check">
								<input name="check" type="checkbox" class="form-check-input"
									id="exampleCheck1"> <label class="form-check-label"
									for="exampleCheck1">Agree terms and Conditions</label>
							</div>
							<br>
							<div class="container text-center" id="loader"
								style="display: none;">
								<span class="fa fa-refresh fa-spin fa-3x"></span>
								<h4>please wait..</h4>
							</div>
							<br>
							<button id="submit-btn" type="submit" class="btn btn-primary">
								Submit</button>
						</form>
					</div>

				</div>
			</div>
		</div>
	</main>

	<!-- JavaScript -->
	<script src="https://code.jquery.com/jquery-3.7.1.min.js"
		integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo="
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/popper.js@1.14.3/dist/umd/popper.min.js"
		integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/js/bootstrap.min.js"
		integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy"
		crossorigin="anonymous"></script>

	<script src="JS/myjs.js" type="text/javascript"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>

	<script>
		$(document).ready(function() {
			console.log("loaded.....");

			$('#reg-form').on('submit', function(event) {
				event.preventDefault();

				let form = new FormData(this);

				$("#submit-btn").hide();
				$("#loader").show();
				
				$.ajax({	
					url : "RegisterServlet",
					type : 'POST',
					data : form,
					success : function(data, textStatus, jqXHR) {
						console.log(data)
						
						$("#submit-btn").show();
						$("#loader").hide();
						
						if (data.trim()==='done')
						{
							swal("register Successfully..we are redirecting to Login Page")
							.then((value) => {
						  		window.location = "login_page.jsp"
							}); 
						}else {
							swal(data); 							
						}
					},
					error : function(jqXHR, textStatus, errorThrown) {
						$("#submit-btn").show();
						$("#loader").hide();
						swal("somthing went wrong..try again");
					},
					processData: false,
					contentType: false
				});
			});
		});
	</script>
</body>
</html>