package it.tmid.model;

import java.util.LinkedList;

// Classe Bean delle Posizioni. Setto le posizioni in modo che il file "mappa.jsp" 
// riesca a prelevarle tramite le funzioni get e set sulle variabili initposition
// e finalposition

public class PositionBean {

	LinkedList <String> listinit = new LinkedList<String>();
	LinkedList <String> listfinal = new LinkedList<String>();
	String initposition;
	String finalposition;


	public LinkedList<String> getListinit() {

		return listinit;
	}

	public void addListinit(String valore){
		this.listinit.add(valore);
	}

	public void addListfinal(String valore){
		this.listfinal.add(valore);
	}

	public void setListinit(LinkedList<String> listinit) {
		this.listinit = listinit;
	}

	public LinkedList<String> getListfinal() {
		return listfinal;
	}

	public void setListfinal(LinkedList<String> listfinal) {
		this.listfinal = listfinal;
	}

	public String getInitposition() {
		return initposition;
	}

	public void setInitposition(String initposition) {
		this.initposition = initposition;
	}

	public String getFinalposition() {
		return finalposition;
	}

	public void setFinalposition(String finalposition) {
		this.finalposition = finalposition;
	}



}
