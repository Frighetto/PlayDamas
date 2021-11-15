<%-- 
    Document   : GameSession
    Created on : 17/01/2016, 07:54:43
    Author     : Lucas
--%>

<%@page import="model.Player"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<%
    Player player = (Player) request.getAttribute("player");
%>

<title>Game</title>

<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>

<script>
    $.get('GameSessionController?action=getGame&tempID=' + '<%=player.getTempId()%>', function (result) {
        $('#game').html(result);
    });

    $.get('GameSessionController?action=getChat&tempID=' + '<%=player.getTempId()%>', function (result) {
        $('#gameChat').html(result);
    });

    $(document).ready(function () {
        $.get('UserController?action=getUserPage&tempID=' + '<%=player.getTempId()%>', function (result) {
            $('#contacts').html(result);
        });
    });

</script>

<body>   



    <main class="flex-centralizado">

        <section>
            <div id="game"></div>
        </section>

        <aside>
            <div id="contacts"></div>
        </aside>

    </main>
    <footer>
        <div id="gameChat"></div>               
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
