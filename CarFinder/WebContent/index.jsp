<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!-- 
Menu principale della Web-App, che viene caricato subito dopo il Login.
Permette di accedere alle diverse sezioni, quali "Localizza veicolo" nella quale
si potrà vedere la simulazione di un veicolo in movimento; "Profilo Utente",
dove si vedrà il report dei dati di registrazione dell'utente e dove è 
possibile cambiare la propria password; "Settaggio Soglie", dove è possibile
settare la prima e seconda soglia utente, in modo che al superamente di essere,
nella sezione "Localizzazione", verrà inviata una mail nel caso di superamento
della prima ed una simulazione di invio SMS per la seconda (quindi un presunto
furto di auto; infine il menu "Telecamera di sorveglianza" dove si vedrà il 
video del presunto ladro che sta utilizzando il video 
-->

<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta content="IE=edge" http-equiv="X-UA-Compatible">
	<meta content="initial-scale=1.0, width=device-width" name="viewport">
	<title>Menù</title>

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
<body>
	<header class="header">
		<a class="header-logo" href="index.jsp"><span class="icon icon-home"></span> Menù</a>
		<ul class="nav nav-list pull-right">
			<li>
				<a class="menu-toggle" href="#profile">
					<span class="access-hide"></span>
					<span class="avatar avatar-sm"><img alt="alt text for John Smith avatar" src="images/users/avatar-001.jpg"></span>
					<span class="header-close icon icon-close icon-lg"></span>
				</a>
			</li>
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
						<a class="menu-top-user"><span class="avatar pull-left"><img alt="alt text for John Smith avatar" src="images/users/avatar-001.jpg"></span><%=session.getAttribute("nome") %></a>
					</div>
				</div>
				<div class="menu-content">
					<ul class="nav">
						<li>
							<a href="Utente.jsp"><span class="icon icon-account-box"></span>Profilo utente</a>
						</li>
						<li>
						<form name="logoutForm" method="POST" action="LogoutServlet">
							<input type="hidden" name="param1" value="Logout">
							<A HREF="javascript:document.logoutForm.submit()"><span class="icon icon-exit-to-app"></span>Logout</A>
						</form> 
					</ul>
				</div>
			</div>
		</div>
	</nav>
	<div class="content">
		<div class="content-heading">
			<div class="container">
				<h1 class="heading">Funzioni</h1>
			</div>
		</div>
		<div class="content-inner">
			<div class="container">
				<div class="card-wrap">
					<div class="row">
						<div class="col-lg-4 col-sm-6">
							<div class="card">
								<div class="card-main">
									<div class="card-img">
										<a href="PositionServlet"><img alt="alt text" src="images/samples/localizza.jpg"></a>
									</div>
								</div>
							</div>
						</div>
						<div class="col-lg-4 col-sm-6">
							<div class="card">
								<div class="card-main">
									<div class="card-img">
										<a href="Utente.jsp"><img alt="alt text" src="images/samples/utente.jpg"></a>
									</div>
								</div>
							</div>
						</div>
						<div class="col-lg-4 col-sm-6">
							<div class="card">
								<div class="card-main">
									<div class="card-img">
										<a href="Soglie.jsp"><img alt="alt text" src="images/samples/soglie.jpg"></a>
									</div>
								</div>
							</div>
						</div>
						<div class="col-lg-4 col-sm-6">
							<div class="card">
								<div class="card-main">
									<div class="card-img">
										<a href="Video.jsp"><img alt="alt text" src="images/samples/sorveglianza.jpg"></a>
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
			<p>αlfada progetti</p>
		</div>
	</footer>
	

	<script src="js/base.min.js" type="text/javascript"></script>
</body>
</html>