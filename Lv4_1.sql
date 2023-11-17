# 보호소에서 중성화한 동물
# https://school.programmers.co.kr/learn/courses/30/lessons/59045
SELECT ai.ANIMAL_ID, ai.ANIMAL_TYPE, ai.NAME
FROM ANIMAL_INS as ai INNER JOIN ANIMAL_OUTS AS ao ON ai.ANIMAL_ID = ao.ANIMAL_ID
WHERE ai.SEX_UPON_INTAKE != ao.SEX_UPON_OUTCOME
ORDER BY ai.ANIMAL_ID ASC;


# 식품분류별 가장 비싼 식품의 정보 조회하기
# https://school.programmers.co.kr/learn/courses/30/lessons/131116
SELECT fp2.CATEGORY, fp2.PRICE AS MAX_PRICE, fp2.PRODUCT_NAME
FROM (SELECT *,
            ROW_NUMBER() OVER (PARTITION BY CATEGORY ORDER BY PRICE DESC) AS rnk
    FROM FOOD_PRODUCT
    WHERE CATEGORY IN ('과자', '국', '김치', '식용유')) AS fp2
WHERE fp2.rnk = 1
ORDER BY MAX_PRICE DESC;


# 5월 식품들의 총매출 조회하기
# https://school.programmers.co.kr/learn/courses/30/lessons/131117
SELECT *
FROM (SELECT fp.PRODUCT_ID, fp.PRODUCT_NAME,
            SUM(fo.AMOUNT) OVER (PARTITION BY fp.PRODUCT_ID) * fp.PRICE AS TOTAL_SALES
    FROM FOOD_PRODUCT AS fp INNER JOIN FOOD_ORDER AS fo ON fp.PRODUCT_ID = fo.PRODUCT_ID
    WHERE fo.PRODUCE_DATE BETWEEN '2022-05-01' AND '2022-05-31') AS totals
GROUP BY totals.PRODUCT_ID
ORDER BY totals.TOTAL_SALES DESC, totals.PRODUCT_ID ASC;


# 취소되지 않은 진료 예약 조회하기
# https://school.programmers.co.kr/learn/courses/30/lessons/132204
SELECT ap.APNT_NO, pa.PT_NAME, pa.PT_NO, doc.MCDP_CD, doc.DR_NAME, ap.APNT_YMD
FROM PATIENT as pa INNER JOIN APPOINTMENT as ap ON pa.PT_NO = ap.PT_NO
        INNER JOIN DOCTOR as doc ON ap.MDDR_ID = doc.DR_ID
WHERE ap.APNT_YMD BETWEEN '2022-04-13' AND '2022-04-14'
    AND ap.APNT_CNCL_YMD IS NULL
    AND ap.MCDP_CD = 'CS'
ORDER BY ap.APNT_YMD ASC;


# 년, 월, 성별 별 상품 구매 회원 수 구하기
# https://school.programmers.co.kr/learn/courses/30/lessons/131532







# 서울에 위치한 식당 목록 출력하기
# https://school.programmers.co.kr/learn/courses/30/lessons/131118
SELECT *
FROM (SELECT ri.REST_ID, ri.REST_NAME, ri.FOOD_TYPE, ri.FAVORITES, ri.ADDRESS,
           ROUND((AVG(rr.REVIEW_SCORE) OVER (PARTITION BY rr.REST_ID)), 2) AS SCORE
    FROM REST_INFO AS ri INNER JOIN REST_REVIEW  AS rr ON ri.REST_ID = rr.REST_ID
    WHERE ri.ADDRESS LIKE '서울%') AS avg_score
GROUP BY avg_score.REST_ID
ORDER BY avg_score.SCORE DESC, avg_score.FAVORITES DESC;


# 우유와 요거트가 담긴 장바구니
# https://school.programmers.co.kr/learn/courses/30/lessons/62284
SELECT milk.CART_ID
FROM (SELECT CART_ID
      FROM CART_PRODUCTS 
      WHERE NAME = 'Milk') AS milk
      INNER JOIN
      (SELECT CART_ID
      FROM CART_PRODUCTS 
      WHERE NAME = 'Yogurt') AS yogurt
      ON milk.CART_ID = yogurt.CART_ID
GROUP BY milk.CART_ID
ORDER BY milk.CART_ID;


# 주문량이 많은 아이스크림들 조회하기
# https://school.programmers.co.kr/learn/courses/30/lessons/133027
SELECT uni3.FLAVOR
FROM (
    SELECT uni.FLAVOR, SUM(uni.TOTAL_ORDER) AS total
    FROM (SELECT * FROM FIRST_HALF
          UNION
          SELECT * FROM JULY) AS uni
    GROUP BY uni.FLAVOR
    ORDER BY total DESC
    LIMIT 3
    ) AS uni3


