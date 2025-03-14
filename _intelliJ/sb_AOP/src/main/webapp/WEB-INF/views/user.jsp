<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>AOP 예제 - 사용자 정보</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 20px;
            line-height: 1.6;
        }
        .container {
            max-width: 800px;
            margin: 0 auto;
            padding: 20px;
            border: 1px solid #ddd;
            border-radius: 5px;
        }
        h1, h2 {
            color: #333;
        }
        .user-info {
            margin-top: 20px;
            padding: 15px;
            background-color: #f9f9f9;
            border-radius: 5px;
        }
        a {
            color: #0066cc;
            text-decoration: none;
            margin-right: 15px;
        }
        a:hover {
            text-decoration: underline;
        }
        .links {
            margin-top: 20px;
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
        <h1>사용자 정보</h1>
        
        <div class="user-info">
            <p><strong>사용자 ID:</strong> ${userId}</p>
            <p><strong>정보:</strong> ${userInfo}</p>
        </div>
        
        <div class="links">
            <a href="<c:url value='/users/${userId}/details'/>">상세 정보 보기</a>
            <a href="<c:url value='/users/'/>">사용자 목록으로</a>
            <a href="<c:url value='/users/home'/>">홈으로</a>
            <a href="<c:url value='/aop/explain'/>">AOP 작동방식 보기</a>
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