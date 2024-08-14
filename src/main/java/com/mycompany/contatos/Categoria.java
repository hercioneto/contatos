/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

/**
 *
 * @author Aluno
 */
package com.mycompany.contatos;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class Categoria {
    private int id;
    private String nome;

    // Getters e Setters
    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public String getNome() { return nome; }
    public void setNome(String nome) { this.nome = nome; }

    // Método para salvar a categoria no banco de dados
    public boolean salvar() {
        Connection conn = null;
        PreparedStatement ps = null;
        String sql = "INSERT INTO categorias (nome) VALUES (?)";

        try {
            conn = dbUtil.getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, getNome());

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

    // Método para retornar todas as categorias do banco de dados
    public static List<Categoria> getAllCategorias() {
        List<Categoria> categorias = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        String sql = "SELECT * FROM categorias";

        try {
            conn = dbUtil.getConnection();
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();

            while (rs.next()) {
                Categoria categoria = new Categoria();
                categoria.setId(rs.getInt("id"));
                categoria.setNome(rs.getString("nome"));
                categorias.add(categoria);
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
        return categorias;
    }

    // Método para retornar uma categoria específica do banco de dados
    public static List<Categoria> getCategoria(int id) {
        List<Categoria> categorias = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        String sql = "SELECT * FROM categorias WHERE id = ?";

        try {
            conn = dbUtil.getConnection();
            ps = conn.prepareStatement(sql);
            ps.setInt(1, id);
            rs = ps.executeQuery();

            if (rs.next()) {
                Categoria categoria = new Categoria();
                categoria.setId(rs.getInt("id"));
                categoria.setNome(rs.getString("nome"));
                categorias.add(categoria);
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
        return categorias;
    }

    // Método para atualizar uma categoria no banco de dados
    public boolean atualizar() {
        Connection conn = null;
        PreparedStatement ps = null;
        String sql = "UPDATE categorias SET nome = ? WHERE id = ?";

        try {
            conn = dbUtil.getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, getNome());
            ps.setInt(2, getId());

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

    // Método para apagar uma categoria do banco de dados
    public boolean deletar() {
        Connection conn = null;
        PreparedStatement ps = null;
        String sql = "DELETE FROM categorias WHERE id = ?";

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

