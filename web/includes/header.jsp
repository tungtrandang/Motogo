<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
        <link href="https://fonts.googleapis.com/css2?family=Oswald:wght@500;700&family=Manrope:wght@400;600;700&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/customer.css">
    </head>
    <body>
        <nav class="navbar navbar-expand-lg sticky-top">
            <div class="container">
                <a class="navbar-brand logo-text" href="${pageContext.request.contextPath}/">
                    <i class="bi bi-bicycle me-2"></i> MOTOGO
                </a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarNav">
                    <ul class="navbar-nav ms-auto align-items-center">
                        <li class="nav-item">
                            <a class="nav-link ${navPage == 'home' ? 'active' : ''}" href="${pageContext.request.contextPath}/index.jsp">Trang Chủ</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link ${navPage == 'bikes' ? 'active' : ''}" href="${pageContext.request.contextPath}/bikes">Danh Sách Xe</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link ${navPage == 'about' ? 'active' : ''}" href="${pageContext.request.contextPath}/about">Giới Thiệu</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link ${navPage == 'policy' ? 'active' : ''}" href="${pageContext.request.contextPath}/prici-policy">Bảng Giá & Chính Sách</a>
                        </li>

                        <c:choose>
                            <c:when test="${empty sessionScope.acc}">
                                <li class="nav-item ms-lg-3"><a class="btn-secondary-custom" href="${pageContext.request.contextPath}/login">Đăng nhập</a></li>
                                <li class="nav-item ms-lg-2"><a class="btn-primary-custom" href="${pageContext.request.contextPath}/register">Đăng ký</a></li>
                                </c:when>
                                <c:otherwise>
                                <li class="nav-item dropdown ms-lg-4">
                                    <a class="nav-link dropdown-toggle d-flex align-items-center p-0" href="#" data-bs-toggle="dropdown" aria-expanded="false">
                                        <div class="avatar-container ${navPage == 'user' ? 'border-primary shadow-sm' : ''}">
                                            <c:set var="avatarSrc">
                                                <c:choose>
                                                    <c:when test="${not empty sessionScope.acc.avatarUrl}">
                                                        ${pageContext.request.contextPath}/${sessionScope.acc.avatarUrl}
                                                    </c:when>
                                                    <c:otherwise>
                                                        ${pageContext.request.contextPath}/assets/img/avatar/avatar3.jpg
                                                    </c:otherwise>
                                                </c:choose>
                                            </c:set>
                                            <img src="${avatarSrc}" alt="User Avatar" class="navbar-avatar">
                                        </div>
                                    </a>
                                    <ul class="dropdown-menu dropdown-menu-end shadow border-0 mt-3 py-3" style="border-radius: 15px; min-width: 200px;">
                                        <li class="px-3 py-2 mb-2">
                                            <div class="d-flex flex-column">
                                                <span class="fw-bold text-dark">${sessionScope.acc.firstName} ${sessionScope.acc.lastName}</span>
                                                <span class="text-muted small">${sessionScope.acc.email}</span>
                                            </div>
                                        </li>
                                        <li><hr class="dropdown-divider mx-3"></li>
                                        <li>
                                            <a class="dropdown-item py-2" href="${pageContext.request.contextPath}/profile">
                                                <i class="bi bi-person me-2"></i> Hồ sơ của tôi
                                            </a>
                                        </li>
                                        <li>
                                            <a class="dropdown-item py-2" href="${pageContext.request.contextPath}/history">
                                                <i class="bi bi-clock-history me-2"></i> Lịch sử thuê xe
                                            </a>
                                        </li>
                                        <li>
                                            <a class="dropdown-item py-2" href="${pageContext.request.contextPath}/changepassword">
                                                <i class="bi bi-key me-2"></i> Đổi mật khẩu
                                            </a>
                                        </li>
                                        <li><hr class="dropdown-divider mx-3"></li>
                                        <li>
                                            <a class="dropdown-item py-2 text-danger fw-bold" href="${pageContext.request.contextPath}/logout">
                                                <i class="bi bi-box-arrow-right me-2"></i> Đăng xuất
                                            </a>
                                        </li>
                                    </ul>
                                </li>
                            </c:otherwise>
                        </c:choose>
                    </ul>
                </div>
            </div>
        </nav>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>