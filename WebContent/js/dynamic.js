/* SCRIPT "dynamic.js".
 * Viene utilizzato per scrivere in modo dinamico nelle pagina LoginPage.jsp e
 * RegistrPage.jsp quando il login o la registrazione non sono andate a buon fine
 */

function loginfailed(val){
	var valore = parseFloat(val);
	
 	if (valore==1)
 		document.getElementById("margin-no-top").innerHTML="<br /><strong>Username o Password errati.</strong>";
 	if (valore==2)
 		document.getElementById("margin-no-top").innerHTML="<br /><strong>Registrazione effettuata con successo. Accedi.</strong>";
}

function regfailed(val){
	
	var valore = parseFloat(val);
 	if (valore==1)
 		document.getElementById("margin-no-top").innerHTML="<br /><strong>Utente gi&agrave; registrato o Email non valida. Riprovare</strong>";
 	
}

function sogliefailed(val){
	var valore = parseFloat(val);
	if (valore==1)
		document.getElementById("margin-no-top").innerHTML="<br /><strong>C'è un problema nelle soglie inserite. Riprovare</strong>";
	if (valore==2)
		document.getElementById("margin-no-top").innerHTML="<br /><strong>Soglie inserite con successo.</strong>";
}

function setpass(val){
	var valore = parseFloat(val);
	if (valore==1)
		document.getElementById("margin-no-top").innerHTML="<br /><strong>Password attuale errata. Riprovare.</strong>";
	
	
if (valore==2)
	document.getElementById("margin-no-top").innerHTML="<br /><strong>Password settata con successo.</strong>";
}


