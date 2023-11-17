# 고양이와 개는 몇 마리 있을까
# https://school.programmers.co.kr/learn/courses/30/lessons/59040
SELECT ANIMAL_TYPE, COUNT(ANIMAL_TYPE) AS count
FROM ANIMAL_INS
GROUP BY ANIMAL_TYPE
ORDER BY ANIMAL_TYPE;


# 입양 시각 구하기(1)
# https://school.programmers.co.kr/learn/courses/30/lessons/59412
SELECT DATE_FORMAT(DATETIME, '%H') AS HOUR, COUNT(*) AS COUNT
FROM ANIMAL_OUTS
WHERE DATE_FORMAT(DATETIME, '%H') >= 9 AND DATE_FORMAT(DATETIME, '%H') < 20
GROUP BY HOUR
ORDER BY HOUR;


# 진료과별 총 예약 횟수 출력하기
# https://school.programmers.co.kr/learn/courses/30/lessons/132202
SELECT MCDP_CD AS 진료과코드, COUNT(MCDP_CD) AS 5월예약건수
FROM APPOINTMENT
WHERE YEAR(APNT_YMD) = '2022' AND MONTH(APNT_YMD) = '5'
GROUP BY MCDP_CD	
ORDER BY 5월예약건수 ASC, 진료과코드 ASC


# 자동차 종류 별 특정 옵션이 포함된 자동차 수 구하기
# https://school.programmers.co.kr/learn/courses/30/lessons/151137
SELECT CAR_TYPE, COUNT(CAR_TYPE) AS CARS
FROM CAR_RENTAL_COMPANY_CAR
WHERE INSTR(OPTIONS, '통풍시트') > 0
    OR INSTR(OPTIONS, '열선시트') > 0
    OR INSTR(OPTIONS, '가죽시트') > 0
GROUP BY CAR_TYPE
ORDER BY CAR_TYPE


# 상품 별 오프라인 매출 구하기
# https://school.programmers.co.kr/learn/courses/30/lessons/131533
SELECT pr.PRODUCT_CODE,
    SUM(pr.PRICE * os.SALES_AMOUNT) AS SALES
FROM PRODUCT AS pr INNER JOIN OFFLINE_SALE AS os ON pr.PRODUCT_ID = os.PRODUCT_ID
GROUP BY pr.PRODUCT_CODE
ORDER BY SALES DESC, pr.PRODUCT_CODE ASC;




# 조건에 맞는 도서와 저자 리스트 출력하기
# https://school.programmers.co.kr/learn/courses/30/lessons/144854
SELECT bo.BOOK_ID, au.AUTHOR_NAME, DATE_FORMAT(bo.PUBLISHED_DATE, '%Y-%m-%d') AS PUBLISHED_DATE
FROM BOOK AS bo INNER JOIN AUTHOR AS au ON bo.AUTHOR_ID = au.AUTHOR_ID
WHERE bo.CATEGORY = '경제'
ORDER BY bo.PUBLISHED_DATE;


# 성분으로 구분한 아이스크림 총 주문량
# https://school.programmers.co.kr/learn/courses/30/lessons/133026
SELECT ii.INGREDIENT_TYPE, SUM(fh.TOTAL_ORDER) AS TOTAL_ORDER
FROM FIRST_HALF AS fh INNER JOIN ICECREAM_INFO AS ii ON fh.FLAVOR = ii.FLAVOR
GROUP BY ii.INGREDIENT_TYPE
ORDER BY TOTAL_ORDER ASC;


# 루시와 엘라 찾기
# https://school.programmers.co.kr/learn/courses/30/lessons/59046
SELECT ANIMAL_ID, NAME, SEX_UPON_INTAKE
FROM ANIMAL_INS
WHERE NAME IN ('Lucy', 'Ella', 'Pickle', 'Rogan', 'Sabrina', 'Mitty')
ORDER BY ANIMAL_ID ASC;


# 3월에 태어난 여성 회원 목록 출력하기
# https://school.programmers.co.kr/learn/courses/30/lessons/131120
SELECT MEMBER_ID, MEMBER_NAME, GENDER, date_format(DATE_OF_BIRTH, '%Y-%m-%d') AS DATE_OF_BIRTH
FROM MEMBER_PROFILE
WHERE MONTH(DATE_OF_BIRTH) = '03' AND GENDER = 'W' AND TLNO IS NOT NULL
ORDER BY MEMBER_ID;


# 가격대 별 상품 개수 구하기
# https://school.programmers.co.kr/learn/courses/30/lessons/131530
SELECT TRUNCATE(PRICE, -4) AS PRICE_GROUP, COUNT(*) AS PRODUCTS
FROM PRODUCT
GROUP BY PRICE_GROUP
ORDER BY PRICE_GROUP ASC;


