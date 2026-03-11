/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import models.Account;
import java.sql.SQLException;
import java.util.List;
import utils.DBContext;

/**
 *
 * @author Admin
 */
public class AccountDAO extends DBContext {

    PreparedStatement st;
    ResultSet rs;

    public void createAccount(Account acc) {
        String sql = """
                 INSERT INTO Accounts 
                 (lastName, firstName, PhoneNumber, Email, PasswordHash, AvatarUrl, Role) 
                 VALUES (?, ?, ?, ?, ?, ?, ?)
                 """;
        try {
            st = connection.prepareStatement(sql);
            st.setString(1, acc.getLastName());
            st.setString(2, acc.getFirstName());
            st.setString(3, acc.getPhoneNumber());
            st.setString(4, acc.getEmail());
            st.setString(5, acc.getPasswordHash());
            st.setString(6, acc.getAvatarUrl());
            st.setInt(7, 0);
            st.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public boolean isEmailExists(String email) {
        String sql = "SELECT 1 FROM Accounts WHERE Email = ?";
        try {
            st = connection.prepareStatement(sql);
            st.setString(1, email);
            rs = st.executeQuery();

            if (rs.next()) {
                return true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    public boolean isPhoneExists(String phone) {
        String sql = "SELECT 1 FROM Accounts WHERE PhoneNumber = ?";
        try {
            st = connection.prepareStatement(sql);
            st.setString(1, phone);
            rs = st.executeQuery();

            if (rs.next()) {
                return true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    public void updateProfile(String lastName, String firstName, String phone, String email) {
        String sql = "UPDATE Accounts SET lastName = ?, firstName = ?, PhoneNumber = ? WHERE Email = ?";
        try {
            st = connection.prepareStatement(sql);
            st.setString(1, lastName);
            st.setString(2, firstName);
            st.setString(3, phone);
            st.setString(4, email);
            st.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void changePassword(String email, String newPassword) {
        String sql = "UPDATE Accounts SET PasswordHash = ? WHERE Email = ?";
        try {
            st = connection.prepareStatement(sql);
            st.setString(1, newPassword);
            st.setString(2, email);
            st.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public Account authenticate(String username, String password) throws SQLException {
        try {
            String sql = """
                     SELECT *
                     FROM Accounts
                     WHERE PhoneNumber = ? OR Email = ?
                     """;

            st = connection.prepareStatement(sql);
            st.setString(1, username);
            st.setString(2, username);

            rs = st.executeQuery();

            if (rs.next()) {
                Account acc = mapAccount(rs);

                if (acc.getPasswordHash().equals(password)) {
                    return acc;
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return null;
    }

    private Account mapAccount(ResultSet rs) throws SQLException {
        Account acc = new Account();
        acc.setAccountsID(rs.getInt("AccountsID"));
        acc.setLastName(rs.getString("lastName"));
        acc.setFirstName(rs.getString("firstName"));
        acc.setPhoneNumber(rs.getString("PhoneNumber"));
        acc.setEmail(rs.getString("Email"));
        acc.setPasswordHash(rs.getString("PasswordHash"));
        acc.setAvatarUrl(rs.getString("AvatarUrl"));
        acc.setRole(rs.getInt("Role"));
        acc.setCreatedAt(rs.getTimestamp("CreatedAt"));
        return acc;
    }
}
