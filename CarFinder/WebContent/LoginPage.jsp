<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!-- 
Questa è la pagina .jsp iniziale dove è necessario inserire le credenziali.
Una volta inserite verrà richiamata la LoginServlet e se il login ha avuto
successo si verrà reindirizzati nel menu principale (index.jsp), altrimenti
Verrà ricaricata la LoginPage con un messaggio a comparsa dinamica nel quale
compare la non effettuata identificazione. 
-->

<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta content="IE=edge" http-equiv="X-UA-Compatible">
	<meta content="initial-scale=1.0, width=device-width" name="viewport">
	<title>Login Page</title>

	<!-- css -->
	<link href="css/base.min.css" rel="stylesheet">

	<!-- favicon -->
	<!-- ... -->

	<!-- ie -->
		<!--[if lt IE 9]>
			<script src="js/html5shiv.js" type="text/javascript"></script>
			<script src="js/respond.js" type="text/javascript"></script>
		<![endif]-->
</head>
<body onload="loginfailed(<%=session.getAttribute("login")%>)">
<%
		//se esiste la sessione l'utente viene rediretto alla pagina index.jsp
		String usern = null;
		if (!(session.getAttribute("targa") == null))
			response.sendRedirect("index.jsp");
                         
               
		String Targa = null;
		String sessionID = null;
		Cookie[] cookies = request.getCookies();
		if (cookies != null) {
			for (Cookie cookie : cookies) {
				if (cookie.getName().equals("targa"))
					Targa = cookie.getValue();
				if (cookie.getName().equals("JSESSIONID"))
					sessionID = cookie.getValue();
			}
		}
	%>
	<header class="header">
		<span class="header-logo">Login page</span>
	</header>
	<div class="content">
		<div class="content-heading">
		</div>
		<div class="content-inner">
			<div class="container">
				<div class="row">
					<div class="col-lg-4 col-lg-push-4 col-sm-6 col-sm-push-3">
						<div class="card-wrap">
							<div class="card">
								<div class="card-main">
									<div class="card-header">
										<div class="card-inner">
											<h1 class="card-heading">Login</h1>
										</div>
									</div>
									<div class="card-inner">
										<p class="text-center">
											<span class="avatar avatar-inline avatar-lg">
												<img alt="Login" src="images/users/avatar-001.jpg">
											</span>
										</p>
										<form class="form" action="LoginServlet">
											<div class="form-group form-group-label">
												<div class="row">
													<div class="col-md-10 col-md-push-1">
														<label class="floating-label" for="login-targa">Targa</label>
														<input class="form-control" id="login-targa" type="text" name="targa" value="" required>
													</div>
												</div>
											</div>
											<div class="form-group form-group-label">
												<div class="row">
													<div class="col-md-10 col-md-push-1">
														<label class="floating-label" for="login-password">Password</label>
														<input class="form-control" id="login-password" type="password" name="pw" value="" required>
													</div>
												</div>
											</div>
											<div class="form-group">
												<div class="row">
													<div class="col-md-10 col-md-push-1">
														<button class="btn btn-block btn-blue waves-button waves-effect waves-light" type="submit" value="submit">Accedi</button>
													<p class="margin-no-top" id="margin-no-top"><br/></p>
													</div>
												</div>
											</div>
										</form>
									</div>
								</div>
							</div>
						</div>
						<div class="clearfix">
							<p class="margin-no-top pull-right"><a href="RegistPage.jsp">Registrati qui</a></p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<footer class="footer">
		<div class="container">
			<p>&alpha;lfada progetti</p>
		</div>
	</footer>
<script src="js/dynamic.js"></script>

	<script src="js/base.min.js" type="text/javascript"></script>
</body>
</html>