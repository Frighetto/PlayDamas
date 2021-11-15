<%-- 
    Document   : Game
    Created on : 17/01/2016, 08:46:38
    Author     : Lucas
<button onclick="exitGameSession()">sair</button>
--%>

<%@page import="model.Game"%>
<%@page import="model.Player"%>
<%
    Player player = (Player) request.getAttribute("player");
    Game game = (Game) request.getAttribute("game");
%>
<script>
    function exitGameSession() {
        myGameStopFunction();
        $(document).ready(function () {
            $.get('GameSessionController?action=exitGame&tempID=' + '<%=player.getTempId()%>', function (result) {
                $('#main').html(result);
            });
        });
    }


</script>


<div id="session">

</div>



<script>   
    refreshGame();
    var playerID = '<%=player.getTempId()%>';
    var gameInterval;
    var side = '<%=game.getSide(player.getId())%>';
    $(document).ready(function () {
        gameInterval = setInterval(function () {
            refreshGame();
        }, 2000);
    });
    function myGameStopFunction() {
        clearInterval(gameInterval);
    }

    function refreshGame() {

        $.get('GameSessionController?action=getGameState&tempID=' + '<%=player.getTempId()%>', function (result) {
            gerarTabuleiro(result);
        });

    }

    function gerarTabuleiro(tabuleiro) {

        if (tabuleiro[0] === "1" || tabuleiro[0] === "2") {
            myGameStopFunction();
            if (tabuleiro[0] === side) {
                alert("Você venceu!");
            } else {
                alert("Você perdeu!");
            }

        } else {

            if (side === "2") {
                tabuleiro = reverse(tabuleiro);
            }

            var novo = "";

            for (var i = 0; i < tabuleiro.length; i++) {
                if (i < 4 || i >= 8 && i < 12 || i >= 16 && i < 20 || i >= 24 && i < 28) {
                    novo += tabBranco();
                }
                if (side === "2") {
                    novo += getSlot(tabuleiro[(i)], (31 - i));
                } else {
                    novo += getSlot(tabuleiro[i], i);
                }
                if (i >= 4 && i < 8 || i >= 12 && i < 16 || i >= 20 && i < 24 || i >= 28 && i < 31) {
                    novo += tabBranco();
                }
                if ((i + 1) % 4 === 0 && i < 31) {
                    novo += "<br>";
                }

            }

            novo += exit(playerID, "exit");
            document.getElementById("session").innerHTML = novo;
        }
    }

    function getSlot(slot, i) {
        switch (slot) {
            case "p":
                return tabPreto();
            case "P":
                return tabPretoSelecionado(i);
            case "b":
                return pecaBranca();
            case "B":
                return pecaBrancaAzul(i);
            case "v":
                return pecaVermelha();
            case "V":
                return pecaVermelhaAzul(i);
            case "w":
                return damaBranca();
            case "W":
                return damaBrancaAzul(i);
            case "r":
                return damaVermelha();
            case "R":
                return damaVermelhaAzul(i);
            case "C":
                return pecaBrancaSelecionada(i);
            case "U":
                return pecaVermelhaSelecionada(i);
            case "X":
                return damaBrancaSelecionada(i);
            case "S":
                return damaVermelhaSelecionada(i);
        }
    }


    function tabBranco() {
        return  "<img src='img/tab-branco.png'/>";
    }
    function tabPreto() {
        return  "<img src='img/tab-preto.png'/>";
    }
    function tabPretoSelecionado(i) {
        return "<img class=\"ponteiro\" src='img/tab-preto-sel.png' onfocus=\"if(this.blur)this.blur()\" onclick=\"updateSession('" + i + "')\"/>";
    }
    function pecaBranca() {
        return  "<img src='img/tab-pecab.png'/>";
    }
    function pecaBrancaAzul(i) {
        return "<img class=\"ponteiro\" src='img/tab-pecab-azul.png' onfocus=\"if(this.blur)this.blur()\" onclick=\"updateSession('" + i + "')\"/>";
    }
    function pecaVermelha() {
        return  "<img src='img/tab-pecav.png'/>";
    }
    function pecaVermelhaAzul(i) {
        return "<img class=\"ponteiro\" src='img/tab-pecav-azul.png' onfocus=\"if(this.blur)this.blur()\" onclick=\"updateSession('" + i + "')\"/>";
    }
    function damaBranca() {
        return  "<img src='img/tab-damab.png'/>";
    }
    function damaBrancaAzul(i) {
        return "<img class=\"ponteiro\" src='img/tab-damab-azul.png' onfocus=\"if(this.blur)this.blur()\" onclick=\"updateSession('" + i + "')\"/>";
    }
    function damaVermelha() {
        return  "<img src='img/tab-damav.png'/>";
    }
    function damaVermelhaAzul(i) {
        return "<img class=\"ponteiro\" src='img/tab-damav-azul.png' onfocus=\"if(this.blur)this.blur()\" onclick=\"updateSession('" + i + "')\"/>";
    }
    function pecaBrancaSelecionada(i) {
        return "<img class=\"ponteiro\" src='img/tab-pecab-sel.png' onfocus=\"if(this.blur)this.blur()\" onclick=\"updateSession('" + i + "')\"/>";
    }
    function pecaVermelhaSelecionada(i) {
        return "<img class=\"ponteiro\" src='img/tab-pecav-sel.png' onfocus=\"if(this.blur)this.blur()\" onclick=\"updateSession('" + i + "')\"/>";
    }
    function damaBrancaSelecionada(i) {
        return "<img class=\"ponteiro\" src='img/tab-damab-sel.png' onfocus=\"if(this.blur)this.blur()\" onclick=\"updateSession('" + i + "')\"/>";
    }
    function damaVermelhaSelecionada(i) {
        return "<img class=\"ponteiro\" src='img/tab-damav-sel.png' onfocus=\"if(this.blur)this.blur()\" onclick=\"updateSession('" + i + "')\"/>";
    }
    function exit(i) {
        return "<img class=\"ponteiro\" src='img/sair.gif' onfocus=\"if(this.blur)this.blur()\" onclick=\"exitGameSession()\"/>";
    }

    function updateSession(i) {
        $.get('GameSessionController?action=updateGameState&tempID=' + '<%=player.getTempId()%>' + '&mov=' + i, function (result) {
            gerarTabuleiro(result);
        });
    }


    function reverse(s) {
        var o = '';
        for (var i = s.length - 1; i >= 0; i--) {
            o += s[i];
        }
        return o;
    }
</script>

<style>

    img{
        height: 70px;
        width: 70px;
    } 
</style>
