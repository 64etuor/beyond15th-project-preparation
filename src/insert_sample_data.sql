--
-- 임시로 FK 체크 해제
--
SET FOREIGN_KEY_CHECKS = 0;

--
-- 1. authority
-- user가 참조하는 권한 ID는 1,2,3 뿐이므로 기존대로 유지
--
INSERT INTO `authority` (authority_id, authority_name)
VALUES
  (1, 'User'),
  (2, 'Seller'),
  (3, 'Admin');

--
-- 2. category
--
INSERT INTO `category` (category_name, created_at, modified_at)
VALUES
  ('패션의류',         NOW(), NOW()),
  ('뷰티/화장품',      NOW(), NOW()),
  ('디지털/가전',      NOW(), NOW()),
  ('식품',            NOW(), NOW()),
  ('생활/건강',        NOW(), NOW()),
  ('스포츠/레저',      NOW(), NOW()),
  ('자동차/공구',      NOW(), NOW()),
  ('도서/음반/DVD',    NOW(), NOW()),
  ('완구/취미',        NOW(), NOW()),
  ('가구/인테리어',    NOW(), NOW());

--
-- 3. user
-- 가장 큰 문제였던 authority_id를 [1,2,3] 범위로 수정
-- 기존 데이터와 순서는 동일하게 두되, authority_id만 조정
--
INSERT INTO `user` (
  user_id, 
  authority_id, 
  password, 
  contact_number, 
  email, 
  age, 
  gender,
  profile_image_url, 
  is_alarm_enabled, 
  is_consent_provided, 
  account_status,
  reported_count, 
  created_at, 
  modified_at, 
  deleted_at, 
  remaining_point
)
VALUES
  -- 1~3번 사용자: 기존대로 authority_id=1,2,3
  ('user01', 1,  'pw01', '01000000001', 'user01@example.com', 25, 'M',
   'http://example.com/profile/user01.jpg', 1, 1, '휴면',  0, NOW(), NOW(), NULL, 100.00),
  ('user02', 2,  'pw02', '01000000002', 'user02@example.com', 30, 'F',
   'http://example.com/profile/user02.jpg', 1, 1, '정지',  1, NOW(), NOW(), NULL, 500.00),
  ('user03', 3,  'pw03', '01000000003', 'user03@example.com', 29, 'M',
   'http://example.com/profile/user03.jpg', 0, 1, '탈퇴',  2, NOW(), NOW(), NULL, 0.00),

  -- 4번~10번 사용자: 기존에 4~10이었던 authority_id를 1,2,3 중 하나로 재배치
  ('user04', 1,  'pw04', '01000000004', 'user04@example.com', 40, 'F',
   'http://example.com/profile/user04.jpg', 1, 0, '휴면',  0, NOW(), NOW(), NULL, 250.00),
  ('user05', 2,  'pw05', '01000000005', 'user05@example.com', 18, 'M',
   'http://example.com/profile/user05.jpg', 0, 0, '정지',  3, NOW(), NOW(), NULL, 300.00),
  ('user06', 3,  'pw06', '01000000006', 'user06@example.com', 35, 'F',
   'http://example.com/profile/user06.jpg', 1, 1, '휴면',  0, NOW(), NOW(), NULL, 45.00),
  ('user07', 1,  'pw07', '01000000007', 'user07@example.com', 22, 'F',
   'http://example.com/profile/user07.jpg', 1, 1, '정지',  0, NOW(), NOW(), NULL, 0.00),
  ('user08', 2,  'pw08', '01000000008', 'user08@example.com', 28, 'M',
   'http://example.com/profile/user08.jpg', 0, 1, '탈퇴',  4, NOW(), NOW(), NULL, 1000.00),
  ('user09', 3,  'pw09', '01000000009', 'user09@example.com', 45, 'M',
   'http://example.com/profile/user09.jpg', 1, 1, '정지',  0, NOW(), NOW(), NULL, 120.00),
  ('user10', 1,  'pw10', '01000000010', 'user10@example.com', 38, 'F',
   'http://example.com/profile/user10.jpg', 0, 0, '휴면',  2, NOW(), NOW(), NULL, 999.99);

--
-- 4. store
--
INSERT INTO `store` (
  user_id, 
  category_id, 
  business_registration_number, 
  business_operation_certificate_url,
  store_name, 
  contact_number, 
  address, 
  address_detail, 
  business_hours, 
  average_rating,
  created_at, 
  modified_at, 
  deleted_at
)
VALUES
  ('user01', 1, 'BRN-0001', 'http://example.com/opert/store1.jpg',
   '가게1',  '02-1111-0001', '서울시 강남구', '101호', '10:00 ~ 22:00', 4.5, NOW(), NOW(), NULL),
  ('user02', 2, 'BRN-0002', 'http://example.com/opert/store2.jpg',
   '가게2',  '02-1111-0002', '서울시 강동구', '102호', '09:00 ~ 21:00', 3.8, NOW(), NOW(), NULL),
  ('user03', 3, 'BRN-0003', 'http://example.com/opert/store3.jpg',
   '가게3',  '02-1111-0003', '서울시 강북구', '103호', '08:00 ~ 20:00', 4.0, NOW(), NOW(), NULL),
  ('user04', 4, 'BRN-0004', 'http://example.com/opert/store4.jpg',
   '가게4',  '02-1111-0004', '서울시 강서구', '104호', '09:30 ~ 23:00', 3.2, NOW(), NOW(), NULL),
  ('user05', 5, 'BRN-0005', 'http://example.com/opert/store5.jpg',
   '가게5',  '02-1111-0005', '서울시 서초구', '105호', '11:00 ~ 21:00', 5.0, NOW(), NOW(), NULL),
  ('user06', 6, 'BRN-0006', 'http://example.com/opert/store6.jpg',
   '가게6',  '02-1111-0006', '서울시 성동구', '106호', '10:00 ~ 20:00', 4.3, NOW(), NOW(), NULL),
  ('user07', 7, 'BRN-0007', 'http://example.com/opert/store7.jpg',
   '가게7',  '02-1111-0007', '서울시 용산구', '107호', '00:00 ~ 24:00', 2.9, NOW(), NOW(), NULL),
  ('user08', 8, 'BRN-0008', 'http://example.com/opert/store8.jpg',
   '가게8',  '02-1111-0008', '서울시 광진구', '108호', '10:00 ~ 22:00', 4.9, NOW(), NOW(), NULL),
  ('user09', 9, 'BRN-0009', 'http://example.com/opert/store9.jpg',
   '가게9',  '02-1111-0009', '서울시 강남구', '109호', '07:00 ~ 18:00', 3.0, NOW(), NOW(), NULL),
  ('user10',10,'BRN-0010', 'http://example.com/opert/store10.jpg',
   '가게10','02-1111-0010','서울시 종로구', '110호', '10:00 ~ 23:00', 4.1, NOW(), NOW(), NULL);

--
-- 5. notification_type
--
INSERT INTO `notification_type` (notification_message)
VALUES
  ('알림 메시지 예시 1'),
  ('알림 메시지 예시 2'),
  ('알림 메시지 예시 3'),
  ('알림 메시지 예시 4'),
  ('알림 메시지 예시 5'),
  ('알림 메시지 예시 6'),
  ('알림 메시지 예시 7'),
  ('알림 메시지 예시 8'),
  ('알림 메시지 예시 9'),
  ('알림 메시지 예시 10');

--
-- 6. report_type
--
INSERT INTO `report_type` (name, created_at, modified_at)
VALUES
  ('욕설/비방',   NOW(), NOW()),
  ('허위사실',    NOW(), NOW()),
  ('개인정보노출', NOW(), NOW()),
  ('음란물',     NOW(), NOW()),
  ('도배',       NOW(), NOW()),
  ('광고/홍보',   NOW(), NOW()),
  ('불법정보',    NOW(), NOW()),
  ('저작권침해',  NOW(), NOW()),
  ('기타1',      NOW(), NOW()),
  ('기타2',      NOW(), NOW());

--
-- 7. card_company
--
INSERT INTO `card_company` (card_company_name, created_at, modified_at)
VALUES
  ('신한카드',     NOW(), NOW()),
  ('KB국민카드',   NOW(), NOW()),
  ('삼성카드',     NOW(), NOW()),
  ('롯데카드',     NOW(), NOW()),
  ('우리카드',     NOW(), NOW()),
  ('하나카드',     NOW(), NOW()),
  ('NH농협카드',   NOW(), NOW()),
  ('BC카드',       NOW(), NOW());

--
-- 8. receipt
--
INSERT INTO `receipt` (
  user_id, 
  store_id, 
  card_company_id, 
  receipt_body, 
  amount, 
  payment_method,
  transaction_status, 
  is_canceled, 
  created_at, 
  deleted_at
)
VALUES
  ('user01', 1,  1, '{ "items": ["itemA", "itemB"] }', 10000, '신용', '승인', 'N', NOW(), NULL),
  ('user02', 2,  2, '{ "items": ["itemC"] }',         12000, '체크', '승인', 'N', NOW(), NULL),
  ('user03', 3,  3, '{ "items": ["itemD", "itemE"] }',15000, '현금', '취소', 'Y', NOW(), NULL),
  ('user04', 4,  4, '{ "items": ["itemF"] }',         8000,  '신용', '승인', 'N', NOW(), NULL),
  ('user05', 5,  5, '{ "items": ["itemG"] }',         5000,  '체크', '승인', 'N', NOW(), NULL),
  ('user06', 6,  6, '{ "items": ["itemH", "itemI"] }',7000,  '현금', '승인', 'N', NOW(), NULL),
  ('user07', 7,  7, '{ "items": ["itemJ"] }',         20000, '신용', '승인', 'N', NOW(), NULL),
  ('user08', 8,  8, '{ "items": ["itemK"] }',         9000,  '체크', '취소', 'Y', NOW(), NULL),
  ('user09', 9,  5, '{ "items": ["itemL", "itemM"] }',15000, '현금', '승인', 'N', NOW(), NULL),
  ('user10',10, 4, '{ "items": ["itemN"] }',         3000,  '신용', '승인', 'N', NOW(), NULL);

--  2025-02-12 트랜잭션 관련 테이블 삭제
-- --
-- 9. transaction_status_code
-- --
-- INSERT INTO `transaction_status_code` (transaction_status_code, code_description)
-- VALUES
--   (1,  'Communication Error'),
--   (2,  'Invalid Request Format'),
--   (3,  'Timeout Occurred'),
--   (4,  'Service Unavailable'),
--   (5,  'Card Data Mismatch'),
--   (6,  'System Error'),
--   (7,  'Duplicate Transaction Detected'),
--   (8,  'Data Integrity Violation'),
--   (9,  'Unexpected Server Response'),
--   (10, 'Processing Error');

-- --
-- 10. point_product
--
INSERT INTO `point_product` (product_name, price, quantity, created_at, modified_at)
VALUES
  ('포인트상품A', 1000,  50, NOW(), NOW()),
  ('포인트상품B', 2000,  30, NOW(), NOW()),
  ('포인트상품C', 500,   10, NOW(), NOW()),
  ('포인트상품D', 10000, 5,  NOW(), NOW()),
  ('포인트상품E', 3000,  20, NOW(), NOW()),
  ('포인트상품F', 2500,  15, NOW(), NOW()),
  ('포인트상품G', 1500,  50, NOW(), NOW()),
  ('포인트상품H', 4000,  10, NOW(), NOW()),
  ('포인트상품I', 9999,  1,  NOW(), NOW()),
  ('포인트상품J', 5000,  2,  NOW(), NOW());

--
-- 11. review
--
INSERT INTO `review` (
  user_id, 
  store_id, 
  content, 
  rating, 
  created_at, 
  modified_at, 
  deleted_at
)
VALUES
  ('user01', 1,  '좋았습니다!',     5, NOW(), NOW(), NULL),
  ('user02', 2,  '가격이 저렴해요', 4, NOW(), NOW(), NULL),
  ('user03', 3,  '서비스 별로...',  2, NOW(), NOW(), NULL),
  ('user04', 4,  '재방문 의사 있음',4, NOW(), NOW(), NULL),
  ('user05', 5,  '평범합니다',     3, NOW(), NOW(), NULL),
  ('user06', 6,  '사장님이 친절해요',5, NOW(), NOW(), NULL),
  ('user07', 7,  '24시간이라 편해요',4, NOW(), NOW(), NULL),
  ('user08', 8,  '좀 시끄러움',     2, NOW(), NOW(), NULL),
  ('user09', 9,  '비추천합니다...', 1, NOW(), NOW(), NULL),
  ('user10',10, '진짜 최고!',     5, NOW(), NOW(), NULL);

--
-- 12. comment
--
INSERT INTO `comment` (
  user_id, 
  review_id, 
  content, 
  created_at, 
  modified_at, 
  deleted_at
)
VALUES
  ('user01', 1,  '동감합니다!',         NOW(), NOW(), NULL),
  ('user02', 2,  '저도 싸게 샀어요.',    NOW(), NOW(), NULL),
  ('user03', 3,  '정말 별로였나요?',     NOW(), NOW(), NULL),
  ('user04', 4,  '괜찮아 보이네요~',    NOW(), NOW(), NULL),
  ('user05', 5,  'ㅇㅇ 평범함',         NOW(), NOW(), NULL),
  ('user06', 6,  '저도 친절함에 공감!',  NOW(), NOW(), NULL),
  ('user07', 7,  '한밤에도 편하죠 ㅎㅎ',  NOW(), NOW(), NULL),
  ('user08', 8,  '맞아요 좀 시끄럽...',  NOW(), NOW(), NULL),
  ('user09', 9,  '헉... 왜 비추천?',     NOW(), NOW(), NULL),
  ('user10',10, '완전 동의합니다!',      NOW(), NOW(), NULL);

--
-- 13. `like`
--
INSERT INTO `like` (
  review_id, 
  user_id, 
  created_at
)
VALUES
  (1, 'user01', NOW()),
  (2, 'user02', NOW()),
  (3, 'user03', NOW()),
  (4, 'user04', NOW()),
  (5, 'user05', NOW()),
  (6, 'user06', NOW()),
  (7, 'user07', NOW()),
  (8, 'user08', NOW()),
  (9, 'user09', NOW()),
  (10,'user10', NOW());

--
-- 14. review_image
--
INSERT INTO `review_image` (
  review_id, 
  review_image_url
)
VALUES
  (1, 'http://example.com/review/rev1_img1.jpg'),
  (2, 'http://example.com/review/rev2_img1.jpg'),
  (3, 'http://example.com/review/rev3_img1.jpg'),
  (4, 'http://example.com/review/rev4_img1.jpg'),
  (5, 'http://example.com/review/rev5_img1.jpg'),
  (6, 'http://example.com/review/rev6_img1.jpg'),
  (7, 'http://example.com/review/rev7_img1.jpg'),
  (8, 'http://example.com/review/rev8_img1.jpg'),
  (9, 'http://example.com/review/rev9_img1.jpg'),
  (10,'http://example.com/review/rev10_img1.jpg');

--
-- 15. point
--
INSERT INTO `point` (
  user_id, 
  reference_point_id, 
  receipt_id, 
  transaction_type,
  point, 
  created_at, 
  is_canceled
)
VALUES
  ('user01', NULL, 1,  'earn',   100, NOW(), 'N'),
  ('user02', 1,    2,  'earn',   50,  NOW(), 'N'),
  ('user03', NULL, 3,  'redeem', 30,  NOW(), 'N'),
  ('user04', 2,    4,  'earn',   200, NOW(), 'N'),
  ('user05', NULL, 5,  'earn',   10,  NOW(), 'N'),
  ('user06', 4,    6,  'redeem', 20,  NOW(), 'N'),
  ('user07', NULL, 7,  'earn',   70,  NOW(), 'N'),
  ('user08', 6,    8,  'redeem', 100, NOW(), 'N'),
  ('user09', NULL, 9,  'earn',   300, NOW(), 'N'),
  ('user10', 8,    10, 'redeem', 500, NOW(), 'N');

--  2025-02-12 트랜잭션 관련 테이블 삭제
--
-- 16. transaction_error_history
--
-- INSERT INTO `transaction_error_history` (
--   transaction_status_code, 
--   receipt_id, 
--   point_product_id,
--   transaction_type, 
--   created_at
-- )
-- VALUES
--   (1,  1,  1,  'purchase', NOW()),
--   (2,  2,  2,  'purchase', NOW()),
--   (3,  3,  3,  'purchase', NOW()),
--   (4,  4,  4,  'purchase', NOW()),
--   (5,  5,  5,  'purchase', NOW()),
--   (6,  6,  6,  'purchase', NOW()),
--   (7,  7,  7,  'refund',   NOW()),
--   (8,  8,  8,  'refund',   NOW()),
--   (9,  9,  9,  'purchase', NOW()),
--   (10, 10,10, 'purchase', NOW());
-- 
--
-- 17. favorite
--
INSERT INTO `favorite` (
  user_id, 
  store_id, 
  created_at, 
  deleted_at
)
VALUES
  ('user01', 1,  NOW(), NULL),
  ('user02', 2,  NOW(), NULL),
  ('user03', 3,  NOW(), NULL),
  ('user04', 4,  NOW(), NULL),
  ('user05', 5,  NOW(), NULL),
  ('user06', 6,  NOW(), NULL),
  ('user07', 7,  NOW(), NULL),
  ('user08', 8,  NOW(), NULL),
  ('user09', 9,  NOW(), NULL),
  ('user10',10, NOW(), NULL);

--
-- 18. store_image
--
INSERT INTO `store_image` (
  store_id, 
  store_image_url
)
VALUES
  (1,  'http://example.com/store/store1_img1.jpg'),
  (2,  'http://example.com/store/store2_img1.jpg'),
  (3,  'http://example.com/store/store3_img1.jpg'),
  (4,  'http://example.com/store/store4_img1.jpg'),
  (5,  'http://example.com/store/store5_img1.jpg'),
  (6,  'http://example.com/store/store6_img1.jpg'),
  (7,  'http://example.com/store/store7_img1.jpg'),
  (8,  'http://example.com/store/store8_img1.jpg'),
  (9,  'http://example.com/store/store9_img1.jpg'),
  (10, 'http://example.com/store/store10_img1.jpg');

--
-- 19. login_history
--
INSERT INTO `login_history` (
  user_id, 
  login_at, 
  ip_address, 
  device_type
)
VALUES
  ('user01', NOW(), '192.168.0.1',  'Desktop'),
  ('user02', NOW(), '192.168.0.2',  'Mobile'),
  ('user03', NOW(), '192.168.0.3',  'Tablet'),
  ('user04', NOW(), '192.168.0.4',  'Desktop'),
  ('user05', NOW(), '192.168.0.5',  'Mobile'),
  ('user06', NOW(), '192.168.0.6',  'Tablet'),
  ('user07', NOW(), '192.168.0.7',  'Desktop'),
  ('user08', NOW(), '192.168.0.8',  'Mobile'),
  ('user09', NOW(), '192.168.0.9',  'Tablet'),
  ('user10',NOW(), '192.168.0.10', 'Desktop');

--
-- 20. report
--
INSERT INTO `report` (
  report_type_id, 
  user_id, 
  comment_id, 
  review_id, 
  report_comment, 
  created_at
)
VALUES
  (1,  'user01', 1,  1,  '욕설이 있습니다.',       NOW()),
  (2,  'user02', 2,  2,  '허위사실 제보합니다.',   NOW()),
  (3,  'user03', 3,  3,  '개인정보 노출된 듯.',    NOW()),
  (4,  'user04', 4,  4,  '음란한 표현이 많아요.',  NOW()),
  (5,  'user05', 5,  5,  '도배성 게시물 신고',     NOW()),
  (6,  'user06', 6,  6,  '광고글 입니다',          NOW()),
  (7,  'user07', 7,  7,  '불법 정보가 포함됨',      NOW()),
  (8,  'user08', 8,  8,  '저작권 침해 예상됨',      NOW()),
  (9,  'user09', 9,  9,  '기타 사유1',             NOW()),
  (10, 'user10',10, 10, '기타 사유2',             NOW());

--
-- 21. penalty_history
--
INSERT INTO `penalty_history` (
  user_id, 
  admin_id, 
  penalty_reason, 
  start_penalty_at, 
  end_penalty_at
)
VALUES
  ('user01', 'user02', '이용규칙 위반(1)',  NOW(), DATE_ADD(NOW(), INTERVAL 7 DAY)),
  ('user02', 'user03', '이용규칙 위반(2)',  NOW(), DATE_ADD(NOW(), INTERVAL 7 DAY)),
  ('user03', 'user04', '이용규칙 위반(3)',  NOW(), DATE_ADD(NOW(), INTERVAL 7 DAY)),
  ('user04', 'user05', '이용규칙 위반(4)',  NOW(), DATE_ADD(NOW(), INTERVAL 7 DAY)),
  ('user05', 'user06', '이용규칙 위반(5)',  NOW(), DATE_ADD(NOW(), INTERVAL 7 DAY)),
  ('user06', 'user07', '이용규칙 위반(6)',  NOW(), DATE_ADD(NOW(), INTERVAL 7 DAY)),
  ('user07', 'user08', '이용규칙 위반(7)',  NOW(), DATE_ADD(NOW(), INTERVAL 7 DAY)),
  ('user08', 'user09', '이용규칙 위반(8)',  NOW(), DATE_ADD(NOW(), INTERVAL 7 DAY)),
  ('user09', 'user10','이용규칙 위반(9)',  NOW(), DATE_ADD(NOW(), INTERVAL 7 DAY)),
  ('user10','user01', '이용규칙 위반(10)', NOW(), DATE_ADD(NOW(), INTERVAL 7 DAY));

--
-- 22. notification_history
--

INSERT INTO `notification_history`
    (`notification_type_id`, `user_id`, `read_at`, `created_at`)
VALUES
    (1, 'user01', NULL, '2025-02-11 09:00:00'),
    (2, 'user01', '2025-02-11 09:10:00', '2025-02-11 09:05:00'),
    (1, 'user02', NULL, '2025-02-11 09:15:00'),
    (1, 'user03', '2025-02-11 09:20:00', '2025-02-11 09:18:00'),
    (3, 'user01', NULL, '2025-02-11 09:30:00'),
    (2, 'user02', NULL, '2025-02-11 09:35:00'),
    (4, 'user04', '2025-02-11 09:40:00', '2025-02-11 09:39:00'),
    (1, 'user04', NULL, '2025-02-11 09:45:00'),
    (3, 'user02', '2025-02-11 09:50:00', '2025-02-11 09:49:00'),
    (2, 'user05', NULL, '2025-02-11 09:55:00');



--
-- FK 다시 활성화
--
SET FOREIGN_KEY_CHECKS = 1;
