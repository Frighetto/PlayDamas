<%-- 
    Document   : User
    Created on : 18/01/2016, 18:50:35
    Author     : Lucas
--%>

<%@page import="java.util.Map"%>
<%@page import="model.Message"%>
<%@page import="model.UserModel"%>
<%@page import="model.Player"%>
<%
    Player player = (Player) request.getAttribute("player");
    UserModel userModel = (UserModel) UserModel.instance();
%>
<script>

    $(document).ready(function () {
        var interval = setInterval(function () {
            $.get('UserController?action=getUserPage&tempID=' + '<%=player.getTempId()%>', function (result) {
                $('#contacts').html(result);
            });
            myStopFunctionPlayers(interval);
        }, 2000);
    });
    function myStopFunctionPlayers(interval) {
        clearInterval(interval);
    }
    function enviarMensagem(id) {

    <%
        if (player.getGameId() == null) {
    %>
        $('#LobbyImputMessage').val('/' + id + ':');
    <%
    } else {
    %>
        $('#GameSessionImputMessage').val('/' + id + ':');
    <%
          }
    %>
    }
</script>
<table>
    <thead>
        <tr>
            <td>
                Contatos online(<%=userModel.getContactsOnline(player)%>)                        
            </td>
        </tr>
    </thead>
    <%
        for (String contact : player.getContacts()) {
    %>      
    <tr>
        <td>             
            <button onclick="enviarMensagem('<%=contact%>')"><%=contact%></button>   
            (<%=userModel.isOnline(contact)%>)    
        </td>
        <td><button onclick="updateFriends('<%=contact%>', '<%=UserModel.instance().isAdded(player.getId(), contact)%>')"><%=UserModel.instance().isAdded(player.getId(), contact)%> </button> </td>
    </tr>
    <%
        }
    %>

</table>