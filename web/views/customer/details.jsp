<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="/includes/header.jsp" %>

<c:set var="navPage" value="bikes" scope="request" />

<div class="container my-5">
    <div class="row g-5">
        <div class="col-lg-7">
            <div class="bike-gallery shadow-sm rounded-4 overflow-hidden mb-4">
                <%-- Sử dụng ảnh từ database --%>
                <img src="${pageContext.request.contextPath}/${bike.imgBike}" 
                     class="img-fluid w-100" alt="${bike.model}" 
                     style="min-height: 400px; object-fit: cover;">
            </div>

            <div class="p-4 bg-white rounded-4 shadow-sm border">
                <h5 class="fw-bold mb-3">Thông tin chi tiết</h5>
                <p class="text-secondary small" style="line-height: 1.8;">
                    Dòng xe <strong>${bike.brand} ${bike.model}</strong> được bảo trì định kỳ, đảm bảo khả năng vận hành êm ái và an toàn trên mọi cung đường. 
                    Xe sở hữu thiết kế hiện đại, tiết kiệm nhiên liệu và linh hoạt trong mọi địa hình, từ phố đông đến những cung đường ngoại ô. 
                    Chúng tôi cam kết cung cấp phương tiện sạch sẽ, đầy đủ giấy tờ và hỗ trợ nhiệt tình để bạn có trải nghiệm di chuyển tốt nhất.
                </p>
            </div>
        </div>

        <div class="col-lg-5">
            <div class="sticky-top" style="top: 100px; z-index: 1;">
                <div class="p-4 bg-white rounded-4 shadow-sm border">
                    <%-- Trạng thái xe --%>
                    <c:choose>
                        <c:when test="${bike.status == 'Available'}">
                            <span class="badge bg-success-subtle text-success mb-2 px-3 py-2 rounded-pill small">Sẵn sàng</span>
                        </c:when>
                        <c:otherwise>
                            <span class="badge bg-secondary-subtle text-secondary mb-2 px-3 py-2 rounded-pill small">${bike.status}</span>
                        </c:otherwise>
                    </c:choose>

                    <h1 class="fw-bold mb-2 h3">${bike.brand} ${bike.model}</h1>
                    <div class="d-flex align-items-center mb-4">
                        <h2 class="text-primary-custom fw-bold mb-0 me-2">
                            <fmt:formatNumber value="${bike.pricePreDay}" type="number"/>₫
                        </h2>
                        <span class="text-muted">/ ngày</span>
                    </div>

                    <div class="row g-3 mb-4 text-center">
                        <div class="col-6">
                            <div class="p-3 bg-light rounded-3">
                                <i class="bi bi-palette text-primary mb-2 d-block fs-5"></i>
                                <span class="small fw-bold">${bike.color}</span>
                            </div>
                        </div>
                        <div class="col-6">
                            <div class="p-3 bg-light rounded-3">
                                <i class="bi bi-card-heading text-primary mb-2 d-block fs-5"></i>
                                <span class="small fw-bold">${bike.plateNumber}</span>
                            </div>
                        </div>
                    </div>

                    <ul class="list-unstyled small mb-4">
                        <li class="mb-3 d-flex align-items-center">
                            <i class="bi bi-check2-circle text-success me-3 fs-5"></i>
                            <span>Bao gồm <strong>02 mũ bảo hiểm</strong> đạt chuẩn</span>
                        </li>
                        <li class="mb-3 d-flex align-items-center">
                            <i class="bi bi-shield-check text-success me-3 fs-5"></i>
                            <span>Kiểm tra kỹ thuật trước khi giao</span>
                        </li>
                        <li class="mb-3 d-flex align-items-center">
                            <i class="bi bi-headset text-success me-3 fs-5"></i>
                            <span>Cứu hộ tận nơi nếu gặp sự cố</span>
                        </li>
                    </ul>

                    <hr class="my-4 opacity-25">

                    <<div class="d-grid gap-3">
                        <c:choose>
                            <c:when test="${bike.status == 'Available'}">
                                <c:choose>
                                    <c:when test="${not empty sessionScope.acc}">
                                        <a href="booking?plateNumber=${bike.plateNumber}" class="btn btn-primary-custom btn-lg py-3 fw-bold">
                                            <i class="bi bi-calendar-plus me-2"></i>ĐẶT XE NGAY
                                        </a>
                                    </c:when>

                                    <c:otherwise>
                                        <a href="javascript:void(0);" 
                                           onclick="alert('Vui lòng đăng nhập để sử dụng dịch vụ đặt xe!'); window.location.href = '${pageContext.request.contextPath}/login';" 
                                           class="btn btn-primary-custom btn-lg py-3 fw-bold">
                                            <i class="bi bi-calendar-plus me-2"></i>ĐẶT XE NGAY
                                        </a>
                                    </c:otherwise>
                                </c:choose>
                            </c:when>
                            <c:otherwise>
                                <button class="btn btn-secondary btn-lg py-3 fw-bold" disabled style="cursor: not-allowed; opacity: 0.7;">
                                    <i class="bi bi-slash-circle me-2"></i>HIỆN KHÔNG THỂ THUÊ
                                </button>
                                <p class="text-danger small mt-2 text-center">
                                    <i class="bi bi-info-circle"></i> 
                                    Xe hiện đang ${bike.status == 'Rented' ? 'được thuê' : 'bảo trì'}. Vui lòng quay lại sau!
                                </p>
                            </c:otherwise>
                        </c:choose>
                    </div>

                    <div class="mt-4 p-3 rounded-3 border-dashed text-center" style="background-color: #fff9f0; border: 1px dashed #FF6B35;">
                        <p class="small mb-0">
                            <i class="bi bi-geo-alt me-1"></i> 
                            Giao xe tận nơi trong vòng 15-30 phút
                        </p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<%@ include file="/includes/footer.jsp" %>