package model;

public class Cliente {

	private int id;
	private String nome;
	private String email;
	private String tel;
	private String senha;

	public Cliente() {
	}

	public Cliente(int id, String nome, String email, String tel, String senha) {

		this.id = id;
		this.nome = nome;
		this.email = email;
		this.tel = tel;
		this.senha = senha;
	}

	public Cliente(String nome, String email, String tel, String senha) {

		this.nome = nome;
		this.email = email;
		this.tel = tel;
		this.senha = senha;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getSenha() {
		return senha;
	}

	public void setSenha(String senha) {
		this.senha = senha;
	}

	// tostring
		@Override   
		public String toString() {
			return "Cliente [id=" + id + ", nome=" + nome + ", email=" + email + ", tel=" + tel + ", senha=" + senha + "]";
		}
}
