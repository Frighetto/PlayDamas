<%-- 
    Document   : LobbyMessageList
    Created on : 14/01/2016, 16:37:19
    Author     : Lucas 
--%>
<%@page import="model.Player"%>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<%
    Player LobbyPlayer = (Player) request.getAttribute("player");
%>
<script>

    $('#LobbyMessagesList').val($('#LobbyMessagesList').val() + '                                          Bem vindo!');

    var PrivateLastMessageIndex;
    var LobbyLastMessageIndex;
    var LobbyNewMessages;

    $.get('MessageController?action=getAllMessages' + '&tempID=' + '<%=LobbyPlayer.getTempId()%>' + '&currentChat=' + 'lobby', function (result) {
        LobbyUpdateMessages(result);
        var textarea = document.getElementById('LobbyMessagesList');
        textarea.scrollTop = textarea.scrollHeight;
    });

    var LobbyNewMessagesInterval = setInterval(function () {
        $.get('MessageController?action=seekNewMessages' + '&tempID=' + '<%=LobbyPlayer.getTempId()%>' + '&lastMessageIndex=' + LobbyLastMessageIndex + '&privateLastMessageIndex=' + PrivateLastMessageIndex + '&currentChat=' + 'lobby', function (result) {
            var tam = result + '';
            if (tam.length === 0) {
                clearInterval(LobbyNewMessagesInterval);
            }
            LobbyUpdateMessages(result);
        });
    }, 2000);

    function LobbyUpdateMessages(message) {
        var private;
        for (var i = 0; i < message.length; i++) {
            if (message[i] === '$') {
                private = i;
            }
            if (message[i] === '#') {
                if (PrivateLastMessageIndex === message.slice(0, private) && LobbyLastMessageIndex === message.slice(private + 1, i)) {
                    break;
                }
                PrivateLastMessageIndex = message.slice(0, private);
                LobbyLastMessageIndex = message.slice(private + 1, i);
                if (message.length !== i + 1) {
                    LobbyNewMessages = message.slice(i + 1, message.length);
                    $('#LobbyMessagesList').val($('#LobbyMessagesList').val() + '\n' + LobbyNewMessages);
                    LobbyAdjustMessagesScroll();
                    break;
                }
            }
        }
    }


    function LobbyAdjustMessagesScroll() {
        var textarea = document.getElementById('LobbyMessagesList');
        if (textarea.scrollHeight - textarea.scrollTop === 137) {
            textarea.scrollTop = textarea.scrollHeight;
        }
    }
</script>

<textarea id="LobbyMessagesList" rows="8" cols="100" readonly="readonly"></textarea>
<br>
<textarea id="LobbyImputMessage" rows="1" cols="100" onkeypress="LobbyCheckEnterKey();"></textarea>

<script>

    function LobbyCheckEnterKey() {
        var key = window.event.keyCode;
        if (key === 13) {
            $.get('MessageController?action=addMessage&message=' + document.getElementById("LobbyImputMessage").value + '&tempID=' + '<%=LobbyPlayer.getTempId()%>' + '&lastMessageIndex=' + LobbyLastMessageIndex + '&privateLastMessageIndex=' + PrivateLastMessageIndex + '&currentChat=' + 'lobby', function (result) {

                LobbyUpdateMessages(result);
            });
            document.getElementById("LobbyImputMessage").value = "";
        }
    }
</script>
