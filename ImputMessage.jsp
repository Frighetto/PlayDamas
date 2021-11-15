<%-- 
    Document   : ImputMessage
    Created on : 21/02/2016, 15:53:54
    Author     : Lucas
--%>

<%@page import="model.Player"%>
<textarea id="imputMessage" rows="1" cols="100" onkeypress="imputMessageCheckEnterKey();"></textarea>
<script>
    <%
        Player imputMessagePlayer = (Player) request.getAttribute("player");
    %>
        
    function updateMessageList(message) {
    <%
        if (imputMessagePlayer.getGameId() == null) {
    %>
        LobbyUpdateMessages(message);
    <%
    } else {
    %>
        GameSessionUpdateMessages(message);
    <%
        }
    %>
    }
    
    function imputMessageCheckEnterKey() {
        var key = window.event.keyCode;
        if (key === 13) {
            $.get('MessageImputController?action=addMessage&message=' + document.getElementById("imputMessage").value + '&tempID=' + '<%=imputMessagePlayer.getTempId()%>', function (result) {
                updateMessageList(result);
            });
            document.getElementById("imputMessage").value = "";
        }
    }
</script>
