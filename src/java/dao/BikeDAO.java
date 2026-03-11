package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import model.Bike;
import utils.DBContext;
// Đảm bảo package và class model đúng tên

/**
 *
 * @author Admin
 */
public class BikeDAO extends DBContext {

    PreparedStatement st;
    ResultSet rs;

    // Lấy toàn bộ danh sách xe
    public List<Bike> getAllBikes() {
        List<Bike> list = new ArrayList<>();
        try {
            String sql = "SELECT * FROM Bike";
            st = connection.prepareStatement(sql);
            rs = st.executeQuery();
            while (rs.next()) {
                Bike b = new Bike();
                b.setBikeId(rs.getInt("BikeID"));
                b.setPlateNumber(rs.getString("PlateNumber"));
                b.setBrand(rs.getString("Brand"));
                b.setModel(rs.getString("Model"));
                b.setImgBike(rs.getString("ImgBike"));
                b.setColor(rs.getString("Color"));
                b.setPricePreDay(rs.getDouble("PricePreDay"));
                b.setStatus(rs.getString("Status"));
                list.add(b);
            }
        } catch (Exception e) {
            System.out.println("getAllBikes Error: " + e.getMessage());
        }
        return list;
    }

    public Bike getBikeByPlateNumber(String plateNumber) {
        // Câu lệnh SQL truy vấn xe theo biển số (PlateNumber là khóa chính)
        String sql = "SELECT plateNumber, brand, model, color, pricePreDay, [status], imgBike FROM Bike WHERE plateNumber = ?";

        try {
            // Mở kết nối và chuẩn bị câu lệnh
            st = connection.prepareStatement(sql);
            st.setString(1, plateNumber);
            rs = st.executeQuery();

            if (rs.next()) {
                Bike b = new Bike();
                b.setPlateNumber(rs.getString("plateNumber"));
                b.setBrand(rs.getString("brand"));
                b.setModel(rs.getString("model"));
                b.setColor(rs.getString("color"));
                b.setPricePreDay(rs.getDouble("pricePreDay"));
                b.setStatus(rs.getString("status"));
                b.setImgBike(rs.getString("imgBike"));
                return b;
            }
        } catch (Exception e) {
            System.out.println("Lỗi getBikeByPlateNumber: " + e.getMessage());
        }
        return null;
    }

    public List<Bike> getBikes(String name, String[] brands, String[] types) {
        List<Bike> list = new ArrayList<>();
        try {
            StringBuilder sql = new StringBuilder("SELECT * FROM Bike WHERE 1=1 ");

            if (name != null && !name.isEmpty()) {
                sql.append(" AND (Model LIKE ? OR Brand LIKE ?) ");
            }

            if (brands != null && brands.length > 0) {
                sql.append(" AND Brand IN (");
                for (int i = 0; i < brands.length; i++) {
                    sql.append("?");
                    if (i < brands.length - 1) {
                        sql.append(",");
                    }
                }
                sql.append(") ");
            }

            st = connection.prepareStatement(sql.toString());

            int index = 1;
            if (name != null && !name.isEmpty()) {
                st.setString(index++, "%" + name + "%");
                st.setString(index++, "%" + name + "%");
            }

            if (brands != null && brands.length > 0) {
                for (String brand : brands) {
                    st.setString(index++, brand);
                }
            }

            rs = st.executeQuery();
            while (rs.next()) {
                list.add(new Bike(
                        rs.getInt("BikeID"),
                        rs.getString("PlateNumber"),
                        rs.getString("Brand"),
                        rs.getString("Model"),
                        rs.getString("ImgBike"),
                        rs.getString("Color"),
                        rs.getDouble("PricePreDay"),
                        rs.getString("Status")
                ));
            }
        } catch (Exception e) {
            System.out.println("searchBikes Error: " + e.getMessage());
        }
        return list;
    }

    public List<Bike> getTopBikes() {
        List<Bike> listBike = new ArrayList<>();
        String sql = "SELECT TOP 4 BikeID, PlateNumber, Brand, Model, ImgBike, Color, PricePreDay, Status FROM Bike";
        try {
            st = connection.prepareStatement(sql);
            rs = st.executeQuery();

            while (rs.next()) {
                listBike.add(new Bike(
                        rs.getInt("BikeID"),
                        rs.getString("PlateNumber"),
                        rs.getString("Brand"),
                        rs.getString("Model"),
                        rs.getString("ImgBike"),
                        rs.getString("Color"),
                        rs.getDouble("PricePreDay"),
                        rs.getString("Status")
                ));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return listBike;
    }

    public void insertBike(Bike b) {
        try {
            String sql = """
                         INSERT INTO Bike (PlateNumber, Brand, Model, ImgBike, Color, PricePreDay, Status)
                         VALUES (?, ?, ?, ?, ?, ?, ?)
                         """;
            st = connection.prepareStatement(sql);
            st.setString(1, b.getPlateNumber());
            st.setString(2, b.getBrand());
            st.setString(3, b.getModel());
            st.setString(4, b.getImgBike());
            st.setString(5, b.getColor());
            st.setDouble(6, b.getPricePreDay());
            st.setString(7, b.getStatus());
            st.executeUpdate();
        } catch (Exception e) {
            System.out.println("insertBike Error: " + e.getMessage());
        }
    }
}
