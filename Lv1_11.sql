# 강원도에 위치한 생산공장 목록 출력하기
# https://school.programmers.co.kr/learn/courses/30/lessons/131112
SELECT FACTORY_ID, FACTORY_NAME, ADDRESS
FROM FOOD_FACTORY
WHERE INSTR(ADDRESS, '강원도') = 1;


# 흉부외과 또는 일반외과 의사 목록 출력하기
# https://school.programmers.co.kr/learn/courses/30/lessons/132203
SELECT DR_NAME, DR_ID, MCDP_CD, DATE_FORMAT(HIRE_YMD, '%Y-%m-%d')
FROM DOCTOR
WHERE MCDP_CD IN ('CS', 'GS')
ORDER BY HIRE_YMD DESC, DR_NAME ASC;


# 이름이 없는 동물의 아이디
# https://school.programmers.co.kr/learn/courses/30/lessons/59039
SELECT ANIMAL_ID
FROM ANIMAL_INS
WHERE NAME IS NULL;


# 조건에 맞는 회원수 구하기
# https://school.programmers.co.kr/learn/courses/30/lessons/131535
SELECT COUNT(*) AS USERS
FROM USER_INFO
WHERE YEAR(JOINED) = '2021' AND AGE BETWEEN 20 AND 29;


# 12세 이하인 여자 환자 목록 출력하기
# https://school.programmers.co.kr/learn/courses/30/lessons/132201
SELECT PT_NAME, PT_NO, GEND_CD, AGE, IFNULL(TLNO, 'NONE')
FROM PATIENT
WHERE AGE <= 12 AND GEND_CD = 'W'
ORDER BY AGE DESC, PT_NAME ASC;




# 인기있는 아이스크림
# https://school.programmers.co.kr/learn/courses/30/lessons/133024
SELECT FLAVOR
FROM FIRST_HALF
ORDER BY TOTAL_ORDER DESC, SHIPMENT_ID ASC;


# 조건에 맞는 도서 리스트 출력하기
# https://school.programmers.co.kr/learn/courses/30/lessons/144853
SELECT BOOK_ID, DATE_FORMAT(PUBLISHED_DATE, '%Y-%m-%d')
FROM BOOK
WHERE YEAR(PUBLISHED_DATE) = '2021' AND CATEGORY = '인문'
ORDER BY PUBLISHED_DATE ASC;


# 평균 일일 대여 요금 구하기
# https://school.programmers.co.kr/learn/courses/30/lessons/151136
SELECT ROUND(AVG(DAILY_FEE)) AS AVERAGE_FEE
FROM CAR_RENTAL_COMPANY_CAR
WHERE CAR_TYPE = 'SUV';


# 모든 레코드 조회하기
# https://school.programmers.co.kr/learn/courses/30/lessons/59034
SELECT ANIMAL_ID, ANIMAL_TYPE, DATETIME, INTAKE_CONDITION, NAME, SEX_UPON_INTAKE
FROM ANIMAL_INS
ORDER BY ANIMAL_ID ASC;


# 과일로 만든 아이스크림 고르기
# https://school.programmers.co.kr/learn/courses/30/lessons/133025
-- INNER JOIN ON 직접 설정 필요
SELECT fh.FLAVOR
FROM FIRST_HALF AS fh INNER JOIN ICECREAM_INFO AS ii ON fh.FLAVOR = ii.FLAVOR
WHERE fh.TOTAL_ORDER > 3000 AND ii.INGREDIENT_TYPE = 'fruit_based'
ORDER BY fh.TOTAL_ORDER DESC;

