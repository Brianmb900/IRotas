/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package db;

import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.*;
import java.time.*;
import java.util.ArrayList;
import web.DatabaseListener;

/**
 *
 * @author Fatec
 */
public class User {

    private Integer idCLiente;
    private int cliente;
    private int colaborador;
    private String nome;
    private String email;
    private String password;
    private String telefone;
    private LocalDate dataNascimento;
    private char sexo;
    private String curriculo;

    public static String passwordMD5(String s) throws NoSuchAlgorithmException {
        MessageDigest m = MessageDigest.getInstance("MD5");
        m.update(s.getBytes(), 0, s.length());
        String passMD5 = new BigInteger(1, m.digest()).toString(16);
        return passMD5;
    }

    public static User getUser(String email, String password) throws Exception {
        User user = null;
        Connection con = DatabaseListener.getConnection();
        PreparedStatement stmt = con.prepareStatement("SELECT * FROM users WHERE nm_email_user = ? AND cd_password_user = ?");
        stmt.setString(1, email);
        stmt.setString(2, passwordMD5(password));
        ResultSet rs = stmt.executeQuery();
        if (rs.next()) {
            Integer id = rs.getInt("cd_user");
            int cliente = rs.getInt("ic_client_yes_no_user");
            int colaborador = rs.getInt("ic_collaborator_yes_no_user");
            String nome = rs.getString("nm_user");
            String emailC = rs.getString("nm_email_user");
            String senha = rs.getString("cd_password_user");
            String telefone = rs.getString("cd_phone_number_user");
            LocalDate dataNascimento = LocalDate.parse(rs.getString("dt_birthdate_user"));
            String Sexo = rs.getString("ic_sex_male_female_user");
            char sexo = Sexo.charAt(0);
            String curriculo = rs.getString("im_curriculum_user");

            user = new User(id, cliente, colaborador, nome, emailC, senha, telefone, dataNascimento, sexo, curriculo);
        }
        stmt.close();
        con.close();

        return user;
    }

    public User(Integer idCLiente, int cliente, int colaborador, String nome, String email, String password, String telefone, LocalDate dataNascimento, char sexo, String curriculo) {
        this.idCLiente = idCLiente;
        this.cliente = cliente;
        this.colaborador = colaborador;
        this.nome = nome;
        this.email = email;
        this.password = password;
        this.telefone = telefone;
        this.dataNascimento = dataNascimento;
        this.sexo = sexo;
        this.curriculo = curriculo;
    }

    public Integer getIdCLiente() {
        return idCLiente;
    }

    public void setIdCLiente(Integer idCLiente) {
        this.idCLiente = idCLiente;
    }

    public int getCliente() {
        return cliente;
    }

    public void setCliente(int cliente) {
        this.cliente = cliente;
    }

    public int getColaborador() {
        return colaborador;
    }

    public void setColaborador(int colaborador) {
        this.colaborador = colaborador;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getTelefone() {
        return telefone;
    }

    public void setTelefone(String telefone) {
        this.telefone = telefone;
    }

    public LocalDate getDataNascimento() {
        return dataNascimento;
    }

    public void setDataNascimento(LocalDate dataNascimento) {
        this.dataNascimento = dataNascimento;
    }

    public char getSexo() {
        return sexo;
    }

    public void setSexo(char Sexo) {
        this.sexo = sexo;
    }

    public String getCurriculo() {
        return curriculo;
    }

    public void setCurriculo(String curriculo) {
        this.curriculo = curriculo;
    }
}
