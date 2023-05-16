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

    public static Service getDrivingSchool(String email, String password) throws Exception {
        Service driving = null;
        Connection con = DatabaseListener.getConnection();
        PreparedStatement stmt = con.prepareStatement("SELECT * FROM drivingSchools WHERE nm_email_drivingSchool = ? AND cd_password_drivingSchool = ?");
        stmt.setString(1, email);
        stmt.setString(2, passwordMD5(password));
        ResultSet rs = stmt.executeQuery();
        while (rs.next()) {
            Integer id = rs.getInt("cd_drivingSchool");
            String nome = rs.getString("nm_drivingSchool");
            String descricao = rs.getString("ds_drivingSchool");
            String endereco = rs.getString("nm_address_drivingSchool");
            String cidade = rs.getString("nm_city_drivingSchool");
            String bairro = rs.getString("nm_neighborhood_drivingSchool");
            String cep = rs.getString("cd_cep_drivingSchool");
            String telefone = rs.getString("cd_phone_number_drivingSchool");
            String emailD = rs.getString("nm_email_drivingSchool");
            String senha = rs.getString("cd_password_drivingSchool");
            double avaliacao = rs.getInt("vl_rating_drivingSchool");
            double qtdeAvaliacao = rs.getInt("qt_rating_drivingSchool");
            double rAvaliacao = rs.getInt("vl_rating_final_drivingSchool");

            driving = new Service(id, nome, descricao, endereco, cidade, bairro, cep, telefone, emailD, senha, avaliacao, qtdeAvaliacao, rAvaliacao);
        }
        stmt.close();
        con.close();

        return driving;
    }

    public static Service getDrivingSchoolAlt(String email, String password) throws Exception {
        Service driving = null;
        Connection con = DatabaseListener.getConnection();
        PreparedStatement stmt = con.prepareStatement("SELECT * FROM drivingSchools WHERE nm_email_drivingSchool = ? AND cd_password_drivingSchool = ?");
        stmt.setString(1, email);
        stmt.setString(2, password);
        ResultSet rs = stmt.executeQuery();
        while (rs.next()) {
            Integer id = rs.getInt("cd_drivingSchool");
            String nome = rs.getString("nm_drivingSchool");
            String descricao = rs.getString("ds_drivingSchool");
            String endereco = rs.getString("nm_address_drivingSchool");
            String cidade = rs.getString("nm_city_drivingSchool");
            String bairro = rs.getString("nm_neighborhood_drivingSchool");
            String cep = rs.getString("cd_cep_drivingSchool");
            String telefone = rs.getString("cd_phone_number_drivingSchool");
            String emailD = rs.getString("nm_email_drivingSchool");
            String senha = rs.getString("cd_password_drivingSchool");
            double avaliacao = rs.getInt("vl_rating_drivingSchool");
            double qtdeAvaliacao = rs.getInt("qt_rating_drivingSchool");
            double rAvaliacao = rs.getInt("vl_rating_final_drivingSchool");

            driving = new Service(id, nome, descricao, endereco, cidade, bairro, cep, telefone, emailD, senha, avaliacao, qtdeAvaliacao, rAvaliacao);
        }
        stmt.close();
        con.close();

        return driving;
    }

    public static Service getDrivingSchoolView(String idV) throws Exception {
        Service driving = null;
        Connection con = DatabaseListener.getConnection();
        PreparedStatement stmt = con.prepareStatement("SELECT * FROM drivingSchools WHERE cd_drivingSchool = ?");
        stmt.setString(1, idV);
        ResultSet rs = stmt.executeQuery();
        while (rs.next()) {
            Integer id = rs.getInt("cd_drivingSchool");
            String nome = rs.getString("nm_drivingSchool");
            String descricao = rs.getString("ds_drivingSchool");
            String endereco = rs.getString("nm_address_drivingSchool");
            String cidade = rs.getString("nm_city_drivingSchool");
            String bairro = rs.getString("nm_neighborhood_drivingSchool");
            String cep = rs.getString("cd_cep_drivingSchool");
            String telefone = rs.getString("cd_phone_number_drivingSchool");
            String emailD = rs.getString("nm_email_drivingSchool");
            String senha = rs.getString("cd_password_drivingSchool");
            double avaliacao = rs.getInt("vl_rating_drivingSchool");
            double qtdeAvaliacao = rs.getInt("qt_rating_drivingSchool");
            double rAvaliacao = rs.getInt("vl_rating_final_drivingSchool");

            driving = new Service(id, nome, descricao, endereco, cidade, bairro, cep, telefone, emailD, senha, avaliacao, qtdeAvaliacao, rAvaliacao);
        }
        stmt.close();
        con.close();

        return driving;
    }

    public static ArrayList<Service> getTotalSchools() throws Exception {
        ArrayList<Service> list = new ArrayList<>();
        Connection con = DatabaseListener.getConnection();
        Statement stmt = con.createStatement();
        ResultSet rs = stmt.executeQuery("SELECT * FROM drivingSchools ORDER BY cd_drivingSchool");
        while (rs.next()) {
            Integer id = rs.getInt("cd_drivingSchool");
            String nome = rs.getString("nm_drivingSchool");
            String descricao = rs.getString("ds_drivingSchool");
            String endereco = rs.getString("nm_address_drivingSchool");
            String cidade = rs.getString("nm_city_drivingSchool");
            String bairro = rs.getString("nm_neighborhood_drivingSchool");
            String cep = rs.getString("cd_cep_drivingSchool");
            String telefone = rs.getString("cd_phone_number_drivingSchool");
            String emailD = rs.getString("nm_email_drivingSchool");
            String senha = rs.getString("cd_password_drivingSchool");
            double avaliacao = rs.getInt("vl_rating_drivingSchool");
            double qtdeAvaliacao = rs.getInt("qt_rating_drivingSchool");
            double rAvaliacao = rs.getInt("vl_rating_final_drivingSchool");

            list.add(new Service(id, nome, descricao, endereco, cidade, bairro, cep, telefone, emailD, senha, avaliacao, qtdeAvaliacao, rAvaliacao));
        }
        stmt.close();
        con.close();
        return list;
    }

    public static ArrayList<Service> getSchools(int start, int fim, String order, String order2) throws Exception {
        ArrayList<Service> list = new ArrayList<>();
        Connection con = DatabaseListener.getConnection();
        Statement stmt = con.createStatement();
        ResultSet rs = stmt.executeQuery("SELECT * FROM drivingSchools ORDER BY " + order + order2 + " LIMIT " + (start - 1) + "," + fim);
        while (rs.next()) {
            Integer id = rs.getInt("cd_drivingSchool");
            String nome = rs.getString("nm_drivingSchool");
            String descricao = rs.getString("ds_drivingSchool");
            String endereco = rs.getString("nm_address_drivingSchool");
            String cidade = rs.getString("nm_city_drivingSchool");
            String bairro = rs.getString("nm_neighborhood_drivingSchool");
            String cep = rs.getString("cd_cep_drivingSchool");
            String telefone = rs.getString("cd_phone_number_drivingSchool");
            String emailD = rs.getString("nm_email_drivingSchool");
            String senha = rs.getString("cd_password_drivingSchool");
            double avaliacao = rs.getInt("vl_rating_drivingSchool");
            double qtdeAvaliacao = rs.getInt("qt_rating_drivingSchool");
            double rAvaliacao = rs.getInt("vl_rating_final_drivingSchool");

            list.add(new Service(id, nome, descricao, endereco, cidade, bairro, cep, telefone, emailD, senha, avaliacao, qtdeAvaliacao, rAvaliacao));
        }
        stmt.close();
        con.close();
        return list;
    }

    public static ArrayList<Service> searchSchool(String busca, int start, int fim, String order, String order2) throws Exception {
        ArrayList<Service> list = new ArrayList<>();
        Connection con = DatabaseListener.getConnection();
        PreparedStatement stmt = con.prepareStatement("SELECT * FROM drivingSchools WHERE nm_drivingSchool LIKE ? ORDER BY " + order + order2 + " LIMIT " + (start - 1) + "," + fim);
        stmt.setString(1, "%" + busca + "%");
        ResultSet rs = stmt.executeQuery();
        while (rs.next()) {
            Integer id = rs.getInt("cd_drivingSchool");
            String nome = rs.getString("nm_drivingSchool");
            String descricao = rs.getString("ds_drivingSchool");
            String endereco = rs.getString("nm_address_drivingSchool");
            String cidade = rs.getString("nm_city_drivingSchool");
            String bairro = rs.getString("nm_neighborhood_drivingSchool");
            String cep = rs.getString("cd_cep_drivingSchool");
            String telefone = rs.getString("cd_phone_number_drivingSchool");
            String emailD = rs.getString("nm_email_drivingSchool");
            String senha = rs.getString("cd_password_drivingSchool");
            double avaliacao = rs.getInt("vl_rating_drivingSchool");
            double qtdeAvaliacao = rs.getInt("qt_rating_drivingSchool");
            double rAvaliacao = rs.getInt("vl_rating_final_drivingSchool");

            list.add(new Service(id, nome, descricao, endereco, cidade, bairro, cep, telefone, emailD, senha, avaliacao, qtdeAvaliacao, rAvaliacao));
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
