<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <script>
    $(function(){
        var settings = {
                type: 'json',
                filelimit: 1,
                allow: '*.(jpg|jpeg|png)'
        };
        
        var select = UIkit.uploadSelect($("#upload-select"), settings),
            drop = UIkit.uploadDrop($("#upload-drop"), settings);
    })
    </script>
<head>
<meta charset="UTF-8">
<title>Cadastro de Produto</title>
<spring:url value="/produto/deleta/" var="deleta"></spring:url>
<spring:url value="/produto/altera/" var="altera"></spring:url>
<spring:url value="/produto/salva" var="salva"></spring:url>
<spring:url value="/produto/" var="cancela"></spring:url>
 <link rel="stylesheet" href='<spring:url value="/resources/css/upload.min.css"/>' />
<link href='<spring:url value="/resources/css/bootstrap.css"/>'
	rel="stylesheet" />
<link href='<spring:url value="/resources/css/style.css"/>'
	rel="stylesheet" />
<script type="text/javascript"
	src='<spring:url value="/resources/js/jquery-3.4.1.min.js"/>'></script>
<script type="text/javascript"
	src='<spring:url value="/resources/js/bootstrap.js"/>'></script>
	<script src='<spring:url value="/resources/js/uikit.min.js"/>'></script>
<script src='<spring:url value="/resources/js/upload.min.js"/>'></script>
</head>
<body class="bg-dark" id="produto">
	<jsp:include page="${request.contextPath}/nav"></jsp:include>
	<div class="container my-3">
		<div class="row">
			<div class="col-lg-3" id="lateral">
				<div class="card mx-auto">
					<div class="card-body">
						<p>TODO Carrinho aqui</p>
					</div>
				</div>
			</div>
			<div class="col-lg-9">
				<div class="card mx-auto">
					<form:form class="form-horizontal" method="POST" action="${salva}"
						modelAttribute="produto" enctype="multipart/form-data">
						<h2 class="display-4 text-center mt-3">Cadastro de Produtos</h2>
						<div class="card-body">
							<c:if test="${not empty mensagemErro}">
								<div id="divMensagem" class="alert alert-danger" role="alert">
									${mensagemErro}</div>
							</c:if>
							<c:if test="${not empty mensagemSucesso}">
								<div id="divMensagem" class="alert alert-success" role="alert">
									${mensagemSucesso}</div>
							</c:if>
							<div class="">

								<form:hidden path="id" />
								<form:hidden path="imagemProd" />

								<div class="form-group form-row">
									<label for="nome" class=" col-sm-2 col-form-label text-right">Nome</label>
									<div class="col-sm-4">
										<form:input class="form-control" path="nome" />
									</div>
								</div>
								<div class="form-group form-row">
									<label class=" col-sm-2 col-form-label text-right"
										for="valorUnitario">Valor Unitario</label>
									<div class="col-sm-4">
										<form:input cssClass="form-control" path="valorUnitario" />
									</div>
								</div>
								<div class="form-group form-row">
									<label class=" col-sm-2 text-right col-form-label"
										for="valorUnitario">Foto:</label>
									<div class="arquivo col-sm-6">
										<input type="file" name="imagem" class="form-control"
											id="customFile"> <label class="custom-file-label"
											for="customFile">Escolha seu arquivo...</label>
									</div>
									
									<div class="row">
										<div class="form-group col-sm-12">
											<label class="control-label">Foto</label>

											<div id="upload-drop" class="bw-upload">
												<i class="glyphicon glyphicon-cloud-upload"></i> <span>Arraste
													a foto aqui ou</span> <a class="bw-upload-form-file">selecione
													<input id="customFile" type="file"
													accept=".jpg,.jpeg,.png" />
												</a>
											</div>
										</div>
									</div>
								</div>
								<c:if test="${produto.id ne 0}">
									<div class="form-row ">
										<div class="offset-sm-2 col-sm-6">
											<img class="rounded h-auto w-50" alt=""
												src="data:image/jpge;base64,${imagem64}">
										</div>
									</div>
									<br />
								</c:if>
								<div class="form-row">
									<div class="offset-sm-2 col-sm-2">
										<form:button class="btn btn-success" onclick="trocaImagem()"> ${produto.id == 0 ? 'Cadastrar' : 'Alterar'} </form:button>
									</div>
									<div class="col-sm-2">
										<c:if test="${produto.id ne 0}">
											<a class="btn btn-danger" href="${cancela}">Cancelar</a>
										</c:if>
									</div>
								</div>
							</div>
						</div>
					</form:form>
				</div>
				<br />
				<c:if test="${empty produtos }">
					<div class="card">
						<div class="card-body mx-auto">
							<h1 class="text-danger">Não há produtos cadastrados</h1>
						</div>
					</div>
				</c:if>
				<c:if test="${not empty produtos}">
					<div class="card mx-auto">
						<table class="table table-striped table-sm">
							<thead class="thead-danger">
								<tr>
									<th>Codigo</th>
									<th>Nome</th>
									<th>Valor Unitario</th>
									<th colspan="2">Ações</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="produto" items="${produtos}">
									<tr>
										<td>${produto.id}</td>
										<td>${produto.nome}</td>
										<td>${produto.valorUnitario}</td>
										<td><a class="btn btn-sm btn-warning"
											href="${altera}${produto.id}">Alterar</a></td>
										<td><a class="btn btn-sm btn-danger"
											href="${deleta}${produto.id}"
											onclick="return confirm('Deseja realmente deletar o produto: ${produto.nome} ?')">Deletar</a></td>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</c:if>
				<script type="text/javascript">
					$(document).ready(function() {
						$('#divMensagem').delay(5000).fadeOut('slow');
					});
					function trocaImagem() {
						if (document.getElementById("customFile").value != 0)
							document.getElementById("imagemProd").value = 0;
					};
				</script>
			</div>
		</div>
	</div>
</body>
</html>