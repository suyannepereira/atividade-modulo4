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

import dao.DestinoDAO;
import model.Destino;

@WebServlet(urlPatterns = { "/destino", "/destino-save", "/destino-delete" })
public class DestinoController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	DestinoDAO ddao = new DestinoDAO();

	public DestinoController() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String route = request.getServletPath();
		switch (route) {
		case "/destino":
			read(request, response);
			break;
		case "/destino-save":
			save(request, response);
			break;
		case "/destino-delete":
			delete(request, response);
			break;
		default:
			response.sendRedirect("/atividade_modulo4/index.html");
			break;
		}
	}

	protected void save(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Destino destino = new Destino();
		if (request.getParameter("id") != null) {
			destino.setId_Destino(Integer.parseInt(request.getParameter("id")));
		}
		destino.setNome_Destino(request.getParameter("nome"));
		destino.setPreco_Destino(Float.parseFloat(request.getParameter("preco")));
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String data = request.getParameter("data");
		try {
			destino.setData_Destino(sdf.parse(data));

		} catch (Exception e) {

		}

		ddao.save(destino);
		response.sendRedirect("/atividade_modulo4/destino");
	}

	protected void read(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<Destino> destinos = ddao.read();
		request.setAttribute("destinos", destinos);
		RequestDispatcher rd = request.getRequestDispatcher("./destinos.jsp");
		rd.forward(request, response);
	}

	protected void delete(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		ddao.delete(id);
		response.sendRedirect("destino");
	}
}
