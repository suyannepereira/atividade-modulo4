package controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ClienteDAO;
import dao.CompraDAO;
import dao.DestinoDAO;
import model.Cliente;
import model.Compra;
import model.Destino;

@WebServlet(urlPatterns = { "/compra", "/compra-save", "/compra-delete" })
public class CompraController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	ClienteDAO cldao = new ClienteDAO();
	DestinoDAO ddao = new DestinoDAO();
	CompraDAO cdao = new CompraDAO();

	public CompraController() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		List<Cliente> clientes = cldao.read();
		List<Destino> destinos = ddao.read();

		request.setAttribute("destinos", destinos);
		request.setAttribute("clientes", clientes);
		String route = request.getServletPath();
		switch (route) {
		case "/compra":
			read(request, response);
			break;
		case "/compra-save":
			save(request, response);
			break;
		case "/compra-delete":
			delete(request, response);
			break;
		default:
			response.sendRedirect("/atividade_modulo4/index.html");
			break;
		}
	}

	protected void save(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Compra compra = new Compra();
		int idCliente = Integer.parseInt(request.getParameter("idCliente"));
		int idDestino = Integer.parseInt(request.getParameter("idDestino"));

		if (request.getParameter("id") != null) {
			compra.setId_Compra(Integer.parseInt(request.getParameter("id")));
		}
		compra.setTotal_Compra(Float.parseFloat(request.getParameter("total")));
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String data = request.getParameter("data");
		try {
			compra.setData_Compra(sdf.parse(data));

		} catch (Exception e) {

		}
		compra.setCliente(cldao.readById(idCliente));
		compra.setDestino(ddao.readById(idDestino));

		cdao.save(compra);
		response.sendRedirect("/atividade_modulo4/compra");
	}

	protected void read(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<Compra> compras = cdao.read();
		request.setAttribute("compras", compras);
		RequestDispatcher rd = request.getRequestDispatcher("./compras.jsp");
		rd.forward(request, response);
	}

	protected void delete(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		cdao.delete(id);
		response.sendRedirect("compra");
	}
}
