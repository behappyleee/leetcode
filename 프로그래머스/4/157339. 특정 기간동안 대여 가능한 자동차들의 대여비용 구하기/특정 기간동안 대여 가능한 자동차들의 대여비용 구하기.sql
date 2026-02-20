-- 1) 2022-11-01 ~ 2022-11-30 대여 가능한 세단 or SUV 차량 조회
-- 2) AND 30 일간 대여 가능한 금액 50만원 이상 200만원 미만인 자동차들을 조회 
-- 3) 조회 데이터 필드 자동차 ID, 자동차 종류, 대여 금액 (FEE)
-- 4) 결과 대여 금액 내림 차순, 대여 금액 같을 경우 자동차 종류 오름차순 정렬, 자동차 종류 같을 경우 자동차 ID로 내림 차순 정렬

-- 코드를 입력하세요
 
 SELECT rental_car.CAR_ID, 
       rental_car.CAR_TYPE,
       ROUND(30 * rental_car.DAILY_FEE * (1 - discount_plan.DISCOUNT_RATE / 100)) AS FEE
FROM CAR_RENTAL_COMPANY_CAR rental_car
INNER JOIN CAR_RENTAL_COMPANY_DISCOUNT_PLAN discount_plan
        ON discount_plan.CAR_TYPE = rental_car.CAR_TYPE
WHERE rental_car.CAR_TYPE IN ('세단', 'SUV')
  AND discount_plan.DURATION_TYPE = '30일 이상'
  AND rental_car.CAR_ID NOT IN (
      SELECT CAR_ID
      FROM CAR_RENTAL_COMPANY_RENTAL_HISTORY
      WHERE START_DATE <= '2022-11-30'
        AND END_DATE >= '2022-11-01'
  )
  AND ROUND(30 * rental_car.DAILY_FEE * (1 - discount_plan.DISCOUNT_RATE / 100)) >= 500000
  AND ROUND(30 * rental_car.DAILY_FEE * (1 - discount_plan.DISCOUNT_RATE / 100)) < 2000000
ORDER BY FEE DESC, rental_car.CAR_TYPE ASC, rental_car.CAR_ID DESC;
 
 
#      SELECT rental_car.CAR_ID, 
#             rental_car.CAR_TYPE,
#             ROUND((30 * rental_car.DAILY_FEE) * ROUND((1 - (discount_plan.DISCOUNT_RATE / 100)), 2)) AS FEE
#        FROM CAR_RENTAL_COMPANY_CAR rental_car
#   LEFT JOIN CAR_RENTAL_COMPANY_RENTAL_HISTORY rental_history
#          ON rental_car.CAR_ID = rental_history.CAR_ID
#  INNER JOIN CAR_RENTAL_COMPANY_DISCOUNT_PLAN discount_plan
#          ON discount_plan.CAR_TYPE = rental_car.CAR_TYPE         
#  WHERE (rental_car.CAR_TYPE = '세단' or rental_car.CAR_TYPE = 'SUV')
#    AND (rental_history.START_DATE <= '2022-11-30' AND rental_history.END_DATE >= '2022-11-01')
#    AND discount_plan.DURATION_TYPE = '30일 이상' 
#    AND (ROUND((30 * rental_car.DAILY_FEE) * ROUND((1 - (discount_plan.DISCOUNT_RATE / 100)), 2))) >= 500000
#    AND (ROUND((30 * rental_car.DAILY_FEE) * ROUND((1 - (discount_plan.DISCOUNT_RATE / 100)), 2))) < 2000000
#    ORDER BY FEE DESC, rental_car.CAR_TYPE ASC, rental_car.CAR_ID DESC;
   
   
   
   
   
   
   
   
   
   
   
   
   