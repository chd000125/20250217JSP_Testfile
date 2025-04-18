CREATE DATABASE IF NOT EXISTS board;
USE board;

CREATE TABLE IF NOT EXISTS board (
    id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(200) NOT NULL,
    content TEXT NOT NULL,
    writer VARCHAR(50) NOT NULL,
    regdate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    viewcount INT DEFAULT 0
);

-- 게시판 더미 데이터 생성
INSERT INTO board (title, content, writer) VALUES 
('공지사항: 새로운 기능 업데이트', '이번 업데이트에서는 다음과 같은 기능이 추가되었습니다...', '관리자'),
('안녕하세요 가입인사 드립니다', '앞으로 잘 부탁드립니다!', '김신입'),
('질문있습니다', '게시판 사용방법을 잘 모르겠어요...', '박초보'),
('오늘 날씨가 좋네요', '산책하기 좋은 날씨입니다.', '이날씨'),
('맛집 추천합니다', '어제 발견한 숨은 맛집이 있어서 공유합니다...', '정먹방'),
('주말 영화 추천', '이번 주말에 볼만한 영화를 추천드립니다.', '최영화'),
('개발 스터디 모집합니다', '함께 공부하실 분을 찾습니다.', '강개발'),
('취미 공유해요', '여러분의 취미는 무엇인가요?', '한취미'),
('여행 후기입니다', '지난 주말 여행 다녀온 후기 공유합니다.', '류여행'),
('독서모임 안내', '매주 토요일 독서모임을 진행합니다.', '심독서'),
('운동 파트너 구합니다', '같이 운동하실 분 구합니다.', '윤운동'),
('일상 이야기', '오늘 있었던 재미있는 일을 공유합니다.', '조일상'),
('중고거래 문의', '물품 상태가 어떤가요?', '장중고'),
('식물 키우기 팁', '반려식물 키우는 노하우를 공유합니다.', '백식물'),
('주식 투자 이야기', '요즘 주식시장 어떻게 보시나요?', '신투자'),
('음악 추천합니다', '요즘 즐겨듣는 플레이리스트입니다.', '오음악'),
('반려동물 이야기', '우리 강아지 사진 올립니다.', '구동물'),
('취업 준비 팁', '취준생들을 위한 꿀팁 공유합니다.', '민취준'),
('요리 레시피 공유', '간단한 요리 레시피 알려드립니다.', '송요리'),
('IT 뉴스 공유', '최신 IT 소식을 전해드립니다.', '차정보');

-- 조회수 랜덤 업데이트
UPDATE board SET viewcount = FLOOR(RAND() * 100);

-- 등록일 랜덤하게 설정 (최근 30일 이내)
UPDATE board 
SET regdate = DATE_SUB(NOW(), INTERVAL FLOOR(RAND() * 30) DAY);