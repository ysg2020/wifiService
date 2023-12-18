<%@ page import = "src.main.wifi.*" %>
<%@ page import = "src.main.wifi.vo.*" %>
<%@ page import = "java.util.List" %>
<%@ page contentType = "text/html; charset=utf-8" %>
<html>
<body>
    <%
            request.setCharacterEncoding("UTF-8");
            int id = 0;
            WifiService wifiService = new WifiService();
            if(request.getParameter("id") != null){
                id = Integer.parseInt(request.getParameter("id"));

            }
            wifiService.removeBmk(id);
            response.sendRedirect("/bookmark-list.jsp");
    %>

</body>
</html>