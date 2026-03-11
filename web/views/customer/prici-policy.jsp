<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="navPage" value="policy" scope="request" />
<%@ include file="/includes/header.jsp" %>

<div class="page-header">
    <div class="container">
        <h1 class="page-title">Bảng Giá & Chính Sách</h1>
    </div>
</div>

<div class="container my-5">
    <div class="card border-0 shadow-sm mb-5" style="border-radius: 15px;">
        <div class="card-body p-4">
            <h4 class="fw-bold mb-4" style="font-family: var(--font-display); color: var(--secondary-color);">
                <i class="bi bi-tags-fill me-2 text-primary-custom"></i>BẢNG GIÁ THUÊ XE
            </h4>
            <div class="table-responsive">
                <table class="table table-bordered align-middle">
                    <thead class="table-light text-center small fw-bold text-uppercase">
                        <tr>
                            <th class="py-3">Loại xe tiêu biểu</th>
                            <th class="py-3">Giá thuê/Ngày</th>
                            <th class="py-3">Tiền đặt cọc</th>
                        </tr>
                    </thead>
                    <tbody class="text-center small">
                        <tr>
                            <td class="text-start ps-4 fw-bold">Xe Số <span class="text-muted fw-normal">(Wave, Sirius, Blade)</span></td>
                            <td class="text-primary-custom fw-bold">120.000₫</td>
                            <td>2.000.000₫</td>
                        </tr>
                        <tr>
                            <td class="text-start ps-4 fw-bold">Xe Tay Ga <span class="text-muted fw-normal">(Vision, AirBlade, Janus)</span></td>
                            <td class="text-primary-custom fw-bold">150.000₫</td>
                            <td>2.500.000₫</td>
                        </tr>
                        <tr>
                            <td class="text-start ps-4 fw-bold">Xe Côn Tay <span class="text-muted fw-normal">(Exciter, Winner, Raider)</span></td>
                            <td class="text-primary-custom fw-bold">200.000₫</td>
                            <td>3.000.000₫</td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>

    <div class="row g-4 mb-5">
        <div class="col-md-6">
            <div class="h-100 p-4 bg-white shadow-sm rounded-4 border-start border-4 border-primary">
                <h5 class="fw-bold mb-3" style="font-family: var(--font-display); color: var(--secondary-color);">1. Điều Kiện Thuê Xe</h5>
                <ul class="small ps-3 mb-4">
                    <li class="mb-2">Khách hàng từ 18 tuổi trở lên, có CCCD/CMND hợp lệ.</li>
                    <li class="mb-2">Có Giấy phép lái xe phù hợp với loại xe thuê.</li>
                    <li class="mb-2">Đặt cọc theo quy định (tiền mặt hoặc giữ CCCD gốc).</li>
                    <li>Ký hợp đồng thuê xe và cam kết tuân thủ các quy định.</li>
                </ul>

                <h5 class="fw-bold mb-3" style="font-family: var(--font-display); color: var(--secondary-color);">2. Quy Định Đặt Cọc</h5>
                <p class="small text-muted mb-2">Hoàn trả 100% tiền cọc trong vòng 30 phút khi:</p>
                <ul class="small ps-3">
                    <li class="mb-2">Trả xe đúng hạn, xe không hư hỏng, trầy xước.</li>
                    <li>Đã thanh toán đầy đủ tiền thuê và phí phát sinh.</li>
                </ul>
            </div>
        </div>

        <div class="col-md-6">
            <div class="h-100 p-4 bg-white shadow-sm rounded-4 border-start border-4 border-primary">
                <h5 class="fw-bold mb-3" style="font-family: var(--font-display); color: var(--secondary-color);">3. Chính Sách Hủy & Trả Trễ</h5>
                <div class="row mb-3 small">
                    <div class="col-6">
                        <p class="fw-bold mb-1 text-primary-custom">Hủy xe:</p>
                        <ul class="ps-3">
                            <li>>24h: Hoàn 100%</li>
                            <li>12-24h: Hoàn 50%</li>
                            <li><12h: Không hoàn</li>
                        </ul>
                    </div>
                    <div class="col-6 border-start">
                        <p class="fw-bold mb-1 text-primary-custom">Trả trễ:</p>
                        <ul class="ps-3">
                            <li><2h: Miễn phí</li>
                            <li>2-6h: +50% giá ngày</li>
                            <li>>6h: +100% giá ngày</li>
                        </ul>
                    </div>
                </div>

                <h5 class="fw-bold mb-3" style="font-family: var(--font-display); color: var(--secondary-color);">4. Trách Nhiệm & Bồi Thường</h5>
                <ul class="small ps-3">
                    <li class="mb-2">Bồi thường 100% giá trị nếu xe bị mất hoặc hư hỏng nặng.</li>
                    <li class="mb-2">Chi trả phí sửa chữa nếu xe trầy xước hoặc hư hỏng nhẹ.</li>
                    <li>Không sử dụng xe vào mục đích bất hợp pháp.</li>
                </ul>
            </div>
        </div>

        <div class="col-12">
            <div class="p-4 bg-white shadow-sm rounded-4 border-start border-4 border-warning">
                <h5 class="fw-bold mb-3" style="font-family: var(--font-display); color: var(--secondary-color);">5. Chính Sách Nhiên Liệu & Phụ Kiện</h5>
                <div class="row align-items-center small">
                    <div class="col-md-8">
                        <i class="bi bi-fuel-pump me-2"></i>Xe giao đầy bình xăng, khách tự đổ trong quá trình thuê. Vui lòng trả xe đầy bình như ban đầu (phí 150% giá xăng nếu không đổ đầy).
                    </div>
                    <div class="col-md-4 text-md-end mt-3 mt-md-0">
                        <span class="badge bg-light text-dark border p-2"><i class="bi bi-check-circle-fill text-success me-1"></i>02 Mũ bảo hiểm + 01 Áo mưa</span>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="alert text-center p-4 border-0 shadow-sm" style="background: var(--dark-color); color: white; border-radius: 15px;">
        <h5 class="fw-bold mb-2" style="font-family: var(--font-display); color: var(--accent-color);">HỖ TRỢ KHẨN CẤP: 0901 234 567</h5>
        <p class="small mb-0 opacity-75">
            <i class="bi bi-clock-history me-2"></i>Cam kết có mặt hỗ trợ trong vòng 30 phút tại khu vực nội thành.
        </p>
    </div>
</div>

<%@ include file="/includes/footer.jsp" %>