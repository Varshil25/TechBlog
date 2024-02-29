<%@page import="java.text.DateFormat"%>
<%@page import="com.tech.blog.dao.UserDao"%>
<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<%@page import="com.tech.blog.dao.PostDao"%>
<%@page import="com.tech.blog.entities.User"%>
<%@page errorPage="error_page.jsp"%>
<%@page import="com.tech.blog.entities.Post"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.tech.blog.entities.Category"%>
<%@page import="java.util.Date"%>
<%@page import="java.time.LocalDateTime"%>
<%@page import="com.tech.blog.dao.LikeDao"%>
<%
User user = (User) session.getAttribute("currentUser");
if (user == null) {
	response.sendRedirect("login_page.jsp");
}
%>

<%
int postId = Integer.parseInt(request.getParameter("post_id"));
PostDao d = new PostDao(ConnectionProvider.getConnection());
Post p = d.getPostByPostId(postId);
%>


<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title><%=p.getpTitle()%> || TechBlog</title>
<!-- CSS -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/css/bootstrap.min.css"
	integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO"
	crossorigin="anonymous">

<link href="CSS/mystyle.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<style type="text/css">
body {
	background: url("img/bg.webp");
	background-attachment: fixed;
	background-size: cover;
}

.banner-background {
	clip-path: polygon(30% 0%, 70% 0%, 100% 0, 100% 100%, 64% 91%, 31% 100%, 0 93%, 0 0
		);
}

.post-title {
	font-weight: 100;
	font-size: 30px;
	text-align: center;
}

.post-content {
	font-weight: 100;
	font-size: 25px;
}

.post-date {
	font-style: italic;
	font-weight: bold;
	display:;
}

.post-user-info {
	font-size: 20px;
}

.row-user {
	border: 1px solid #e2e2e2;
	padding-top: 15px;
}
</style>

<div id="fb-root"></div>
<script async defer crossorigin="anonymous"
	src="https://connect.facebook.net/en_GB/sdk.js#xfbml=1&version=v19.0"
	nonce="er8XtLzB"></script>
</head>
<body>
	<!-- start of navbar  -->

	<nav class="navbar navbar-expand-lg navbar-dark primary-background">
		<a class="navbar-brand" href="index.jsp"> <span
			class="fa fa-asterisk"></span> Tech Blog
		</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item active"><a class="nav-link"
					href="profile.jsp"><span class="fa fa-edit"></span> LearnCode<span
						class="sr-only">(current)</span></a></li>

				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
					role="button" data-toggle="dropdown" aria-haspopup="true"
					aria-expanded="false"> <span class="fa fa-folder-open-o"></span>
						Categories
				</a>
					<div class="dropdown-menu" aria-labelledby="navbarDropdown">
						<a class="dropdown-item" href="#">Programming Language</a> <a
							class="dropdown-item" href="#">Project implementation</a>
						<div class="dropdown-divider"></div>
						<a class="dropdown-item" href="#">Data Structure</a>
					</div></li>
				<li class="nav-item"><a class="nav-link" href="#"><span
						class="fa fa-address-book-o"></span> Contact us</a></li>

				<li class="nav-item"><a class="nav-link" href="#"
					data-toggle="modal" data-target="#add-post-modal"><span
						class="fa fa-asterisk"></span> Do Post </a></li>
			</ul>
			<ul class="navbar-nav mr-right">
				<li class="nav-item"><a class="nav-link" href="#!"
					data-toggle="modal" data-target="#profile-modal"><span
						class="fa fa-user-circle"></span> <%=user.getName()%> </a></li>
				<li class="nav-item"><a class="nav-link" href="LogoutServlet"><span
						class="fa fa-user-plus"></span> Logout</a></li>
			</ul>
		</div>
	</nav>

	<!-- end of navbar -->

	<!-- main content of the Body -->
	<div class="container">
		<div class="row my-4">
			<div class="col-md-8 offset-md-2">
				<div class="card">
					<div class="card-header  primary-background text-white">
						<h4 class="post-title"><%=p.getpTitle()%></h4>
					</div>
					<div class="card-body">
						<img class="card-img-top my-2" src="blog_pics/<%=p.getpPic()%>"
							alt="Card image cap">
						<div class="row my-3 row-user">
							<div class="col-md-8">
								<%
								UserDao ud = new UserDao(ConnectionProvider.getConnection());
								%>
								<p class="post-user-info">
									<a href="#!"> <%=ud.getUserByUserId(p.getUserId()).getName()%>
									</a> is Posted :
								</p>
							</div>
							<div class="col-md-4">
								<p class="post-date">
									<%=DateFormat.getDateTimeInstance().format(p.getpDate())%></p>
							</div>
						</div>
						<p class="post-content">
							<%=p.getpContent()%></p>
						<br> <br>
						<div class="post-code">
							<pre><%=p.getpCode()%></pre>
						</div>

					</div>
					<div class="card-footer primary-background">
						<%
						LikeDao ldao = new LikeDao(ConnectionProvider.getConnection());
						%>

						<a href="#!" onclick="doLike(<%=p.getPid()%>,<%=user.getId()%>)"
							class="btn btn-outline-light btn-sm"><i
							class="fa fa-thumbs-o-up"><span class="like-counter"><%=ldao.countLikeOnPost(p.getPid())%></span></i></a>
						<a href="#!" class="btn btn-outline-light btn-sm"><i
							class="fa fa-commenting-o"></i></a>

					</div>

					<div class="card-footer">
						<div class="fb-comments"
							data-href="http://localhost:8080/TechBlog/show_blog_page.jsp?post_id= <%= p.getPid() %>"
							data-width="" data-numposts="5"></div>
					</div>
				</div>

			</div>
		</div>
	</div>

	<!-- End of main content of body -->


	<!-- Profile Model -->

	<!-- Modal -->
	<div class="modal fade" id="profile-modal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header primary-background text-white">
					<h5 class="modal-title" id="exampleModalLabel">TechBlog</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<div class="container text-center ">
						<img style="max-width: 150px;" alt=""
							src="pics/<%=user.getProfile()%>">
						<h5 class="modal-title mt-3" id="exampleModalLabel">
							<%=user.getName()%>
						</h5>

						<!-- details of user -->
						<div id="profile-details">
							<table class="table">
								<tbody>
									<tr>
										<th scope="row">Id:</th>
										<td><%=user.getName()%></td>
									</tr>
									<tr>
										<th scope="row">Email:</th>
										<td><%=user.getEmail()%></td>
									</tr>
									<tr>
										<th scope="row">Gender:</th>
										<td><%=user.getGender()%></td>
									</tr>
									<tr>
										<th scope="row">Status:</th>
										<td><%=user.getAbout()%></td>
									</tr>
									<tr>
										<th scope="row">Registered on:</th>
										<td><%=user.getRdate().toString()%></td>
									</tr>
								</tbody>
							</table>
						</div>

						<!-- profile Edit -->

						<div id="profile-edit" style="display: none;">
							<h3 class="mt-3">Please Edit Carefully</h3>
							<form action="EditServlet" method="post"
								enctype="multipart/form-data">
								<table class="table">
									<tr>
										<td>Id:</td>
										<td><%=user.getId()%></td>
									</tr>
									<tr>
										<td>Email:</td>
										<td><input type="email" class="form-control"
											name="user_email" value="<%=user.getEmail()%>"></td>
									</tr>
									<tr>
										<td>Name:</td>
										<td><input type="text" class="form-control"
											name="user_name" value=" <%=user.getName()%> "></td>
									</tr>
									<tr>
										<td>Password:</td>
										<td><input type="password" class="form-control"
											name="user_password" value="<%=user.getPassword()%>">
										</td>
									</tr>
									<tr>
										<td>Gender:</td>
										<td><%=user.getGender()%></td>
									</tr>
									<tr>
										<td>About:</td>
										<td><textarea rows="2" cols="" class="form-control"
												name="user_about"> <%=user.getAbout()%> </textarea></td>
									</tr>
									<tr>
										<td>New Profile pic:</td>
										<td><input type="file" name="image" class="form-control">
										</td>
									</tr>
								</table>
								<div class="container">
									<button type="submit" class="btn btn-outline-primary">
										Save</button>
								</div>
							</form>
						</div>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">Close</button>
					<button id="edit-profile-button" type="button"
						class="btn btn-primary">Edit</button>
				</div>
			</div>
		</div>
	</div>
	<!-- End of profile model -->

	<!-- Add post Model -->

	<!-- Modal -->
	<div class="modal fade" id="add-post-modal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Provide the
						post details</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<form id="add-post-form" action="AddPostServlet" method="post">
						<div class="form-group">
							<select class="form-control" name="cid">
								<option selected="selected" disabled="disabled">---select
									Category---</option>

								<%
								PostDao postd = new PostDao(ConnectionProvider.getConnection());
								ArrayList<Category> list = postd.getAllCategories();
								for (Category c : list) {
								%>
								<option value="<%=c.getCid()%>"><%=c.getName()%></option>
								<%
								}
								%>
							</select>
						</div>

						<div class="form-group">
							<input name="pTitle" type="text" placeholder="Enter Post Title.."
								class="form-control" />
						</div>
						<div class="form-group">
							<textarea name="pContent" class="form-control"
								style="height: 100px;" placeholder="Enter your content"></textarea>
						</div>
						<div class="form-group">
							<textarea name="pCode" class="form-control"
								style="height: 100px;" placeholder="Enter your program (if any)"></textarea>
						</div>
						<div class="form-group">
							<label>Select your pic :</label> <br> <input name="pic"
								type="file">
						</div>

						<div class="conatiner text-center">
							<button type="submit" class="btn btn-outline-primary">
								Post</button>
						</div>
					</form>

				</div>

			</div>
		</div>
	</div>
	<!-- End Post Model -->

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

	<script type="text/javascript"
		src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
	<script src="JS/myjs.js" type="text/javascript"></script>

	<script>
		$(document).ready(function() {
			let editStatus = false;

			$('#edit-profile-button').click(function() {
				if (editStatus == false) {
					$("#profile-details").hide();
					$("#profile-edit").show();
					editStatus = true;
					$(this).text("Back")
				} else {
					$("#profile-details").show();
					$("#profile-edit").hide();
					editStatus = false;
				}
			});
		});
	</script>

	<!-- now add post Js -->
	<script>
		$(document)
				.ready(
						function(e) {
							$("#add-post-form")
									.on(
											"submit",
											function(event) {
												event.preventDefault();
												console
														.log("you have clicked on submit.")
												let form = new FormData(this);

												$
														.ajax({
															url : "AddPostServlet",
															type : 'POST',
															data : form,

															success : function(
																	data,
																	textStatus,
																	jqXHR) {
																console
																		.log(data);
																if (data.trim() == 'done') {
																	swal(
																			"Good job!",
																			"saved successfully",
																			"success");
																} else {
																	swal(
																			"Error",
																			"Something..went Wrong try again...",
																			"error");
																}
															},
															error : function(
																	jqXHR,
																	textStatus,
																	errorThrown) {
																swal(
																		"Error",
																		"Something..went Wrong try again...",
																		"error");
															},
															processData : false,
															contentType : false
														})
											})
						})
	</script>


	<!-- loading post using ajax -->
	<script>
		function getPosts(catId, temp) {
			$("#loader").show();
			$("#post-container").hide();

			$(".c-link").removeClass('active')

			$.ajax({
				url : "load_posts.jsp",
				data : {
					cid : catId
				},
				success : function(data, textStatus, jqXHR) {
					console.log(data);
					$("#loader").hide();
					$("#post-container").show();
					$('#post-container').html(data);
					$(temp).addClass('active')
				}
			})

		}

		$(document).ready(function(e) {
			let allPostRef = $('.c-link')[0]
			getPosts(0, allPostRef)

		})
	</script>
</body>
</html>