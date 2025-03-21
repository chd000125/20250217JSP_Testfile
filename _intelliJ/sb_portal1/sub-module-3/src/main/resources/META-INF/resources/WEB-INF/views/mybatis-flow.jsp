<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="common/header.jsp">
    <jsp:param name="title" value="마이바티스 플로우"/>
</jsp:include>

<div class="container mt-5">
    <h2 class="mb-4 text-center">스프링 부트와 마이바티스 작동 과정</h2>
    
    <div class="row mb-5">
        <div class="col-md-12">
            <div class="card shadow-sm">
                <div class="card-body">
                    <p class="lead text-center">
                        스프링 부트 애플리케이션에서 마이바티스가 어떻게 작동하는지 시각적으로 보여드립니다.
                        아래 버튼을 클릭하여 각 단계를 확인하세요.
                    </p>
                </div>
            </div>
        </div>
    </div>
    
    <div class="row mb-4">
        <div class="col-md-12">
            <div class="d-flex justify-content-center">
                <div class="btn-group" role="group">
                    <button type="button" class="btn btn-primary" onclick="showStep(1)">1. 요청 시작</button>
                    <button type="button" class="btn btn-primary" onclick="showStep(2)">2. 컨트롤러</button>
                    <button type="button" class="btn btn-primary" onclick="showStep(3)">3. 서비스</button>
                    <button type="button" class="btn btn-primary" onclick="showStep(4)">4. 매퍼</button>
                    <button type="button" class="btn btn-primary" onclick="showStep(5)">5. SQL 실행</button>
                    <button type="button" class="btn btn-primary" onclick="showStep(6)">6. 응답 반환</button>
                </div>
            </div>
        </div>
    </div>
    
    <div class="row">
        <div class="col-md-12">
            <div class="card shadow-sm">
                <div class="card-body">
                    <div id="flowContainer" class="text-center">
                        <div id="step1" class="flow-step">
                            <h3 class="mb-4">1. 클라이언트 요청</h3>
                            <div class="flow-diagram">
                                <svg width="800" height="400" viewBox="0 0 800 400">
                                    <defs>
                                        <marker id="arrowhead" markerWidth="10" markerHeight="7" refX="0" refY="3.5" orient="auto">
                                            <polygon points="0 0, 10 3.5, 0 7" fill="#2c3e50" />
                                        </marker>
                                    </defs>
                                    <rect x="50" y="150" width="150" height="80" rx="10" fill="#3498db" />
                                    <text x="125" y="195" text-anchor="middle" fill="white" font-weight="bold">클라이언트</text>
                                    
                                    <rect x="350" y="150" width="150" height="80" rx="10" fill="#2c3e50" />
                                    <text x="425" y="195" text-anchor="middle" fill="white" font-weight="bold">스프링 부트</text>
                                    
                                    <line x1="200" y1="190" x2="350" y2="190" stroke="#2c3e50" stroke-width="2" marker-end="url(#arrowhead)" />
                                    <text x="275" y="180" text-anchor="middle" fill="#2c3e50" font-weight="bold">HTTP 요청</text>
                                </svg>
                            </div>
                            <div class="flow-description mt-3">
                                <p>클라이언트(브라우저)가 HTTP 요청을 보내면 스프링 부트 애플리케이션이 이를 받습니다.</p>
                                <p>예: <code>GET /board</code> 요청이 게시판 목록을 요청합니다.</p>
                            </div>
                        </div>
                        
                        <div id="step2" class="flow-step" style="display: none;">
                            <h3 class="mb-4">2. 컨트롤러 처리</h3>
                            <div class="flow-diagram">
                                <svg width="800" height="400" viewBox="0 0 800 400">
                                    <defs>
                                        <marker id="arrowhead" markerWidth="10" markerHeight="7" refX="0" refY="3.5" orient="auto">
                                            <polygon points="0 0, 10 3.5, 0 7" fill="#2c3e50" />
                                        </marker>
                                    </defs>
                                    <rect x="50" y="150" width="150" height="80" rx="10" fill="#3498db" opacity="0.5" />
                                    <text x="125" y="195" text-anchor="middle" fill="white" font-weight="bold">클라이언트</text>
                                    
                                    <rect x="350" y="50" width="150" height="80" rx="10" fill="#2c3e50" />
                                    <text x="425" y="95" text-anchor="middle" fill="white" font-weight="bold">디스패처 서블릿</text>
                                    
                                    <rect x="350" y="250" width="150" height="80" rx="10" fill="#e74c3c" />
                                    <text x="425" y="295" text-anchor="middle" fill="white" font-weight="bold">컨트롤러</text>
                                    
                                    <line x1="425" y1="130" x2="425" y2="250" stroke="#2c3e50" stroke-width="2" marker-end="url(#arrowhead)" />
                                    <text x="445" y="190" text-anchor="start" fill="#2c3e50" font-weight="bold">요청 매핑</text>
                                </svg>
                            </div>
                            <div class="flow-description mt-3">
                                <p>스프링의 디스패처 서블릿이 요청을 받아 적절한 컨트롤러로 라우팅합니다.</p>
                                <p>예: <code>BoardController</code>의 <code>list()</code> 메서드가 호출됩니다.</p>
                                <pre class="bg-light p-3 text-start"><code>@GetMapping
public String list(Model model) {
    model.addAttribute("boards", boardService.getAllBoards());
    return "board/list";
}</code></pre>
                            </div>
                        </div>
                        
                        <div id="step3" class="flow-step" style="display: none;">
                            <h3 class="mb-4">3. 서비스 계층</h3>
                            <div class="flow-diagram">
                                <svg width="800" height="400" viewBox="0 0 800 400">
                                    <defs>
                                        <marker id="arrowhead" markerWidth="10" markerHeight="7" refX="0" refY="3.5" orient="auto">
                                            <polygon points="0 0, 10 3.5, 0 7" fill="#2c3e50" />
                                        </marker>
                                    </defs>
                                    <rect x="50" y="150" width="150" height="80" rx="10" fill="#e74c3c" opacity="0.5" />
                                    <text x="125" y="195" text-anchor="middle" fill="white" font-weight="bold">컨트롤러</text>
                                    
                                    <rect x="350" y="150" width="150" height="80" rx="10" fill="#f39c12" />
                                    <text x="425" y="195" text-anchor="middle" fill="white" font-weight="bold">서비스</text>
                                    
                                    <line x1="200" y1="190" x2="350" y2="190" stroke="#2c3e50" stroke-width="2" marker-end="url(#arrowhead)" />
                                    <text x="275" y="180" text-anchor="middle" fill="#2c3e50" font-weight="bold">메서드 호출</text>
                                </svg>
                            </div>
                            <div class="flow-description mt-3">
                                <p>컨트롤러는 비즈니스 로직을 처리하기 위해 서비스 계층을 호출합니다.</p>
                                <p>예: <code>BoardService</code>의 <code>getAllBoards()</code> 메서드가 호출됩니다.</p>
                                <pre class="bg-light p-3 text-start"><code>public List&lt;Board&gt; getAllBoards() {
    return boardMapper.findAll();
}</code></pre>
                            </div>
                        </div>
                        
                        <div id="step4" class="flow-step" style="display: none;">
                            <h3 class="mb-4">4. 매퍼 인터페이스</h3>
                            <div class="flow-diagram">
                                <svg width="800" height="400" viewBox="0 0 800 400">
                                    <defs>
                                        <marker id="arrowhead" markerWidth="10" markerHeight="7" refX="0" refY="3.5" orient="auto">
                                            <polygon points="0 0, 10 3.5, 0 7" fill="#2c3e50" />
                                        </marker>
                                    </defs>
                                    <rect x="50" y="150" width="150" height="80" rx="10" fill="#f39c12" opacity="0.5" />
                                    <text x="125" y="195" text-anchor="middle" fill="white" font-weight="bold">서비스</text>
                                    
                                    <rect x="350" y="150" width="150" height="80" rx="10" fill="#9b59b6" />
                                    <text x="425" y="195" text-anchor="middle" fill="white" font-weight="bold">매퍼 인터페이스</text>
                                    
                                    <line x1="200" y1="190" x2="350" y2="190" stroke="#2c3e50" stroke-width="2" marker-end="url(#arrowhead)" />
                                    <text x="275" y="180" text-anchor="middle" fill="#2c3e50" font-weight="bold">메서드 호출</text>
                                </svg>
                            </div>
                            <div class="flow-description mt-3">
                                <p>서비스는 데이터 액세스를 위해 마이바티스 매퍼 인터페이스를 호출합니다.</p>
                                <p>예: <code>BoardMapper</code>의 <code>findAll()</code> 메서드가 호출됩니다.</p>
                                <pre class="bg-light p-3 text-start"><code>@Mapper
public interface BoardMapper {
    @Select("SELECT * FROM board")
    List&lt;Board&gt; findAll();
    
    // 다른 메서드들...
}</code></pre>
                            </div>
                        </div>
                        
                        <div id="step5" class="flow-step" style="display: none;">
                            <h3 class="mb-4">5. SQL 실행</h3>
                            <div class="flow-diagram">
                                <svg width="800" height="400" viewBox="0 0 800 400">
                                    <defs>
                                        <marker id="arrowhead" markerWidth="10" markerHeight="7" refX="0" refY="3.5" orient="auto">
                                            <polygon points="0 0, 10 3.5, 0 7" fill="#2c3e50" />
                                        </marker>
                                    </defs>
                                    <rect x="50" y="150" width="150" height="80" rx="10" fill="#9b59b6" opacity="0.5" />
                                    <text x="125" y="195" text-anchor="middle" fill="white" font-weight="bold">매퍼 인터페이스</text>
                                    
                                    <rect x="350" y="50" width="150" height="80" rx="10" fill="#27ae60" />
                                    <text x="425" y="95" text-anchor="middle" fill="white" font-weight="bold">마이바티스</text>
                                    
                                    <rect x="350" y="250" width="150" height="80" rx="10" fill="#16a085" />
                                    <text x="425" y="295" text-anchor="middle" fill="white" font-weight="bold">데이터베이스</text>
                                    
                                    <line x1="200" y1="190" x2="350" y2="90" stroke="#2c3e50" stroke-width="2" marker-end="url(#arrowhead)" />
                                    <text x="275" y="130" text-anchor="middle" fill="#2c3e50" font-weight="bold">프록시 호출</text>
                                    
                                    <line x1="425" y1="130" x2="425" y2="250" stroke="#2c3e50" stroke-width="2" marker-end="url(#arrowhead)" />
                                    <text x="445" y="190" text-anchor="start" fill="#2c3e50" font-weight="bold">SQL 실행</text>
                                </svg>
                            </div>
                            <div class="flow-description mt-3">
                                <p>마이바티스는 매퍼 인터페이스의 메서드를 프록시하여 SQL을 실행합니다.</p>
                                <p>1. 매퍼 인터페이스의 어노테이션에서 SQL을 추출합니다.</p>
                                <p>2. JDBC를 통해 데이터베이스에 SQL을 실행합니다.</p>
                                <p>3. 결과를 자바 객체로 매핑합니다.</p>
                                <pre class="bg-light p-3 text-start"><code>실행된 SQL: SELECT * FROM board</code></pre>
                            </div>
                        </div>
                        
                        <div id="step6" class="flow-step" style="display: none;">
                            <h3 class="mb-4">6. 응답 반환</h3>
                            <div class="flow-diagram">
                                <svg width="800" height="400" viewBox="0 0 800 400">
                                    <defs>
                                        <marker id="arrowhead" markerWidth="10" markerHeight="7" refX="0" refY="3.5" orient="auto">
                                            <polygon points="0 0, 10 3.5, 0 7" fill="#2c3e50" />
                                        </marker>
                                    </defs>
                                    <rect x="50" y="150" width="150" height="80" rx="10" fill="#3498db" />
                                    <text x="125" y="195" text-anchor="middle" fill="white" font-weight="bold">클라이언트</text>
                                    
                                    <rect x="350" y="50" width="150" height="80" rx="10" fill="#e74c3c" opacity="0.5" />
                                    <text x="425" y="95" text-anchor="middle" fill="white" font-weight="bold">컨트롤러</text>
                                    
                                    <rect x="350" y="250" width="150" height="80" rx="10" fill="#2c3e50" opacity="0.5" />
                                    <text x="425" y="295" text-anchor="middle" fill="white" font-weight="bold">뷰 (JSP)</text>
                                    
                                    <rect x="600" y="150" width="150" height="80" rx="10" fill="#16a085" opacity="0.5" />
                                    <text x="675" y="195" text-anchor="middle" fill="white" font-weight="bold">데이터베이스</text>
                                    
                                    <line x1="425" y1="130" x2="425" y2="250" stroke="#2c3e50" stroke-width="2" marker-end="url(#arrowhead)" />
                                    <text x="445" y="190" text-anchor="start" fill="#2c3e50" font-weight="bold">모델 전달</text>
                                    
                                    <line x1="350" y1="290" x2="200" y2="190" stroke="#2c3e50" stroke-width="2" marker-end="url(#arrowhead)" />
                                    <text x="275" y="260" text-anchor="middle" fill="#2c3e50" font-weight="bold">HTML 응답</text>
                                    
                                    <line x1="600" y1="190" x2="500" y2="90" stroke="#2c3e50" stroke-width="2" marker-end="url(#arrowhead)" />
                                    <text x="550" y="130" text-anchor="middle" fill="#2c3e50" font-weight="bold">데이터 반환</text>
                                </svg>
                            </div>
                            <div class="flow-description mt-3">
                                <p>데이터베이스에서 가져온 데이터는 역순으로 전달됩니다:</p>
                                <p>1. 데이터베이스 → 마이바티스 → 매퍼 → 서비스 → 컨트롤러</p>
                                <p>2. 컨트롤러는 모델에 데이터를 추가하고 뷰 이름을 반환합니다.</p>
                                <p>3. 스프링은 뷰를 렌더링하고 HTML을 클라이언트에 반환합니다.</p>
                                <pre class="bg-light p-3 text-start"><code>// 컨트롤러에서 모델에 데이터 추가
model.addAttribute("boards", boardService.getAllBoards());
return "board/list";  // 뷰 이름 반환</code></pre>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
    <div class="row mt-5">
        <div class="col-md-12">
            <div class="card shadow-sm">
                <div class="card-header bg-primary text-white">
                    <h4 class="mb-0">실시간 마이바티스 로그</h4>
                </div>
                <div class="card-body">
                    <div id="mybatisLog" class="bg-dark text-light p-3" style="height: 200px; overflow-y: auto; font-family: monospace;">
                        <div>--- 마이바티스 로그가 여기에 표시됩니다 ---</div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
    <div class="row mt-4 mb-5">
        <div class="col-md-12">
            <div class="card shadow-sm">
                <div class="card-header bg-success text-white">
                    <h4 class="mb-0">마이바티스 테스트</h4>
                </div>
                <div class="card-body">
                    <p>아래 버튼을 클릭하여 실제 마이바티스 작동을 테스트해보세요:</p>
                    <div class="d-flex justify-content-center">
                        <button id="testSelect" class="btn btn-primary me-2">SELECT 테스트</button>
                        <button id="testInsert" class="btn btn-success me-2">INSERT 테스트</button>
                        <button id="testUpdate" class="btn btn-warning me-2">UPDATE 테스트</button>
                        <button id="testDelete" class="btn btn-danger">DELETE 테스트</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<script>
    function showStep(step) {
        // 모든 단계 숨기기
        document.querySelectorAll('.flow-step').forEach(el => {
            el.style.display = 'none';
        });
        
        // 선택한 단계 표시
        document.getElementById('step' + step).style.display = 'block';
    }
    
    // 페이지 로드 시 첫 번째 단계 표시
    document.addEventListener('DOMContentLoaded', function() {
        showStep(1);
        
        // 테스트 버튼 이벤트 리스너
        document.getElementById('testSelect').addEventListener('click', function() {
            simulateMybatisOperation('SELECT', 'SELECT * FROM board WHERE id = 1');
        });
        
        document.getElementById('testInsert').addEventListener('click', function() {
            simulateMybatisOperation('INSERT', "INSERT INTO board (title, content, author) VALUES ('새 게시글', '내용입니다', '작성자')");
        });
        
        document.getElementById('testUpdate').addEventListener('click', function() {
            simulateMybatisOperation('UPDATE', "UPDATE board SET title = '수정된 제목', content = '수정된 내용' WHERE id = 1");
        });
        
        document.getElementById('testDelete').addEventListener('click', function() {
            simulateMybatisOperation('DELETE', 'DELETE FROM board WHERE id = 3');
        });
    });
    
    function simulateMybatisOperation(operation, sql) {
        const logContainer = document.getElementById('mybatisLog');
        
        // 로그 추가 함수
        function addLog(message, className = '') {
            const logEntry = document.createElement('div');
            logEntry.textContent = message;
            if (className) {
                logEntry.className = className;
            }
            logContainer.appendChild(logEntry);
            logContainer.scrollTop = logContainer.scrollHeight;
        }
        
        // 타임스탬프 생성
        const now = new Date();
        const timestamp = now.toISOString().replace('T', ' ').substring(0, 19);
        
        // 로그 시뮬레이션
        addLog(`[${timestamp}] [DEBUG] [org.mybatis.spring.SqlSessionUtils] - Creating a new SqlSession`);
        addLog(`[${timestamp}] [DEBUG] [org.mybatis.spring.SqlSessionUtils] - SqlSession [org.apache.ibatis.session.defaults.DefaultSqlSession@5a01ccaa] was not registered for synchronization because synchronization is not active`);
        
        setTimeout(() => {
            addLog(`[${timestamp}] [DEBUG] [org.mybatis.spring.transaction.SpringManagedTransaction] - JDBC Connection [HikariProxyConnection@1765369575 wrapping com.mysql.cj.jdbc.ConnectionImpl@4b013c76] will not be managed by Spring`);
            addLog(`[${timestamp}] [DEBUG] [com.example.sb_mybatis.mapper.BoardMapper.${operation.toLowerCase()}] - ==>  Preparing: ${sql}`);
        }, 500);
        
        setTimeout(() => {
            if (operation === 'SELECT') {
                addLog(`[${timestamp}] [DEBUG] [com.example.sb_mybatis.mapper.BoardMapper.${operation.toLowerCase()}] - ==> Parameters: `);
                addLog(`[${timestamp}] [DEBUG] [com.example.sb_mybatis.mapper.BoardMapper.${operation.toLowerCase()}] - <==    Results: Board(id=1, title=첫 번째 게시글입니다., content=안녕하세요. 첫 번째 게시글의 내용입니다., author=관리자, createdAt=2023-06-15 10:30:00.0, updatedAt=null)`);
            } else {
                addLog(`[${timestamp}] [DEBUG] [com.example.sb_mybatis.mapper.BoardMapper.${operation.toLowerCase()}] - ==> Parameters: `);
                addLog(`[${timestamp}] [DEBUG] [com.example.sb_mybatis.mapper.BoardMapper.${operation.toLowerCase()}] - <==    Updates: 1`);
            }
        }, 1000);
        
        setTimeout(() => {
            addLog(`[${timestamp}] [DEBUG] [org.mybatis.spring.SqlSessionUtils] - Closing non transactional SqlSession [org.apache.ibatis.session.defaults.DefaultSqlSession@5a01ccaa]`);
            addLog(`[${timestamp}] [INFO] [com.example.sb_mybatis.service.BoardService] - ${operation} operation completed successfully`);
        }, 1500);
    }
</script>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html> 