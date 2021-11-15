<%-- 
    Document   : lobby
    Created on : 24/02/2016, 17:56:54
    Author     : allan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>

        <script src="jquery.min.js"></script>
        <script src="bootstrap.min.js"></script>
        <link rel="stylesheet" type="text/css" href="bootstrap.min.css">


        <link href="font-awesome.min" rel="stylesheet">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Jogo de Damas</title>
    </head>
    <body>



        <div class="container">
            

               <nav class="navbar navbar-default">
                    <div class="container-fluid"> 
                        <!-- Brand and toggle get grouped for better mobile display -->
                        <div class="navbar-header">
                            <button type="button" class="navbar-toggle collapsed" 
                                    data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                                <span class="sr-only">Toggle navigation</span> 
                                <span class="icon-bar"></span> 
                                <span class="icon-bar"></span> 
                                <span class="icon-bar"></span> 
                            </button>
                            <a class="navbar-brand">Checkers Game</a> 
                        </div>

                        <!-- Collect the nav links, forms, and other content for toggling -->
                        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                            
                            
                            <ul class="nav navbar-nav navbar-right">
                                
                                <li class="dropdown"> <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">
                                      Perfil <span class="caret"></span></a>
                                    <ul class="dropdown-menu" role="menu">
                                        <li><a href="#">Action</a></li>
                                        <li><a href="#">Another action</a></li>
                                        <li><a href="#">Something else here</a></li>
                                        <li class="divider"></li>
                                        <li><a href="#">Separated link</a></li>
                                    </ul>
                                </li>
                                <li><a href="#">Sair</a></li>
                            </ul>
                        </div>
                        <!-- /.navbar-collapse --> 
                    </div>
                    <!-- /.container-fluid --> 
                </nav>
            



        </div>
        <br>
        <br>
        <br>
        <div class="container">
             <div class="row">
                <div class="col-sm-2 col-lg-2">
                    <h3>Menu Esquerdo</h3> <p>O vídeo fornece uma maneira poderosa de ajudá-lo a provar seu argumento. Ao clicar em Vídeo Online, você pode colar o código de inserção do vídeo que deseja adicionar. Você também pode digitar uma palavra-chave para pesquisar online o vídeo mais adequado ao seu documento.</p>
                </div>
                <div class="col-sm-8 col-lg-7x">
                    <h3>Tabuleiro!</h3> <p>Para dar ao documento uma aparência profissional, o Word fornece designs de cabeçalho, rodapé, folha de rosto e caixa de texto que se complementam entre si. Por exemplo, você pode adicionar uma folha de rosto, um cabeçalho e uma barra lateral correspondentes.</p>
                </div>
                <div class="col-sm-2 col-lg-2 ">
                    <h3>Menu Direito!</h3> <p>Clique em Inserir e escolha os elementos desejados nas diferentes galerias. Temas e estilos também ajudam a manter seu documento coordenado. Quando você clica em Design e escolhe um novo tema, as imagens, gráficos e elementos gráficos SmartArt são alterados para corresponder ao novo tema.</p>
                </div>
            </div>
        </div>
    

            <div class="container">
                <div class="row">
                    <div class="col-sm-12">

                        <fieldset class="form-group">
                            <label for="exampleTextarea">Example textarea</label>
                            <textarea class="form-control" id="exampleTextarea" rows="3"></textarea>
                        </fieldset>
                        <div class="row">
                            <!-- /.col-lg-6 -->
                            <div class="col-lg-6">
                                <div class="input-group">
                                    <input type="text" class="form-control" placeholder="Digite sua mensagem...">
                                    <span class="input-group-btn">
                                        <button class="btn btn-default" type="button">Enviar</button>
                                    </span>
                                </div><!-- /input-group -->
                            </div><!-- /.col-lg-6 -->
                        </div><!-- /.row -->

                    </div>
                </div>
            </div>

            <ul id="contextMenu" class="dropdown-menu" role="menu">
                <li><a tabindex="-1" href="#">Action</a></li>
                <li><a tabindex="-1" href="#">Another action</a></li>
                <li><a tabindex="-1" href="#">Something else here</a></li>
                <li class="divider"></li>
                <li><a tabindex="-1" href="#">Separated link</a></li>
            </ul>







            <table id="myTable" class="table table-hover">
                <thead>
                    <tr>
                        <th>#</th>
                        <th>Test</th>
                        <th>Last Name</th>
                        <th>Username</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>1</td>
                        <td>Mark</td>
                        <td>Otto</td>
                        <td>@mdo</td>
                    </tr>
                    <tr>
                        <td>2</td>
                        <td>Jacob</td>
                        <td>Thornton</td>
                        <td>@fat</td>
                    </tr>
                    <tr>
                        <td>3</td>
                        <td>Larry</td>
                        <td>the Bird</td>
                        <td>@twitter</td>
                    </tr>
                </tbody>
            </table>

            <ul id="contextMenu" class="dropdown-menu" role="menu" style="display:none" >
                <li><a tabindex="-1" href="#"><div id="1"></div></a></li>
                <li><a tabindex="-1" href="#">Another action</a></li>
                <li><a tabindex="-1" href="#">Something else here</a></li>
                <li class="divider"></li>
                <li><a tabindex="-1" href="#">Separated link</a></li>
            </ul>






    </body>
</html>
