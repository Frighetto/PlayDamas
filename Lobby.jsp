<%-- 
    Document   : Lobby
    Created on : 31/12/2015, 07:25:38
    Author     : Lucas
--%>

<%@page import="model.Message"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.Player"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Lobby</title>   

<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script src="Lobby.js"></script>

<script>
    <%
        Player player = (Player) request.getAttribute("player");
    %>

    $(document).ready(function () {
        $.get('LobbyController?action=getChat&tempID=' + '<%=player.getTempId()%>', function (result) {
            $('#lobbyChat').html(result);
        });
    });

    $(document).ready(function () {
        $.get('LobbyController?action=getPlayers&tempID=' + '<%=player.getTempId()%>', function (result) {
            $('#players').html(result);
        });
    });

    $(document).ready(function () {
        $.get('UserController?action=getUserPage&tempID=' + '<%=player.getTempId()%>', function (result) {
            $('#contacts').html(result);
        });
    });

   
    function exit() {
        $(document).ready(function () {
            $.get('LobbyController?action=exit&tempID=' + '<%=player.getTempId()%>', function (result) {
                $('#main').html(result);
            });
        });
    }
</script>


<body>   


   
    <nav class="navbar navbar-inverse navbar-fixed-top">

        <div class="container">

            <div id="navbar" class="navbar-collapse collapse">
                <div class="navbar-form navbar-right">

                </div>
            </div><!--/.navbar-collapse -->
        </div>
    </nav>    


    <main class="flex-centralizado">

        <section>
            <div id="players"></div>
        </section>

        <aside>
            <div id="contacts"></div>
        </aside>

    </main>
    <footer>
        <div id="lobbyChat"></div>               
    </footer>

</body>


<style>   
    .flex-centralizado {
        display: flex;
        justify-content: center;
    }

    header {                
        text-align:center;        
    }
    aside {

    }
    section {        

    }
    footer {       
        color:white;
        clear:both;
        text-align:center;
        padding:5px; 
    }
</style>