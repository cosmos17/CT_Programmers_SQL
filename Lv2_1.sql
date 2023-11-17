# 중복 제거하기
# https://school.programmers.co.kr/learn/courses/30/lessons/59408
SELECT COUNT(DISTINCT NAME)
FROM ANIMAL_INS
WHERE NAME IS NOT NULL;


# 동명 동물 수 찾기
# https://school.programmers.co.kr/learn/courses/30/lessons/59041
SELECT NAME, COUNT(*) AS COUNT
FROM ANIMAL_INS
WHERE NAME IS NOT NULL
GROUP BY NAME
HAVING COUNT(NAME) > 1
ORDER BY NAME;


# 최솟값 구하기
# https://school.programmers.co.kr/learn/courses/30/lessons/59038
SELECT DATETIME
FROM ANIMAL_INS
WHERE DATETIME = (SELECT MIN(DATETIME) FROM ANIMAL_INS);


# 동물 수 구하기
# https://school.programmers.co.kr/learn/courses/30/lessons/59406
SELECT COUNT(ANIMAL_ID)
FROM ANIMAL_INS;


# 이름에 el이 들어가는 동물 찾기
# https://school.programmers.co.kr/learn/courses/30/lessons/59047
SELECT ANIMAL_ID, NAME
FROM ANIMAL_INS
WHERE (INSTR(NAME, 'el') > 0
    OR INSTR(NAME, 'eL') > 0
    OR INSTR(NAME, 'El') > 0
    OR INSTR(NAME, 'EL') > 0)
    AND ANIMAL_TYPE = 'Dog'
ORDER BY NAME;




# NULL 처리하기
# https://school.programmers.co.kr/learn/courses/30/lessons/59410
SELECT ANIMAL_TYPE, IFNULL(NAME, 'No name'), SEX_UPON_INTAKE
FROM ANIMAL_INS
ORDER BY ANIMAL_ID;


# DATETIME에서 DATE로 형 변환
# https://school.programmers.co.kr/learn/courses/30/lessons/59414
SELECT ANIMAL_ID, NAME, DATE_FORMAT(DATETIME, '%Y-%m-%d') AS 날짜
FROM ANIMAL_INS
ORDER BY ANIMAL_ID;


# 가격이 제일 비싼 식품의 정보 출력하기
# https://school.programmers.co.kr/learn/courses/30/lessons/131115
SELECT PRODUCT_ID, PRODUCT_NAME, PRODUCT_CD, CATEGORY, PRICE
FROM FOOD_PRODUCT
ORDER BY PRICE DESC
LIMIT 1;


# 중성화 여부 파악하기
# https://school.programmers.co.kr/learn/courses/30/lessons/59409
SELECT ANIMAL_ID, NAME,
    IF( (INSTR(SEX_UPON_INTAKE, 'Neutered') OR INSTR(SEX_UPON_INTAKE, 'Spayed')), 'O', 'X') AS 중성화
FROM ANIMAL_INS
ORDER BY ANIMAL_ID;


# 카테고리 별 상품 개수 구하기
# https://school.programmers.co.kr/learn/courses/30/lessons/131529
SELECT LEFT(PRODUCT_CODE, 2) AS CATEGORY, COUNT(PRODUCT_ID) AS PRODUCTS
FROM PRODUCT
GROUP BY CATEGORY
ORDER BY CATEGORY;


