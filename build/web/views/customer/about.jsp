<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="navPage" value="about" scope="request" />
<jsp:include page="/includes/header.jsp" />

<%-- Tận dụng class .page-header và .page-title từ CSS của bạn --%>
<header class="page-header">
    <div class="container">
        <h1 class="page-title">Về Chúng Tôi</h1>
    </div>
</header>

<main class="container my-5">
    <section class="row justify-content-center text-center mb-5">
        <div class="col-lg-10">
            <h2 class="fw-bold mb-4" style="color: var(--primary-color); font-family: var(--font-display);">MOTOGO - Đơn vị cho thuê xe máy hàng đầu</h2>
            <div class="lh-lg" style="color: var(--dark-color); font-size: 1.1rem;">
                <p>MOTOGO là đơn vị hàng đầu trong lĩnh vực cho thuê xe máy tại Việt Nam, với hơn 10 năm kinh nghiệm phục vụ khách hàng. Chúng tôi tự hào mang đến dịch vụ cho thuê xe chất lượng cao, đáp ứng mọi nhu cầu di chuyển của bạn.</p>
                <p>Với đội ngũ nhân viên chuyên nghiệp, nhiệt tình và hệ thống xe đa dạng, luôn được bảo dưỡng định kỳ, chúng tôi cam kết mang đến trải nghiệm thuê xe tốt nhất. Mỗi chiếc xe đều được kiểm tra kỹ lưỡng trước khi giao, đảm bảo an toàn tuyệt đối.</p>
                <p>Sự hài lòng của khách hàng chính là động lực để chúng tôi không ngừng cải tiến và phát triển.</p>
            </div>
        </div>
    </section>

    <section class="mb-5">
        <h2 class="text-center fw-bold mb-5" style="font-family: var(--font-display);">TẠI SAO CHỌN CHÚNG TÔI</h2>
        <div class="row g-4">
            <c:set var="reasons" value="${['Uy Tín & An Toàn', 'Giá Cả Hợp Lý', 'Xe Đa Dạng', 'Phục Vụ 24/7', 'Thủ Tục Nhanh', 'Hỗ Trợ Tận Tâm']}" />
            <c:forEach var="reason" items="${reasons}" varStatus="status">
                <div class="col-md-4">
                    <%-- Dùng border-start và màu sắc từ :root để tạo điểm nhấn đơn giản --%>
                    <div class="p-4 bg-white h-100 shadow-sm border-start border-4" 
                         style="border-color: ${status.index < 3 ? 'var(--primary-color)' : 'var(--secondary-color)'} !important; border-radius: 0 15px 15px 0;">
                        <h5 class="fw-bold text-uppercase small">${reason}</h5>
                        <p class="small text-muted mb-0">Cam kết mang lại chất lượng dịch vụ tốt nhất, minh bạch và tận tâm trong từng giao dịch.</p>
                    </div>
                </div>
            </c:forEach>
        </div>
    </section>

    <section class="row py-5 text-center rounded-4 mb-5" style="background-color: var(--light-color);">
        <div class="col-6 col-md-3 border-end">
            <h2 class="fw-bold" style="color: var(--primary-color); font-family: var(--font-display);">200+</h2>
            <span class="text-uppercase small fw-bold">Xe Chất Lượng</span>
        </div>
        <div class="col-6 col-md-3 border-end">
            <h2 class="fw-bold" style="color: var(--primary-color); font-family: var(--font-display);">5000+</h2>
            <span class="text-uppercase small fw-bold">Khách Hàng</span>
        </div>
        <div class="col-6 col-md-3 border-end">
            <h2 class="fw-bold" style="color: var(--primary-color); font-family: var(--font-display);">10+</h2>
            <span class="text-uppercase small fw-bold">Năm Kinh Nghiệm</span>
        </div>
        <div class="col-6 col-md-3">
            <h2 class="fw-bold" style="color: var(--primary-color); font-family: var(--font-display);">24/7</h2>
            <span class="text-uppercase small fw-bold">Hỗ Trợ</span>
        </div>
    </section>

    <section class="row g-4">
        <div class="col-md-6">
            <div class="p-4 text-white h-100 shadow-sm" style="background: var(--dark-color); border-radius: 15px;">
                <h3 class="fw-bold mb-3" style="font-family: var(--font-display); color: #FFD23F;">TẦM NHÌN</h3>
                <p class="small" style="opacity: 0.8; line-height: 1.7;">Trở thành đơn vị cho thuê xe máy hàng đầu Việt Nam, được khách hàng tin tưởng và lựa chọn số 1 cho mọi nhu cầu di chuyển trên toàn quốc.</p>
            </div>
        </div>
        <div class="col-md-6">
            <div class="p-4 border h-100 shadow-sm" style="background: white; border-radius: 15px;">
                <h3 class="fw-bold mb-3" style="font-family: var(--font-display); color: var(--secondary-color);">SỨ MỆNH</h3>
                <p class="small text-muted" style="line-height: 1.7;">Cung cấp dịch vụ chất lượng cao với giá cả hợp lý, không ngừng đầu tư vào đội xe hiện đại và đào tạo nhân viên chuyên nghiệp.</p>
            </div>
        </div>
    </section>
</main>

<%-- Nhúng Footer --%>
<jsp:include page="/includes/footer.jsp" />