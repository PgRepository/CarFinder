package it.tmid.model;

public class UserBean {

	private String username;
	private String password;
	private String passwordnuova;
	private String firstName;
	private String lastName;
	private String email;
	private String targa;
	private float soglia1;
	private float soglia2;
	public boolean valid;


	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String newFirstName) {
		firstName = newFirstName;
	}


	public String getLastName() {
		return lastName;
	}

	public void setLastName(String newLastName) {
		lastName = newLastName;
	}


	public String getPassword() {
		return password;
	}

	public void setPassword(String newPassword) {
		password = newPassword;
	}
	
	public String getPasswordNuova(){
		return passwordnuova;
	}

	public void setPasswordNuova(String newPassword){
		passwordnuova = newPassword;
	}

	public String getUsername() {
		return username;
	}

	public void setUserName(String newUsername) {
		username = newUsername;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String newEmail) {
		email = newEmail;
	}

	public String getTarga() {
		return targa;
	}

	public void setTarga(String newTarga) {
		targa = newTarga;
	}

	public boolean isValid() {
		return valid;
	}

	public void setValid(boolean newValid) {
		valid = newValid;
	}

	public float getSoglia1() {
		return soglia1;
	}

	public void setSoglia1(float soglia1) {
		this.soglia1 = soglia1;
	}

	public float getSoglia2() {
		return soglia2;
	}

	public void setSoglia2(float soglia2) {
		this.soglia2 = soglia2;
	}	
}
