#데이터베이스 전체보기
SHOW DATABASES;
# 데이터베이스 생성
CREATE DATABASE exam;
# 데이터베이스 삭제
DROP DATABASE exam;
DROP DATABASE IF EXISTS exam;
# 데이터베이스 사용
USE exam;

/*
할일 테이블 생성

번호     - id
작성날짜 - regDate
수행날짜 - performDate
완료여부 - completeStatus 완료o:1, 완료x:0   
내용     - content
기타     - etc
*/

# 테이블 생성(제약 조건 x, 일단 데이터 타입만 적음)
CREATE TABLE todo(
    id INT,
    regDate DATETIME,
    performDate DATETIME,
    completeStatus TINYINT,
    content VARCHAR(200),
    etc TEXT
);

# 테이블 수정(add,drop,modify)
ALTER TABLE todo MODIFY COLUMN id INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT;
ALTER TABLE todo MODIFY COLUMN regDate DATETIME NOT NULL;
ALTER TABLE todo MODIFY COLUMN performDate DATETIME NOT NULL;
ALTER TABLE todo MODIFY COLUMN completeStatus TINYINT UNSIGNED NOT NULL;
ALTER TABLE todo MODIFY COLUMN content VARCHAR(200) NOT NULL;
ALTER TABLE todo MODIFY COLUMN etc2 INT NOT NULL;
ALTER TABLE todo MODIFY COLUMN completeStatus TINYINT UNSIGNED NOT NULL DEFAULT 0;

ALTER TABLE todo ADD COLUMN etc2 TEXT;
ALTER TABLE todo DROP COLUMN etc2;

#추가 하는 컬럼의 위치를 지정하고싶을 때
ALTER TABLE todo ADD COLUMN nowDate DATETIME NOT NULL AFTER regDate;

# 테이블 구조 확인
DESC todo;

# 테이블 삭제
DROP TABLE todo;

# 테이블 생성(제약 조건 추가)
CREATE TABLE todo(
    id INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    regDate DATETIME NOT NULL,
    performDate DATETIME NOT NULL,
    completeStatus TINYINT UNSIGNED NOT NULL,
    content VARCHAR(200) NOT NULL,
    etc TEXT
);

SELECT NOW();
# 데이터 삽입1
INSERT INTO todo (
    regDate,
    performDate,
    completeStatus,
    content,
    etc
) VALUES (
    NOW(),
    NOW(),
    0,
    '기상',
    '기타'
);
# 데이터 삽입2
INSERT INTO todo VALUES(
    2,
    NOW(),
    NOW(),
    0,
    '세안',
    '기타'
);
# 데이터 삽입3
INSERT INTO todo SET regDate=NOW(),performDate=NOW(),completeStatus=1,content='운동';
INSERT INTO todo SET regDate=NOW(),performDate=NOW(),content='퇴근';

# 데이터 조회 oderby 기본값 asc(오름차순) desc 내림차순
SELECT * FROM todo;
SELECT * FROM todo ORDER BY id;
SELECT * FROM todo ORDER BY id DESC;
SELECT id,content,etc FROM todo;
SELECT DISTINCT(completeStatus) FROM todo; # 중복값 제거
SELECT COUNT(*) FROM todo; # row 개수
SELECT COUNT(etc) FROM todo; # 집계함수는 null값 계산 안함

#데이터 수정
UPDATE todo SET completeStatus = 1;
UPDATE todo SET content = '출근' WHERE id = 5;

#데이터 삭제
DELETE FROM todo;
DELETE FROM todo WHERE id = 10;
TRUNCATE todo;