/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package db;

import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.*;
import java.util.ArrayList;
import web.DatabaseListener;

/**
 *
 * @author Fatec
 */
public class DrivingSchool {

    private Integer idAutoescola;
    private String nome;
    private String descricao;
    private String endereco;
    private String cidade;
    private String bairro;
    private String cep;
    private String telefone;
    private String email;
    private String senha;
    private int avalaicao;

    public static String passwordMD5(String s) throws NoSuchAlgorithmException {
        MessageDigest m = MessageDigest.getInstance("MD5");
        m.update(s.getBytes(), 0, s.length());
        String passMD5 = new BigInteger(1, m.digest()).toString(16);
        return passMD5;
    }

    public static ArrayList<DrivingSchool> getUsers(int start, int fim, int order) throws Exception {
        ArrayList<DrivingSchool> list = new ArrayList<>();
        Connection con = DatabaseListener.getConnection();
        Statement stmt = con.createStatement();
        ResultSet rs = stmt.executeQuery("SELECT * FROM Users ORDER BY " + order + " LIMIT " + (start - 1) + "," + fim
        );
        while (rs.next()) {
            Integer id = rs.getInt("cd_user");
            int administrator = rs.getInt("ic_administrator_yes_no_user");
            String nome = rs.getString("nm_user");
            String sobrenome = rs.getString("nm_last_user");
            String emailC = rs.getString("nm_email_user");
            String senha = rs.getString("cd_password_user");
            String telefone = rs.getString("cd_phone_number_user");
            LocalDate dataNascimento = LocalDate.parse(rs.getString("dt_birthdate_user"));
            String Sexo = rs.getString("ic_sex_male_female_user");
            char sexo = Sexo.charAt(0);

            list.add(new DrivingSchool(id, administrator, nome, sobrenome, emailC, senha, telefone, dataNascimento, sexo));
        }
        stmt.close();
        con.close();
        return list;
    }

    public static ArrayList<DrivingSchool> getTotalUsers() throws Exception {
        ArrayList<DrivingSchool> list = new ArrayList<>();
        Connection con = DatabaseListener.getConnection();
        Statement stmt = con.createStatement();
        ResultSet rs = stmt.executeQuery("SELECT * FROM Users ORDER BY cd_user");
        while (rs.next()) {
            Integer id = rs.getInt("cd_user");
            int administrator = rs.getInt("ic_administrator_yes_no_user");
            String nome = rs.getString("nm_user");
            String sobrenome = rs.getString("nm_last_user");
            String emailC = rs.getString("nm_email_user");
            String senha = rs.getString("cd_password_user");
            String telefone = rs.getString("cd_phone_number_user");
            LocalDate dataNascimento = LocalDate.parse(rs.getString("dt_birthdate_user"));
            String Sexo = rs.getString("ic_sex_male_female_user");
            char sexo = Sexo.charAt(0);

            list.add(new DrivingSchool(id, administrator, nome, sobrenome, emailC, senha, telefone, dataNascimento, sexo));
        }
        stmt.close();
        con.close();
        return list;
    }

    public static DrivingSchool getUser(String email, String password) throws Exception {
        DrivingSchool user = null;
        Connection con = DatabaseListener.getConnection();
        PreparedStatement stmt = con.prepareStatement("SELECT * FROM drivingSchools WHERE nm_email_drivingSchool = ? AND cd_password_drivingSchool = ?");
        stmt.setString(1, email);
        stmt.setString(2, passwordMD5(password));
        ResultSet rs = stmt.executeQuery();
        while (rs.next()) {
            Integer id = rs.getInt("cd_user");
            int administrator = rs.getInt("ic_administrator_yes_no_user");
            String nome = rs.getString("nm_user");
            String sobrenome = rs.getString("nm_last_user");
            String emailC = rs.getString("nm_email_user");
            String senha = rs.getString("cd_password_user");
            String telefone = rs.getString("cd_phone_number_user");
            LocalDate dataNascimento = LocalDate.parse(rs.getString("dt_birthdate_user"));
            String Sexo = rs.getString("ic_sex_male_female_user");
            char sexo = Sexo.charAt(0);

            user = new DrivingSchool(id, administrator, nome, sobrenome, emailC, senha, telefone, dataNascimento, sexo);
        }
        stmt.close();
        con.close();

        return user;
    }

    public static ArrayList<DrivingSchool> searchUser(String busca) throws Exception {
        ArrayList<DrivingSchool> list = new ArrayList<>();
        Connection con = DatabaseListener.getConnection();
        PreparedStatement stmt = con.prepareStatement("SELECT * FROM users WHERE nm_user = ?");
        stmt.setString(1, busca);
        ResultSet rs = stmt.executeQuery();
        while (rs.next()) {
            Integer id = rs.getInt("cd_user");
            int administrator = rs.getInt("ic_administrator_yes_no_user");
            String nome = rs.getString("nm_user");
            String sobrenome = rs.getString("nm_last_user");
            String emailC = rs.getString("nm_email_user");
            String senha = rs.getString("cd_password_user");
            String telefone = rs.getString("cd_phone_number_user");
            LocalDate dataNascimento = LocalDate.parse(rs.getString("dt_birthdate_user"));
            String Sexo = rs.getString("ic_sex_male_female_user");
            char sexo = Sexo.charAt(0);

            list.add(new DrivingSchool(id, administrator, nome, sobrenome, emailC, senha, telefone, dataNascimento, sexo));
        }
        stmt.close();
        con.close();

        return list;
    }

    public static void addDrivingSchool(DrivingSchool school) throws Exception {
        Connection con = DatabaseListener.getConnection();
        PreparedStatement stmt = con.prepareStatement("INSERT INTO drivingSchools (nm_drivingSchool, ds_drivingSchool, nm_address_drivingSchool, nm_city_drivingSchool, "
                + "nm_neighbordhood_drivingSchool, cd_cep_drivingSchool, cd_phone_number_drivingSchool, "
                + "nm_email_drivingSchool, cd_password_drivingSchool, vl_rating_drivingSchool)"
                + "VALUES (?,?,?,?,?,?,?,?)");
        stmt.setString(1, school.getNome());
        stmt.setString(2, school.getDescricao());
        stmt.setString(3, school.getEndereco());
        stmt.setString(4, school.getCidade());
        stmt.setString(5, school.getBairro());
        stmt.setString(6, school.getCep());
        stmt.setString(7, school.getTelefone());
        stmt.setString(8, school.getEmail());
        stmt.setString(9, passwordMD5(school.getSenha()));
        stmt.setInt(10, 0);
        stmt.execute();
        stmt.close();
        con.close();
    }

    public static void alterDrivingSchool(DrivingSchool school) throws Exception {
        Connection con = DatabaseListener.getConnection();
        PreparedStatement stmt = con.prepareStatement(""
                + "UPDATE drivingSchools SET nm_drivingSchool = ?, ds_drivingSchool = ?, nm_address_drivingSchool = ?, nm_city_drivingSchool = ?, "
                + "nm_neighbordhood_drivingSchool = ?, cd_cep_drivingSchool = ?, cd_phone_number_drivingSchool = ?, nm_email_drivingSchool = ?"
                + "WHERE cd_drivingSchool = ?");
        stmt.setString(1, school.getNome());
        stmt.setString(2, school.getDescricao());
        stmt.setString(3, school.getEndereco());
        stmt.setString(4, school.getCidade());
        stmt.setString(5, school.getBairro());
        stmt.setString(6, school.getCep());
        stmt.setString(7, school.getTelefone());
        stmt.setString(8, school.getEmail());
        stmt.setInt(9, school.getIdAutoescola());
        stmt.execute();
        stmt.close();
        con.close();
    }

    public static void alterarSenhaUser(String senha, Integer identificacao) throws Exception {
        Connection con = DatabaseListener.getConnection();
        PreparedStatement stmt = con.prepareStatement(""
                + "UPDATE drivingSchools SET cd_password_drivingSchool = ? WHERE cd_user = ?");
        stmt.setString(1, passwordMD5(senha));
        stmt.setInt(2, identificacao);
        stmt.execute();
        stmt.close();
        con.close();
    }

    public static void deleteDrivingSchool(Integer identificacao) throws Exception {
        Connection con = DatabaseListener.getConnection();
        PreparedStatement stmt = con.prepareStatement("DELETE FROM drivingSchools WHERE cd_drivingSchool = ?");
        stmt.setInt(1, identificacao);
        stmt.execute();
        stmt.close();
        con.close();
    }

    public DrivingSchool(Integer idAutoescola, String nome, String descricao, String endereco, String cidade, String bairro, String cep,
            String telefone, String email, String senha, int avalaicao) {
        this.idAutoescola = idAutoescola;
        this.nome = nome;
        this.descricao = descricao;
        this.endereco = endereco;
        this.cidade = cidade;
        this.bairro = bairro;
        this.cep = cep;
        this.telefone = telefone;
        this.email = email;
        this.senha = senha;
        this.avalaicao = avalaicao;
    }

    public Integer getIdAutoescola() {
        return idAutoescola;
    }

    public void setIdAutoescola(Integer idAutoescola) {
        this.idAutoescola = idAutoescola;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getDescricao() {
        return descricao;
    }

    public void setDescricao(String descricao) {
        this.descricao = descricao;
    }

    public String getEndereco() {
        return endereco;
    }

    public void setEndereco(String endereco) {
        this.endereco = endereco;
    }

    public String getCidade() {
        return cidade;
    }

    public void setCidade(String cidade) {
        this.cidade = cidade;
    }

    public String getBairro() {
        return bairro;
    }

    public void setBairro(String bairro) {
        this.bairro = bairro;
    }

    public String getCep() {
        return cep;
    }

    public void setCep(String cep) {
        this.cep = cep;
    }

    public String getTelefone() {
        return telefone;
    }

    public void setTelefone(String telefone) {
        this.telefone = telefone;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getSenha() {
        return senha;
    }

    public void setSenha(String senha) {
        this.senha = senha;
    }

    public int getAvalaicao() {
        return avalaicao;
    }

    public void setAvalaicao(int avalaicao) {
        this.avalaicao = avalaicao;
    }

}
