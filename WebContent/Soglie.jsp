<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!-- 
Nel file "Soglie.jsp" sarà possibile settare le due soglie di velocità entro le
quali deve rimanere la velocità del veicolo localizzato. Le soglie verranno inviate
e salvate sul proprio profilo utente mediante la "ThresholdServlet" he in caso 
positivo ricarica la pagina Soglie.jsp
-->

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta content="IE=edge" http-equiv="X-UA-Compatible">
<meta content="initial-scale=1.0, width=device-width" name="viewport">
<title>Settaggio soglie</title>

<link href="css/base.min.css" rel="stylesheet">

</head>
<body onload="sogliefailed(<%=session.getAttribute("so")%>)">
	<header class="header">
		<a class="header-logo" href="index.jsp"><span
			class="icon icon-home"></span> Menù</a>
		<ul class="nav nav-list pull-right">
			<li><a class="menu-toggle" href="#profile"> <span
					class="access-hide"></span> <span class="avatar avatar-sm"><img
						alt="alt text for John Smith avatar"
						src="images/users/avatar-001.jpg"></span> <span
					class="header-close icon icon-close icon-lg"></span>
			</a></li>
		</ul>
	</header>
	<%
		//permette l'accesso alla pagina solo se esiste la sessione
		String usern = null;
		if (session.getAttribute("targa") == null) {
			response.sendRedirect("LoginPage.jsp");
		} else
			usern = (String) session.getAttribute("targa");
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
	<nav class="menu menu-right" id="profile">
		<div class="menu-scroll">
			<div class="menu-wrap">
				<div class="menu-top">
					<div class="menu-top-img">
						<img alt="John Smith" src="images/samples/landscape.jpg">
					</div>
					<div class="menu-top-info">
						<a class="menu-top-user"><span class="avatar pull-left"><img
								alt="alt text for John Smith avatar"
								src="images/users/avatar-001.jpg"></span><%=session.getAttribute("nome")%></a>
					</div>
				</div>
				<div class="menu-content">
					<ul class="nav">
						<li><a href="Utente.jsp"><span
								class="icon icon-account-box"></span>Profilo utente</a></li>
						<li>
							<form name="logoutForm" method="POST" action="LogoutServlet">
								<input type="hidden" name="param1" value="Logout"> <A
									HREF="javascript:document.logoutForm.submit()"><span
									class="icon icon-exit-to-app"></span>Logout</A>
							</form>
					</ul>
				</div>
			</div>
		</div>
	</nav>
	<div class="content">
		<div class="content-heading">
			<div class="container">
				<h1 class="heading">Settaggio soglie</h1>
			</div>
		</div>
	</div>
	<div class="content">
		<div class="content-inner">
			<div class="container">
				<div class="row">
					<div class="col-lg-4 col-lg-push-4 col-sm-6 col-sm-push-3">
						<div class="card-wrap">
							<div class="card">
								<div class="card-main">
									<div class="card-header">
										<div class="card-inner">
											<h1 class="card-heading">Setta le soglie di velocit&agrave;</h1>
										</div>
									</div>
									<div class="card-inner">
										<form class="form" action="ThresholdServlet">
											<div class="form-group form-group-label">
												<div class="row">
													<div class="col-md-10 col-md-push-1">
														<label class="floating-label" for="login-username">Prima
															soglia</label> <input class="form-control" id="login-username"
															type="text" name="soglia1"
															value="<%=session.getAttribute("soglia1")%>" required>
													</div>
												</div>
											</div>
											<div class="form-group form-group-label">
												<div class="row">
													<div class="col-md-10 col-md-push-1">
														<label class="floating-label" for="login-password">Seconda
															soglia</label> <input class="form-control" id="login-password"
															type="text" name="soglia2"
															value="<%=session.getAttribute("soglia2")%>" required>

													</div>
												</div>

											</div>

											<div class="form-group">

												<div class="row">

													<div class="col-md-10 col-md-push-1">

														<button
															class="btn btn-block btn-blue waves-button waves-effect waves-light"
															type="submit" value="submit">Conferma</button>
														<p class="margin-no-top" id="margin-no-top">
															<br />
															<br />
														</p>
													</div>
												</div>
											</div>
										</form>
									</div>
								</div>
							</div>
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