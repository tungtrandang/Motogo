<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:include page="/includes/header.jsp" />

<%-- 1. Đổi activePage thành password để sidebar highlight đúng mục --%>
<c:set var="activePage" value="password" scope="request" />
<main style="flex: 1;">
    <div class="container my-5">
        <div class="row g-4">

            <jsp:include page="sidebar.jsp" />

            <div class="col-lg-9">
                <div class="card border-0 shadow-sm p-4" style="border-radius: 20px;">
                    <h4 class="fw-bold mb-4">Đổi mật khẩu</h4>

                    <form action="updateaccount?action=changePass" method="POST">
                        <div class="row g-3">
                            <div class="col-md-12">
                                <label class="form-label fw-bold small text-muted">Nhập mật khẩu cũ</label>
                                <input type="password" name="oldPassword" class="form-control custom-input" 
                                       required placeholder="********">
                            </div>
                            <div class="col-md-6">
                                <label class="form-label fw-bold small text-muted">Nhập mật khẩu mới</label>
                                <input type="password" name="newPassword" id="newPassword" class="form-control custom-input" 
                                       required placeholder="********">
                            </div>
                            <div class="col-md-6">
                                <label class="form-label fw-bold small text-muted">Xác minh mật khẩu mới</label>
                                <input type="password" name="confirmPassword" id="confirmPassword" class="form-control custom-input" 
                                       required placeholder="********">
                            </div>

                            <div class="col-12 text-end mt-4">
                                <button type="submit" class="btn fw-bold px-4 py-2" 
                                        style="background-color: #FF6B35; color: white; border-radius: 25px; border: none; transition: 0.3s;">
                                    ĐỔI MẬT KHẨU
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