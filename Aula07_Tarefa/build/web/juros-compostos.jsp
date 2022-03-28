<%@page import="java.io.IOException"%>
<%@page import="java.io.PrintWriter"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

        <title>Juros Compostos</title>
    </head>
    <body>
        <%@include file="WEB-INF/jspf/menu.jspf" %>
        <div class="container-fluid">    
            <h2> Juros Compostos </h2>

            <form method="post">

                Capital: <p><input type="number" name="n1" value="1"/></p>
                Juros:  <p><input type="number"  name="n2" value="1"/></p>
                Meses:  <p><input type="number"  name="n3" value="1"/></p>

                <p><input type="submit" value="Calcular"/></p>
            </form>


            <%
              
    String error = null;
        float n1 = 0, n2 = 0;
        int n3 = 0;

        try {
            String p1 = request.getParameter("n1");
            String p2 = request.getParameter("n2");
            String p3 = request.getParameter("n3");
            n1 = Float.parseFloat(p1);
            n2 = Float.parseFloat(p2);
            n3 = Integer.parseInt(p3);

        } catch (Exception e) {
            error = e.getMessage();
        }

        if (error != null) {
            out.println("<span style = 'color: red'>Erro ao tentar ler parametros</span>");
        } else {
            out.println("<div>");
            out.println(String.format("<p> Valor Futuro: %.0f</p>", n1 * Math.pow((1 + (n2 / 100)), n3)));
            out.println("</div>");
        }
        %>

        </div> 
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
    </body>
</html>
