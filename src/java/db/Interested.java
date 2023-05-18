/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package db;

import java.sql.*;
import java.util.ArrayList;
import web.DatabaseListener;

/**
 *
 * @author Fatec
 */
public class Interested {

    private Integer idInteressado;
    private Integer idAutoescola;
    private Integer idCLiente;
    
    public static ArrayList<Interested> getTotalInteresteds() throws Exception {
        ArrayList<Interested> list = new ArrayList<>();
        Connection con = DatabaseListener.getConnection();
        Statement stmt = con.createStatement();
        ResultSet rs = stmt.executeQuery("SELECT * FROM interesteds ORDER BY cd_interested");
        while (rs.next()) {
            Integer idInteressado = rs.getInt("cd_interested");
            Integer idAutoescola = rs.getInt("cd_drivingSchool_interested");
            Integer idCliente = rs.getInt("cd_user_interested");
            list.add(new Interested(idInteressado, idAutoescola, idCliente ));
        }
        stmt.close();
        con.close();
        return list;
    }

    public static Interested getAlredyInteresteds(int idAuto, int idUser) throws Exception {
        Interested interessado = null;
        Connection con = DatabaseListener.getConnection();
        PreparedStatement stmt = con.prepareStatement("SELECT * FROM interesteds WHERE cd_user_interested = ? AND cd_drivingSchool_interested = ?");
        stmt.setInt(1, idUser);
        stmt.setInt(2, idAuto);
        ResultSet rs = stmt.executeQuery();
        while (rs.next()) {
            Integer idInteressado = rs.getInt("cd_interested");
            Integer idAutoescola = rs.getInt("cd_drivingSchool_interested");
            Integer idCliente = rs.getInt("cd_user_interested");
            interessado = new Interested(idInteressado, idAutoescola, idCliente );
        }
        stmt.close();
        con.close();
        return interessado;
    }
    
    public static ArrayList<Interested> getInteresteds(int start, int fim, String order, String order2) throws Exception {
        ArrayList<Interested> list = new ArrayList<>();
        Connection con = DatabaseListener.getConnection();
        Statement stmt = con.createStatement();
        ResultSet rs = stmt.executeQuery("SELECT * FROM interesteds ORDER BY " + order + order2 + " LIMIT " + (start - 1) + "," + fim);
        while (rs.next()) {
            Integer idInteressado = rs.getInt("cd_interested");
            Integer idAutoescola = rs.getInt("cd_drivingSchool_interested");
            Integer idCliente = rs.getInt("cd_user_interested");
            list.add(new Interested(idInteressado, idAutoescola, idCliente ));
        }
        stmt.close();
        con.close();
        return list;
    }

    public static ArrayList<Interested> searchInterested(String busca, int start, int fim, String order, String order2) throws Exception {
        ArrayList<Interested> list = new ArrayList<>();
        Connection con = DatabaseListener.getConnection();
        PreparedStatement stmt = con.prepareStatement("SELECT * FROM interesteds WHERE cd_drivingSchool_interested = ? ORDER BY " + order + order2 + " LIMIT " + (start - 1) + "," + fim);
        stmt.setString(1, busca);
        ResultSet rs = stmt.executeQuery();
        while (rs.next()) {
            Integer idInteressado = rs.getInt("cd_interested");
            Integer idAutoescola = rs.getInt("cd_drivingSchool_interested");
            Integer idCliente = rs.getInt("cd_user_interested");
            list.add(new Interested(idInteressado, idAutoescola, idCliente ));
        }
        stmt.close();
        con.close();

        return list;
    }
    
    public static void altInterested(Interested interessado) throws Exception {
        Connection con = DatabaseListener.getConnection();
        PreparedStatement stmt = con.prepareStatement("UPDATE interesteds SET cd_drivingSchool_interested = ? cd_user_interested = ? WHERE cd_interested = ?)");
        stmt.setInt(1, interessado.getIdAutoescola());
        stmt.setInt(2, interessado.getIdCLiente());
        stmt.setInt(3, interessado.getIdInteressado());
        stmt.execute();
        stmt.close();
        con.close();
    }

    public static void addInterested(Interested interessado) throws Exception {
        Connection con = DatabaseListener.getConnection();
        PreparedStatement stmt = con.prepareStatement("INSERT INTO interesteds (cd_drivingSchool_interested, cd_user_interested) VALUES (?,?)");
        stmt.setInt(1, interessado.getIdAutoescola());
        stmt.setInt(2, interessado.getIdCLiente());
        stmt.execute();
        stmt.close();
        con.close();
    }

    public static void deleteInterestedAdm(Integer identificacao) throws Exception {
        Connection con = DatabaseListener.getConnection();
        PreparedStatement stmt = con.prepareStatement("DELETE FROM interesteds WHERE cd_interested = ?");
        stmt.setInt(1, identificacao);
        stmt.execute();
        stmt.close();
        con.close();
    }
    
    public static void deleteInterestedUser(Integer idUser, Integer idAuto) throws Exception {
        Connection con = DatabaseListener.getConnection();
        PreparedStatement stmt = con.prepareStatement("DELETE FROM interesteds WHERE cd_user_interested = ? AND cd_drivingSchool_interested = ?");
        stmt.setInt(1, idUser);
        stmt.setInt(2, idAuto);
        stmt.execute();
        stmt.close();
        con.close();
    }

    public Interested(Integer idInteressado, Integer idAutoescola, Integer idCLiente) {
        this.idInteressado = idInteressado;
        this.idAutoescola = idAutoescola;
        this.idCLiente = idCLiente;
    }

    public Integer getIdInteressado() {
        return idInteressado;
    }

    public void setIdInteressado(Integer idInteressado) {
        this.idInteressado = idInteressado;
    }

    public Integer getIdAutoescola() {
        return idAutoescola;
    }

    public void setIdAutoescola(Integer idAutoescola) {
        this.idAutoescola = idAutoescola;
    }

    public Integer getIdCLiente() {
        return idCLiente;
    }

    public void setIdCLiente(Integer idCLiente) {
        this.idCLiente = idCLiente;
    }

    
}
