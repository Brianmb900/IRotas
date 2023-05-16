/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package db;

import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.*;
import java.time.LocalTime;
import java.util.ArrayList;
import web.DatabaseListener;

/**
 *
 * @author Fatec
 */
public class Service {

    private Integer idServico;
    private Integer idAutoescola;
    private String descricao;
    private LocalTime horaInicio;
    private LocalTime horaFim;
    private double valor;
    private Integer tipo;

    public static ArrayList<Service> getServicosAutoescola(String idAuto) throws Exception {
        ArrayList<Service> list = new ArrayList<>();
        Connection con = DatabaseListener.getConnection();
        PreparedStatement stmt = con.prepareStatement("SELECT * FROM services WHERE cd_drivingschool_service = ?");
        stmt.setString(1, idAuto);
        ResultSet rs = stmt.executeQuery();
        while (rs.next()) {
            Integer idS = rs.getInt("cd_service");
            Integer idA = rs.getInt("cd_drivingschool_service");
            String descricao = rs.getString("ds_service");
            LocalTime hrIni = LocalTime.parse(rs.getString("hr_start_service"));
            LocalTime hrFim = LocalTime.parse(rs.getString("hr_end_service"));
            double valor = rs.getDouble("vl_service");
            Integer tipo = rs.getInt("ic_class_theoretical_practical_service");

            list.add(new Service(idS, idA, descricao, hrIni, hrFim, valor, tipo));
        }
        stmt.close();
        con.close();
        return list;
    }

    public static ArrayList<Service> getTotalServicos() throws Exception {
        ArrayList<Service> list = new ArrayList<>();
        Connection con = DatabaseListener.getConnection();
        Statement stmt = con.createStatement();
        ResultSet rs = stmt.executeQuery("SELECT * FROM services ORDER BY cd_service");
        while (rs.next()) {
            Integer idS = rs.getInt("cd_service");
            Integer idA = rs.getInt("cd_drivingschool_service");
            String descricao = rs.getString("ds_service");
            LocalTime hrIni = LocalTime.parse(rs.getString("hr_start_service"));
            LocalTime hrFim = LocalTime.parse(rs.getString("hr_end_service"));
            double valor = rs.getDouble("vl_service");
            Integer tipo = rs.getInt("ic_class_theoretical_practical_service");

            list.add(new Service(idS, idA, descricao, hrIni, hrFim, valor, tipo));
        }
        stmt.close();
        con.close();
        return list;
    }

    public static ArrayList<Service> getServicos(int start, int fim, String order, String order2) throws Exception {
        ArrayList<Service> list = new ArrayList<>();
        Connection con = DatabaseListener.getConnection();
        Statement stmt = con.createStatement();
        ResultSet rs = stmt.executeQuery("SELECT * FROM services ORDER BY " + order + order2 + " LIMIT " + (start - 1) + "," + fim);
        while (rs.next()) {
            Integer idS = rs.getInt("cd_service");
            Integer idA = rs.getInt("cd_drivingschool_service");
            String descricao = rs.getString("ds_service");
            LocalTime hrIni = LocalTime.parse(rs.getString("hr_start_service"));
            LocalTime hrFim = LocalTime.parse(rs.getString("hr_end_service"));
            double valor = rs.getDouble("vl_service");
            Integer tipo = rs.getInt("ic_class_theoretical_practical_service");

            list.add(new Service(idS, idA, descricao, hrIni, hrFim, valor, tipo));
        }
        stmt.close();
        con.close();
        return list;
    }

    public static ArrayList<Service> searchServico(int idAuto, int start, int fim, String order, String order2) throws Exception {
        ArrayList<Service> list = new ArrayList<>();
        Connection con = DatabaseListener.getConnection();
        PreparedStatement stmt = con.prepareStatement("SELECT * FROM drivingSchools WHERE cd_drivingschool_service = ? ORDER BY " + order + order2 + " LIMIT " + (start - 1) + "," + fim);
        stmt.setInt(1, idAuto);
        ResultSet rs = stmt.executeQuery();
        while (rs.next()) {
            Integer idS = rs.getInt("cd_service");
            Integer idA = rs.getInt("cd_drivingschool_service");
            String descricao = rs.getString("ds_service");
            LocalTime hrIni = LocalTime.parse(rs.getString("hr_start_service"));
            LocalTime hrFim = LocalTime.parse(rs.getString("hr_end_service"));
            double valor = rs.getDouble("vl_service");
            Integer tipo = rs.getInt("ic_class_theoretical_practical_service");

            list.add(new Service(idS, idA, descricao, hrIni, hrFim, valor, tipo));
        }
        stmt.close();
        con.close();

        return list;
    }

    public static void addServico(Service school) throws Exception {
        Connection con = DatabaseListener.getConnection();
        PreparedStatement stmt = con.prepareStatement("INSERT INTO services (cd_service, cd_drivingschool_service, ds_service,"
                + "hr_start_service, hr_end_service, vl_service, ic_class_theoretical_practical_service)"
                + "VALUES (?,?,?,?,?,?,?)");
        stmt.setInt(1, school.getIdServico());
        stmt.setInt(2, school.getIdAutoescola());
        stmt.setString(3, school.getDescricao());
        stmt.setString(4, school.getHoraInicio().toString());
        stmt.setString(5, school.getHoraFim().toString());
        stmt.setDouble(6, school.getValor());
        stmt.setInt(7, school.getTipo());
        stmt.execute();
        stmt.close();
        con.close();
    }

    public static void alterServico(Service servico) throws Exception {
        Connection con = DatabaseListener.getConnection();
        PreparedStatement stmt = con.prepareStatement(""
                + "UPDATE services SET ds_service = ?, hr_start_service = ?, hr_end_service = ?, vl_service = ?, ic_class_theoretical_practical_service = ?"
                + "WHERE cd_service = ? AND cd_drivingschool_service = ?");
        stmt.setString(1, servico.getDescricao());
        stmt.setString(2, servico.getHoraInicio().toString());
        stmt.setString(3, servico.getHoraFim().toString());
        stmt.setDouble(4, servico.getValor());
        stmt.setInt(5, servico.getTipo());
        stmt.setInt(6, servico.getIdServico());
        stmt.setInt(7, servico.getIdAutoescola());
        stmt.execute();
        stmt.close();
        con.close();
    }

    public static void deleteService(Integer identificacao) throws Exception {
        Connection con = DatabaseListener.getConnection();
        PreparedStatement stmt = con.prepareStatement("DELETE FROM services WHERE cd_service = ?");
        stmt.setInt(1, identificacao);
        stmt.execute();
        stmt.close();
        con.close();
    }

    public Service(Integer idServico, Integer idAutoescola, String descricao, LocalTime horaInicio, LocalTime horaFim, double valor, Integer tipo) {
        this.idServico = idServico;
        this.idAutoescola = idAutoescola;
        this.descricao = descricao;
        this.horaInicio = horaInicio;
        this.horaFim = horaFim;
        this.valor = valor;
        this.tipo = tipo;
    }

    public Integer getIdServico() {
        return idServico;
    }

    public void setIdServico(Integer idServico) {
        this.idServico = idServico;
    }

    public Integer getIdAutoescola() {
        return idAutoescola;
    }

    public void setIdAutoescola(Integer idAutoescola) {
        this.idAutoescola = idAutoescola;
    }

    public String getDescricao() {
        return descricao;
    }

    public void setDescricao(String descricao) {
        this.descricao = descricao;
    }

    public LocalTime getHoraInicio() {
        return horaInicio;
    }

    public void setHoraInicio(LocalTime horaInicio) {
        this.horaInicio = horaInicio;
    }

    public LocalTime getHoraFim() {
        return horaFim;
    }

    public void setHoraFim(LocalTime horaFim) {
        this.horaFim = horaFim;
    }

    public double getValor() {
        return valor;
    }

    public void setValor(double valor) {
        this.valor = valor;
    }

    public Integer getTipo() {
        return tipo;
    }

    public void setTipo(Integer tipo) {
        this.tipo = tipo;
    }
}
