<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="jstl"%>
<!DOCTYPE html>
<html lang="pt-br">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="assets/css/Style.css" />
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css">
<title>Cadastro</title>
</head>
<body>
	<header>
		<nav class="navbar bg-info navbar-dark navbar-expand-sm sticky-top">
			<div class="container-fluid justify-content-around">
				<a href="index.html" class="navbar-brand d-flex align-items-center">
					<!-- Ícone do Bootstrap Icons --> <i
					class="bi bi-airplane-engines fs-4 me-2"></i>AgeTravel
				</a>
				<button class="navbar-toggler" type="button"
					data-bs-toggle="collapse" data-bs-target="#menuNavbar">
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
				<table class="table">
					<thead>
						<tr>
							<th scope="col">Id</th>
							<th scope="col">Nome</th>
							<th scope="col">Telefone</th>
							<th scope="col">Email</th>
							<th scope="col">Ações</th>
						</tr>
					</thead>
					<tbody>
						<jstl:forEach items="${clientes}" var="c">
							<tr>
								<td>${c.id}</td>
								<td>${c.nome}</td>
								<td>${c.tel}</td>
								<td>${c.email}</td>

								<td>
									<button class="btn btn-primary mb-1" data-bs-toggle="modal" data-bs-target="#editar${c.id}">Editar</button> 
									<a href="cliente-delete?id=${c.id}"	onclick="return confirm('Deseja excluir ${c.nome}?')"
									class="btn btn-danger mb-1">Excluir</a></td>

							</tr>
							
							

<!-- Modal de editar-->
<div class="modal fade" id="editar${c.id}" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="exampleModalLabel">Editar</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
         <form action="./cliente-save">
                    
                        <input value="${c.id}" type="text" class="form-control" id="id" name="id" readonly hidden>
                    
                    <div class="mb-3">
                        <label for="nome" class="form-label">Nome</label>
                        <input value="${c.nome}" type="text" class="form-control" id="nome" name="nome" placeholder="Digite seu nome">
                    </div>
                    <div class="mb-3">
                        <label for="email" class="form-label">Email</label>
                        <input value="${c.email}" type="email" class="form-control" id="email" name="email" placeholder="Digite seu email">
                    </div>
                    <div class="mb-3">
                        <label for="telefone" class="form-label">Telefone</label>
                        <input value="${c.tel}" type="tel" class="form-control" id="telefone" name="telefone" placeholder="Digite seu telefone">
                    </div>
                    <div class="mb-3">
                        <label for="senha" class="form-label">Senha</label>
                        <input value="${c.senha}" type="password" class="form-control" id="senha" name="senha" placeholder="Senha">
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

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
		crossorigin="anonymous"></script>
</body>
</html>
