# 상위 n개 레코드
# https://school.programmers.co.kr/learn/courses/30/lessons/59405
SELECT NAME
FROM ANIMAL_INS
ORDER BY DATETIME LIMIT 1;


# 어린 동물 찾기
# https://school.programmers.co.kr/learn/courses/30/lessons/59037
SELECT ANIMAL_ID, NAME
FROM ANIMAL_INS
WHERE INTAKE_CONDITION != 'Aged';

# 이름이 있는 동물의 아이디
# https://school.programmers.co.kr/learn/courses/30/lessons/59407
SELECT ANIMAL_ID
FROM ANIMAL_INS
WHERE NAME IS NOT NULL;


# 역순 정렬하기
# https://school.programmers.co.kr/learn/courses/30/lessons/59035
SELECT NAME, DATETIME
FROM ANIMAL_INS
ORDER BY ANIMAL_ID DESC;


# 여러 기준으로 정렬하기
# https://school.programmers.co.kr/learn/courses/30/lessons/59404
SELECT ANIMAL_ID, NAME, DATETIME
FROM ANIMAL_INS
ORDER BY NAME ASC, DATETIME DESC;




# 아픈 동물 찾기
# https://school.programmers.co.kr/learn/courses/30/lessons/59036
SELECT ANIMAL_ID, NAME
FROM ANIMAL_INS
WHERE INTAKE_CONDITION = 'Sick'
ORDER BY ANIMAL_ID;


# 동물의 아이디와 이름
# https://school.programmers.co.kr/learn/courses/30/lessons/59403
SELECT ANIMAL_ID, NAME
FROM ANIMAL_INS
ORDER BY ANIMAL_ID;


# 나이 정보가 없는 회원 수 구하기
# https://school.programmers.co.kr/learn/courses/30/lessons/131528
SELECT COUNT(USER_ID)
FROM USER_INFO
WHERE AGE IS NULL;


# 가장 비싼 상품 구하기
# https://school.programmers.co.kr/learn/courses/30/lessons/131697
SELECT MAX(PRICE)
FROM PRODUCT;


# 경기도에 위치한 식품창고 목록 출력하기
# https://school.programmers.co.kr/learn/courses/30/lessons/131114
SELECT WAREHOUSE_ID, WAREHOUSE_NAME, ADDRESS, IFNULL(FREEZER_YN, 'N')
FROM FOOD_WAREHOUSE
WHERE INSTR(ADDRESS, '경기도') = 1
ORDER BY WAREHOUSE_ID;


