<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="../../includes/header.jsp" %>
<div class="page-header">
    <div class="container">
        <h1 class="page-title">Đặt xe online</h1>
    </div>
</div>
<div class="container my-4">
    <div class="card border-0 shadow-sm mx-auto" style="max-width: 850px; border: 1px solid #eee !important;">
        <div class="card-body p-4">
            <h5 class="text-center mb-4 fw-bold" style="color: #FF6B35; font-size: 1.2rem; text-transform: uppercase;">Thông tin đặt lịch</h5>
            
            <form action="process-booking" method="POST" enctype="multipart/form-data">
                
                <div class="row g-3 mb-3">
                    <div class="col-md-4">
                        <label class="form-label mb-1 fw-bold text-dark">Họ và tên</label>
                        <input type="text" class="form-control form-control-sm bg-light" value="${sessionScope.user.fullName}" readonly>
                    </div>
                    <div class="col-md-4">
                        <label class="form-label mb-1 fw-bold text-dark">Số điện thoại</label>
                        <input type="tel" class="form-control form-control-sm bg-light" value="${sessionScope.user.phone}" readonly>
                    </div>
                    <div class="col-md-4">
                        <label class="form-label mb-1 fw-bold text-dark">Xe thuê</label>
                        <input type="text" class="form-control form-control-sm bg-light" value="Honda AirBlade - 59C1-123.45" readonly>
                    </div>
                </div>

                <div class="row g-3 mb-3">
                    <div class="col-md-6">
                        <label class="form-label mb-1 fw-bold text-dark">Ngày nhận xe</label>
                        <input type="date" name="startDate" class="form-control form-control-sm" required>
                    </div>
                    <div class="col-md-6">
                        <label class="form-label mb-1 fw-bold text-dark">Ngày trả xe</label>
                        <input type="date" name="endDate" class="form-control form-control-sm" required>
                    </div>
                </div>

                <div class="row g-3 mb-3">
                    <div class="col-md-6">
                        <label class="form-label mb-1 fw-bold text-dark">Hình thức nhận xe</label>
                        <select class="form-select form-select-sm" id="pickupSelect" name="pickupType" onchange="toggleLoc('pickup')">
                            <option value="store">Nhận tại cửa hàng</option>
                            <option value="delivery">Giao xe tận nơi</option>
                        </select>
                        <div id="pickupAddr" class="mt-2 d-none">
                            <input type="text" name="pickupAddress" class="form-control form-control-sm" placeholder="Địa chỉ giao xe đến...">
                        </div>
                    </div>
                    <div class="col-md-6">
                        <label class="form-label mb-1 fw-bold text-dark">Hình thức trả xe</label>
                        <select class="form-select form-select-sm" id="returnSelect" name="returnType" onchange="toggleLoc('return')">
                            <option value="store">Trả tại cửa hàng</option>
                            <option value="delivery">Thu hồi tận nơi</option>
                        </select>
                        <div id="returnAddr" class="mt-2 d-none">
                            <input type="text" name="returnAddress" class="form-control form-control-sm" placeholder="Địa chỉ thu hồi xe...">
                        </div>
                    </div>
                </div>

                <div class="row g-3 mb-4">
                    <div class="col-md-6 border-end">
                        <label class="form-label mb-1 fw-bold">Căn cước công dân (CCCD)</label>
                        <input type="text" name="cccd" class="form-control form-control-sm mb-2" placeholder="Số CCCD">
                        <div class="row g-2">
                            <div class="col-6">
                                <label class="form-label mb-1 fw-bold text-dark">Mặt trước</label>
                                <input type="file" name="cccd_front" class="form-control form-control-sm">
                            </div>
                            <div class="col-6">
                                <label class="form-label mb-1 fw-bold text-dark">Mặt sau</label>
                                <input type="file" name="cccd_back" class="form-control form-control-sm">
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <label class="form-label mb-1 fw-bold">Bằng lái xe (GPLX)</label>
                        <input type="text" name="gplx" class="form-control form-control-sm mb-2" placeholder="Số bằng lái">
                        <div class="row g-2">
                            <div class="col-6">
                                <label class="form-label mb-1 fw-bold text-dark">Mặt trước</label>
                                <input type="file" name="gplx_front" class="form-control form-control-sm">
                            </div>
                            <div class="col-6">
                                <label class="form-label mb-1 fw-bold text-dark">Mặt sau</label>
                                <input type="file" name="gplx_back" class="form-control form-control-sm">
                            </div>
                        </div>
                    </div>
                </div>

                <button type="submit" class="btn w-100 fw-bold py-2 text-white" style="background-color: #FF6B35; border-radius: 6px;">
                    XÁC NHẬN ĐẶT LỊCH
                </button>
            </form>
        </div>
    </div>
</div>

<script>
    function toggleLoc(type) {
        const select = document.getElementById(type + 'Select');
        const inputDiv = document.getElementById(type + 'Addr');
        if (select.value === 'delivery') {
            inputDiv.classList.remove('d-none');
        } else {
            inputDiv.classList.add('d-none');
        }
    }
</script>

<%@ include file="../../includes/footer.jsp" %>