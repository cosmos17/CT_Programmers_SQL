# 오랜 기간 보호한 동물(1)
# https://school.programmers.co.kr/learn/courses/30/lessons/59044
SELECT ai.NAME, ai.DATETIME
FROM ANIMAL_INS AS ai LEFT JOIN ANIMAL_OUTS AS ao ON ai.ANIMAL_ID = ao.ANIMAL_ID
WHERE ao.DATETIME IS NULL
ORDER BY DATETIME
LIMIT 3;


# 카테고리 별 도서 판매량 집계하기
# https://school.programmers.co.kr/learn/courses/30/lessons/144855
SELECT bo.CATEGORY, SUM(SALES) AS TOTAL_SALES
FROM BOOK AS bo INNER JOIN BOOK_SALES AS bs ON bo.BOOK_ID = bs.BOOK_ID
WHERE YEAR(bs.SALES_DATE) = '2022' AND MONTH(bs.SALES_DATE) = '1'
GROUP BY bo.CATEGORY
ORDER BY bo.CATEGORY ASC;


# 있었는데요 없었습니다
# https://school.programmers.co.kr/learn/courses/30/lessons/59043
SELECT ai.ANIMAL_ID, ai.NAME
FROM ANIMAL_INS AS ai INNER JOIN ANIMAL_OUTS AS ao ON ai.ANIMAL_ID = ao.ANIMAL_ID
WHERE ai.DATETIME > ao.DATETIME
ORDER BY ai.DATETIME;


# 오랜 기간 보호한 동물(2)
# https://school.programmers.co.kr/learn/courses/30/lessons/59411
SELECT ao.ANIMAL_ID, ao.NAME
FROM ANIMAL_INS AS ai RIGHT JOIN ANIMAL_OUTS AS ao ON ai.ANIMAL_ID = ao.ANIMAL_ID
ORDER BY DATEDIFF(ao.DATETIME, ai.DATETIME) DESC
LIMIT 2;


# 조건별로 분류하여 주문상태 출력하기
# https://school.programmers.co.kr/learn/courses/30/lessons/131113
SELECT ORDER_ID, PRODUCT_ID, DATE_FORMAT(OUT_DATE, '%Y-%m-%d') AS OUT_DATE,
    (CASE
        WHEN OUT_DATE IS NULL THEN '출고미정'
        WHEN OUT_DATE <= '2022-05-01' THEN '출고완료'
        ELSE '출고대기'
     END) AS '출고여부'
FROM FOOD_ORDER
ORDER BY ORDER_ID ASC;




# 조건에 맞는 사용자와 총 거래금액 조회하기
# https://school.programmers.co.kr/learn/courses/30/lessons/164668
-- SELECT uu.USER_ID, uu.NICKNAME,
--     SUM(ub.PRICE) AS TOTAL_SALES
-- FROM USED_GOODS_BOARD AS ub INNER JOIN USED_GOODS_USER AS uu
--     ON ub.WRITER_ID = uu.USER_ID
-- WHERE ub.STATUS = 'DONE' AND ub.PRICE >= 700000
-- GROUP BY uu.USER_ID, uu.NICKNAME, uu.USER_ID
-- ORDER BY TOTAL_SALES ASC;


# 대여 기록이 존재하는 자동차 리스트 구하기
# https://school.programmers.co.kr/learn/courses/30/lessons/157341
SELECT DISTINCT(ch.CAR_ID)
FROM CAR_RENTAL_COMPANY_CAR AS cc INNER JOIN CAR_RENTAL_COMPANY_RENTAL_HISTORY AS ch
    on cc.CAR_ID = ch.CAR_ID
WHERE cc.CAR_TYPE = '세단' AND MONTH(ch.START_DATE) = '10'
ORDER BY ch.CAR_ID DESC;


# 즐겨찾기가 가장 많은 식당 정보 출력하기
# https://school.programmers.co.kr/learn/courses/30/lessons/131123
-- 윈도우 함수 ROW_NUMBER
SELECT RI.FOOD_TYPE, RI.REST_ID, RI.REST_NAME, RI.FAVORITES
FROM (
    SELECT FOOD_TYPE, REST_ID, REST_NAME, FAVORITES,
        ROW_NUMBER() OVER (PARTITION BY FOOD_TYPE ORDER BY FAVORITES DESC) AS FR
    FROM REST_INFO
    ) RI
WHERE FR = 1
ORDER BY RI.FOOD_TYPE DESC;


# 없어진 기록 찾기
# https://school.programmers.co.kr/learn/courses/30/lessons/59042
SELECT ao.ANIMAL_ID, ao.NAME
FROM ANIMAL_INS AS ai RIGHT JOIN ANIMAL_OUTS AS ao
    ON ai.ANIMAL_ID = ao.ANIMAL_ID
WHERE ai.DATETIME IS NULL
ORDER BY ao.ANIMAL_ID;


# 조건에 맞는 사용자 정보 조회하기
# https://school.programmers.co.kr/learn/courses/30/lessons/164670
SELECT uu.USER_ID, uu.NICKNAME,
    CONCAT(uu.CITY, ' ', uu.STREET_ADDRESS1, ' ', uu.STREET_ADDRESS2) AS 전체주소,
    CONCAT(SUBSTRING(uu.TLNO, 1, 3), '-', SUBSTRING(uu.TLNO, 4, 4), '-', SUBSTRING(uu.TLNO, 8, 4)) AS 전화번호
FROM USED_GOODS_BOARD AS ub INNER JOIN USED_GOODS_USER AS uu
    ON ub.WRITER_ID = uu.USER_ID
WHERE ub.WRITER_ID IN (
    SELECT WRITER_ID
    FROM USED_GOODS_BOARD
    GROUP BY WRITER_ID
    HAVING COUNT(WRITER_ID) > 2
    )
GROUP BY uu.USER_ID
ORDER BY uu.USER_ID DESC;


