<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>AOP 실시간 모니터링</title>
    <style>
        body {
            font-family: 'Noto Sans KR', Arial, sans-serif;
            margin: 0;
            padding: 20px;
            line-height: 1.6;
            color: #333;
            background-color: #f5f5f5;
        }
        .container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 20px;
            background-color: #fff;
            border-radius: 5px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
        }
        h1, h2 {
            color: #2c3e50;
        }
        h1 {
            border-bottom: 2px solid #3498db;
            padding-bottom: 10px;
            margin-bottom: 30px;
        }
        .monitor-container {
            display: flex;
            margin-top: 20px;
        }
        .monitor-panel {
            flex: 1;
            padding: 15px;
            border: 1px solid #ddd;
            border-radius: 5px;
            margin-right: 20px;
            background-color: #fff;
        }
        .event-log {
            flex: 2;
            height: 500px;
            overflow-y: auto;
            padding: 15px;
            border: 1px solid #ddd;
            border-radius: 5px;
            background-color: #f9f9f9;
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
        .stats-container {
            display: flex;
            flex-wrap: wrap;
            margin-top: 20px;
        }
        .stat-box {
            flex: 1;
            min-width: 200px;
            padding: 15px;
            margin: 10px;
            background-color: #fff;
            border-radius: 5px;
            box-shadow: 0 1px 3px rgba(0,0,0,0.1);
            text-align: center;
        }
        .stat-value {
            font-size: 24px;
            font-weight: bold;
            color: #3498db;
            margin: 10px 0;
        }
        .stat-label {
            font-size: 14px;
            color: #666;
        }
        .method-list {
            margin-top: 20px;
        }
        .method-item {
            padding: 10px;
            margin-bottom: 5px;
            background-color: #f5f5f5;
            border-radius: 4px;
            cursor: pointer;
        }
        .method-item:hover {
            background-color: #e3f2fd;
        }
        .active-method {
            background-color: #bbdefb;
            font-weight: bold;
        }
        .nav-links {
            margin-top: 30px;
            padding-top: 15px;
            border-top: 1px solid #eee;
        }
        a {
            color: #3498db;
            text-decoration: none;
            margin-right: 15px;
        }
        a:hover {
            text-decoration: underline;
        }
        .clear-btn {
            padding: 8px 15px;
            background-color: #f44336;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            margin-top: 10px;
        }
        .clear-btn:hover {
            background-color: #d32f2f;
        }
        .aop-flow-container {
            position: relative;
            height: 300px;
            margin: 30px 0;
            border: 1px solid #ddd;
            border-radius: 5px;
            padding: 10px;
            overflow: hidden;
        }
        .aop-flow-step {
            position: absolute;
            width: 150px;
            padding: 10px;
            border-radius: 5px;
            text-align: center;
            transition: all 0.5s ease;
            opacity: 0.3;
        }
        .aop-flow-step.active {
            opacity: 1;
            transform: scale(1.05);
            box-shadow: 0 0 15px rgba(0,0,0,0.2);
            z-index: 10;
        }
        .client-step {
            left: 50px;
            top: 20px;
            background-color: #e1f5fe;
            border: 2px solid #03a9f4;
        }
        .proxy-step {
            left: 250px;
            top: 20px;
            background-color: #fff9c4;
            border: 2px solid #ffc107;
        }
        .before-step {
            left: 250px;
            top: 100px;
            background-color: #ffebee;
            border: 2px solid #f44336;
        }
        .target-step {
            left: 450px;
            top: 20px;
            background-color: #e8f5e9;
            border: 2px solid #4caf50;
        }
        .after-step {
            left: 250px;
            top: 180px;
            background-color: #f3e5f5;
            border: 2px solid #9c27b0;
        }
        .result-step {
            left: 650px;
            top: 20px;
            background-color: #ede7f6;
            border: 2px solid #673ab7;
        }
        .flow-arrow {
            position: absolute;
            width: 50px;
            height: 2px;
            background-color: #999;
        }
        .arrow-client-proxy {
            left: 200px;
            top: 40px;
            width: 50px;
        }
        .arrow-proxy-before {
            left: 325px;
            top: 70px;
            height: 30px;
            width: 2px;
        }
        .arrow-before-target {
            left: 325px;
            top: 100px;
            height: 2px;
            width: 125px;
            transform: translate(0, 20px) rotate(-45deg);
        }
        .arrow-target-after {
            left: 450px;
            top: 70px;
            height: 110px;
            width: 2px;
        }
        .arrow-after-result {
            left: 400px;
            top: 190px;
            height: 2px;
            width: 250px;
            transform: translate(0, -20px) rotate(45deg);
        }
        .arrow-result-client {
            left: 650px;
            top: 40px;
            width: 50px;
            transform: rotate(180deg);
        }
    </style>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.min.js"></script>
</head>
<body>
    <div class="container">
        <h1>AOP 실시간 모니터링</h1>
        
        <div class="aop-flow-container">
            <div class="aop-flow-step client-step" id="client-step">
                <strong>클라이언트</strong>
                <p>메서드 호출</p>
            </div>
            <div class="aop-flow-step proxy-step" id="proxy-step">
                <strong>프록시 객체</strong>
                <p>AOP 처리</p>
            </div>
            <div class="aop-flow-step before-step" id="before-step">
                <strong>Before Advice</strong>
                <p>메서드 실행 전</p>
            </div>
            <div class="aop-flow-step target-step" id="target-step">
                <strong>대상 객체</strong>
                <p>실제 메서드 실행</p>
            </div>
            <div class="aop-flow-step after-step" id="after-step">
                <strong>After Advice</strong>
                <p>메서드 실행 후</p>
            </div>
            <div class="aop-flow-step result-step" id="result-step">
                <strong>결과 반환</strong>
                <p>클라이언트에게</p>
            </div>
            
            <!-- 화살표 -->
            <div class="flow-arrow arrow-client-proxy"></div>
            <div class="flow-arrow arrow-proxy-before"></div>
            <div class="flow-arrow arrow-before-target"></div>
            <div class="flow-arrow arrow-target-after"></div>
            <div class="flow-arrow arrow-after-result"></div>
            <div class="flow-arrow arrow-result-client"></div>
        </div>
        
        <div class="monitor-container">
            <div class="monitor-panel">
                <h2>통계</h2>
                <div class="stats-container">
                    <div class="stat-box">
                        <div class="stat-label">총 AOP 이벤트</div>
                        <div class="stat-value" id="total-events">0</div>
                    </div>
                    <div class="stat-box">
                        <div class="stat-label">평균 실행 시간</div>
                        <div class="stat-value" id="avg-execution-time">0 ms</div>
                    </div>
                    <div class="stat-box">
                        <div class="stat-label">최대 실행 시간</div>
                        <div class="stat-value" id="max-execution-time">0 ms</div>
                    </div>
                </div>
                
                <h2>모니터링 중인 메서드</h2>
                <div class="method-list" id="method-list">
                    <!-- 메서드 목록이 여기에 동적으로 추가됩니다 -->
                </div>
                
                <button class="clear-btn" id="clear-events">이벤트 로그 지우기</button>
            </div>
            
            <div class="event-log" id="event-log">
                <!-- 이벤트 로그가 여기에 동적으로 추가됩니다 -->
                <div class="event-item event-before">
                    <div class="event-header">
                        <span>BEFORE</span>
                        <span class="event-time">2023-01-01 12:00:00</span>
                    </div>
                    <div class="event-method">UserService.findUser()</div>
                    <div class="event-message">메서드 실행 전</div>
                </div>
            </div>
        </div>
        
        <div class="nav-links">
            <a href="<c:url value='/users/home'/>">홈으로 돌아가기</a>
            <a href="<c:url value='/aop/explain'/>">AOP 작동방식 설명</a>
        </div>
    </div>
    
    <script>
        $(document).ready(function() {
            var stompClient = null;
            var events = [];
            var methods = {};
            var totalExecutionTime = 0;
            var maxExecutionTime = 0;
            
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
                    highlightFlowStep('proxy-step');
                } else if (event.eventType === 'AROUND_END') {
                    eventClass = 'event-around-end';
                    highlightFlowStep('result-step');
                    
                    // 실행 시간 통계 업데이트
                    if (event.executionTime > 0) {
                        totalExecutionTime += event.executionTime;
                        if (event.executionTime > maxExecutionTime) {
                            maxExecutionTime = event.executionTime;
                            $('#max-execution-time').text(maxExecutionTime + ' ms');
                        }
                        
                        var avgTime = Math.round(totalExecutionTime / events.length);
                        $('#avg-execution-time').text(avgTime + ' ms');
                    }
                } else if (event.eventType === 'BEFORE') {
                    eventClass = 'event-before';
                    highlightFlowStep('before-step');
                } else if (event.eventType === 'AFTER') {
                    eventClass = 'event-after';
                    highlightFlowStep('after-step');
                }
                
                // 메서드 목록 업데이트
                var methodKey = event.className + '.' + event.methodName;
                if (!methods[methodKey]) {
                    methods[methodKey] = {
                        count: 0,
                        totalTime: 0
                    };
                    
                    // 메서드 목록에 추가
                    $('#method-list').append(
                        '<div class="method-item" data-method="' + methodKey + '">' +
                        methodKey +
                        '</div>'
                    );
                }
                methods[methodKey].count++;
                
                if (event.eventType === 'AROUND_END') {
                    methods[methodKey].totalTime += event.executionTime;
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
                
                // 통계 업데이트
                $('#total-events').text(events.length);
                
                // 대상 메서드 실행 중 표시
                if (event.eventType === 'AROUND_START') {
                    setTimeout(function() {
                        highlightFlowStep('target-step');
                    }, 500);
                }
                
                // 클라이언트 호출 표시
                if (event.eventType === 'BEFORE') {
                    highlightFlowStep('client-step');
                }
            }
            
            function highlightFlowStep(stepId) {
                // 모든 단계 비활성화
                $('.aop-flow-step').removeClass('active');
                
                // 해당 단계 활성화
                $('#' + stepId).addClass('active');
                
                // 일정 시간 후 활성화 해제
                setTimeout(function() {
                    $('#' + stepId).removeClass('active');
                }, 1500);
            }
            
            // 이벤트 로그 지우기
            $('#clear-events').click(function() {
                $('#event-log').empty();
                events = [];
                $('#total-events').text('0');
                $('#avg-execution-time').text('0 ms');
                $('#max-execution-time').text('0 ms');
                totalExecutionTime = 0;
                maxExecutionTime = 0;
            });
            
            // 메서드 항목 클릭 이벤트
            $(document).on('click', '.method-item', function() {
                var method = $(this).data('method');
                $('.method-item').removeClass('active-method');
                $(this).addClass('active-method');
                
                // 해당 메서드 관련 이벤트만 필터링하여 표시할 수 있음
                // 여기서는 간단히 활성화만 표시
            });
            
            // 웹소켓 연결
            connect();
        });
    </script>
</body>
</html> 