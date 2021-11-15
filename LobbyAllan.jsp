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
        <script src="bootstrap-editable.js"></script>
        <script src="jquery.mockjax.js"></script>
        <link rel="stylesheet" type="text/css" href="bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="bootstrap-combined.min.css">
        <link rel="stylesheet" type="text/css" href="bootstrap-editable.css">
        <link rel="stylesheet" type="text/css" href="bootstraptable.css">
        <link rel="stylesheet" type="text/css" href="bootstrap.css">
        <link rel="stylesheet" href="font-awesome.min.css">


        <script>
            teste();
        </script>

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
                            <span class="sr-only"></span> 
                            <span class="icon-bar"></span> 
                            <span class="icon-bar"></span> 
                            <span class="icon-bar"></span> 
                        </button>
                        <a class="navbar-brand">Checkers Game</a> 
                    </div>

                    <!-- Collect the nav links, forms, and other content for toggling -->
                    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">


                        <ul class="nav navbar-nav navbar-right">

                            <li class="dropdown">
                            
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false"><span class="glyphicon glyphicon-user"></span> 
                                Perfil<span class="caret"></span></a>
                            <ul class="dropdown-menu" role="menu">
                                <li><span class="edit"><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Nome do Usuário<p></span></li>
                                <li><span class="edit"><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;E-mail</p></span></li>
                                <li>Usuário desde: </li>
                                <li class="divider"></li>
                                <li>Ranking: Intermediário</li>
                                <li>Nº Partidas Jogadas</li>
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
                    <%-- INICIO MENU ESQUERDO --%>
                    <div class="panel-group" id="accordion">
                        <div class="panel panel-info">
                            <div class="panel-heading">
                                <h4 class="panel-title">
                                    <p><a href="#collpaseone" data-toggle="collapse" data-parent="accordion">
                                            Desafiar </a>
                                </h4>
                            </div>
                            <div id="collpaseone" class="panel-collapse collapse in">
                                <div class="panel-body">
                                    <p><a href="#collpaseone" data-toggle="collapse" data-parent="accordion">
                                            Desafiar Todos </a></p>
                                    <p><a href="#collpaseone" data-toggle="collapse" data-parent="accordion">
                                            Iniciante </a></p>
                                    <p><a href="#collpaseone" data-toggle="collapse" data-parent="accordion">
                                            Intermediário </a></p>
                                    <p><a href="#collpaseone" data-toggle="collapse" data-parent="accordion">
                                            Avançado </a></p>
                                </div>
                            </div>
                        </div>
                        <p><center><button onclick="login()" class="btn btn-danger">Cancelar Desafios</button></center></p>

                    </div>
                    <%-- FIM MENU ESQUERDO --%>
                </div>

                <div class="col-sm-8 col-lg-8x">
                    <%-- INICIO TABELA COM LISTA DOS JOGADORES --%>


                    <div class="container">
                        <div class="row">
                            <div class="col-xs-8">
                                <div class="table-responsive">
                                    <table summary="This table shows how to create responsive tables using Bootstrap's default functionality" class="table table-bordered table-hover">
                                        <caption class="text-center">Lista de Jogadores do Checkers Game: </caption>
                                        <thead>
                                            <tr>
                                                <th>ID</th>
                                                <th>Usuário</th>
                                                <th><center><span class="glyphicon glyphicon-plus"></span></center></th>
                                        <th><center><span class="glyphicon glyphicon-minus"></span></center></th>
                                        <th><center>Bloquear</center></th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td>1</td>
                                                <td>Fulano de Tal</td>
                                                <td><center><a href="" class="btn btn-default"><span class="glyphicon glyphicon-plus"></span><span class="glyphicon glyphicon-user"></span></a></center></td>
                                        <td><center><a href="" class="btn btn-default"><span class="glyphicon glyphicon-minus"></span><span class="glyphicon glyphicon-user"></span></a></center></td>
                                        <td><center><a href="" class="btn btn-default"><span class="glyphicon glyphicon-ban-circle"></span><span class="glyphicon glyphicon-user"></span></a></center></td>

                                        </tr>

                                        </tbody>
                                        <tfoot>
                                            <tr>
                                                <td colspan="5" class="text-center">Checkers Game</td>
                                            </tr>
                                        </tfoot>
                                    </table>
                                </div><!--end of .table-responsive-->
                            </div>
                        </div>
                    </div>
                    <%-- FIM TABELA COM LISTA DOS JOGADORES --%>




                </div>
                <div class="col-sm-2 col-lg-2 ">
                    <%-- INICIO PAINEL DIREITO --%>

                    <div class="panel-group" id="accordion">
                        <div class="panel panel-default" id="panel1">
                            <div class="panel-heading">
                                <h4 class="panel-title">
                                    <a data-toggle="collapse" data-target="#collapseOne" href="#collapseOne">
                                        Jogadores Online - (#20)
                                    </a>
                                </h4>

                            </div>
                            <div id="collapseOne" class="panel-collapse collapse in">
                                <div class="panel-body">1 - Fulano de tal</div>
                            </div>
                        </div>
                        <div class="panel panel-default" id="panel2">
                            <div class="panel-heading">
                                <h4 class="panel-title">
                                    <a data-toggle="collapse" data-target="#collapseTwo" href="#collapseTwo" class="collapsed">
                                        Jogadores Offline - (#5)
                                    </a>
                                </h4>

                            </div>
                            <div id="collapseTwo" class="panel-collapse collapse">
                                <div class="panel-body"> 1 - Fulano de Tal</div>
                            </div>
                        </div>

                    </div>



                    <%-- FIM PAINEL DIREITO --%>
                </div>
            </div>
        </div>


        <div class="container">
            <div class="row">
                <div class="col-sm-12">

                    <fieldset class="form-group col-lg-12">
                        <label for="exampleTextarea">Chat: </label>
                        <textarea class="form-control" id="exampleTextarea" rows="3"></textarea>
                    </fieldset>
                    <div class="row">
                        <!-- /.col-lg-6 -->
                        <div class="col-lg-12">
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
















        <script>
            // setting defaults for the editable
            $.fn.editable.defaults.mode = 'inline';
            $.fn.editable.defaults.showbuttons = false;
            $.fn.editable.defaults.url = '/post';
            $.fn.editable.defaults.type = 'text';

            // make all items having class 'edit' editable
            $('.edit').editable();

            // make username1 editable
            $('#username1').editable({
                type: 'text',
                pk: 1,
                url: '/post',
                title: 'Enter username'
            });

            //ajax emulation
            $.mockjax({
                url: '/post',
                responseTime: 200,
                response: function (settings) {
                    console.log('done!');
                }
            });

            // this is to automatically make the next item in the table editable
            $('.edit').on('save', function (e, params) {
                var that = this;
                // persist the old value in the element to be restored when clicking reset
                var oldItemValue = $(that)[0].innerHTML;
                if (!$(that).attr('oldValue')) {
                    console.log('persisting original value: ' + oldItemValue)
                    $(that).attr('oldValue', oldItemValue);
                }
                setTimeout(function () {
                    // first search the row
                    var item = $(that).closest('td').next().find('.edit');
                    console.log(item);
                    if (item.length == 0) {
                        // check the next row
                        item = $(that).closest('tr').next().find('.edit');
                    }
                    item.editable('show');
                }, 200);
            });

            $('#resetbtn').click(function () {
                $('.edit').each(function () {
                    var o = $(this);
                    o.editable('setValue', o.attr('oldValue'))	//clear values
                            .editable('option', 'pk', o.attr('pk'))	//clear pk
                            .removeClass('editable-unsaved')
                            .removeAttr('oldValue');
                });
            });

            $('#savebtn').click(function () {
                $('.edit').editable('submit', {
                    url: '/post',
                    //ajaxOptions: { dataType: 'json' },           
                    success: function (data, config) {
                        $(this).removeClass('editable-unsaved') //remove unsaved class
                                .removeAttr('oldValue');	// clear oldValue
                    },
                    error: function (errors) {
                        console.log('error');
                        var msg = '';
                        if (errors && errors.responseText) { //ajax error, errors = xhr object
                            msg = errors.responseText;
                        } else { //validation error (client-side or server-side)
                            $.each(errors, function (k, v) {
                                msg += k + ": " + v + "<br>";
                            });
                        }
                    }
                });
            });

        </script>



    </body>
</html>
