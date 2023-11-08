package model;

import java.util.Date;

public class Destino {

	private int id_Destino;
	private String nome_Destino;
	private float preco_Destino;
	private Date data_Destino;

	public Destino() {

	}
	
	

	public Destino(String nome_Destino, float preco_Destino, Date data_Destino) {
		super();
		this.nome_Destino = nome_Destino;
		this.preco_Destino = preco_Destino;
		this.data_Destino = data_Destino;
	}



	public Destino(int id_Destino, String nome_Destino, float preco_Destino, Date data_Destino) {

		this.id_Destino = id_Destino;
		this.nome_Destino = nome_Destino;
		this.preco_Destino = preco_Destino;
		this.data_Destino = data_Destino;
	}

	public int getId_Destino() {
		return id_Destino;
	}

	public void setId_Destino(int id_Destino) {
		this.id_Destino = id_Destino;
	}

	public String getNome_Destino() {
		return nome_Destino;
	}

	public void setNome_Destino(String nome_Destino) {
		this.nome_Destino = nome_Destino;
	}

	public float getPreco_Destino() {
		return preco_Destino;
	}

	public void setPreco_Destino(float preco_Destino) {
		this.preco_Destino = preco_Destino;
	}

	public Date getData_Destino() {
		return data_Destino;
	}

	public void setData_Destino(Date data_Destino) {
		this.data_Destino = data_Destino;
	}



	@Override
	public String toString() {
		return "Destino [id_Destino=" + id_Destino + ", nome_Destino=" + nome_Destino + ", preco_Destino="
				+ preco_Destino + ", data_Destino=" + data_Destino + "]";
	}

	
}
