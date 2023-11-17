# 자동차 대여 기록에서 대여중 / 대여 가능 여부 구분하기
# https://school.programmers.co.kr/learn/courses/30/lessons/157340
-- SELECT CNTS.CAR_ID, IF (SUM(CNTS.CNT) > 0, '대여중', '대여가능') AS AVAILABILITY
-- FROM (
--     SELECT CAR_ID,
--         (CASE
--             WHEN DATE_FORMAT(START_DATE, '%Y-%m-%d') <= '2022-10-16'
--                 AND DATE_FORMAT(END_DATE, '%Y-%m-%d') >= '2022-10-16' THEN 1
--             ELSE 0
--          END) AS CNT
--     FROM CAR_RENTAL_COMPANY_RENTAL_HISTORY
--     ) CNTS
-- GROUP BY CNTS.CAR_ID
-- ORDER BY CNTS.CAR_ID DESC;


# 헤비 유저가 소유한 장소
# https://school.programmers.co.kr/learn/courses/30/lessons/77487
SELECT pl1.ID, pl1.NAME, pl1.HOST_ID
FROM PLACES AS pl1 INNER JOIN (
    SELECT HOST_ID, COUNT(HOST_ID) AS CNT
    FROM PLACES
    GROUP BY HOST_ID
    HAVING CNT > 1
    ) AS pl2
    ON pl1.HOST_ID = pl2.HOST_ID
ORDER BY pl1.ID;


# 조회수가 가장 많은 중고거래 게시판의 첨부파일 조회하기
# https://school.programmers.co.kr/learn/courses/30/lessons/164671
-- SELECT ub.VIEWS, uf.FILE_ID, uf.BOARD_ID
-- FROM USED_GOODS_BOARD AS ub INNER JOIN USED_GOODS_FILE AS uf
--     ON ub.BOARD_ID = uf.BOARD_ID
-- GROUP BY ub.BOARD_ID
-- ORDER BY ub.VIEWS DESC
-- LIMIT 1;


# 대여 횟수가 많은 자동차들의 월별 대여 횟수 구하기
# https://school.programmers.co.kr/learn/courses/30/lessons/151139




