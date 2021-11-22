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
        <link href="game.css" rel="stylesheet">  
        <script src="jquery.min.js"></script>
        <script>
            var temp_id = <?php echo $_REQUEST['temp_id'] ?>;           
            requestGame();

            setInterval(() => { requestGame() }, 15000);

            function requestGame(){
                var url = 'gameState.php?temp_id=' + temp_id;
                $.get(url, (result) => { processRequest(result) });  
            }
            
            function processRequest(request){
               
            }           
            function move(){
                document.getElementById("circle").classList.remove("circle");                    
                document.getElementById("circle").classList.add("circlemove");
            }
            
        </script>                                         
    </head>
    <body style="overflow-y: none">        
        <nav class="navbar navbar-inverse navbar-fixed-top">
            <div class="container">
                <div id="navbar" class="navbar-collapse collapse">
                    <div class="navbar-form navbar-right form-group">
                        <form action="/leaveGame.php" method="POST" onsubmit="this.source.value=this.outerHTML"> 
                            <input name="temp_id" style="display: none" type="text" class="form-control" value="<?php echo $_REQUEST['temp_id'] ?>">
                            <button type="submit" class="btn btn-primary">Voltar</button>
                        </form> 
                    </div>
                </div>
            </div>
        </nav>
        <div style="margin-top: 50px;"> </div>
         
        <div style="width: 480px; height: 480px; margin: auto; background-color: black;">  
            <div class="quadradobranco" style="display: inline-block">
            </div>  
            <div class="quadradobranco2" style="display: inline-block">
            </div>                                  
            <div class="quadrado" style="display: inline-block">
                <button id="circle" class="circle" onclick="move()">
                    <div class="div-circle circle2">                    
                        <div class="div-circle circle3">                                       
                        </div>     
                    </div>            
                </button>                                 
            </div>
            <div class="quadrado2" style="display: inline-block; z-index: -1;">
            </div>            
        </div>                
    </body>
</html>
