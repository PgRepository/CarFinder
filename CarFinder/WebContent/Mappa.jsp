<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!-- 
Il file Mappa.jsp viene chiamato al click su "Localizzazione" dal menu 
principale e fa apparire la mappa prelevata da Google Maps attraverso le
API di Google. Premendo il pulsante "Localizza veicolo" verrà chiamata la
funzione di avvio contenuta nello script "engine.js" che carica il percorso
scelto casualmente, che a sua volta carica lo script "epoly.js" permettendo
così di vedere l'indicatore sulla mappa muoversi.
-->

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta content="IE=edge" http-equiv="X-UA-Compatible">
<meta content="initial-scale=1.0, width=device-width" name="viewport">
<title>Car finder</title>

<link href="css/base.min.css" rel="stylesheet">

</head>
<body>
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
								src="images/users/avatar-001.jpg"></span><%=session.getAttribute("nome") %></a>
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
				<h1 class="heading">Mappa</h1>
			</div>
		</div>
	</div>
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
											<p class="card-heading">Localizzazione Veicolo</p>

											<!-- JAVASCRIPT CHE CARICA LA MAPPA DALLE API DI GOOGLE -->

											<script
												src="http://maps.google.com/maps?file=api&amp;v=2&amp;key=ABQIAAAAi_x03rBPvcUzObU_OU5Z_RRMrZ4ZiepwBPC13G1CO0mIcOaHJBSF-jlBQxmGDKmcezkCQdycMczfaQ"
												type="text/javascript"></script>

											<!-- JAVASCRIPT CHE CARICA LO SCRIPT PER IL POSIZIONAMENTO DELL'INDICATORE -->
											<script src="js/epoly.js" type="text/javascript"></script>

											<!-- JAVASCRIPT CHE CARICA LO SCRIPT IN JQUERY PER L'INVIO DELLA MAIL -->

											<script
												src="//ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js">
											</script>

											<div align="center" style="width: 100%; height: 50px">
												<div id="controls" style="width: 100%; height: 100%">

													<form
														onsubmit="start('<%=session.getAttribute("initposition")%>','<%=session.getAttribute("finalposition")%>',
														'<%=session.getAttribute("soglia1")%>','<%=session.getAttribute("soglia2")%>',
														'<%=session.getAttribute("nome")%>','<%=session.getAttribute("email")%>');return false">

														<button
															class="btn btn-red waves-button waves-effect waves-light"
															type="submit" value="Submit">Localizza il
															veicolo</button>
													</form>
												</div>
											</div>

											<div align="center" style="width: 100%; height: 450px">

												<div id="map" style="width: 100%; height: 100%"></div>

												<div class="style1" id="step">&nbsp;</div>

												<span class="style1"> <!-- JAVASCRIPT CHE CARICA IL MOTORE PER MUOVERE L'INDICATORE + ESECUZIONE MAIL -->
													<script src="js/engine.js" type="text/javascript"> </script>

												</span>
												<button class="waves-effect waves-light" data-toggle="toast"
													title="E' stata superata la prima soglia. Verrà mandata un'email sull'account di posta registrato."
													hidden="hidden"></button>
												<button class="waves-effect waves-light" data-toggle="toast"
													title="ATTENZIONE! PROBABILE FURTO DELL'AUTO! E' stata superata la seconda soglia. Verrà mandato un'SMS immediatamente!"
													hidden="hidden"></button>
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

	<!-- SOGLIE -->
	<div aria-hidden="true" class="modal fade" id="soglie" role="dialog"
		tabindex="-1">
		<div class="modal-dialog modal-full">
			<div class="modal-content">
				<iframe class="iframe-seamless" src="Soglie.jsp"
					title="Settaggio soglie"></iframe>
			</div>
		</div>
	</div>

	<!-- VIDEO -->
	<div aria-hidden="true" class="modal fade" id="video" role="dialog"
		tabindex="-1">
		<div class="modal-dialog modal-full">
			<div class="modal-content">
				<iframe class="iframe-seamless" src="Video.jsp"
					title="Video sorveglianza"></iframe>
			</div>
		</div>
	</div>



	<footer class="footer">
		<div class="container">
			<p>αlfada progetti</p>
		</div>
	</footer>

	<div class="fbtn-container-2">
		<div class="fbtn-inner">
			<a class="fbtn fbtn-red fbtn-lg" data-toggle="dropdown"><span class="fbtn-text">Velocità</span>
			<span class="fbtn-ori fa fa-tachometer"></span><span class="fbtn-sub icon icon-close"></span></a>
			<div class="fbtn-dropdown">
				<a class="fbtn fbtn-alt"><span id="distanza" class="fbtn-text"></span><span class="fa fa-road"></span></a> 
				<a class="fbtn fbtn-alt"><span id="speed" class="fbtn-text"></span><span class="fa fa-tachometer"></span></a>
			</div>
		</div>
	</div>

	<div class="fbtn-container">
		<div class="fbtn-inner">
			<a class="fbtn fbtn-blue fbtn-lg" data-toggle="dropdown"><span class="fbtn-text">Altro</span>
			<span class="fbtn-ori fa fa-chevron-up"></span><span class="fbtn-sub icon icon-close"></span></a>
			<div class="fbtn-dropdown">
				<a class="fbtn fbtn-alt" data-toggle="modal" href="#video">
					<span class="fbtn-text">Visione video</span><span class="icon icon-videocam"></span></a>
				<a class="fbtn fbtn-alt" data-toggle="modal" href="#soglie">
					<span class="fbtn-text">Settaggio soglie</span><span class="fa fa-wrench"></span></a>
			</div>
		</div>
	</div>

	<script src="js/base.min.js" type="text/javascript"></script>

	<script src="js/dynamic.js"></script>
</body>
</html>