<%-- 
    Document   : main
    Created on : 11/01/2016, 17:25:32
    Author     : Lucas
--%>

<!DOCTYPE html>
<html>

<script>
    $(document).ready(function () {
        $.get('IndexController', function (result) {
            $('#main').html(result);
        });
    });
</script>

<div id="main"></div>

</html>