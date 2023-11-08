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
                      <a href="destino" class="nav-link active">Destinos</a>
                      <a href="compra" class="nav-link active">Compras</a>
                      <a href="contato.html" class="nav-link active">Contato</a>
                      <a href="cadastro.html" class="nav-link active">Cadastro</a>
                      <a href="cliente" class="nav-link active">Clientes</a>
            </div>
          </div>
        </div>
      </nav>
    </header>
   
	<div class="container mt-5">
	<h2>Compra</h2>
		<button class="btn btn-primary mb-1" data-bs-toggle="modal" data-bs-target="#criar">Criar</button> 
	
				<table class="table">
					<thead>
						<tr>
							<th scope="col">Id</th>
							<th scope="col">Cliente</th>
							<th scope="col">Data</th>
							<th scope="col">Destino</th>
							<th scope="col">Total</th>
						</tr>
					</thead>
					<tbody>
						<jstl:forEach items="${compras}" var="c">
							<tr>
								<td>${c.id_Compra}</td>
								<td>${c.cliente.nome}</td>
								<td>${c.data_Compra}</td>
								<td>${c.destino.nome_Destino}</td>
								<td>${c.total_Compra}</td>

								<td>
									<button class="btn btn-primary mb-1" data-bs-toggle="modal" data-bs-target="#editar${c.id_Compra}">Editar</button> 
									<a href="compra-delete?id=${c.id_Compra}"	onclick="return confirm('Deseja excluir ${c.cliente.nome}?')"
									class="btn btn-danger mb-1">Excluir</a></td>

							</tr>
							
							

<!-- Modal de editar-->
<div class="modal fade" id="editar${c.id_Compra}" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="exampleModalLabel">Editar</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
         <form action="./compra-save">
                    
                    <input value="${c.id_Compra}" type="text" class="form-control" id="id" name="id" readonly hidden>
                    
                    <input value="${c.cliente.id}" type="text" class="form-control" id="idCliente" name="idCliente" readonly hidden>
                    <input value="${c.destino.id_Destino}" type="text" class="form-control" id="idDestino" name="idDestino" readonly hidden>
                    <div class="mb-3">
                        <label for="data" class="form-label">Data</label>
                        <input value="${c.data_Compra}" type="date" class="form-control" id="data" name="data">
                    </div>
                    <div class="mb-3">
                        <label for="preco" class="form-label">Total</label>
                        <input value="${c.total_Compra}" type="number" class="form-control" id="total" name="total" placeholder="Digite o preço">
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
         <form action="./compra-save">
                    
                    
                    <div class="mb-3">
                        <label for="idCliente" class="form-label">idCliente</label>
                        <input value="${compra.cliente.id}" type="text" class="form-control" id="idCliente" name="idCliente" placeholder="Digite seu nome">
                    </div>
                    
                     <div class="mb-3">
                        <label for="idDestino" class="form-label">idDestino</label>
                        <input value="${compra.destino.id_Destino}" type="text" class="form-control" id="idDestino" name="idDestino" placeholder="Digite o destino">
                    </div>
                                 
                    <div class="mb-3">
                        <label for="data" class="form-label">Data</label>
                        <input value="${compra.data_Compra}" type="date" class="form-control" id="data" name="data" placeholder="Digite a data da viagem">
                    </div>
                    <div class="mb-3">
                        <label for="preco" class="form-label">Total</label>
                        <input value="${compra.total_Compra}" type="number" class="form-control" id="total" name="total" placeholder="Digite o valor total">
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
