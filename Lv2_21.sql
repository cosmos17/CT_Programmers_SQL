# 재구매가 일어난 상품과 회원 리스트 구하기
# https://school.programmers.co.kr/learn/courses/30/lessons/131536

-- SELECT USER_ID, PRODUCT_ID
-- FROM ONLINE_SALE AS os1 INNER JOIN 
--     (SELECT USER_ID AS UID, COUNT(*) AS CNT
--      FROM ONLINE_SALE
--      GROUP BY USER_ID, PRODUCT_ID
--      HAVING CNT > 1) as os2
--      ON os1.USER_ID = os2.UID;


# 조건에 부합하는 중고거래 상태 조회하기
# https://school.programmers.co.kr/learn/courses/30/lessons/164672
# SELECT BOARD_ID, WRITER_ID, TITLE, PRICE,
    (CASE STATUS
        WHEN 'SALE' THEN '판매중'
        WHEN 'RESERVED' THEN '예약중'
        WHEN 'DONE' THEN '거래완료'
     END) AS STATUS
FROM USED_GOODS_BOARD
WHERE CREATED_DATE = '2022-10-05'
ORDER BY BOARD_ID DESC;


# 자동차 평균 대여 기간 구하기
# https://school.programmers.co.kr/learn/courses/30/lessons/157342
SELECT AVGDF.CAR_ID, ROUND(AVGDF.DF, 1) AS AVERAGE_DURATION
FROM (
    SELECT *, AVG(DATEDIFF(END_DATE, START_DATE) +1) AS DF
    FROM CAR_RENTAL_COMPANY_RENTAL_HISTORY
    GROUP BY CAR_ID
    ) AS AVGDF
WHERE AVGDF.DF >= 7
ORDER BY AVERAGE_DURATION DESC, AVGDF.CAR_ID DESC;


