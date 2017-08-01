<%-- 
    Document   : cadastroPessoa
    Created on : 10/03/2017, 18:30:41
    Author     : DesenvolvedorJava
--%>
<%@taglib prefix="s" uri="http://www.springframework.org/tags/form"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cadastro de Cds</title>
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
                <h2 class="text-center">Cadastro de CDs</h2>
                <s:form action="cadastrarCd.htm" method="POST" modelAttribute="cd">
                    <div class="form-group">
                       <label>Titulo: </label>
                       <s:input path="titulo" class="form-control" />
                     </div>
                     <div class="form-group">
                       <label>Artista: </label>
                       <s:input path="artista" class="form-control" />
                     </div>
                     <div class="form-group">
                       <label>Gênero: </label>
                       <s:input path="genero" class="form-control" />
                     </div>
                     <div class="form-group">
                       <label>Ano de Lançamento: </label>
                       <s:input path="lancamento" class="form-control" />
                     </div>
                     <input type="submit" class="btn btn-success" value="Cadastrar"/>
                        <input type="reset" class="btn btn-primary" value="Limpar"/> 
                        
                        <a href="index.htm" class="btn btn-warning"/> Voltar</a>
                </s:form>
            </div>
        </div>
    </body>
</html>
