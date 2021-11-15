<%--
Views should be stored under the WEB-INF folder so that
they are not accessible except through controller process.

This JSP is here to provide a redirect to the dispatcher
servlet but should be the only JSP outside of WEB-INF.

--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script>   
    $(document).ready(function () {
        $.get('RootController', function (result) {
            $('#root').html(result);
        });
    });
</script>


<div id="root">

</div>
