<?php
session_start();
$temp_id = $_SESSION['temp_id'];
?>
<!DOCTYPE html>
<html>
    <head>
        <title>Play Damas</title>
        <meta charset="utf-8">        
        <meta name="viewport" content="width=device-width, initial-scale=1">                                   
        <meta name="author" content="Lucas Fernando Frighetto">
        <link rel="icon" href="icon.png">                    
        <link href="bootstrap/bootstrap.css" rel="stylesheet">            
        <link href="index.css" rel="stylesheet"> 
        <link href="lobby.css" rel="stylesheet">  
        <script src="jquery.min.js"></script>
        <script>
            var temp_id = <?php echo $temp_id ?>;           
            requestLobbyPlayers();

            setInterval(() => { requestLobbyPlayers() }, 15000);

            function requestLobbyPlayers(){
                var url = 'lobbyPlayers.php?temp_id=' + temp_id;
                $.get(url, (result) => { processRequest(result) });  
            }

            function challenge(selectedPlayer, option){
                var url = "challenge.php?temp_id=" + temp_id + "&player=" + selectedPlayer + "&option=" + option;
                $.get(url, (result) => { processRequest(result) })
            }            

            function processRequest(request){
                if(request == "onGame"){
                    var form = document.getElementById("game");
                    form.submit();
                } else {
                    generateTable(request);
                }
            }

            function optionClass(option){
                switch (option){
                    case 'Cancelar' : return "btn btn-primary";
                    case 'Aceitar' : return "btn btn-success";
                    case 'Desafiar' : return "btn btn-danger";
                    default : return "btn btn-default";
                }
            }
           
            function generateTable(players) {                
                players = JSON.parse(players);
                var tbody = document.createElement("tbody");
                for(var i = 0; i < players.length; i++){
                    var player = players[i];
                    var tr = document.createElement("tr");
                    var td = document.createElement("td");
                    td.setAttribute('style', 'text-align: center; vertical-align: middle; width: 150px');
                    td.innerHTML = player['username'];
                    tr.appendChild(td);

                    td = document.createElement("td");
                    td.setAttribute('style', 'text-align: center');                       

                    var button = document.createElement("button");  
                    button.setAttribute('style', 'width: 100px');     
                    var option = player['challenge_option'];
                    button.setAttribute('onclick', 'challenge(' + player['id'] + ', "' + option + '")');                                                      
                    button.setAttribute('class', optionClass(option));                   
                    button.innerHTML = option;                       
                    td.appendChild(button);
                    tr.appendChild(td);
                    tbody.appendChild(tr);
                }                    
                document.getElementById("lobbyTable").innerHTML = tbody.innerHTML;                                                                                   
            }
        </script>                                         
    </head>
    <body style="overflow-y: none">
        <form id="game" style="display: none" action="/game.php" method="POST" onsubmit="this.source.value=this.outerHTML"> 
            <input name="temp_id" value="<?php echo $temp_id ?>"></input>
        </form> 
        <nav class="navbar navbar-inverse navbar-fixed-top">
            <div class="container">
                <div id="navbar" class="navbar-collapse collapse">
                    <div class="navbar-form navbar-right form-group">
                        <button href="index.html" class="btn btn-primary">Sair</button>
                    </div>
                </div>
            </div>
        </nav>
        <div style="margin-top: 50px;"> </div>
        <div style="width: 400px; margin: auto;">
            <div class="tableFixHead">
                <table class="table">
                    <thead>
                        <tr>
                            <th style="text-align: center" scope="col">Usuário</th>                            
                            <th style="text-align: center" scope="col"></th>                
                        </tr>
                    </thead>
                    <tbody id="lobbyTable">
                        
                    </tbody>
                </table>
            </div>
        </div>
    </body>
</html>
