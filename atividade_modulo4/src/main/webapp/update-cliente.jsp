<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="jstl"%>

<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="assets/css/Style.css" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css">
    <title>Cadastro</title>
</head>
<body>
    <header>
        <nav class="navbar bg-info navbar-dark navbar-expand-sm sticky-top">
            <div class="container-fluid justify-content-around">
                <a href="index.html" class="navbar-brand d-flex align-items-center">
                    <!-- Ícone do Bootstrap Icons -->
                    <i class="bi bi-airplane-engines fs-4 me-2"></i>AgeTravel
                </a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#menuNavbar">
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
        <div class="row">
            <div class="col-md-6">
                <form action="./cliente-save">
                    <h2>Atualizar</h2>
                    <div class="mb-3">
                        <label for="id" class="form-label">Id</label>
                        <input value="${cliente.id}" type="text" class="form-control" id="id" name="id">
                    </div>
                    <div class="mb-3">
                        <label for="nome" class="form-label">Nome</label>
                        <input value="${cliente.nome}" type="text" class="form-control" id="nome" name="nome" placeholder="Digite seu nome">
                    </div>
                    <div class="mb-3">
                        <label for="email" class="form-label">Email</label>
                        <input value="${cliente.email}" type="email" class="form-control" id="email" name="email" placeholder="Digite seu email">
                    </div>
                    <div class="mb-3">
                        <label for="telefone" class="form-label">Telefone</label>
                        <input value="${cliente.tel}" type="tel" class="form-control" id="telefone" name="telefone" placeholder="Digite seu telefone">
                    </div>
                    <div class="mb-3">
                        <label for="senha" class="form-label">Senha</label>
                        <input value="${cliente.senha}" type="password" class="form-control" id="senha" name="senha" placeholder="Senha">
                    </div>
                    <button type="submit" class="btn btn-info">Atualizar</button>
                </form>
            </div>
            <div class="col-md-6">
                <img src="assets/image/cadastro.png" class="img-fluid" alt="Imagem de fundo">
            </div>
        </div>
    </div>
    
    <script
    src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
    integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
    crossorigin="anonymous"
  ></script></body>
</html>
