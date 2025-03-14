<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>AOP 작동방식 설명</title>
    <style>
        body {
            font-family: 'Noto Sans KR', Arial, sans-serif;
            margin: 0;
            padding: 20px;
            line-height: 1.6;
            color: #333;
        }
        .container {
            max-width: 1000px;
            margin: 0 auto;
            padding: 20px;
            border: 1px solid #ddd;
            border-radius: 5px;
            background-color: #fff;
        }
        h1, h2, h3 {
            color: #2c3e50;
        }
        h1 {
            border-bottom: 2px solid #3498db;
            padding-bottom: 10px;
            margin-bottom: 30px;
        }
        .section {
            margin-bottom: 40px;
            padding: 20px;
            background-color: #f9f9f9;
            border-radius: 5px;
            box-shadow: 0 2px 5px rgba(0,0,0,0.1);
        }
        .diagram {
            margin: 30px auto;
            text-align: center;
            padding: 20px;
            background-color: #fff;
            border-radius: 5px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
        }
        .diagram img {
            max-width: 100%;
        }
        .code-block {
            background-color: #f4f4f4;
            border-left: 4px solid #3498db;
            padding: 15px;
            margin: 20px 0;
            font-family: Consolas, Monaco, 'Andale Mono', monospace;
            overflow-x: auto;
        }
        .highlight {
            background-color: #ffffcc;
            padding: 2px 5px;
            border-radius: 3px;
        }
        .aop-flow {
            display: flex;
            flex-direction: column;
            align-items: center;
            margin: 30px 0;
        }
        .aop-step {
            width: 80%;
            padding: 15px;
            margin: 10px 0;
            border-radius: 5px;
            text-align: center;
            position: relative;
        }
        .aop-step:after {
            content: "↓";
            position: absolute;
            bottom: -25px;
            left: 50%;
            font-size: 20px;
            color: #666;
        }
        .aop-step:last-child:after {
            content: "";
        }
        .client { background-color: #e1f5fe; }
        .proxy { background-color: #fff9c4; }
        .advice { background-color: #e8f5e9; }
        .target { background-color: #f3e5f5; }
        
        .aop-concept {
            display: flex;
            flex-wrap: wrap;
            justify-content: space-between;
            margin: 20px 0;
        }
        .concept-item {
            flex-basis: 48%;
            margin-bottom: 20px;
            padding: 15px;
            background-color: #fff;
            border-radius: 5px;
            box-shadow: 0 1px 3px rgba(0,0,0,0.1);
        }
        .concept-title {
            font-weight: bold;
            color: #3498db;
            margin-bottom: 10px;
            border-bottom: 1px solid #eee;
            padding-bottom: 5px;
        }
        a {
            color: #3498db;
            text-decoration: none;
            margin-right: 15px;
        }
        a:hover {
            text-decoration: underline;
        }
        .nav-links {
            margin-top: 30px;
            padding-top: 15px;
            border-top: 1px solid #eee;
        }
        .monitor-link {
            display: inline-block;
            padding: 8px 15px;
            background-color: #e8f5e9;
            border: 1px solid #a5d6a7;
            border-radius: 4px;
            font-weight: bold;
            margin-left: 10px;
        }
        
        /* AOP 모니터링 스타일 */
        .aop-monitor {
            margin-top: 30px;
            border-top: 1px solid #ddd;
            padding-top: 20px;
        }
        .aop-monitor h2 {
            color: #2c3e50;
            margin-bottom: 15px;
        }
        .event-log {
            height: 300px;
            overflow-y: auto;
            padding: 15px;
            border: 1px solid #ddd;
            border-radius: 5px;
            background-color: #f9f9f9;
            margin-bottom: 20px;
        }
        .event-item {
            padding: 10px;
            margin-bottom: 10px;
            border-radius: 4px;
            position: relative;
            animation: fadeIn 0.5s;
        }
        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(-10px); }
            to { opacity: 1; transform: translateY(0); }
        }
        .event-before {
            background-color: #e1f5fe;
            border-left: 4px solid #03a9f4;
        }
        .event-around-start {
            background-color: #fff9c4;
            border-left: 4px solid #ffc107;
        }
        .event-around-end {
            background-color: #e8f5e9;
            border-left: 4px solid #4caf50;
        }
        .event-after {
            background-color: #f3e5f5;
            border-left: 4px solid #9c27b0;
        }
        .event-header {
            display: flex;
            justify-content: space-between;
            margin-bottom: 5px;
            font-weight: bold;
        }
        .event-time {
            font-size: 0.8em;
            color: #666;
        }
        .event-method {
            font-family: monospace;
            margin: 5px 0;
        }
        .event-message {
            margin-top: 5px;
        }
        .execution-time {
            font-weight: bold;
            color: #e91e63;
        }
        .toggle-monitor {
            padding: 8px 15px;
            background-color: #3498db;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            margin-top: 10px;
        }
        .toggle-monitor:hover {
            background-color: #2980b9;
        }
        .clear-btn {
            padding: 8px 15px;
            background-color: #f44336;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            margin-left: 10px;
        }
        .clear-btn:hover {
            background-color: #d32f2f;
        }
    </style>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.min.js"></script>
</head>
<body>
    <div class="container">
        <h1>AOP(Aspect-Oriented Programming) 작동방식</h1>
        
        <div class="section">
            <h2>AOP란 무엇인가?</h2>
            <p>
                AOP(Aspect-Oriented Programming)는 관점 지향 프로그래밍으로, 핵심 비즈니스 로직과 공통 관심사(Cross-cutting concerns)를 분리하여
                모듈화하는 프로그래밍 패러다임입니다. 로깅, 트랜잭션 관리, 보안과 같은 공통 기능을 비즈니스 로직으로부터 분리하여 코드의 중복을 줄이고
                유지보수성을 향상시킵니다.
            </p>
            
            <div class="diagram">
                <svg width="800" height="300" xmlns="http://www.w3.org/2000/svg">
                    <!-- 비즈니스 로직 모듈 -->
                    <rect x="50" y="50" width="700" height="200" fill="#f3f3f3" stroke="#ccc" stroke-width="2"/>
                    <text x="400" y="30" text-anchor="middle" font-weight="bold">애플리케이션</text>
                    
                    <!-- 비즈니스 모듈 -->
                    <rect x="100" y="100" width="100" height="100" fill="#e1f5fe" stroke="#81d4fa" stroke-width="2"/>
                    <text x="150" y="150" text-anchor="middle">컨트롤러</text>
                    
                    <rect x="250" y="100" width="100" height="100" fill="#e1f5fe" stroke="#81d4fa" stroke-width="2"/>
                    <text x="300" y="150" text-anchor="middle">서비스</text>
                    
                    <rect x="400" y="100" width="100" height="100" fill="#e1f5fe" stroke="#81d4fa" stroke-width="2"/>
                    <text x="450" y="150" text-anchor="middle">레포지토리</text>
                    
                    <rect x="550" y="100" width="100" height="100" fill="#e1f5fe" stroke="#81d4fa" stroke-width="2"/>
                    <text x="600" y="150" text-anchor="middle">기타 모듈</text>
                    
                    <!-- 횡단 관심사 -->
                    <line x1="50" y1="75" x2="750" y2="75" stroke="#ff7043" stroke-width="3" stroke-dasharray="5,5"/>
                    <text x="70" y="70" font-weight="bold" fill="#d84315">로깅</text>
                    
                    <line x1="50" y1="125" x2="750" y2="125" stroke="#7e57c2" stroke-width="3" stroke-dasharray="5,5"/>
                    <text x="70" y="120" font-weight="bold" fill="#5e35b1">보안</text>
                    
                    <line x1="50" y1="175" x2="750" y2="175" stroke="#66bb6a" stroke-width="3" stroke-dasharray="5,5"/>
                    <text x="70" y="170" font-weight="bold" fill="#43a047">트랜잭션</text>
                    
                    <line x1="50" y1="225" x2="750" y2="225" stroke="#29b6f6" stroke-width="3" stroke-dasharray="5,5"/>
                    <text x="70" y="220" font-weight="bold" fill="#0288d1">성능측정</text>
                </svg>
                <p><strong>그림 1:</strong> 횡단 관심사(Cross-cutting concerns)와 비즈니스 로직</p>
            </div>
        </div>
        
        <div class="section">
            <h2>AOP 핵심 개념</h2>
            
            <div class="aop-concept">
                <div class="concept-item">
                    <div class="concept-title">Aspect (관점)</div>
                    <p>여러 객체에 공통적으로 적용되는 기능을 모듈화한 것입니다. 로깅, 트랜잭션 관리 등이 Aspect의 예입니다.</p>
                </div>
                
                <div class="concept-item">
                    <div class="concept-title">Join Point (조인 포인트)</div>
                    <p>프로그램 실행 중 Aspect가 적용될 수 있는 지점입니다. 메서드 실행, 예외 처리 등이 해당됩니다.</p>
                </div>
                
                <div class="concept-item">
                    <div class="concept-title">Pointcut (포인트컷)</div>
                    <p>Join Point의 부분 집합으로, 실제로 Advice가 적용되는 Join Point를 선별하는 표현식입니다.</p>
                </div>
                
                <div class="concept-item">
                    <div class="concept-title">Advice (어드바이스)</div>
                    <p>특정 Join Point에서 Aspect가 취하는 행동입니다. Before, After, Around 등의 유형이 있습니다.</p>
                </div>
                
                <div class="concept-item">
                    <div class="concept-title">Target (대상)</div>
                    <p>Aspect가 적용되는 객체입니다. 즉, 횡단 관심사가 적용되는 객체를 말합니다.</p>
                </div>
                
                <div class="concept-item">
                    <div class="concept-title">Proxy (프록시)</div>
                    <p>Target 객체에 Aspect를 적용하기 위해 생성되는 객체입니다. 클라이언트는 Target 대신 Proxy를 호출합니다.</p>
                </div>
            </div>
        </div>
        
        <div class="section">
            <h2>AOP 작동 흐름</h2>
            
            <div class="aop-flow">
                <div class="aop-step client">
                    <strong>1. 클라이언트 호출</strong>
                    <p>클라이언트가 대상 객체의 메서드를 호출합니다.</p>
                </div>
                
                <div class="aop-step proxy">
                    <strong>2. 프록시 객체 호출</strong>
                    <p>실제로는 대상 객체 대신 Spring AOP가 생성한 프록시 객체가 호출됩니다.</p>
                </div>
                
                <div class="aop-step advice">
                    <strong>3. Before Advice 실행</strong>
                    <p>메서드 실행 전에 적용되는 Advice가 실행됩니다.</p>
                </div>
                
                <div class="aop-step target">
                    <strong>4. 대상 메서드 실행</strong>
                    <p>실제 대상 객체의 메서드가 실행됩니다.</p>
                </div>
                
                <div class="aop-step advice">
                    <strong>5. After Advice 실행</strong>
                    <p>메서드 실행 후에 적용되는 Advice가 실행됩니다.</p>
                </div>
                
                <div class="aop-step client">
                    <strong>6. 결과 반환</strong>
                    <p>최종 결과가 클라이언트에게 반환됩니다.</p>
                </div>
            </div>
            
            <div class="diagram">
                <svg width="800" height="400" xmlns="http://www.w3.org/2000/svg">
                    <!-- 클라이언트 -->
                    <rect x="50" y="50" width="150" height="80" fill="#e1f5fe" stroke="#81d4fa" stroke-width="2" rx="5"/>
                    <text x="125" y="90" text-anchor="middle" font-weight="bold">클라이언트</text>
                    
                    <!-- 프록시 -->
                    <rect x="325" y="50" width="150" height="80" fill="#fff9c4" stroke="#ffee58" stroke-width="2" rx="5"/>
                    <text x="400" y="90" text-anchor="middle" font-weight="bold">프록시 객체</text>
                    
                    <!-- 타겟 -->
                    <rect x="600" y="50" width="150" height="80" fill="#f3e5f5" stroke="#ce93d8" stroke-width="2" rx="5"/>
                    <text x="675" y="90" text-anchor="middle" font-weight="bold">대상 객체</text>
                    
                    <!-- Aspect -->
                    <rect x="325" y="250" width="150" height="80" fill="#e8f5e9" stroke="#a5d6a7" stroke-width="2" rx="5"/>
                    <text x="400" y="290" text-anchor="middle" font-weight="bold">Aspect</text>
                    
                    <!-- 화살표 -->
                    <defs>
                        <marker id="arrowhead" markerWidth="10" markerHeight="7" refX="0" refY="3.5" orient="auto">
                            <polygon points="0 0, 10 3.5, 0 7" fill="#333"/>
                        </marker>
                    </defs>
                    
                    <!-- 클라이언트 -> 프록시 -->
                    <line x1="200" y1="90" x2="325" y2="90" stroke="#333" stroke-width="2" marker-end="url(#arrowhead)"/>
                    <text x="260" y="80" text-anchor="middle" font-size="12">1. 메서드 호출</text>
                    
                    <!-- 프록시 -> 타겟 -->
                    <line x1="475" y1="90" x2="600" y2="90" stroke="#333" stroke-width="2" marker-end="url(#arrowhead)"/>
                    <text x="540" y="80" text-anchor="middle" font-size="12">4. 메서드 실행</text>
                    
                    <!-- 타겟 -> 프록시 -->
                    <line x1="600" y1="110" x2="475" y2="110" stroke="#333" stroke-width="2" marker-end="url(#arrowhead)"/>
                    <text x="540" y="130" text-anchor="middle" font-size="12">5. 결과 반환</text>
                    
                    <!-- 프록시 -> 클라이언트 -->
                    <line x1="325" y1="110" x2="200" y2="110" stroke="#333" stroke-width="2" marker-end="url(#arrowhead)"/>
                    <text x="260" y="130" text-anchor="middle" font-size="12">6. 결과 반환</text>
                    
                    <!-- 프록시 -> Aspect -->
                    <line x1="400" y1="130" x2="400" y2="250" stroke="#333" stroke-width="2" marker-end="url(#arrowhead)"/>
                    <text x="420" y="180" text-anchor="start" font-size="12">2. Before Advice</text>
                    <text x="420" y="200" text-anchor="start" font-size="12">3. Around Advice</text>
                    <text x="420" y="220" text-anchor="start" font-size="12">5. After Advice</text>
                </svg>
                <p><strong>그림 2:</strong> Spring AOP 프록시 기반 작동 방식</p>
            </div>
        </div>
        
        <div class="section">
            <h2>Spring AOP 예제 코드</h2>
            
            <h3>1. Aspect 클래스 정의</h3>
            <div class="code-block">
                <pre>@Aspect
@Component
@Slf4j
public class LoggingAspect {

    @Around("execution(* com.example.aop.service.*.*(..))")
    public Object logExecutionTime(ProceedingJoinPoint joinPoint) throws Throwable {
        long startTime = System.currentTimeMillis();
        
        Object result = joinPoint.proceed();
        
        long endTime = System.currentTimeMillis();
        long executionTime = endTime - startTime;
        
        log.info("Method: {} executed in {} ms", 
                joinPoint.getSignature().toShortString(), 
                executionTime);
        
        return result;
    }
}</pre>
            </div>
            
            <h3>2. 포인트컷 표현식 설명</h3>
            <p>
                <code class="highlight">execution(* com.example.aop.service.*.*(..))</code> 표현식의 의미:
            </p>
            <ul>
                <li><code>execution</code>: 메서드 실행 조인 포인트를 선택</li>
                <li><code>*</code>: 모든 반환 타입</li>
                <li><code>com.example.aop.service</code>: 패키지</li>
                <li><code>*</code>: 모든 클래스</li>
                <li><code>*</code>: 모든 메서드</li>
                <li><code>(..)</code>: 모든 매개변수</li>
            </ul>
        </div>
        
        <div class="section">
            <h2>Advice 유형</h2>
            
            <div class="aop-concept">
                <div class="concept-item">
                    <div class="concept-title">@Before</div>
                    <p>대상 메서드 실행 전에 실행됩니다.</p>
                    <div class="code-block">
                        <pre>@Before("execution(* com.example.service.*.*(..))")
public void beforeAdvice() {
    // 메서드 실행 전 로직
}</pre>
                    </div>
                </div>
                
                <div class="concept-item">
                    <div class="concept-title">@After</div>
                    <p>대상 메서드 실행 후에 실행됩니다(예외 발생 여부와 관계없이).</p>
                    <div class="code-block">
                        <pre>@After("execution(* com.example.service.*.*(..))")
public void afterAdvice() {
    // 메서드 실행 후 로직
}</pre>
                    </div>
                </div>
                
                <div class="concept-item">
                    <div class="concept-title">@AfterReturning</div>
                    <p>대상 메서드가 정상적으로 결과를 반환한 후 실행됩니다.</p>
                    <div class="code-block">
                        <pre>@AfterReturning(
    pointcut = "execution(* com.example.service.*.*(..))",
    returning = "result")
public void afterReturningAdvice(Object result) {
    // 메서드가 값을 반환한 후 로직
}</pre>
                    </div>
                </div>
                
                <div class="concept-item">
                    <div class="concept-title">@AfterThrowing</div>
                    <p>대상 메서드가 예외를 던진 후 실행됩니다.</p>
                    <div class="code-block">
                        <pre>@AfterThrowing(
    pointcut = "execution(* com.example.service.*.*(..))",
    throwing = "ex")
public void afterThrowingAdvice(Exception ex) {
    // 예외 발생 후 로직
}</pre>
                    </div>
                </div>
                
                <div class="concept-item">
                    <div class="concept-title">@Around</div>
                    <p>대상 메서드 실행 전후에 로직을 실행할 수 있는 가장 강력한 Advice입니다.</p>
                    <div class="code-block">
                        <pre>@Around("execution(* com.example.service.*.*(..))")
public Object aroundAdvice(ProceedingJoinPoint joinPoint) throws Throwable {
    // 메서드 실행 전 로직
    Object result = joinPoint.proceed(); // 대상 메서드 실행
    // 메서드 실행 후 로직
    return result;
}</pre>
                    </div>
                </div>
            </div>
        </div>
        
        <div class="aop-monitor-controls">
            <button id="toggle-monitor" class="toggle-monitor">AOP 모니터링 표시</button>
            <button id="clear-events" class="clear-btn" style="display: none;">이벤트 로그 지우기</button>
        </div>
        
        <div class="aop-monitor" id="aop-monitor" style="display: none;">
            <h2>AOP 실시간 모니터링</h2>
            <div class="event-log" id="event-log">
                <!-- 이벤트 로그가 여기에 동적으로 추가됩니다 -->
            </div>
        </div>
        
        <div class="nav-links">
            <a href="<c:url value='/users/home'/>">홈으로 돌아가기</a>
        </div>
    </div>
    
    <script>
        $(document).ready(function() {
            var stompClient = null;
            var events = [];
            
            // 로컬 스토리지에서 이벤트 데이터 로드
            loadEventsFromStorage();
            
            // 모니터링 토글 버튼
            $('#toggle-monitor').click(function() {
                var monitorDiv = $('#aop-monitor');
                var clearBtn = $('#clear-events');
                
                if (monitorDiv.is(':visible')) {
                    monitorDiv.hide();
                    clearBtn.hide();
                    $(this).text('AOP 모니터링 표시');
                    
                    // 웹소켓 연결 해제
                    if (stompClient !== null) {
                        stompClient.disconnect();
                    }
                    
                    // 모니터링 상태 저장
                    localStorage.setItem('aopMonitorVisible', 'false');
                } else {
                    monitorDiv.show();
                    clearBtn.show();
                    $(this).text('AOP 모니터링 숨기기');
                    
                    // 웹소켓 연결
                    connect();
                    
                    // 모니터링 상태 저장
                    localStorage.setItem('aopMonitorVisible', 'true');
                }
            });
            
            // 이벤트 로그 지우기
            $('#clear-events').click(function() {
                $('#event-log').empty();
                events = [];
                
                // 로컬 스토리지에서 이벤트 데이터 삭제
                localStorage.removeItem('aopEvents');
            });
            
            // 페이지 로드 시 모니터링 상태 복원
            if (localStorage.getItem('aopMonitorVisible') === 'true') {
                $('#aop-monitor').show();
                $('#clear-events').show();
                $('#toggle-monitor').text('AOP 모니터링 숨기기');
                connect();
            }
            
            function connect() {
                var socket = new SockJS('/aop-websocket');
                stompClient = Stomp.over(socket);
                stompClient.connect({}, function(frame) {
                    console.log('Connected: ' + frame);
                    stompClient.subscribe('/topic/aop-events', function(message) {
                        showEvent(JSON.parse(message.body));
                    });
                });
            }
            
            function showEvent(event) {
                // 이벤트 타입에 따른 클래스 결정
                var eventClass = 'event-before';
                if (event.eventType === 'AROUND_START') {
                    eventClass = 'event-around-start';
                } else if (event.eventType === 'AROUND_END') {
                    eventClass = 'event-around-end';
                } else if (event.eventType === 'BEFORE') {
                    eventClass = 'event-before';
                } else if (event.eventType === 'AFTER') {
                    eventClass = 'event-after';
                }
                
                // 이벤트 로그에 추가
                var timestamp = new Date(event.timestamp).toLocaleTimeString();
                var executionTimeHtml = event.executionTime > 0 
                    ? '<div><span class="execution-time">실행 시간: ' + event.executionTime + ' ms</span></div>' 
                    : '';
                
                var eventHtml = 
                    '<div class="event-item ' + eventClass + '">' +
                    '   <div class="event-header">' +
                    '       <span>' + event.eventType + '</span>' +
                    '       <span class="event-time">' + timestamp + '</span>' +
                    '   </div>' +
                    '   <div class="event-method">' + event.className + '.' + event.methodName + '()</div>' +
                    '   <div class="event-message">' + event.message + '</div>' +
                    executionTimeHtml +
                    '</div>';
                
                $('#event-log').prepend(eventHtml);
                
                // 이벤트 배열에 추가
                events.push(event);
                
                // 최대 20개까지만 저장
                if (events.length > 20) {
                    events.pop();
                }
                
                // 최대 20개까지만 표시
                if ($('#event-log .event-item').length > 20) {
                    $('#event-log .event-item:last').remove();
                }
                
                // 로컬 스토리지에 이벤트 데이터 저장
                saveEventsToStorage();
            }
            
            // 이벤트 데이터를 로컬 스토리지에 저장
            function saveEventsToStorage() {
                localStorage.setItem('aopEvents', JSON.stringify(events));
            }
            
            // 로컬 스토리지에서 이벤트 데이터 로드
            function loadEventsFromStorage() {
                var storedEvents = localStorage.getItem('aopEvents');
                if (storedEvents) {
                    events = JSON.parse(storedEvents);
                    
                    // 저장된 이벤트 표시
                    events.forEach(function(event) {
                        var eventClass = 'event-before';
                        if (event.eventType === 'AROUND_START') {
                            eventClass = 'event-around-start';
                        } else if (event.eventType === 'AROUND_END') {
                            eventClass = 'event-around-end';
                        } else if (event.eventType === 'BEFORE') {
                            eventClass = 'event-before';
                        } else if (event.eventType === 'AFTER') {
                            eventClass = 'event-after';
                        }
                        
                        var timestamp = new Date(event.timestamp).toLocaleTimeString();
                        var executionTimeHtml = event.executionTime > 0 
                            ? '<div><span class="execution-time">실행 시간: ' + event.executionTime + ' ms</span></div>' 
                            : '';
                        
                        var eventHtml = 
                            '<div class="event-item ' + eventClass + '">' +
                            '   <div class="event-header">' +
                            '       <span>' + event.eventType + '</span>' +
                            '       <span class="event-time">' + timestamp + '</span>' +
                            '   </div>' +
                            '   <div class="event-method">' + event.className + '.' + event.methodName + '()</div>' +
                            '   <div class="event-message">' + event.message + '</div>' +
                            executionTimeHtml +
                            '</div>';
                        
                        $('#event-log').prepend(eventHtml);
                    });
                }
            }
        });
    </script>
</body>
</html>