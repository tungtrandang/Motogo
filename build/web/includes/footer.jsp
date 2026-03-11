<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<footer class="site-footer mt-5" style="background-color: var(--dark-color); color: rgba(255,255,255,0.8); font-family: var(--font-body);">
  <div class="container py-4"> 
    <div class="row gy-3"> 
      <div class="col-md-5 col-lg-4">
        <h6 class="mb-2 text-uppercase fw-bold" style="font-family: var(--font-display); color: var(--primary-color); letter-spacing: 0.5px; font-size: 1.2rem;">
          <i class="bi bi-bicycle me-2"></i>MotoGo
        </h6>
        <p class="x-small-text mb-3" style="line-height: 1.5; max-width: 320px;">
          Dịch vụ cho thuê xe máy uy tín, chất lượng hàng đầu tại Việt Nam. 
          Cam kết mang đến trải nghiệm tốt nhất trên mọi hành trình.
        </p>
        <div class="d-flex gap-2 fs-6"> 
          <a href="#" class="footer-icon-link"><i class="bi bi-facebook"></i></a>
          <a href="#" class="footer-icon-link"><i class="bi bi-instagram"></i></a>
          <a href="#" class="footer-icon-link"><i class="bi bi-youtube"></i></a>
        </div>
      </div>

      <div class="col-md-7 col-lg-5">
        <div class="row g-2"> 
          <div class="col-sm-6">
            <h6 class="text-uppercase fw-bold mb-2" style="font-family: var(--font-display); color: var(--accent-color); font-size: 0.9rem;">Liên hệ</h6>
            <ul class="list-unstyled x-small-text d-flex flex-column gap-1">
              <li><i class="bi bi-geo-alt me-2" style="color: var(--primary-color);"></i>123 Nguyễn Văn Linh, Q.7, TP.HCM</li>
              <li><i class="bi bi-telephone me-2" style="color: var(--primary-color);"></i>090 123 4567</li>
              <li><i class="bi bi-envelope me-2" style="color: var(--primary-color);"></i>contact@motogo.vn</li>
            </ul>
          </div>
          <div class="col-sm-6">
            <h6 class="text-uppercase fw-bold mb-2" style="font-family: var(--font-display); color: var(--accent-color); font-size: 0.9rem;">Giờ làm việc</h6>
            <ul class="list-unstyled x-small-text d-flex flex-column gap-1">
              <li>T2 - T6: <span class="text-light">08:00 - 20:00</span></li>
              <li>T7 - CN: <span class="text-light">07:30 - 21:00</span></li>
              <li class="mt-1" style="color: var(--accent-color); font-size: 0.75rem;">
                <i class="bi bi-clock-history me-1"></i>Hỗ trợ Hotline 24/7
              </li>
            </ul>
          </div>
        </div>
      </div>

      <div class="col-lg-3">
        <h6 class="text-uppercase fw-bold mb-2" style="font-family: var(--font-display); color: var(--accent-color); font-size: 0.9rem;">Liên kết</h6>
        <div class="d-flex flex-wrap flex-lg-column gap-1">
          <a class="footer-nav-link x-small-text" href="${pageContext.request.contextPath}/about">Về chúng tôi</a>
          <span class="d-lg-none mx-1 text-muted" style="font-size: 0.8rem;">|</span>
          <a class="footer-nav-link x-small-text" href="${pageContext.request.contextPath}/booking">Đặt lịch thuê</a>
          <span class="d-lg-none mx-1 text-muted" style="font-size: 0.8rem;">|</span>
          <a class="footer-nav-link x-small-text" href="${pageContext.request.contextPath}/prici-policy">Chính sách</a>
        </div>
      </div>
    </div>

    <hr class="my-3" style="border-color: rgba(255,255,255,0.1);">

    <div class="footer-bottom d-flex flex-column flex-md-row justify-content-between align-items-center" style="font-size: 0.75rem; opacity: 0.6;">
      <span>© 2026 <strong style="color: var(--primary-color);">MotoGo</strong>. All rights reserved.</span>
      <span>Designed for Course Project</span>
    </div>
  </div>
</footer>