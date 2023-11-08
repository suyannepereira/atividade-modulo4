package model;

import java.util.Date;

public class Compra {

	private int id_Compra;
	private Date data_Compra;
	private float total_Compra;
	private Destino destino;
	private Cliente cliente;

	public Compra() {

	}

	public Compra(Date data_Compra, float total_Compra, Destino destino, Cliente cliente) {
		super();
		this.data_Compra = data_Compra;
		this.total_Compra = total_Compra;
		this.destino = destino;
		this.cliente = cliente;
	}

	public Compra(int id_Compra, Date data_Compra, float total_Compra, Destino destino, Cliente cliente) {

		this.id_Compra = id_Compra;
		this.data_Compra = data_Compra;
		this.total_Compra = total_Compra;
		this.destino = destino;
		this.cliente = cliente;
	}

	public int getId_Compra() {
		return id_Compra;
	}

	public void setId_Compra(int id_Compra) {
		this.id_Compra = id_Compra;
	}

	public Date getData_Compra() {
		return data_Compra;
	}

	public void setData_Compra(Date data_Compra) {
		this.data_Compra = data_Compra;
	}

	public float getTotal_Compra() {
		return total_Compra;
	}

	public void setTotal_Compra(float total_Compra) {
		this.total_Compra = total_Compra;
	}

	public Destino getDestino() {
		return destino;
	}

	public void setDestino(Destino destino) {
		this.destino = destino;
	}

	public Cliente getCliente() {
		return cliente;
	}

	public void setCliente(Cliente cliente) {
		this.cliente = cliente;
	}

//	@Override
//	public String toString() {
//		return "Compra [id_Compra=" + id_Compra + ", data_Compra=" + data_Compra + ", total_Compra=" + total_Compra
//				+ ", destino=" + destino.getNome_Destino() + ", cliente=" + cliente.getNome() + "]";
//	}

}
