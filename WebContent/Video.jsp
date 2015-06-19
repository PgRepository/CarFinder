<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!-- 
Nella pagina Video.jsp si potrà vedere il video del presunto ladro che sta rubando
la nostra macchina. Esso carica un file video contenuto nella cartella "video". 
-->

<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta content="IE=edge" http-equiv="X-UA-Compatible">
	<meta content="initial-scale=1.0, width=device-width" name="viewport">
	<title>Video</title>
	
	<link href="css/base.min.css" rel="stylesheet">
	
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
				<h1 class="heading">Telecamera di sorveglianza</h1>
			</div>
		</div>
	</div>
		<!-- CONTENT VIDEO -->
	<div class="content">
		<div class="content-inner">
			<div class="container">
				<div class="row">
					<div class="col-lg-4  col-sm-15">
						<div class="card-wrap">
							<div class="card">
								<div class="card-main">
									<div class="card-header">
										<div class="card-inner">
											<p class="card-heading">Video di sorveglianza</p>

											<div align="center" style="width: 100%; height: 450px">
												<video style="width: 100%; height: 100%" controls autoplay
													loop>
													<source src="video/video.mp4" type="video/mp4">
												</video>
											</div>
										</div>
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