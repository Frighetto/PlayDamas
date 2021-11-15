/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 * 
 */



function exit(id){                 
     $(document).ready(function () {
        $.get('LobbyController?action=exit&tempID='+id, function (result) {
           $('#main').html(result);
        });
    });
}