<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="navPage" value="bikes" scope="request" />
<%@ include file="/includes/header.jsp" %>
<div class="page-header">
    <div class="container">
        <h1 class="page-title">Danh Sách Xe</h1>
    </div>
</div>

<section class="bikes-section my-5">
    <div class="container">
        <div class="row">
            <aside class="col-lg-3">
                <div class="filter-sidebar card p-4 shadow-sm border-0" style="border-radius: 20px; background: white;">
                    <h5 class="fw-bold mb-4" style="color: var(--secondary-color);">
                        <i class="bi bi-funnel-fill me-2 text-primary-custom"></i>BỘ LỌC
                    </h5>

                    <form action="search" method="GET">
                        <div class="filter-group mb-4">
                            <label class="small fw-bold mb-2 d-block text-uppercase">Tìm theo tên</label>
                            <input type="text" class="form-control border-0 bg-light" placeholder="Nhập tên xe..." name="searchName" 
                                   value="${param.searchName}" style="border-radius: 10px; padding: 10px;">
                        </div>

                        <div class="filter-group mb-4">
                            <label class="small fw-bold mb-2 d-block text-uppercase">Hãng xe</label>
                            <div class="form-check mb-2">
                                <input class="form-check-input" type="checkbox" value="Honda" id="brandHonda" name="brands" ${paramValues.brands.contains('Honda') ? 'checked' : ''}>
                                <label class="form-check-label small" for="brandHonda">Honda</label>
                            </div>
                            <div class="form-check mb-2">
                                <input class="form-check-input" type="checkbox" value="Yamaha" id="brandYamaha" name="brands" ${paramValues.brands.contains('Yamaha') ? 'checked' : ''}>
                                <label class="form-check-label small" for="brandYamaha">Yamaha</label>
                            </div>
                            <div class="form-check mb-2">
                                <input class="form-check-input" type="checkbox" value="Piaggio" id="brandPiaggio" name="brands" ${paramValues.brands.contains('Piaggio') ? 'checked' : ''}>
                                <label class="form-check-label small" for="brandPiaggio">Piaggio</label>
                            </div>
                        </div>

                        <div class="filter-group mb-4">
                            <label class="small fw-bold mb-2 d-block text-uppercase">Loại xe</label>
                            <div class="form-check mb-2">
                                <input class="form-check-input" type="checkbox" value="Manual" name="types">
                                <label class="form-check-label small">Xe Số</label>
                            </div>
                            <div class="form-check mb-2">
                                <input class="form-check-input" type="checkbox" value="Scooter" name="types">
                                <label class="form-check-label small">Xe Tay Ga</label>
                            </div>
                        </div>

                        <div class="filter-group mb-4">
                            <label class="small fw-bold mb-2 d-block text-uppercase">Khoảng giá/ngày</label>
                            <select class="form-select border-0 bg-light" name="priceRange" style="border-radius: 10px;">
                                <option value="">Tất cả</option>
                                <option value="0-150000">Dưới 150.000₫</option>
                                <option value="150000-300000">150.000₫ - 300.000₫</option>
                                <option value="300000+">Trên 300.000₫</option>
                            </select>
                        </div>

                        <button type="submit" class="btn btn-primary-custom w-100 py-2 shadow-sm">
                            <i class="bi bi-search me-2"></i>ÁP DỤNG
                        </button>
                    </form>
                </div>
            </aside>

            <main class="col-lg-9">
                <div class="results-info mb-4 d-flex justify-content-between align-items-center bg-white p-3 rounded-4 shadow-sm">
                    <span class="text-secondary small">Tìm thấy <strong class="text-dark">${bikes.size()} xe</strong></span>
                    <select class="form-select form-select-sm border-0 w-auto bg-light">
                        <option>Mới nhất</option>
                        <option>Giá thấp đến cao</option>
                    </select>
                </div>

                <div class="row g-4">
                    <c:forEach items="${bikes}" var="b">
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
            </main>
        </div>
    </div>
</section>

<%@ include file="/includes/footer.jsp" %>