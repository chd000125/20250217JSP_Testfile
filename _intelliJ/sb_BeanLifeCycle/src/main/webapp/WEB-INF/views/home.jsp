<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>스프링 빈 라이프사이클 데모</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            line-height: 1.6;
            color: #333;
            max-width: 1200px;
            margin: 0 auto;
            padding: 20px;
        }
        
        h1, h2, h3 {
            color: #2c3e50;
            text-align: center;
        }
        
        .container {
            display: flex;
            flex-direction: column;
            gap: 20px;
        }
        
        /* 라이프사이클 다이어그램 스타일 */
        .lifecycle-diagram {
            display: flex;
            flex-direction: column;
            align-items: center;
            margin: 30px 0;
        }
        
        .lifecycle-steps {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            gap: 15px;
            margin-bottom: 20px;
        }
        
        .lifecycle-step {
            background-color: #f8f9fa;
            border: 2px solid #dee2e6;
            border-radius: 8px;
            padding: 15px;
            width: 180px;
            text-align: center;
            transition: all 0.3s ease;
            cursor: pointer;
        }
        
        .lifecycle-step:hover {
            transform: translateY(-5px);
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
        }
        
        .lifecycle-step.active {
            background-color: #e3f2fd;
            border-color: #2196f3;
            transform: scale(1.05);
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
            animation: pulse 2s infinite;
        }
        
        @keyframes pulse {
            0% {
                box-shadow: 0 0 0 0 rgba(33, 150, 243, 0.4);
            }
            70% {
                box-shadow: 0 0 0 10px rgba(33, 150, 243, 0);
            }
            100% {
                box-shadow: 0 0 0 0 rgba(33, 150, 243, 0);
            }
        }
        
        .lifecycle-step h3 {
            margin: 0 0 10px 0;
            font-size: 16px;
            color: #495057;
        }
        
        .lifecycle-step.active h3 {
            color: #0d47a1;
        }
        
        .lifecycle-step p {
            margin: 0;
            font-size: 14px;
            color: #6c757d;
        }
        
        /* 설명 패널 스타일 */
        .stage-description {
            background-color: #fff;
            border: 1px solid #dee2e6;
            border-radius: 8px;
            padding: 20px;
            margin: 20px auto;
            max-width: 800px;
            display: none;
            box-shadow: 0 3px 10px rgba(0, 0, 0, 0.1);
        }
        
        .stage-description.active {
            display: block;
            animation: fadeIn 0.5s;
        }
        
        @keyframes fadeIn {
            from { opacity: 0; }
            to { opacity: 1; }
        }
        
        .stage-description h3 {
            margin-top: 0;
            color: #0d47a1;
            border-bottom: 1px solid #e9ecef;
            padding-bottom: 10px;
        }
        
        .stage-description pre {
            background-color: #f8f9fa;
            border: 1px solid #e9ecef;
            border-radius: 4px;
            padding: 10px;
            overflow-x: auto;
        }
        
        .stage-description code {
            font-family: 'Courier New', Courier, monospace;
        }
        
        /* 이벤트 버튼 스타일 */
        .event-buttons {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            gap: 15px;
            margin: 30px 0;
        }
        
        .event-button {
            display: inline-block;
            padding: 12px 20px;
            background-color: #2196f3;
            color: white;
            border-radius: 4px;
            text-decoration: none;
            font-weight: 500;
            transition: all 0.3s ease;
            text-align: center;
            min-width: 150px;
        }
        
        .event-button:hover {
            background-color: #0d47a1;
            transform: translateY(-3px);
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.2);
        }
        
        .event-button.warning {
            background-color: #f44336;
        }
        
        .event-button.warning:hover {
            background-color: #d32f2f;
        }
        
        /* 로그 컨테이너 스타일 */
        .log-container {
            background-color: #f8f9fa;
            border: 1px solid #dee2e6;
            border-radius: 8px;
            padding: 15px;
            height: 250px;
            overflow-y: auto;
            font-family: monospace;
            white-space: pre-wrap;
            margin-top: 20px;
        }
        
        .log-entry {
            margin: 5px 0;
            padding: 5px 10px;
            border-radius: 4px;
            border-left: 4px solid transparent;
            transition: background-color 0.2s;
        }
        
        .log-entry:hover {
            background-color: #f1f1f1;
        }
        
        .log-entry.lifecycle {
            border-left-color: #2196f3;
        }
        
        .log-entry.init {
            border-left-color: #4caf50;
        }
        
        .log-entry.destroy {
            border-left-color: #f44336;
        }
        
        .log-entry.message {
            border-left-color: #ff9800;
        }
        
        .log-entry .timestamp {
            color: #6c757d;
            font-size: 0.9em;
            margin-right: 8px;
        }
        
        .log-entry .category {
            display: inline-block;
            padding: 2px 6px;
            border-radius: 3px;
            font-size: 0.8em;
            font-weight: bold;
            margin-right: 8px;
            color: white;
        }
        
        .log-entry .category.lifecycle {
            background-color: #2196f3;
        }
        
        .log-entry .category.init {
            background-color: #4caf50;
        }
        
        .log-entry .category.destroy {
            background-color: #f44336;
        }
        
        .log-entry .category.message {
            background-color: #ff9800;
        }
        
        .log-entry .content {
            font-weight: normal;
        }
        
        /* 로그 필터 스타일 */
        .log-filters {
            display: flex;
            flex-wrap: wrap;
            gap: 10px;
            margin-bottom: 10px;
        }
        
        .log-filter {
            display: inline-block;
            padding: 5px 10px;
            border-radius: 4px;
            cursor: pointer;
            font-size: 14px;
            transition: all 0.2s;
            border: 1px solid #dee2e6;
        }
        
        .log-filter.active {
            color: white;
            font-weight: bold;
        }
        
        .log-filter.all {
            background-color: #e9ecef;
        }
        
        .log-filter.all.active {
            background-color: #6c757d;
        }
        
        .log-filter.lifecycle {
            background-color: #e3f2fd;
        }
        
        .log-filter.lifecycle.active {
            background-color: #2196f3;
        }
        
        .log-filter.init {
            background-color: #e8f5e9;
        }
        
        .log-filter.init.active {
            background-color: #4caf50;
        }
        
        .log-filter.destroy {
            background-color: #ffebee;
        }
        
        .log-filter.destroy.active {
            background-color: #f44336;
        }
        
        .log-filter.message {
            background-color: #fff3e0;
        }
        
        .log-filter.message.active {
            background-color: #ff9800;
        }
        
        .log-controls {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 10px;
        }
        
        .log-actions {
            display: flex;
            gap: 10px;
        }
        
        .log-action-button {
            padding: 5px 10px;
            border: none;
            border-radius: 4px;
            font-size: 14px;
            cursor: pointer;
            transition: all 0.2s;
            background-color: #e9ecef;
            color: #495057;
        }
        
        .log-action-button:hover {
            background-color: #dee2e6;
        }
        
        .log-action-button.clear {
            background-color: #ffebee;
            color: #d32f2f;
        }
        
        .log-action-button.clear:hover {
            background-color: #ffcdd2;
        }
        
        .log-action-button.export {
            background-color: #e8f5e9;
            color: #2e7d32;
        }
        
        .log-action-button.export:hover {
            background-color: #c8e6c9;
        }
        
        .log-auto-scroll {
            display: flex;
            align-items: center;
            font-size: 14px;
        }
        
        .log-auto-scroll input {
            margin-right: 5px;
        }
        
        .log-highlight {
            background-color: #fff9c4;
        }
        
        .log-count {
            display: inline-block;
            padding: 2px 6px;
            background-color: #e9ecef;
            border-radius: 10px;
            font-size: 12px;
            margin-left: 5px;
            color: #495057;
        }
        
        /* 반응형 디자인 */
        @media (max-width: 768px) {
            .lifecycle-step {
                width: 150px;
                padding: 10px;
            }
            
            .event-button {
                min-width: 120px;
                padding: 10px 15px;
            }
        }
        
        /* 메시지 입력 폼 스타일 */
        .message-form {
            background-color: #fff;
            border: 1px solid #dee2e6;
            border-radius: 8px;
            padding: 20px;
            margin: 30px 0;
            box-shadow: 0 3px 10px rgba(0, 0, 0, 0.1);
        }
        
        .message-form h3 {
            margin-top: 0;
            margin-bottom: 15px;
            color: #2c3e50;
            font-size: 18px;
        }
        
        .message-form .form-group {
            display: flex;
            flex-direction: column;
            margin-bottom: 15px;
        }
        
        .message-form label {
            margin-bottom: 5px;
            font-weight: 500;
            color: #495057;
        }
        
        .message-form input[type="text"] {
            padding: 10px 12px;
            border: 1px solid #ced4da;
            border-radius: 4px;
            font-size: 14px;
            transition: border-color 0.2s;
        }
        
        .message-form input[type="text"]:focus {
            border-color: #2196f3;
            outline: none;
            box-shadow: 0 0 0 3px rgba(33, 150, 243, 0.2);
        }
        
        .message-form .form-actions {
            display: flex;
            justify-content: flex-end;
            gap: 10px;
        }
        
        .message-form button {
            padding: 10px 15px;
            border: none;
            border-radius: 4px;
            font-size: 14px;
            font-weight: 500;
            cursor: pointer;
            transition: all 0.2s;
        }
        
        .message-form button.submit {
            background-color: #2196f3;
            color: white;
        }
        
        .message-form button.submit:hover {
            background-color: #0d47a1;
        }
        
        .message-form button.reset {
            background-color: #e9ecef;
            color: #495057;
        }
        
        .message-form button.reset:hover {
            background-color: #dee2e6;
        }
        
        .bean-status {
            background-color: #e3f2fd;
            border: 1px solid #bbdefb;
            border-radius: 8px;
            padding: 15px;
            margin-bottom: 20px;
        }
        
        .bean-status h3 {
            margin-top: 0;
            margin-bottom: 15px;
            color: #0d47a1;
            font-size: 18px;
        }
        
        .bean-status .status-item {
            display: flex;
            margin-bottom: 10px;
        }
        
        .bean-status .status-label {
            font-weight: 500;
            width: 150px;
            color: #0d47a1;
        }
        
        .bean-status .status-value {
            flex-grow: 1;
            word-break: break-word;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>스프링 빈 라이프사이클 데모</h1>
        
        <h2>라이프사이클 단계</h2>
        <p style="text-align: center; margin-bottom: 20px;">각 단계를 클릭하면 자세한 설명을 볼 수 있습니다.</p>
        
        <div class="bean-status">
            <h3>현재 빈 상태</h3>
            <div class="status-item">
                <div class="status-label">myCustomBean:</div>
                <div class="status-value">${myCustomBeanMessage}</div>
            </div>
            <div class="status-item">
                <div class="status-label">anotherBean:</div>
                <div class="status-value">${anotherBeanMessage}</div>
            </div>
        </div>
        
        <div class="lifecycle-diagram">
            <div class="lifecycle-steps">
                <div class="lifecycle-step" data-stage="instantiate">
                    <h3>1. 인스턴스화</h3>
                    <p>생성자 호출</p>
                </div>
                <div class="lifecycle-step" data-stage="populate">
                    <h3>2. 프로퍼티 설정</h3>
                    <p>의존성 주입</p>
                </div>
                <div class="lifecycle-step" data-stage="postconstruct">
                    <h3>3. @PostConstruct</h3>
                    <p>초기화 콜백</p>
                </div>
                <div class="lifecycle-step" data-stage="afterproperties">
                    <h3>4. afterPropertiesSet()</h3>
                    <p>초기화 콜백</p>
                </div>
                <div class="lifecycle-step" data-stage="custominit">
                    <h3>5. 커스텀 초기화</h3>
                    <p>초기화 콜백</p>
                </div>
                <div class="lifecycle-step" data-stage="ready">
                    <h3>6. 빈 사용 준비</h3>
                    <p>서비스 제공</p>
                </div>
                <div class="lifecycle-step" data-stage="predestroy">
                    <h3>7. @PreDestroy</h3>
                    <p>소멸 콜백</p>
                </div>
                <div class="lifecycle-step" data-stage="destroy">
                    <h3>8. destroy()</h3>
                    <p>소멸 콜백</p>
                </div>
                <div class="lifecycle-step" data-stage="customdestroy">
                    <h3>9. 커스텀 소멸</h3>
                    <p>소멸 콜백</p>
                </div>
            </div>
        </div>
        
        <!-- 단계별 설명 패널 -->
        <div class="stage-description" id="desc-instantiate">
            <h3>1. 인스턴스화 (Instantiation)</h3>
            <p>스프링 컨테이너가 빈의 생성자를 호출하여 인스턴스를 생성합니다.</p>
            <ul>
                <li>클래스의 생성자가 호출됩니다.</li>
                <li>생성자 주입이 발생합니다 (생성자에 <code>@Autowired</code>가 있는 경우).</li>
                <li>기본 객체 초기화가 수행됩니다.</li>
            </ul>
            <pre><code>@Component
public class MyBean {
    public MyBean() {
        // 생성자 호출
        System.out.println("MyBean 생성자 호출");
    }
}</code></pre>
        </div>
        
        <div class="stage-description" id="desc-populate">
            <h3>2. 프로퍼티 설정 (Populate Properties)</h3>
            <p>의존성 주입(DI)이 발생합니다. <code>@Autowired</code>, <code>@Resource</code> 등을 통해 의존성이 주입됩니다.</p>
            <ul>
                <li>필드 주입이 발생합니다.</li>
                <li>세터 메서드 주입이 발생합니다.</li>
                <li>다른 프로퍼티들이 설정됩니다.</li>
            </ul>
            <pre><code>@Component
public class MyBean {
    @Autowired
    private AnotherBean anotherBean; // 필드 주입
    
    private YetAnotherBean yetAnotherBean;
    
    @Autowired
    public void setYetAnotherBean(YetAnotherBean yetAnotherBean) {
        // 세터 주입
        this.yetAnotherBean = yetAnotherBean;
    }
}</code></pre>
        </div>
        
        <div class="stage-description" id="desc-postconstruct">
            <h3>3. @PostConstruct 메서드 호출</h3>
            <p>초기화 콜백 메서드가 호출됩니다. 자바 표준 어노테이션입니다.</p>
            <ul>
                <li>모든 의존성 주입이 완료된 후 호출됩니다.</li>
                <li>빈 초기화 로직을 수행하기에 적합합니다.</li>
                <li>다른 초기화 메서드보다 먼저 호출됩니다.</li>
            </ul>
            <pre><code>@Component
public class MyBean {
    @PostConstruct
    public void init() {
        // 초기화 로직
        System.out.println("@PostConstruct 메서드 호출");
    }
}</code></pre>
        </div>
        
        <div class="stage-description" id="desc-afterproperties">
            <h3>4. afterPropertiesSet() 메서드 호출</h3>
            <p><code>InitializingBean</code> 인터페이스의 메서드가 호출됩니다.</p>
            <ul>
                <li>@PostConstruct 메서드 이후에 호출됩니다.</li>
                <li>스프링 프레임워크에 특화된 초기화 방법입니다.</li>
            </ul>
            <pre><code>@Component
public class MyBean implements InitializingBean {
    @Override
    public void afterPropertiesSet() throws Exception {
        // 초기화 로직
        System.out.println("afterPropertiesSet() 메서드 호출");
    }
}</code></pre>
        </div>
        
        <div class="stage-description" id="desc-custominit">
            <h3>5. 커스텀 초기화 메서드 호출</h3>
            <p><code>@Bean(initMethod="...")</code>로 지정된 커스텀 초기화 메서드가 호출됩니다.</p>
            <ul>
                <li>@PostConstruct와 afterPropertiesSet() 이후에 호출됩니다.</li>
                <li>XML 또는 Java 설정에서 지정한 초기화 메서드입니다.</li>
            </ul>
            <pre><code>@Configuration
public class AppConfig {
    @Bean(initMethod = "customInit")
    public MyBean myBean() {
        return new MyBean();
    }
}

public class MyBean {
    public void customInit() {
        // 커스텀 초기화 로직
        System.out.println("커스텀 초기화 메서드 호출");
    }
}</code></pre>
        </div>
        
        <div class="stage-description" id="desc-ready">
            <h3>6. 빈 사용 준비 (Bean Ready)</h3>
            <p>이제 빈이 완전히 초기화되어 애플리케이션에서 사용할 준비가 되었습니다.</p>
            <ul>
                <li>빈이 완전히 초기화되어 사용 가능한 상태입니다.</li>
                <li>애플리케이션 코드에서 빈을 사용할 수 있습니다.</li>
                <li>빈의 메서드를 호출하고 상태를 변경할 수 있습니다.</li>
            </ul>
        </div>
        
        <div class="stage-description" id="desc-predestroy">
            <h3>7. @PreDestroy 메서드 호출</h3>
            <p>컨테이너가 종료될 때 호출되는 소멸 콜백 메서드입니다.</p>
            <ul>
                <li>스프링 컨테이너가 종료되기 전에 호출됩니다.</li>
                <li>자원 해제 등의 정리 작업을 수행하기에 적합합니다.</li>
                <li>다른 소멸 메서드보다 먼저 호출됩니다.</li>
            </ul>
            <pre><code>@Component
public class MyBean {
    @PreDestroy
    public void cleanup() {
        // 정리 로직
        System.out.println("@PreDestroy 메서드 호출");
    }
}</code></pre>
        </div>
        
        <div class="stage-description" id="desc-destroy">
            <h3>8. destroy() 메서드 호출</h3>
            <p><code>DisposableBean</code> 인터페이스의 메서드가 호출됩니다.</p>
            <ul>
                <li>@PreDestroy 메서드 이후에 호출됩니다.</li>
                <li>스프링 프레임워크에 특화된 소멸 방법입니다.</li>
            </ul>
            <pre><code>@Component
public class MyBean implements DisposableBean {
    @Override
    public void destroy() throws Exception {
        // 정리 로직
        System.out.println("destroy() 메서드 호출");
    }
}</code></pre>
        </div>
        
        <div class="stage-description" id="desc-customdestroy">
            <h3>9. 커스텀 소멸 메서드 호출</h3>
            <p><code>@Bean(destroyMethod="...")</code>로 지정된 커스텀 소멸 메서드가 호출됩니다.</p>
            <ul>
                <li>@PreDestroy와 destroy() 이후에 호출됩니다.</li>
                <li>XML 또는 Java 설정에서 지정한 소멸 메서드입니다.</li>
            </ul>
            <pre><code>@Configuration
public class AppConfig {
    @Bean(destroyMethod = "customDestroy")
    public MyBean myBean() {
        return new MyBean();
    }
}

public class MyBean {
    public void customDestroy() {
        // 커스텀 정리 로직
        System.out.println("커스텀 소멸 메서드 호출");
    }
}</code></pre>
        </div>
        
        <h2>라이프사이클 이벤트 트리거</h2>
        <div class="event-buttons">
            <a href="/trigger-event?event=refresh" class="event-button">빈 새로고침</a>
            <a href="/trigger-event?event=destroy" class="event-button">빈 소멸</a>
            <a href="/trigger-event?event=recreate" class="event-button">빈 재생성</a>
            <a href="/trigger-event?event=shutdown" class="event-button warning">애플리케이션 종료</a>
        </div>
        
        <div class="message-form">
            <h3>빈 메시지 업데이트</h3>
            <form action="/update-message" method="post">
                <div class="form-group">
                    <label for="message">새 메시지:</label>
                    <input type="text" id="message" name="message" placeholder="새 메시지를 입력하세요" required>
                </div>
                <div class="form-actions">
                    <button type="reset" class="reset">초기화</button>
                    <button type="submit" class="submit">메시지 업데이트</button>
                </div>
            </form>
        </div>
        
        <h2>실시간 로그</h2>
        <div class="log-controls">
            <div class="log-filters">
                <span class="log-filter all active" data-filter="all">모든 로그 <span class="log-count" id="count-all">0</span></span>
                <span class="log-filter lifecycle" data-filter="lifecycle">라이프사이클 <span class="log-count" id="count-lifecycle">0</span></span>
                <span class="log-filter init" data-filter="init">초기화 <span class="log-count" id="count-init">0</span></span>
                <span class="log-filter destroy" data-filter="destroy">소멸 <span class="log-count" id="count-destroy">0</span></span>
                <span class="log-filter message" data-filter="message">메시지 <span class="log-count" id="count-message">0</span></span>
            </div>
            <div class="log-actions">
                <div class="log-auto-scroll">
                    <input type="checkbox" id="auto-scroll" checked>
                    <label for="auto-scroll">자동 스크롤</label>
                </div>
                <button class="log-action-button export" id="export-logs">로그 내보내기</button>
                <button class="log-action-button clear" id="clear-logs">로그 지우기</button>
            </div>
        </div>
        <div class="log-container">
            <c:forEach items="${logs}" var="log">
                <div class="log-entry ${fn:contains(log, 'PostConstruct') || fn:contains(log, 'afterPropertiesSet') || fn:contains(log, '초기화') ? 'init' : 
                                        fn:contains(log, 'PreDestroy') || fn:contains(log, 'destroy') || fn:contains(log, '소멸') ? 'destroy' : 
                                        fn:contains(log, '메시지') ? 'message' : 'lifecycle'}">
                    <c:choose>
                        <c:when test="${fn:contains(log, 'PostConstruct') || fn:contains(log, 'afterPropertiesSet') || fn:contains(log, '초기화')}">
                            <span class="category init">초기화</span>
                        </c:when>
                        <c:when test="${fn:contains(log, 'PreDestroy') || fn:contains(log, 'destroy') || fn:contains(log, '소멸')}">
                            <span class="category destroy">소멸</span>
                        </c:when>
                        <c:when test="${fn:contains(log, '메시지')}">
                            <span class="category message">메시지</span>
                        </c:when>
                        <c:otherwise>
                            <span class="category lifecycle">라이프사이클</span>
                        </c:otherwise>
                    </c:choose>
                    <c:if test="${fn:length(log) > 12 && fn:contains(log, ' - ')}">
                        <span class="timestamp">${fn:substring(log, 0, 12)}</span>
                        <span class="content">${fn:substring(log, 15, fn:length(log))}</span>
                    </c:if>
                    <c:if test="${!(fn:length(log) > 12 && fn:contains(log, ' - '))}">
                        <span class="content">${log}</span>
                    </c:if>
                </div>
            </c:forEach>
        </div>
    </div>
    
    <script>
        document.addEventListener('DOMContentLoaded', function() {
            // 로그 컨테이너를 마지막 로그 항목으로 스크롤
            const logContainer = document.querySelector('.log-container');
            logContainer.scrollTop = logContainer.scrollHeight;
            
            // 현재 단계 활성화
            const currentStage = '${currentStage}';
            resetActiveSteps();
            
            if (currentStage) {
                const activeStep = document.querySelector(`.lifecycle-step[data-stage="${currentStage}"]`);
                if (activeStep) {
                    activeStep.classList.add('active');
                    
                    // 현재 단계의 설명 패널 표시
                    const description = document.getElementById(`desc-${currentStage}`);
                    if (description) {
                        description.classList.add('active');
                    }
                }
            }
            
            // 단계 클릭 이벤트 추가
            const lifecycleSteps = document.querySelectorAll('.lifecycle-step');
            lifecycleSteps.forEach(step => {
                step.addEventListener('click', function() {
                    const stage = this.getAttribute('data-stage');
                    
                    // 모든 설명 패널 숨기기
                    const descriptions = document.querySelectorAll('.stage-description');
                    descriptions.forEach(d => d.classList.remove('active'));
                    
                    // 해당 설명 패널 표시
                    const description = document.getElementById(`desc-${stage}`);
                    if (description) {
                        description.classList.add('active');
                        
                        // 설명 패널로 스크롤
                        description.scrollIntoView({ behavior: 'smooth', block: 'center' });
                    }
                });
            });
            
            // 로그 필터링 기능
            const logFilters = document.querySelectorAll('.log-filter');
            const logEntries = document.querySelectorAll('.log-entry');
            const autoScrollCheckbox = document.getElementById('auto-scroll');
            const exportLogsButton = document.getElementById('export-logs');
            const clearLogsButton = document.getElementById('clear-logs');
            
            // 로그 카운트 업데이트
            function updateLogCounts() {
                const allCount = document.querySelectorAll('.log-entry').length;
                const lifecycleCount = document.querySelectorAll('.log-entry.lifecycle').length;
                const initCount = document.querySelectorAll('.log-entry.init').length;
                const destroyCount = document.querySelectorAll('.log-entry.destroy').length;
                const messageCount = document.querySelectorAll('.log-entry.message').length;
                
                document.getElementById('count-all').textContent = allCount;
                document.getElementById('count-lifecycle').textContent = lifecycleCount;
                document.getElementById('count-init').textContent = initCount;
                document.getElementById('count-destroy').textContent = destroyCount;
                document.getElementById('count-message').textContent = messageCount;
            }
            
            // 초기 로그 카운트 업데이트
            updateLogCounts();
            
            // 필터 클릭 이벤트
            logFilters.forEach(filter => {
                filter.addEventListener('click', function() {
                    const filterType = this.getAttribute('data-filter');
                    
                    // 필터 버튼 활성화/비활성화
                    logFilters.forEach(f => f.classList.remove('active'));
                    this.classList.add('active');
                    
                    // 로그 항목 필터링
                    logEntries.forEach(entry => {
                        if (filterType === 'all') {
                            entry.style.display = '';
                        } else {
                            entry.style.display = entry.classList.contains(filterType) ? '' : 'none';
                        }
                    });
                    
                    // 필터링 후 스크롤 조정
                    if (autoScrollCheckbox.checked) {
                        logContainer.scrollTop = logContainer.scrollHeight;
                    }
                });
            });
            
            // 로그 내보내기 기능
            exportLogsButton.addEventListener('click', function() {
                // 현재 표시된 로그만 내보내기
                const visibleLogs = Array.from(logEntries)
                    .filter(entry => entry.style.display !== 'none')
                    .map(entry => {
                        const timestamp = entry.querySelector('.timestamp');
                        const content = entry.querySelector('.content');
                        const category = entry.querySelector('.category');
                        
                        let logText = '';
                        if (timestamp) {
                            logText += timestamp.textContent + ' ';
                        }
                        if (category) {
                            logText += '[' + category.textContent + '] ';
                        }
                        if (content) {
                            logText += content.textContent;
                        } else {
                            logText += entry.textContent;
                        }
                        return logText;
                    })
                    .join('\n');
                
                // 텍스트 파일로 내보내기
                const blob = new Blob([visibleLogs], { type: 'text/plain' });
                const url = URL.createObjectURL(blob);
                const a = document.createElement('a');
                a.href = url;
                a.download = 'bean-lifecycle-logs.txt';
                document.body.appendChild(a);
                a.click();
                document.body.removeChild(a);
                URL.revokeObjectURL(url);
            });
            
            // 로그 지우기 기능
            clearLogsButton.addEventListener('click', function() {
                if (confirm('현재 표시된 로그를 지우시겠습니까? 이 작업은 화면에서만 지워지며 서버의 로그는 유지됩니다.')) {
                    // 현재 표시된 로그만 지우기
                    const activeFilter = document.querySelector('.log-filter.active');
                    const filterType = activeFilter.getAttribute('data-filter');
                    
                    if (filterType === 'all') {
                        logContainer.innerHTML = '';
                    } else {
                        document.querySelectorAll(`.log-entry.${filterType}`).forEach(entry => {
                            entry.remove();
                        });
                    }
                    
                    // 로그 카운트 업데이트
                    updateLogCounts();
                }
            });
            
            // 자동 스크롤 기능
            autoScrollCheckbox.addEventListener('change', function() {
                if (this.checked) {
                    logContainer.scrollTop = logContainer.scrollHeight;
                }
            });
            
            // 주기적으로 새 로그 확인 (실제 구현에서는 웹소켓 등을 사용하는 것이 좋음)
            setInterval(function() {
                if (autoScrollCheckbox.checked) {
                    logContainer.scrollTop = logContainer.scrollHeight;
                }
            }, 1000);
            
            // 로그 항목 클릭 시 하이라이트
            logContainer.addEventListener('click', function(event) {
                const logEntry = event.target.closest('.log-entry');
                if (logEntry) {
                    // 모든 하이라이트 제거
                    document.querySelectorAll('.log-entry').forEach(entry => {
                        entry.classList.remove('log-highlight');
                    });
                    
                    // 클릭한 항목 하이라이트
                    logEntry.classList.add('log-highlight');
                }
            });
        });
        
        function resetActiveSteps() {
            const steps = document.querySelectorAll('.lifecycle-step');
            steps.forEach(step => step.classList.remove('active'));
        }
    </script>
</body>
</html> 