<%-- 
    Document   : GameSessionChat
    Created on : 17/01/2016, 08:30:24
    Author     : Lucas
--%>

<%@page import="model.Player"%>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<%
    Player GameSessionPlayer = (Player) request.getAttribute("player");
%>
<script>

    $('#GameSessionMessagesList').val($('#GameSessionMessagesList').val() + '                                          Boa sorte!');

    var PrivateLastMessageIndex;
    var GameSessionLastMessageIndex;
    var GameSessionNewMessages;

    $.get('MessageController?action=getAllMessages' + '&tempID=' + '<%=GameSessionPlayer.getTempId()%>' + '&currentChat=' + 'gameSession', function (result) {
        GameSessionUpdateMessages(result);
        var textarea = document.getElementById('GameSessionMessagesList');
        textarea.scrollTop = textarea.scrollHeight;
    });

    var GameSessionNewMessagesInterval = setInterval(function () {
        $.get('MessageController?action=seekNewMessages' + '&tempID=' + '<%=GameSessionPlayer.getTempId()%>' + '&lastMessageIndex=' + GameSessionLastMessageIndex + '&privateLastMessageIndex=' + PrivateLastMessageIndex + '&currentChat=' + 'gameSession', function (result) {
            var tam = result + '';
            if (tam.length === 0) {
                clearInterval(GameSessionNewMessagesInterval);
            }
            GameSessionUpdateMessages(result);
        });
    }, 2000);

    function GameSessionUpdateMessages(message) {
        var private;
        for (var i = 0; i < message.length; i++) {
            if (message[i] === '$') {
                private = i;
            }
            if (message[i] === '#') {
                if (PrivateLastMessageIndex === message.slice(0, private) && GameSessionLastMessageIndex === message.slice(private + 1, i)) {
                    break;
                }
                PrivateLastMessageIndex = message.slice(0, private);
                GameSessionLastMessageIndex = message.slice(private + 1, i);
                if (message.length !== i + 1) {
                    GameSessionNewMessages = message.slice(i + 1, message.length);
                    $('#GameSessionMessagesList').val($('#GameSessionMessagesList').val() + '\n' + GameSessionNewMessages);
                    GameSessionAdjustMessagesScroll();
                    break;
                }
            }
        }
    }


    function GameSessionAdjustMessagesScroll() {
        var textarea = document.getElementById('GameSessionMessagesList');
        if (textarea.scrollHeight - textarea.scrollTop === 137) {
            textarea.scrollTop = textarea.scrollHeight;
        }
    }
</script>

<textarea id="GameSessionMessagesList" rows="8" cols="100" readonly="readonly"></textarea>
<br>
<textarea id="GameSessionImputMessage" rows="1" cols="100" onkeypress="GameSessionCheckEnterKey();"></textarea>

<script>

    function GameSessionCheckEnterKey() {
        var key = window.event.keyCode;
        if (key === 13) {
            $.get('MessageController?action=addMessage&message=' + document.getElementById("GameSessionImputMessage").value + '&tempID=' + '<%=GameSessionPlayer.getTempId()%>' + '&lastMessageIndex=' + GameSessionLastMessageIndex + '&privateLastMessageIndex=' + PrivateLastMessageIndex + '&currentChat=' + 'gameSession', function (result) {

                GameSessionUpdateMessages(result);
            });
            document.getElementById("GameSessionImputMessage").value = "";
        }
    }
</script>
