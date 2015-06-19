<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!-- 
Questa è la pagina .jsp dove è necessario inserire i propri dati per effettuare
la registrazione dell'utente. Una volta inseriti verrà richiamata la 
RegistrationServlet e se la registrazione ha avuto successo si verrà reindirizzati 
nel menu di Login (LoginPage.jsp), altrimenti verrà ricaricata la RegistrPage.jsp
con un messaggio a comparsa dinamica nel quale compare la non effettuata 
registrazione.
-->

<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta content="IE=edge" http-equiv="X-UA-Compatible">
	<meta content="initial-scale=1.0, width=device-width" name="viewport">
	<title>Registrazione</title>

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
<body onload="regfailed(<%=session.getAttribute("reg")%>)">
	<header class="header">
		<span class="header-logo">Registrazione</span>
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
											<h1 class="card-heading">Inserisci qui i tuoi dati</h1>
										</div>
									</div>
									<div class="card-inner">
										<p class="text-center">
											<span class="avatar avatar-inline avatar-lg">
												<img alt="Login" src="images/users/avatar-001.jpg">
											</span>
										</p>
										<form class="form" action="RegistrationServlet">
										<div class="form-group form-group-label">
												<div class="row">
													<div class="col-md-10 col-md-push-1">
														<label class="floating-label" for="login-username">Targa *</label>
														<input class="form-control" id="reg-targa" type="text" name="targa" value="" required>
													</div>
												</div>
											</div>
											<div class="form-group form-group-label">
												<div class="row">
													<div class="col-md-10 col-md-push-1">
														<label class="floating-label" for="login-username">Nome *</label>
														<input class="form-control" id="reg-name" type="text" name="fname" value="" required>
													</div>
												</div>
											</div>
											<div class="form-group form-group-label">
												<div class="row">
													<div class="col-md-10 col-md-push-1">
														<label class="floating-label" for="login-password">Cognome *</label>
														<input class="form-control" id="reg-lastName" type="text" name="lname" value="" required>
													</div>
												</div>
											</div>
											<div class="form-group form-group-label">
												<div class="row">
													<div class="col-md-10 col-md-push-1">
														<label class="floating-label" for="login-password">Email *</label>
														<input class="form-control" id="reg-email" type="text" name="email" value="" required>
													</div>
												</div>
											</div>
											
											<div class="form-group form-group-label">
												<div class="row">
													<div class="col-md-10 col-md-push-1">
														<label class="floating-label" for="login-password">Password *</label>
														<input class="form-control" id="login-password" type="password" name="pass" value="" required>
													</div>
												</div>
											</div>
											<div class="form-group">
												<div class="row">
													<div class="col-md-10 col-md-push-1">
														<button class="btn btn-block btn-blue waves-button waves-effect waves-light" type="submit" value="Invia">Registrati</button>
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
							<p class="margin-no-top pull-right"><a href="LoginPage.jsp">Sei gi&agrave; registrato? Vai al login.</a></p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<footer class="footer">
		<div class="container">
			<p>alfada progetti</p>
		</div>
	</footer>
<script src="js/dynamic.js"></script>

	<script src="js/base.min.js" type="text/javascript"></script>
</body>
</html>