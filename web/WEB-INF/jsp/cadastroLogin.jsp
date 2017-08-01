<%-- 
    Document   : login
    Created on : 13/03/2017, 18:02:17
    Author     : DesenvolvedorJava
--%>
<%@taglib prefix="s" uri="http://www.springframework.org/tags/form"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cadastro de Usuário</title>
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
            <h1 class="text-center">Cadastro de Usuário</h1>
        <s:form action="cadastrarLogin.htm" method="POST" modelAttribute="login">
        <div class="form-group">
                <label>Login: </label>
                <s:input path="login" class="form-control" />
        <div class="form-group">
                <label>Senha: </label>
                <s:password path="senha" class="form-control" />
        </div>
        <input type="submit" class="btn btn-success" value="Cadastrar"/>
        <input type="reset" class="btn btn-primary" value="Limpar"/>        
        <a href="index.htm" class="btn btn-success"/> Voltar</a>
                </s:form>
            </div>
        </div>
    </body>
</html>
