SELECT * FROM todo;

#데이터 수정
UPDATE todo SET completeStatus = 0;
UPDATE todo SET completeStatus = 1 WHERE id = 5;

#데이터 삭제
DELETE FROM todo;
DELETE FROM todo WHERE id = 9;
TRUNCATE todo;

INSERT INTO todo SET regDate=NOW(),performDate=NOW(),content='퇴근';

#집계 함수 더
SELECT MAX(regDate) FROM todo;
SELECT MIN(regDate) FROM todo;

ALTER TABLE todo ADD COLUMN numbering INT;

SELECT SUM(numbering) FROM todo;
SELECT AVG(numbering) FROM todo;

# 프로그래머스 문제 풀기