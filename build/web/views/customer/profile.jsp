<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<jsp:include page="/includes/header.jsp" />

<%-- Đánh dấu để Sidebar biết trang này là 'profile' --%>
<c:set var="activePage" value="profile" scope="request" />

<main style="flex: 1;">
    <div class="container my-5">
        <div class="row g-4">

            <jsp:include page="sidebar.jsp" />

            <div class="col-lg-9">
                <div class="card border-0 shadow-sm p-4" style="border-radius: 20px;">
                    <h4 class="fw-bold mb-4">Thông tin cá nhân</h4>
                    
                    <c:if test="${not empty message}">
                        <div class="alert alert-success alert-dismissible fade show" role="alert">
                            <i class="bi bi-check-circle-fill me-2"></i> ${message}
                            <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
                        </div>
                    </c:if>

                    <c:if test="${not empty error}">
                        <div class="alert alert-danger alert-dismissible fade show" role="alert">
                            <i class="bi bi-exclamation-triangle-fill me-2"></i> ${error}
                            <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
                        </div>
                    </c:if>
                    
                    <form action="updateaccount?action=updateInfo" method="POST">
                        <div class="row g-3">
                            <div class="col-md-6">
                                <label class="form-label fw-bold small text-muted">Họ và tên đệm</label>
                                <input type="text" name="lastName" class="form-control custom-input" 
                                       value="${sessionScope.acc.lastName}" placeholder="Nhập họ...">
                            </div>
                            <div class="col-md-6">
                                <label class="form-label fw-bold small text-muted">Tên</label>
                                <input type="text" name="firstName" class="form-control custom-input" 
                                       value="${sessionScope.acc.firstName}" placeholder="Nhập tên...">
                            </div>
                            <div class="col-md-6">
                                <label class="form-label fw-bold small text-muted">Số điện thoại</label>
                                <input type="text" name="phoneNumber" class="form-control custom-input bg-light" 
                                       value="${sessionScope.acc.phoneNumber}" readonly>
                            </div>
                            <div class="col-md-6">
                                <label class="form-label fw-bold small text-muted">Email</label>
                                <input type="email" class="form-control custom-input bg-light" 
                                       value="${sessionScope.acc.email}" readonly>
                            </div>

                            <div class="col-12 text-end mt-4">
                                <button type="submit" class="btn fw-bold px-4 py-2" 
                                        style="background-color: #FF6B35; color: white; border-radius: 25px; border: none; transition: 0.3s;">
                                    LƯU THAY ĐỔI
                                </button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</main>

<jsp:include page="/includes/footer.jsp" />