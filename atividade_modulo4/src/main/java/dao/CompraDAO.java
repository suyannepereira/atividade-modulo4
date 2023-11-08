package dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import connection.ConnectionMySQL;
import model.Cliente;
import model.Compra;
import model.Destino;

public class CompraDAO {

	// create
	public void save(Compra compra) {
		String sql;

		Connection conn = null;
		PreparedStatement pstm = null;

		try {
			 sql = compra.getId_Compra()==0?
					 "insert into Compra (data_Compra, total_Compra, id_Destino, id_Cliente) values (?, ?, ?, ?)"
					 :
				"UPDATE Compra SET data_Compra = ?, total_Compra = ?, id_Destino = ?, id_Cliente = ? WHERE id_Compra = ?";
					
			conn = ConnectionMySQL.createConnectionMySQL();

			pstm = conn.prepareStatement(sql);

			pstm.setDate(1, new Date(compra.getData_Compra().getTime()));
			pstm.setDouble(2, compra.getTotal_Compra());
			pstm.setInt(3, compra.getDestino().getId_Destino());
			pstm.setInt(4, compra.getCliente().getId());
			if(compra.getId_Compra()!=0) {
				pstm.setInt(5, compra.getId_Compra());
			}
			pstm.execute();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (pstm != null) {
					pstm.close();
				}
				if (conn != null) {
					conn.close();
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

	}

	// read
	public List<Compra> read() {
		List<Compra> compras = new ArrayList<Compra>();
		String sql = "select * from cliente_destino order by id_Compra";

		Connection conn = null;
		PreparedStatement pstm = null;
		ResultSet rset = null;

		try {

			conn = ConnectionMySQL.createConnectionMySQL();

			pstm = conn.prepareStatement(sql);

			rset = pstm.executeQuery();

			while (rset.next()) {
				Compra compra = new Compra();
				Destino destino = new Destino();
				Cliente cliente = new Cliente();

				compra.setId_Compra(rset.getInt("id_Compra"));
				compra.setData_Compra(rset.getDate("data_Compra"));
				compra.setTotal_Compra(rset.getFloat("total_Compra"));

				destino.setId_Destino(rset.getInt("id_Destino"));
				destino.setNome_Destino(rset.getString("nome_Destino"));
				destino.setPreco_Destino(rset.getFloat("preco_Destino"));
				destino.setData_Destino(rset.getDate("data_Destino"));

				cliente.setId(rset.getInt("id_Cliente"));
				cliente.setNome(rset.getString("nome"));
				cliente.setEmail(rset.getString("email"));
				cliente.setTel(rset.getString("tel"));
				cliente.setSenha(rset.getString("senha"));

				compra.setDestino(destino);
				compra.setCliente(cliente);

				compras.add(compra);
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (pstm != null) {
					pstm.close();
				}
				if (conn != null) {
					conn.close();
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		return compras;
	}

	

	// delete
	public void delete(int id) {
		String sql = "DELETE FROM compra WHERE id_Compra = ?";

		Connection conn = null;
		PreparedStatement pstm = null;

		try {

			conn = ConnectionMySQL.createConnectionMySQL();

			pstm = conn.prepareStatement(sql);

			pstm.setInt(1, id);

			pstm.execute();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (pstm != null) {
					pstm.close();
				}
				if (conn != null) {
					conn.close();
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

	}

	// readById
	public Compra readById(int id) {
		Compra compra = new Compra();
		String sql = "select * from compra WHERE id_Compra = ?";

		Connection conn = null;
		PreparedStatement pstm = null;
		ResultSet rset = null;

		try {
			conn = ConnectionMySQL.createConnectionMySQL();

			pstm = conn.prepareStatement(sql);

			pstm.setInt(1, id);

			rset = pstm.executeQuery();

			rset.next();

			Destino destino = new Destino();
			Cliente cliente = new Cliente();
			int id_Cliente = rset.getInt("id_Cliente");
			int id_Destino = rset.getInt("id_Destino");

			compra.setId_Compra(rset.getInt("id_Compra"));
			compra.setData_Compra(rset.getDate("data_Compra"));
			compra.setTotal_Compra(rset.getFloat("total_Compra"));

			ClienteDAO clienteDAO = new ClienteDAO();
			DestinoDAO destinoDAO = new DestinoDAO();
			
			cliente = clienteDAO.readById(id_Cliente);
			destino = destinoDAO.readById(id_Destino);
			
			compra.setDestino(destino);
			compra.setCliente(cliente);

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (pstm != null) {
					pstm.close();
				}
				if (conn != null) {
					conn.close();
				}
			} catch (Exception e) {
				e.printStackTrace(); 
			}
		}
		return compra;
	}

}
