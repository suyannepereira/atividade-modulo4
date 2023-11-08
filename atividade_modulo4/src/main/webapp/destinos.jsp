<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="jstl"%>
<!DOCTYPE html>
<html lang="pt-br">
  <head>
    <meta charset="UTF-8" />
    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.18.1/font/bootstrap-icons.css"
      rel="stylesheet"
    />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
      rel="stylesheet"
      integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
      crossorigin="anonymous"
    />
    <title>Destinos</title>
  </head>
  <body>
    <header>
      <nav class="navbar bg-info navbar-dark navbar-expand-sm sticky-top">
        <div class="container-fluid justify-content-around">
          <a href="index.html" class="navbar-brand d-flex align-items-center">
            <!-- Ícone do Bootstrap Icons -->
            <i class="bi bi-airplane-engines fs-4 me-2"></i>AgeTravel
          </a>
          <button
            class="navbar-toggler"
            type="button"
            data-bs-toggle="collapse"
            data-bs-target="#menuNavbar"
          >
            <span class="navbar-toggler-icon"></span>
          </button>
          <div class="collapse navbar-collapse" id="menuNavbar">
            <div class="navbar-nav ms-auto">
              <a href="index.html" class="nav-link active">Home</a>
              <a href="destino.html" class="nav-link active">Destinos</a>
              <a href="promocao.html" class="nav-link active">Promoções</a>
              <a href="contato.html" class="nav-link active">Contato</a>
              <a href="cadastro.html" class="nav-link active">Cadastro</a>
            </div>
          </div>
        </div>
      </nav>
    </header>
   
	<div class="container mt-5">
	<h2>Destino</h2>
		<button class="btn btn-primary mb-1" data-bs-toggle="modal" data-bs-target="#criar">Criar</button> 
	
				<table class="table">
					<thead>
						<tr>
							<th scope="col">Id</th>
							<th scope="col">Data</th>
							<th scope="col">Nome</th>
							<th scope="col">Preço</th>
						</tr>
					</thead>
					<tbody>
						<jstl:forEach items="${destinos}" var="d">
							<tr>
								<td>${d.id_Destino}</td>
								<td>${d.data_Destino}</td>
								<td>${d.nome_Destino}</td>
								<td>${d.preco_Destino}</td>

								<td>
									<button class="btn btn-primary mb-1" data-bs-toggle="modal" data-bs-target="#editar${d.id_Destino}">Editar</button> 
									<a href="destino-delete?id=${d.id_Destino}"	onclick="return confirm('Deseja excluir ${d.nome_Destino}?')"
									class="btn btn-danger mb-1">Excluir</a></td>

							</tr>
							
							

<!-- Modal de editar-->
<div class="modal fade" id="editar${d.id_Destino}" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="exampleModalLabel">Editar</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
         <form action="./destino-save">
                    
                        <input value="${d.id_Destino}" type="text" class="form-control" id="id" name="id" readonly hidden>
                    
                    <div class="mb-3">
                        <label for="nome" class="form-label">Nome</label>
                        <input value="${d.nome_Destino}" type="text" class="form-control" id="nome" name="nome" placeholder="Digite seu nome">
                    </div>
                    <div class="mb-3">
                        <label for="data" class="form-label">Data</label>
                        <input value="${d.data_Destino}" type="date" class="form-control" id="data" name="data" placeholder="Digite a data da viagem">
                    </div>
                    <div class="mb-3">
                        <label for="preco" class="form-label">Preço</label>
                        <input value="${d.preco_Destino}" type="number" class="form-control" id="preco" name="preco" placeholder="Digite o preço">
                    </div>
                    <button type="submit" class="btn btn-info">Atualizar</button>
                </form>
      </div>
<!--       <div class="modal-footer"> -->
<!--         <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button> -->
<!--         <button type="button" class="btn btn-primary">Save changes</button> -->
<!--       </div> -->
    </div>
  </div>
</div>
							
						</jstl:forEach>

					</tbody>
				</table>

	</div>



<!-- Modal de criar-->
<div class="modal fade" id="criar" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="exampleModalLabel">Criar</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
         <form action="./destino-save">
                    
<%--                         <input value="${destino.id_Destino}" type="text" class="form-control" id="id" name="id" readonly hidden> --%>
                    
                    <div class="mb-3">
                        <label for="nome" class="form-label">Nome</label>
                        <input value="${destino.nome_Destino}" type="text" class="form-control" id="nome" name="nome" placeholder="Digite seu nome">
                    </div>
                    <div class="mb-3">
                        <label for="data" class="form-label">Data</label>
                        <input value="${destino.data_Destino}" type="date" class="form-control" id="data" name="data" placeholder="Digite a data da viagem">
                    </div>
                    <div class="mb-3">
                        <label for="preco" class="form-label">Preço</label>
                        <input value="${destino.preco_Destino}" type="number" class="form-control" id="preco" name="preco" placeholder="Digite o preço">
                    </div>
                    <button type="submit" class="btn btn-info">Atualizar</button>
                </form>
      </div>
<!--       <div class="modal-footer"> -->
<!--         <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button> -->
<!--         <button type="button" class="btn btn-primary">Save changes</button> -->
<!--       </div> -->
    </div>
  </div>
</div>
		




	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
		crossorigin="anonymous"></script>


  </body>
</html>
