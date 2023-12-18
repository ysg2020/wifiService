package src.main.wifi;

import src.main.wifi.vo.*;

import java.sql.*;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

public class SQLiteManager {

    private static Connection conn = null;

    public static Connection getConnection(){
        if(conn == null){
            try{
                Class.forName("org.sqlite.JDBC");
                conn = DriverManager.getConnection("jdbc:sqlite:"+"C:/Users/user/Desktop/Study/sqlite-tools-win-x64-3440200/test.db");
                System.out.println("연결 성공");
            }catch (Exception e){
                e.printStackTrace();
                System.out.println("연결 실패");
            }
        }
        return conn;
    }

    public void saveWifiInfo(WifiInfo wifiInfo) throws SQLException {
        String sql = "INSERT INTO WIFI VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
        conn = getConnection();
        PreparedStatement pstmt = conn.prepareStatement(sql);
        int size = wifiInfo.getTbPublicWifiInfo().getRow().size();
        for (int i = 0; i < size; i++) {
            Row row = wifiInfo.getTbPublicWifiInfo().getRow().get(i);
            pstmt.setString(1,row.getX_SWIFI_MGR_NO());
            pstmt.setString(2,row.getX_SWIFI_WRDOFC());
            pstmt.setString(3,row.getX_SWIFI_MAIN_NM());
            pstmt.setString(4,row.getX_SWIFI_ADRES1());
            pstmt.setString(5,row.getX_SWIFI_ADRES2());
            pstmt.setString(6,row.getX_SWIFI_INSTL_FLOOR());
            pstmt.setString(7,row.getX_SWIFI_INSTL_TY());
            pstmt.setString(8,row.getX_SWIFI_INSTL_MBY());
            pstmt.setString(9,row.getX_SWIFI_SVC_SE());
            pstmt.setString(10,row.getX_SWIFI_CMCWR());
            pstmt.setInt(11,row.getX_SWIFI_CNSTC_YEAR());
            pstmt.setString(12,row.getX_SWIFI_INOUT_DOOR());
            pstmt.setString(13,row.getX_SWIFI_REMARS3());
            pstmt.setDouble(14,row.getLNT());
            pstmt.setDouble(15,row.getLAT());
            pstmt.setString(16,row.getWORK_DTTM());
            pstmt.executeUpdate();
        }
    }

    public List<Row> getWifiInfo(double lnt , double lat) throws SQLException {
        List<Row> result = new ArrayList<>();
        String sql = "SELECT (6371* acos( cos ( radians("+lnt+") )* cos( radians( LNT  ) )* cos( radians( LAT) - radians("+lat+") )+ sin ( radians("+lnt+") ) * sin( radians(LNT)))) "
                      +"AS DISTANCE , * "
                      +"FROM WIFI "
                      +"ORDER BY DISTANCE "
                      +"LIMIT 0 , 20 ";
        conn = getConnection();
        PreparedStatement pstmt = conn.prepareStatement(sql);
        ResultSet rs = pstmt.executeQuery();
        while (rs.next()){
            Row row = new Row();
            row.setDISTANCE(rs.getDouble("DISTANCE"));
            row.setX_SWIFI_MGR_NO(rs.getString("MGR_NO"));
            row.setX_SWIFI_WRDOFC(rs.getString("WRDOFC"));
            row.setX_SWIFI_MAIN_NM(rs.getString("MAIN_NM"));
            row.setX_SWIFI_ADRES1(rs.getString("ADRES1"));
            row.setX_SWIFI_ADRES2(rs.getString("ADRES2"));
            row.setX_SWIFI_INSTL_FLOOR(rs.getString("INSTL_FLOOR"));
            row.setX_SWIFI_INSTL_TY(rs.getString("INSTL_TY"));
            row.setX_SWIFI_INSTL_MBY(rs.getString("INSTL_MBY"));
            row.setX_SWIFI_SVC_SE(rs.getString("SVC_SE"));
            row.setX_SWIFI_CMCWR(rs.getString("CMCWR"));
            row.setX_SWIFI_CNSTC_YEAR(rs.getInt("CNSTC_YEAR"));
            row.setX_SWIFI_INOUT_DOOR(rs.getString("INOUT_DOOR"));
            row.setX_SWIFI_REMARS3(rs.getString("REMARS3"));
            row.setLNT(rs.getDouble("LNT"));
            row.setLAT(rs.getDouble("LAT"));
            row.setWORK_DTTM(rs.getString("WORK_DTTM"));
            result.add(row);
        }

        return result;
    }


    public void saveHistory(double lnt , double lat) throws SQLException {
        LocalDateTime now = LocalDateTime.now();
        String sql = "INSERT INTO HISTORY VALUES (?,?,?,?)";
        conn = getConnection();
        PreparedStatement pstmt = conn.prepareStatement(sql);
        pstmt.setDouble(2,lnt);
        pstmt.setDouble(3,lat);
        pstmt.setString(4, String.valueOf(now));
        pstmt.executeUpdate();

    }

    public void removeHistory(int id) throws SQLException {
        String sql = "DELETE FROM HISTORY WHERE ID = ?";
        conn = getConnection();
        PreparedStatement pstmt = conn.prepareStatement(sql);
        pstmt.setInt(1,id);
        pstmt.executeUpdate();

    }

    public List<History> getHistory() throws SQLException {
        List<History> result = new ArrayList<>();
        String sql = "SELECT * FROM HISTORY";
        conn = getConnection();
        PreparedStatement pstmt = conn.prepareStatement(sql);
        ResultSet rs = pstmt.executeQuery();
        while (rs.next()){
            History history = new History();
            history.setID(rs.getInt("ID"));
            history.setLNT(rs.getDouble("LNT"));
            history.setLAT(rs.getDouble("LAT"));
            history.setWORK_DTTM(rs.getString("WORK_DTTM"));
            result.add(history);
        }

        return result;

    }

    public Row getWifiInfoDtl (String mgrNo) throws SQLException {
        String sql = "SELECT * FROM WIFI WHERE MGR_NO = ?";
        conn = getConnection();
        PreparedStatement pstmt = conn.prepareStatement(sql);
        pstmt.setString(1,mgrNo);
        ResultSet rs = pstmt.executeQuery();
        Row row = new Row();
        //row.setDISTANCE(rs.getDouble("DISTANCE"));
        row.setX_SWIFI_MGR_NO(rs.getString("MGR_NO"));
        row.setX_SWIFI_WRDOFC(rs.getString("WRDOFC"));
        row.setX_SWIFI_MAIN_NM(rs.getString("MAIN_NM"));
        row.setX_SWIFI_ADRES1(rs.getString("ADRES1"));
        row.setX_SWIFI_ADRES2(rs.getString("ADRES2"));
        row.setX_SWIFI_INSTL_FLOOR(rs.getString("INSTL_FLOOR"));
        row.setX_SWIFI_INSTL_TY(rs.getString("INSTL_TY"));
        row.setX_SWIFI_INSTL_MBY(rs.getString("INSTL_MBY"));
        row.setX_SWIFI_SVC_SE(rs.getString("SVC_SE"));
        row.setX_SWIFI_CMCWR(rs.getString("CMCWR"));
        row.setX_SWIFI_CNSTC_YEAR(rs.getInt("CNSTC_YEAR"));
        row.setX_SWIFI_INOUT_DOOR(rs.getString("INOUT_DOOR"));
        row.setX_SWIFI_REMARS3(rs.getString("REMARS3"));
        row.setLNT(rs.getDouble("LNT"));
        row.setLAT(rs.getDouble("LAT"));
        row.setWORK_DTTM(rs.getString("WORK_DTTM"));

        return row;

    }

    public List<BmkGrp> getBmkGrps() throws SQLException {
        List<BmkGrp> result = new ArrayList<>();
        String sql = "SELECT * FROM BMK_GRP ORDER BY SOON";
        conn = getConnection();
        PreparedStatement pstmt = conn.prepareStatement(sql);
        ResultSet rs = pstmt.executeQuery();
        while (rs.next()){
            BmkGrp bmkGrp = new BmkGrp();
            bmkGrp.setID(rs.getInt("ID"));
            bmkGrp.setBMK_NM(rs.getString("BMK_NM"));
            bmkGrp.setSOON(rs.getInt("SOON"));
            bmkGrp.setADD_DTTM(rs.getString("ADD_DTTM"));
            bmkGrp.setEDIT_DTTM(rs.getString("EDIT_DTTM"));
            result.add(bmkGrp);
        }
        return result;

    }

    public BmkGrp getBmkGrp(int id) throws SQLException {
        String sql = "SELECT * FROM BMK_GRP WHERE ID = ?";
        conn = getConnection();
        PreparedStatement pstmt = conn.prepareStatement(sql);
        pstmt.setInt(1,id);
        ResultSet rs = pstmt.executeQuery();
        BmkGrp bmkGrp = new BmkGrp();
        bmkGrp.setID(rs.getInt("ID"));
        bmkGrp.setBMK_NM(rs.getString("BMK_NM"));
        bmkGrp.setSOON(rs.getInt("SOON"));
        bmkGrp.setADD_DTTM(rs.getString("ADD_DTTM"));
        bmkGrp.setEDIT_DTTM(rs.getString("EDIT_DTTM"));
        return bmkGrp;

    }


    public void saveBmkGrp(String bmk_nm , int soon) throws SQLException {
        LocalDateTime now = LocalDateTime.now();
        String sql = "INSERT INTO BMK_GRP VALUES (?,?,?,?,?)";
        conn = getConnection();
        PreparedStatement pstmt = conn.prepareStatement(sql);
        pstmt.setString(2,bmk_nm);
        pstmt.setInt(3,soon);
        pstmt.setString(4, String.valueOf(now));
        pstmt.executeUpdate();

    }

    public void editBmkGrp(String bmk_nm , int soon, int id) throws SQLException {
        LocalDateTime now = LocalDateTime.now();
        String sql = "UPDATE BMK_GRP SET BMK_NM = ? ,SOON = ? , EDIT_DTTM = ? WHERE ID = ?";
        conn = getConnection();
        PreparedStatement pstmt = conn.prepareStatement(sql);
        pstmt.setString(1,bmk_nm);
        pstmt.setInt(2,soon);
        pstmt.setString(3, String.valueOf(now));
        pstmt.setInt(4,id);
        pstmt.executeUpdate();

    }

    public void removeBmkGrp(int id) throws SQLException {
        String sql = "DELETE FROM BMK_GRP WHERE ID = ?";
        conn = getConnection();
        PreparedStatement pstmt = conn.prepareStatement(sql);
        pstmt.setInt(1,id);
        pstmt.executeUpdate();

    }

    public List<Bmk> getBmks() throws SQLException {
        List<Bmk> result = new ArrayList<>();
        String sql = "SELECT * FROM BMK";
        conn = getConnection();
        PreparedStatement pstmt = conn.prepareStatement(sql);
        ResultSet rs = pstmt.executeQuery();
        while (rs.next()){
            Bmk bmk = new Bmk();
            bmk.setID(rs.getInt("ID"));
            bmk.setBMK_NM(rs.getString("BMK_NM"));
            bmk.setMAIN_NM(rs.getString("MAIN_NM"));
            bmk.setADD_DTTM(rs.getString("ADD_DTTM"));
            result.add(bmk);
        }
        return result;
    }

    public Bmk getBmk(int id) throws SQLException {
        String sql = "SELECT * FROM BMK WHERE ID = ?";
        conn = getConnection();
        PreparedStatement pstmt = conn.prepareStatement(sql);
        pstmt.setInt(1,id);
        ResultSet rs = pstmt.executeQuery();
        Bmk bmk = new Bmk();
        bmk.setID(rs.getInt("ID"));
        bmk.setBMK_NM(rs.getString("BMK_NM"));
        bmk.setMAIN_NM(rs.getString("MAIN_NM"));
        bmk.setADD_DTTM(rs.getString("ADD_DTTM"));
        return bmk;

    }
    public void saveBmk(String bmk_nm , String main_nm) throws SQLException {
        LocalDateTime now = LocalDateTime.now();
        String sql = "INSERT INTO BMK VALUES (?,?,?,?)";
        conn = getConnection();
        PreparedStatement pstmt = conn.prepareStatement(sql);
        pstmt.setString(2,bmk_nm);
        pstmt.setString(3,main_nm);
        pstmt.setString(4, String.valueOf(now));
        pstmt.executeUpdate();

    }

    public void removeBmk(int id) throws SQLException {
        String sql = "DELETE FROM BMK WHERE ID = ?";
        conn = getConnection();
        PreparedStatement pstmt = conn.prepareStatement(sql);
        pstmt.setInt(1,id);
        pstmt.executeUpdate();

    }


}
