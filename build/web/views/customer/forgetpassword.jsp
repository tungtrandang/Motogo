<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="/includes/header.jsp" %>

<main style="flex: 1;">
    <section class="py-5">
        <div class="container">
            <div class="bike-card mx-auto p-5" style="max-width: 500px;">
                <h2 class="fw-bold text-center mb-4" style="font-family: var(--font-display); color: var(--dark-color);">
                    QUÊN MẬT KHẨU?
                </h2>
                <p class="text-center text-muted small mb-4">
                    Nhập số điện thoại để nhận hướng dẫn đặt lại mật khẩu.
                </p>
                <form action="forgot-password" method="POST">
                    <div class="mb-4">
                        <label class="form-label fw-bold small">Số điện thoại</label>
                        <input type="tel" name="phone" class="form-control" placeholder="0901234567" required>
                    </div>

                    <button type="submit" class="btn-primary-custom w-100">
                        GỬI YÊU CẦU
                    </button>
                    <div class="text-center text-muted small mb-4">
                        <a href="${pageContext.request.contextPath}/login" class="back-link">
                            Quay lại đăng nhập
                        </a>
                    </div>
                </form>
            </div>
        </div>
    </section>
</main>
<%@ include file="/includes/footer.jsp" %>