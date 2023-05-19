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
public class Evaluation {

    private Integer idAvaliacao;
    private Integer idAutoescola;
    private Integer idCLiente;
    private Double avaliacao;

    public static ArrayList<Evaluation> getTotalEvaluations() throws Exception {
        ArrayList<Evaluation> list = new ArrayList<>();
        Connection con = DatabaseListener.getConnection();
        Statement stmt = con.createStatement();
        ResultSet rs = stmt.executeQuery("SELECT * FROM evaluations ORDER BY cd_evaluation");
        while (rs.next()) {
            Integer idInteressado = rs.getInt("cd_evaluation");
            Integer idAutoescola = rs.getInt("cd_drivingSchool_evaluation");
            Integer idCliente = rs.getInt("cd_user_evaluation");
            Double avaliacao = rs.getDouble("vl_evaluation");
            list.add(new Evaluation(idInteressado, idAutoescola, idCliente, avaliacao));
        }
        stmt.close();
        con.close();
        return list;
    }

    public static Evaluation getAlredyEvaluated(int idAuto, int idUser) throws Exception {
        Evaluation avaliado = null;
        Connection con = DatabaseListener.getConnection();
        PreparedStatement stmt = con.prepareStatement("SELECT * FROM evaluations WHERE cd_user_evaluation = ? AND cd_drivingSchool_evaluation = ?");
        stmt.setInt(1, idUser);
        stmt.setInt(2, idAuto);
        ResultSet rs = stmt.executeQuery();
        while (rs.next()) {
            Integer idInteressado = rs.getInt("cd_evaluation");
            Integer idAutoescola = rs.getInt("cd_drivingSchool_evaluation");
            Integer idCliente = rs.getInt("cd_user_evaluation");
            Double avaliacao = rs.getDouble("vl_evaluation");
            avaliado = new Evaluation(idInteressado, idAutoescola, idCliente, avaliacao);
        }
        stmt.close();
        con.close();
        return avaliado;
    }
    
    public static Double getEvaluationFinal(int idAuto) throws Exception {
        Double avaliacao = null;
        Connection con = DatabaseListener.getConnection();
        PreparedStatement stmt = con.prepareStatement("SELECT ROUND(AVG(vl_evaluation),1) FROM evaluations WHERE cd_drivingSchool_evaluation = ?");
        stmt.setInt(1, idAuto);
        ResultSet rs = stmt.executeQuery();
        while (rs.next()) {
            avaliacao = rs.getDouble("ROUND(AVG(vl_evaluation),1)");
        }
        stmt.close();
        con.close();
        return avaliacao;
    }

    public static ArrayList<Evaluation> getEvaluations(int start, int fim, String order, String order2) throws Exception {
        ArrayList<Evaluation> list = new ArrayList<>();
        Connection con = DatabaseListener.getConnection();
        Statement stmt = con.createStatement();
        ResultSet rs = stmt.executeQuery("SELECT * FROM evaluations ORDER BY " + order + order2 + " LIMIT " + (start - 1) + "," + fim);
        while (rs.next()) {
            Integer idInteressado = rs.getInt("cd_evaluation");
            Integer idAutoescola = rs.getInt("cd_drivingSchool_evaluation");
            Integer idCliente = rs.getInt("cd_user_evaluation");
            Double avaliacao = rs.getDouble("vl_evaluation");
            list.add(new Evaluation(idInteressado, idAutoescola, idCliente, avaliacao));
        }
        stmt.close();
        con.close();
        return list;
    }

    public static ArrayList<Evaluation> searchEvaluation(String busca, int start, int fim, String order, String order2) throws Exception {
        ArrayList<Evaluation> list = new ArrayList<>();
        Connection con = DatabaseListener.getConnection();
        PreparedStatement stmt = con.prepareStatement("SELECT * FROM evaluations WHERE cd_drivingSchool_evaluation = ? ORDER BY " + order + order2 + " LIMIT " + (start - 1) + "," + fim);
        stmt.setString(1, busca);
        ResultSet rs = stmt.executeQuery();
        while (rs.next()) {
            Integer idInteressado = rs.getInt("cd_evaluation");
            Integer idAutoescola = rs.getInt("cd_drivingSchool_evaluation");
            Integer idCliente = rs.getInt("cd_user_evaluation");
            Double avaliacao = rs.getDouble("vl_evaluation");
            list.add(new Evaluation(idInteressado, idAutoescola, idCliente, avaliacao));
        }
        stmt.close();
        con.close();
        return list;
    }

    public static void altEvaluation(Evaluation avaliado) throws Exception {
        Connection con = DatabaseListener.getConnection();
        PreparedStatement stmt = con.prepareStatement("UPDATE evaluations SET vl_evaluation = ? WHERE cd_evaluation = ?");
        stmt.setDouble(1, avaliado.getAvaliacao());
        stmt.setInt(2, avaliado.getIdAvaliacao());
        stmt.execute();
        stmt.close();
        con.close();
    }

    public static void addEvaluation(Evaluation avaliado) throws Exception {
        Connection con = DatabaseListener.getConnection();
        PreparedStatement stmt = con.prepareStatement("INSERT INTO evaluations (cd_drivingSchool_evaluation, cd_user_evaluation, vl_evaluation) VALUES (?,?,?)");
        stmt.setInt(1, avaliado.getIdAutoescola());
        stmt.setInt(2, avaliado.getIdCLiente());
        stmt.setDouble(3, avaliado.getAvaliacao());
        stmt.execute();
        stmt.close();
        con.close();
    }

    public static void deleteEvaluation(Integer identificacao) throws Exception {
        Connection con = DatabaseListener.getConnection();
        PreparedStatement stmt = con.prepareStatement("DELETE FROM evaluations WHERE cd_evaluation = ?");
        stmt.setInt(1, identificacao);
        stmt.execute();
        stmt.close();
        con.close();
    }

    public Evaluation(Integer idAvaliacao, Integer idAutoescola, Integer idCLiente, Double avaliacao) {
        this.idAvaliacao = idAvaliacao;
        this.idAutoescola = idAutoescola;
        this.idCLiente = idCLiente;
        this.avaliacao = avaliacao;
    }

    public Integer getIdAvaliacao() {
        return idAvaliacao;
    }

    public void setIdAvaliacao(Integer idAvaliacao) {
        this.idAvaliacao = idAvaliacao;
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

    public Double getAvaliacao() {
        return avaliacao;
    }

    public void setAvaliacao(Double avaliacao) {
        this.avaliacao = avaliacao;
    }

}
