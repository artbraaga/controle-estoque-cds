<%-- 
    Document   : resultadoConsulta
    Created on : 08/03/2017, 18:27:50
    Author     : DesenvolvedorJava
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="s" uri="http://www.springframework.org/tags/form"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Lista de CDs</title>
        <script src="https://code.jquery.com/jquery-2.2.4.min.js" integrity="sha256-BbhdlvQf/xTY9gja0Dq3HiwQF8LaCRTXxZKRutelT44=" crossorigin="anonymous"></script>
        <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
    </head>
    <style>
        .box {
            background: #ffffff;
            margin-top: 10%;
            padding:30px;
            padding-top:0;
            border-radius: 20px;
            border: 1px solid #000000;
            
        }
        body {
            background-image: url('http://comoeonde.com/wp-content/uploads/2012/07/capas-cd.jpeg');
            background-attachment: fixed;
        }
    </style>
    <body>
        <div class="container">
            <div class="col-md-6 col-md-offset-3 box">
                <h2 class="text-center">Lista de CDs Cadastrados </h2>
                <div class="bs-example" data-example-id="striped-table">
                    <table class="table table-striped">
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>Título</th>
                                <th>Artista</th>
                                <th>Gênero</th>
                                <th>Ano de Lançamento</th>
                                <th></th>
                                <th></th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${listaCds}" var="cd" >
                                <tr>
                                    <th scope="row">${cd.id}</th>
                                    <td>${cd.titulo}</td>
                                    <td>${cd.artista}</td>
                                    <td>${cd.genero}</td>
                                    <td>${cd.lancamento}</td>
                                    <td>
                                        <a data-toggle="modal" data-target="#myModal"
                                           data-id="${cd.id}"
                                           data-titulo="${cd.titulo}"
                                           data-artista="${cd.artista}"
                                           data-genero="${cd.genero}"
                                           data-lancamento="${cd.lancamento}"
                                           onClick="getData(this);"
                                           class="btn btn-primary">Editar</a>
                                    </td>
                                    <td>
                                        <a href="excluirCd.htm?id=${cd.id}" class="btn btn-danger">Excluir</a>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                        
                        
                        </table>
                    <h3 class="text-center"><a href="preparaCadastrarCd.htm" class="btn btn-success"> Cadastrar CDs</a></h3>
                        <h3 class="text-center"><a href="index.htm" class="btn btn-warning"/> Voltar</a></h3>
                    
                </div>
            </div>
        </div>
        <div id="myModal" class="modal fade" role="dialog">
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title">Editar</h4>
      </div>
      <div class="modal-body">
        <s:form action="editarCd.htm" method="POST" modelAttribute="cd">
                    <div class="form-group">
                       <label>Título </label>
                       <s:hidden path="id" name="id" id="id" />
                       <s:input path="titulo" name="titulo" id="titulo" class="form-control" />
                     </div>
                     <div class="form-group">
                       <label>Artista: </label>
                       <s:input path="artista" name="artista" id="artista" class="form-control" />
                     </div>
                     <div class="form-group">
                       <label>Gênero: </label>
                       <s:input path="genero" name="genero" id="genero" class="form-control" />
                     </div>
                     <div class="form-group">
                       <label>Ano de Lançamento: </label>
                       <s:input path="lancamento" name="lancamento" id="lancamento" class="form-control" />
                     </div>
                     <input type="submit" class="btn btn-success" value="Editar"/>
                     <input type="reset" class="btn btn-primary" value="Limpar"/>
                     
                </s:form>
            </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-danger" data-dismiss="modal">Fechar</button>
      </div>
    </div>

  </div>
</div>
        <script>
            var link = window.location.href;
            var link = link.split('/');
            var pagina = link[4].split('/');
            
            var n = pagina[0].indexOf("excluir");
            console.log(n);
            console.log(pagina);
            if(n >= 0){
                window.location.replace("http://localhost:8080/projetoarthurmatias/listarCds.htm");    
            }
            var cd =[];
            function getData(obj) {
                var id = obj.getAttribute('data-id'),
                    titulo = obj.getAttribute('data-titulo'),
                    artista = obj.getAttribute('data-artista'),
                    genero = obj.getAttribute('data-genero'),
                    lancamento = obj.getAttribute('data-lancamento');
            cd = [id, titulo, artista, genero, lancamento];
            document.getElementById("id").value = cd[0];
            document.getElementById("titulo").value = cd[1];
            document.getElementById("artista").value = cd[2];
            document.getElementById("genero").value = cd[3];
            document.getElementById("lancamento").value = cd[4];
            }
        </script>
    </body>
</html>
