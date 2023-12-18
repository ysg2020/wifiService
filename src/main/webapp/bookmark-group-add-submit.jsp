<%@ page import = "src.main.wifi.*" %>
<%@ page import = "src.main.wifi.vo.*" %>
<%@ page import = "java.util.List" %>
<%@ page contentType = "text/html; charset=utf-8" %>
<html>
<body>
    <%
            request.setCharacterEncoding("UTF-8");
            String bmk_nm = "";
            int soon = 0;
            WifiService wifiService = new WifiService();
            if(request.getParameter("bmk_nm") != null && request.getParameter("soon") != null){
                bmk_nm = request.getParameter("bmk_nm");
                soon = Integer.parseInt(request.getParameter("soon"));

            }
            wifiService.saveBmkGrp(bmk_nm,soon);
            response.sendRedirect("/bookmark-group.jsp");
    %>

</body>
</html>