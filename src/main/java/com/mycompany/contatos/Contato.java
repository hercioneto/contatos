/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.contatos;

/**
 *
 * @author Aluno
 */
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class Contato {
    private int id;
    private String nome;
    private String telefone;
    private int idade;
    private int idCategoria; 

    // Getters e Setters
    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public String getNome() { return nome; }
    public void setNome(String nome) { this.nome = nome; }

    public String getTelefone() { return telefone; }
    public void setTelefone(String telefone) { this.telefone = telefone; }

    public int getIdade() { return idade; }
    public void setIdade(int idade) { this.idade = idade; }

    public int getIdCategoria() { return idCategoria; }  // Getter para idCategoria
    public void setIdCategoria(int idCategoria) { this.idCategoria = idCategoria; }  // Setter para idCategoria


    // Método para salvar o contato no banco de dados
    public boolean salvar() {
        Connection conn = null;
        PreparedStatement ps = null;
        String sql = "INSERT INTO contatos (nome, telefone, idade, categoria_id) VALUES (?, ?, ?, ?)";

        try {
            conn = dbUtil.getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, getNome());
            ps.setString(2, getTelefone());
            ps.setInt(3, getIdade());
            ps.setInt(4, getIdCategoria());

            int rowsInserted = ps.executeUpdate();
            return rowsInserted > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        } finally {
            try {
                if (ps != null) ps.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

    // Método para retornar todos os contatos do banco de dados
    public static List<Contato> getAllContatos() {
        List<Contato> contatos = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        String sql = "SELECT * FROM contatos";

        try {
            conn = dbUtil.getConnection();
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();

            while (rs.next()) {
                Contato contato = new Contato();
                contato.setId(rs.getInt("id"));
                contato.setNome(rs.getString("nome"));
                contato.setTelefone(rs.getString("telefone"));
                contato.setIdade(rs.getInt("idade"));
                contato.setIdCategoria(rs.getInt("categoria_id"));  // Recuperando idCategoria
                contatos.add(contato);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) rs.close();
                if (ps != null) ps.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return contatos;
    }

    // Método para retornar um contato específico do banco de dados
    public static List<Contato> getContato(int id) {
        List<Contato> contatos = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        String sql = "SELECT * FROM contatos WHERE id = ?";

        try {
            conn = dbUtil.getConnection();
            ps = conn.prepareStatement(sql);
            ps.setInt(1, id);
            rs = ps.executeQuery();

            if (rs.next()) {
                Contato contato = new Contato();
                contato.setId(rs.getInt("id"));
                contato.setNome(rs.getString("nome"));
                contato.setTelefone(rs.getString("telefone"));
                contato.setIdade(rs.getInt("idade"));
                contato.setIdCategoria(rs.getInt("categoria_id")); 
                contatos.add(contato);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) rs.close();
                if (ps != null) ps.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return contatos;
    }


    // Método para atualizar um contato no banco de dados
    public boolean atualizar() {
        Connection conn = null;
        PreparedStatement ps = null;
        String sql = "UPDATE contatos SET nome = ?, telefone = ?, idade = ?, categoria_id=? WHERE id = ?";

        try {
            conn = dbUtil.getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, getNome());
            ps.setString(2, getTelefone());
            ps.setInt(3, getIdade());
            ps.setInt(4, getIdCategoria());
            ps.setInt(5, getId());

            int rowsUpdated = ps.executeUpdate();
            return rowsUpdated > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        } finally {
            try {
                if (ps != null) ps.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

    // Método para apagar um contato do banco de dados
    public boolean deletar() {
        Connection conn = null;
        PreparedStatement ps = null;
        String sql = "DELETE FROM contatos WHERE id = ?";

        try {
            conn = dbUtil.getConnection();
            ps = conn.prepareStatement(sql);
            ps.setInt(1, getId());

            int rowsDeleted = ps.executeUpdate();
            return rowsDeleted > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        } finally {
            try {
                if (ps != null) ps.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}

