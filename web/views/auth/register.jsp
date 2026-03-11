<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%-- Nhúng Header --%>
<%@ include file="/includes/header.jsp" %>

<main class="register-wrapper d-flex align-items-center py-5" style="min-height: calc(100vh - 160px); flex: 1;">
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-6">
                <div class="card border-0 shadow-lg p-4" style="border-radius: 15px;">
                    <h3 class="logo-text text-center mb-4" style="font-family: var(--font-display); color: var(--dark-color);">Đăng Ký</h3>
                    <c:if test="${not empty error}">
                        <div class="alert alert-danger alert-dismissible fade show mb-4" role="alert" style="border-radius: 10px;">
                            <i class="bi bi-exclamation-triangle-fill me-2"></i>
                            ${error}
                            <button type="button" class="btn-close" data-bs-dismiss="show" data-bs-target=".alert" aria-label="Close"></button>
                        </div>
                    </c:if>
                    <form action="${pageContext.request.contextPath}/register" method="POST" id="registerForm">
                        <div class="row">
                            <div class="col-md-6 mb-3">
                                <label class="form-label small fw-bold">Họ</label>
                                <input type="text" class="form-control" name="lastName" placeholder="Nguyễn" required style="border-radius: 10px;">
                            </div>
                            <div class="col-md-6 mb-3">
                                <label class="form-label small fw-bold">Tên</label>
                                <input type="text" class="form-control" name="firstName" placeholder="Văn A" required style="border-radius: 10px;">
                            </div>
                        </div>

                        <div class="mb-3">
                            <label class="form-label small fw-bold">Email</label>
                            <input type="email" class="form-control" name="email" placeholder="example@gmail.com" required style="border-radius: 10px;">
                        </div>

                        <div class="mb-3">
                            <label class="form-label small fw-bold">Số điện thoại</label>
                            <input type="tel" class="form-control" name="phone" placeholder="0901234567" required style="border-radius: 10px;">
                        </div>

                        <div class="mb-3">
                            <label class="form-label small fw-bold">Mật khẩu</label>
                            <input type="password" class="form-control" name="password" id="password" placeholder="********" required style="border-radius: 10px;">
                        </div>

                        <div class="mb-4">
                            <label class="form-label small fw-bold">Xác nhận mật khẩu</label>
                            <input type="password" class="form-control" name="confirmPassword" id="confirmPassword" placeholder="********" required style="border-radius: 10px;">
                        </div>

                        <button type="submit" class="btn btn-primary-custom w-100 mb-3">Đăng Ký</button>

                        <div class="text-center small">
                            Đã có tài khoản? <a href="${pageContext.request.contextPath}/login" class="fw-bold text-decoration-none" style="color: var(--secondary-color);">Đăng nhập</a>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</main>

<%@ include file="/includes/footer.jsp" %>

