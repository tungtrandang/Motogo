<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<%@ include file="/includes/header.jsp" %>
<div class="container my-5">
    <h3 class="fw-bold mb-4">Lịch sử thuê xe của bạn</h3>
    <div class="table-responsive">
        <table class="table table-hover bg-white shadow-sm rounded">
            <thead class="table-dark">
                <tr>
                    <th>Mã Đơn</th>
                    <th>Xe</th>
                    <th>Ngày Thuê</th>
                    <th>Tổng Tiền</th>
                    <th>Trạng Thái</th>
                    <th>Thao Tác</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>#MTG-001</td>
                    <td>Honda Wave RSX</td>
                    <td>12/02/2026 - 14/02/2026</td>
                    <td>360.000₫</td>
                    <td><span class="badge bg-warning">Chờ nhận xe</span></td>
                    <td><a href="order-detail.jsp" class="btn btn-sm btn-dark">Chi tiết</a></td>
                </tr>
            </tbody>
        </table>
    </div>
</div>
<%@ include file="/includes/footer.jsp" %>