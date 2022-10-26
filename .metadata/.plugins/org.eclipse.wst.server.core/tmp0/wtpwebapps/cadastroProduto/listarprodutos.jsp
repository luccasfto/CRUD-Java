<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
 
<!DOCTYPE html>
<html>

<head>
 <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>LISTAR PRODUTO</title>
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
	
	<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>		
    
    <script> 
    	$(function(){
    		$(".alterarproduto").click(function(){
    			var celula = $(this).parent("td");
    			var elementos = $(celula).siblings("td");
    			var codigo = elementos[0].innerText;
    			$(this).attr("href","consultarproduto?codigo="+codigo);
    		});
    		
    		$(".excluirproduto").click(function(){
    			decisao = confirm("Confirmar a exclus�o?");
    			if(!decisao){
    				return false;
    			}else{
    				var celula = $(this).parent("td");
        			var elementos = $(celula).siblings("td");
        			var codigo = elementos[0].innerText;
        			
        			$.ajax({
        				type:"GET",
        				url: "excluirproduto",
        				data:"codigo="+codigo,
        				sucess:function(response){
        					$("#mensagens").html(response);
        				},
        				error:function(response){
        					$("#mensagens").html(response);
							return false;
        				}
        			});
					$(this).parent().parent().remove();

    			}
    		});
    	});
    </script>
    
</head>

<body>
    
    
    <div id="container" class="container">
    	<h1>Luccas Fernando Taddeo de Oliveira - 20191107828</h1>
    	<div id="mensagens">
    		${msg}
    	</div>
    
        <form name="formulario" id="idform" method="get" action="listarproduto">

			<div class="form-row">
				<div class="form-group col-md-6">
					<label>Nome do Produto:</label>
					<input class="form-control" type="text" id="nome" name="nome"/>
					</div>
			
			</div>
			<button class="btn btn-primary" type="submit" id="btnconsultar">Consultar</button>
			<button class="btn btn-default" type="reset" id="btnlimpar">Limpar</button>
		</form>
		
		<br />
		
		<table border="1" class="table table-striped">
			<thead class="bg-primary">
				<th>C�digo</th>
				<th>Nome</th>
				<th>A��es</th>
			</thead>
			
			<tbody>
					<c:forEach var="produto" items="${lp}">
						<tr>
							<td>${produto.codigo}</td>
							<td>${produto.nome} </td>
							<td>
								<a class="alterarproduto" href="#"><img src="edit-pencil.png" style="float:left; margin:5px" width="30px" /></a>
								<a class="excluirproduto" href="#"><img src="exclude.png" style="float:left; margin:5px" width="30px" /></a>
							</td>
						</tr>
					</c:forEach>
								
			</tbody>
		</table>
	</div>

</body>
</html>
