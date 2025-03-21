<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="common/header.jsp">
    <jsp:param name="title" value="MyCompany - 홈"/>
</jsp:include>

<!-- Hero Section -->
<div class="container-fluid p-0">
    <div class="position-relative">
        <img src="https://images.unsplash.com/photo-1497366216548-37526070297c" class="w-100" style="height: 600px; object-fit: cover;" alt="Office">
        <div class="position-absolute top-50 start-50 translate-middle text-center text-white">
            <h1 class="display-3 fw-bold mb-4">혁신적인 기술 솔루션</h1>
            <p class="lead mb-4">최고의 기술력으로 미래를 선도하는 기업</p>
            <a href="#contact" class="btn btn-primary btn-lg">문의하기</a>
        </div>
    </div>
</div>

<!-- About Section -->
<section id="about" class="py-5">
    <div class="container">
        <h2 class="text-center mb-5">회사 소개</h2>
        <div class="row">
            <div class="col-md-4 mb-4">
                <div class="card h-100 border-0 shadow-sm">
                    <div class="card-body text-center">
                        <i class="fas fa-chart-line fa-3x text-primary mb-3"></i>
                        <h4 class="card-title">비전</h4>
                        <p class="card-text">글로벌 시장을 선도하는 기술 혁신 기업으로 성장</p>
                    </div>
                </div>
            </div>
            <div class="col-md-4 mb-4">
                <div class="card h-100 border-0 shadow-sm">
                    <div class="card-body text-center">
                        <i class="fas fa-users fa-3x text-primary mb-3"></i>
                        <h4 class="card-title">인재상</h4>
                        <p class="card-text">창의적이고 도전적인 인재 양성</p>
                    </div>
                </div>
            </div>
            <div class="col-md-4 mb-4">
                <div class="card h-100 border-0 shadow-sm">
                    <div class="card-body text-center">
                        <i class="fas fa-handshake fa-3x text-primary mb-3"></i>
                        <h4 class="card-title">핵심가치</h4>
                        <p class="card-text">신뢰와 혁신을 바탕으로 한 지속 가능한 성장</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<!-- Services Section -->
<section class="py-5 bg-light">
    <div class="container">
        <h2 class="text-center mb-5">주요 서비스</h2>
        <div class="row">
            <div class="col-lg-3 col-md-6 mb-4">
                <div class="card border-0 shadow-sm">
                    <img src="https://images.unsplash.com/photo-1451187580459-43490279c0fa" class="card-img-top" alt="AI Solution">
                    <div class="card-body">
                        <h5 class="card-title">AI 솔루션</h5>
                        <p class="card-text">최신 인공지능 기술을 활용한 맞춤형 솔루션 제공</p>
                    </div>
                </div>
            </div>
            <div class="col-lg-3 col-md-6 mb-4">
                <div class="card border-0 shadow-sm">
                    <img src="https://images.unsplash.com/photo-1558494949-ef010cbdcc31" class="card-img-top" alt="Cloud Service">
                    <div class="card-body">
                        <h5 class="card-title">클라우드 서비스</h5>
                        <p class="card-text">안정적이고 확장 가능한 클라우드 인프라 구축</p>
                    </div>
                </div>
            </div>
            <div class="col-lg-3 col-md-6 mb-4">
                <div class="card border-0 shadow-sm">
                    <img src="https://images.unsplash.com/photo-1526374965328-7f61d4dc18c5" class="card-img-top" alt="Security">
                    <div class="card-body">
                        <h5 class="card-title">보안 솔루션</h5>
                        <p class="card-text">최첨단 보안 기술로 안전한 비즈니스 환경 조성</p>
                    </div>
                </div>
            </div>
            <div class="col-lg-3 col-md-6 mb-4">
                <div class="card border-0 shadow-sm">
                    <img src="https://images.unsplash.com/photo-1551434678-e076c223a692" class="card-img-top" alt="Consulting">
                    <div class="card-body">
                        <h5 class="card-title">IT 컨설팅</h5>
                        <p class="card-text">전문적인 IT 컨설팅으로 비즈니스 혁신 지원</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<!-- Contact Section -->
<section id="contact" class="py-5">
    <div class="container">
        <h2 class="text-center mb-5">문의하기</h2>
        <div class="row justify-content-center">
            <div class="col-md-8">
                <div class="card border-0 shadow-sm">
                    <div class="card-body">
                        <form>
                            <div class="mb-3">
                                <label for="name" class="form-label">이름</label>
                                <input type="text" class="form-control" id="name" required>
                            </div>
                            <div class="mb-3">
                                <label for="email" class="form-label">이메일</label>
                                <input type="email" class="form-control" id="email" required>
                            </div>
                            <div class="mb-3">
                                <label for="message" class="form-label">문의내용</label>
                                <textarea class="form-control" id="message" rows="5" required></textarea>
                            </div>
                            <div class="text-center">
                                <button type="submit" class="btn btn-primary">보내기</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<!-- Footer -->
<footer class="bg-dark text-white py-4">
    <div class="container">
        <div class="row">
            <div class="col-md-6">
                <h5><i class="fas fa-building me-2"></i>MyCompany</h5>
                <p>서울특별시 강남구 테헤란로 123<br>
                   전화: 02-123-4567<br>
                   이메일: info@mycompany.com</p>
            </div>
            <div class="col-md-6 text-md-end">
                <h5>Follow Us</h5>
                <div class="mt-3">
                    <a href="#" class="text-white me-3"><i class="fab fa-facebook fa-2x"></i></a>
                    <a href="#" class="text-white me-3"><i class="fab fa-twitter fa-2x"></i></a>
                    <a href="#" class="text-white me-3"><i class="fab fa-linkedin fa-2x"></i></a>
                    <a href="#" class="text-white"><i class="fab fa-instagram fa-2x"></i></a>
                </div>
            </div>
        </div>
        <hr>
        <div class="text-center">
            <small>&copy; 2024 MyCompany. All rights reserved.</small>
        </div>
    </div>
</footer>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html> 