<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%-- 1. CHỈ NHÚNG HEADER, KHÔNG KHAI BÁO THÊM HTML/BODY --%>
<%@ include file="/includes/header.jsp" %>

<main class="login-wrapper d-flex align-items-center justify-content-center" style="min-height: calc(100vh - 200px);">
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-5 col-lg-4">
                <div class="card border-0 shadow-lg p-4" style="border-radius: 20px;">
                    <h3 class="fw-bold text-center mb-4" style="font-family: var(--font-display); color: var(--dark-color);">Đăng Nhập</h3>
                    
                    <%-- HIỂN THỊ THÔNG BÁO LỖI TỪ SERVLET GỬI VỀ --%>
                    <c:if test="${not empty error}">
                        <div class="alert alert-danger small py-2" role="alert">
                            <i class="bi bi-exclamation-triangle-fill me-2"></i> ${error}
                        </div>
                    </c:if>

                    <form action="${pageContext.request.contextPath}/login" method="POST">
                        <div class="mb-3">
                            <label class="form-label small fw-bold">Tên đăng nhập / Email</label>
                            <input type="text" class="form-control" name="username" placeholder="Nhập tài khoản" required 
                                   style="border-radius: 10px; padding: 12px;">
                        </div>
                        
                        <div class="mb-1">
                            <label class="form-label small fw-bold">Mật khẩu</label>
                            <input type="password" class="form-control" name="password" placeholder="Nhập mật khẩu" required
                                   style="border-radius: 10px; padding: 12px;">
                        </div>

                        <div class="mb-4 text-end">
                            <a href="${pageContext.request.contextPath}/forgetpassword" class="text-decoration-none small text-muted">Quên mật khẩu?</a>
                        </div>

                        <button type="submit" class="btn btn-primary-custom w-100 mb-3 py-2">
                            ĐĂNG NHẬP
                        </button>
                        
                        <div class="text-center small">
                            <span>Chưa có tài khoản?</span> 
                            <a href="${pageContext.request.contextPath}/register" class="fw-bold text-decoration-none" style="color: var(--primary-color);">Đăng ký ngay</a>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</main>

<%-- 2. NHÚNG FOOTER --%>
<%@ include file="/includes/footer.jsp" %>