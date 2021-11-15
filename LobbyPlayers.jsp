<%-- 
    Document   : LobbyPlayers
    Created on : 15/01/2016, 15:13:40
    Author     : Lucas
--%>

<%@page import="model.UserModel"%>
<%@page import="model.LobbyModel"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.Player"%>

<%
    Player playerx = (Player) request.getAttribute("player");
    ArrayList<Player> players = (ArrayList<Player>) model.LobbyModel.instance().getOtherPlayers(playerx.getId());
    Map<String, ArrayList<String>> challenges = model.LobbyModel.getChallenges();
    LobbyModel lobbyModel = model.LobbyModel.instance();
    UserModel userModel = (UserModel) UserModel.instance();
%>

<script>
    function goToGameSession() {
        $(document).ready(function () {
            $.get('GameSessionController?action=getGameSession&tempID=' + '<%=playerx.getTempId()%>', function (result) {
                $('#main').html(result);
            });
        });
    }

    function goToIndex() {
        $(document).ready(function () {
            $.get('IndexController', function (result) {
                $('#main').html(result);
            });
        });
    }

    function challenge(challenged, type) {
        switch (type) {
            case 'desafiar':
                singleChallenge(challenged);
                break;
            case 'iniciar':
                singleChallenge(challenged);
                break;
            case 'cancelar':
                cancelSingleChallenge(challenged);
                break;
        }
    }

    function singleChallenge(singleChallenge) {
        $(document).ready(function () {
            $.get('LobbyController?action=singleChallenge&tempID=' + '<%=playerx.getTempId()%>' + '&singleChallenge=' + singleChallenge, function (result) {
                if (result === 'success') {
                    goToGameSession();
                }
                if (result === 'challenged') {
                    updatePlayers()();
                }
            });
        });
    }

    function challengeBySkill(skill) {
        $(document).ready(function () {
            $.get('LobbyController?action=challengeBySkill&tempID=' + '<%=playerx.getTempId()%>' + '&skill=' + skill, function (result) {
                if (result === 'success') {
                    goToGameSession();
                }
                if (result === 'challenged') {
                    updatePlayers()();
                }
            });
        });
    }

    function challengeAll() {
        $(document).ready(function () {
            $.get('LobbyController?action=challengeAll&tempID=' + '<%=playerx.getTempId()%>', function (result) {
                if (result === 'success') {
                    goToGameSession();
                }
                if (result === 'challenged') {
                    updatePlayers()();
                }
            });
        });
    }

    function cancelSingleChallenge(singleChallenge) {

        $(document).ready(function () {
            $.get('LobbyController?action=cancelSingleChallenge&tempID=' + '<%=playerx.getTempId()%>' + '&singleChallenge=' + singleChallenge, function (result) {
                if (result === 'success') {
                    updatePlayers();
                }
            });
        });
    }

    function cancelChallengesBySkill(skill) {
        $(document).ready(function () {
            $.get('LobbyController?action=cancelChallengesBySkill&tempID=' + '<%=playerx.getTempId()%>' + '&skill=' + skill, function (result) {
                if (result === 'success') {
                    updatePlayers();
                }
            });
        });
    }

    function cancelAllChallenges() {
        $(document).ready(function () {
            $.get('LobbyController?action=cancelAllChallenges&tempID=' + '<%=playerx.getTempId()%>' + '&challenge=all', function (result) {
                if (result === 'success') {
                    updatePlayers();
                }
            });
        });
    }

    $(document).ready(function () {
        var interval = setInterval(function () {
            checkPlayerState();
            myStopFunctionPlayers(interval);
        }, 2000);
    });
    function myStopFunctionPlayers(interval) {
        clearInterval(interval);
    }

    function checkPlayerState() {

        $.get('UserController?action=getPlayerState&tempID=' + '<%=playerx.getTempId()%>', function (result) {

            switch (result) {
                case 'available':
                    updatePlayers();
                    break;
                case 'busy':
                    goToGameSession();
                    break;
                case 'offline':
                    goToIndex();
                    break;
            }
        });


    }

    function updatePlayers() {
        $.get('LobbyController?action=getPlayers&tempID=' + '<%=playerx.getTempId()%>', function (result) {
            if (result === 'notInLobby') {
                checkPlayerState();
            } else {
                var playerTable = document.getElementById('playersOnLobby');
                var scrollPosition = playerTable.scrollTop;
                $('#players').html(result);
                playerTable = document.getElementById('playersOnLobby');
                playerTable.scrollTop = scrollPosition;
            }
        });
    }
    function updateFriends(userName, action) {
        switch (action) {
            case 'adicionar':
                $.get('UserController?action=addContact&tempID=' + '<%=playerx.getTempId()%>' + '&contact=' + userName, function (result) {
                    if (result === 'success') {
                        updatePlayers();
                    }
                });
                break;
            case 'remover':
                $.get('UserController?action=removeContact&tempID=' + '<%=playerx.getTempId()%>' + '&contact=' + userName, function (result) {
                    if (result === 'success') {
                        updatePlayers();
                    }
                });
                break;
        }
    }

    function blockPlayer(name) {    
        $.get('UserController?action=blockPlayer&tempID=' + '<%=playerx.getTempId()%>' + '&name=' + name, function (result) {
            if (result === 'success') {                
                updatePlayers();
            }
        });
    }

</script>

<button onclick="challengeAll()">desafiar todos</button>
<button onclick="challengeBySkill('beginner')">desafiar iniciantes</button>
<button onclick="challengeBySkill('intermediate')">desafiar intermediários</button>
<button onclick="challengeBySkill('expert')">desafiar especialístas</button>
<button onclick="cancelAllChallenges()">cancelar desafios</button>
<button onclick="exit()">sair</button>



<div id="playersOnLobby" class="playerList">
    <table class="challengeTable"  border="1">
        <thead align="left">
            <tr>
                <th>Nome</th>
                <th>Nível</th>
                <th>#</th>
                <th>#</th>
            </tr>
        </thead>
        <%
            for (int i = 0; i < players.size(); i += 1) {
                boolean setChallenge = true;
        %>      
        <tr>      
            <td><%=players.get(i).getId()%></td>
            <td><button onclick="updateFriends('<%=players.get(i).getId()%>', '<%=UserModel.instance().isAdded(playerx.getId(), players.get(i).getId())%>')"><%=UserModel.instance().isAdded(playerx.getId(), players.get(i).getId())%> </button> </td>
            <td><%=players.get(i).getSkill()%></td> 
            <td><button onclick="challenge('<%=players.get(i).getId()%>', '<%=lobbyModel.getChallengeSituation(playerx.getId(), players.get(i).getId())%>')"><%=lobbyModel.getChallengeSituation(playerx.getId(), players.get(i).getId())%></button></td>            
            <td><button onclick="blockPlayer('<%=players.get(i).getId()%>')"><%=userModel.isBlocked(players.get(i).getId(), playerx.getBlockedPlayers())%></button></td>
        </tr>
        <%
            }
        %>
    </table>
</div>


<style>        
    .playerList {   
        height: 400px;
        text-align:left;
        width:600px;    
        overflow: auto;
    }

    .challengeTable{
        width:600px

    }
</style>
