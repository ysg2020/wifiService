<%@ page import = "src.main.wifi.*" %>
<%@ page import = "src.main.wifi.vo.*" %>
<%@ page import = "java.util.List" %>
<%@ page contentType = "text/html; charset=utf-8" %>
<html>
<body>
    <%
            request.setCharacterEncoding("UTF-8");
            String bmk_nm = "";
            String main_nm = "";
            WifiService wifiService = new WifiService();
            if(request.getParameter("bmk_nm") != null && request.getParameter("main_nm") != null){
                bmk_nm = request.getParameter("bmk_nm");
                main_nm = request.getParameter("main_nm");

            }
            wifiService.saveBmk(bmk_nm,main_nm);
            response.sendRedirect("/bookmark-list.jsp");
    %>

</body>
</html>