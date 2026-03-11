<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%-- Nhúng Header từ thư mục includes theo cấu trúc dự án --%>
<c:set var="navPage" value="home" scope="request" />
<jsp:include page="/includes/header.jsp" />
<main>
    <section class="hero-section d-flex align-items-center" 
             style="background: linear-gradient(rgba(0, 0, 0, 0.5), rgba(0, 0, 0, 0.3)),
             url('${pageContext.request.contextPath}/assets/img/background/background.jpg') center/cover no-repeat;
             min-height: 50vh;
             border-radius: 0 0 40px 40px;">
        <div class="container text-white">
            <div style="max-width: 600px;">
                <h1 class="page-title" style="font-size: 3.5rem; line-height: 1.2;">THUÊ XE MÁY<br>NHANH CHÓNG</h1>
                <p class="mb-4" style="font-size: 1.1rem; opacity: 0.9;">Trải nghiệm dịch vụ thuê xe chất lượng cao với giá cả hợp lý. Thủ tục đơn giản, sẵn sàng phục vụ 24/7.</p>

                <div class="d-flex gap-3">
                    <a href="${pageContext.request.contextPath}/bikes" class="btn-primary-custom">THUÊ XE NGAY →</a>
                    <c:if test="${empty sessionScope.acc}">
                        <a href="${pageContext.request.contextPath}/login" class="btn-secondary-custom">ĐĂNG NHẬP</a>
                    </c:if>
                </div>
            </div>
        </div>
    </section>

    <section class="container py-5">
        <h2 class="section-title">XE NỔI BẬT</h2>
        ${abc}
        <div class="row g-4">
            <c:forEach items="${listBikes}" var="b">
                <div class="col-lg-4 col-md-6">
                    <div class="bike-card">
                        <div class="bike-img" style="background-image: url('${pageContext.request.contextPath}/${b.imgBike}');"></div>
                        <div class="bike-body">
                            <h3 class="bike-name">${b.brand} ${b.model}</h3>
                            <div class="bike-specs mb-2 small text-muted">
                                <i class="bi bi-palette me-1"></i>${b.color} | 
                                <i class="bi bi-card-text me-1"></i>${b.plateNumber}
                            </div>
                            <div class="bike-price mb-2">
                                <fmt:formatNumber value="${b.pricePreDay}" type="number"/>₫
                                <span class="small text-secondary fw-normal">/ngày</span>
                            </div>

                            <div class="bike-body">
                                <h3 class="bike-name">${b.brand} ${b.model}</h3>
                                <c:choose>
                                    <c:when test="${b.status == 'Available'}">
                                        <span class="badge-available">Sẵn sàng</span>
                                    </c:when>
                                    <c:otherwise>
                                        <span class="badge-busy" style="background: #eee; color: #666; padding: 5px 10px; border-radius: 10px; font-size: 0.8rem;">
                                            ${b.status == 'Rented' ? 'Đang thuê' : 'Bảo trì'}
                                        </span>
                                    </c:otherwise>
                                </c:choose>

                                <a href="details?id=${b.plateNumber}" class="btn btn-secondary-custom w-100 mt-3 py-2">XEM CHI TIẾT</a>
                            </div>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>

        <div class="text-center mt-5">
            <a href="${pageContext.request.contextPath}/bikes" class="footer-nav-link fw-bold" style="font-size: 1.1rem;">XEM TẤT CẢ CÁC LOẠI XE →</a>
        </div>
    </section>
</main>

<jsp:include page="/includes/footer.jsp" />