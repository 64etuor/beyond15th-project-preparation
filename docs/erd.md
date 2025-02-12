erDiagram

    %% --------------------------------------------------
    %% 1. authority
    %% --------------------------------------------------
    authority {
        INT authority_id PK
        VARCHAR(30) authority_name
    }

    %% --------------------------------------------------
    %% 2. category
    %% --------------------------------------------------
    category {
        BIGINT category_id PK
        VARCHAR(60) category_name
        TIMESTAMP created_at
        TIMESTAMP modified_at
        TIMESTAMP deleted_at
    }

    %% --------------------------------------------------
    %% 3. user
    %% --------------------------------------------------
    user {
        VARCHAR(30) user_id PK
        INT authority_id FK
        VARCHAR(255) password
        VARCHAR(11) contact_number
        VARCHAR(100) email
        INT age
        ENUM('M','F') gender
        VARCHAR(255) profile_image_url
        ENUM('Y','N') is_alarm_enabled
        ENUM('Y','N') is_consent_provided
        ENUM('휴면','탈퇴','정지') account_status
        INT reported_count
        TIMESTAMP created_at
        TIMESTAMP modified_at
        TIMESTAMP deleted_at
        DECIMAL(10,2) remaining_point
    }

    %% --------------------------------------------------
    %% 4. store
    %% --------------------------------------------------
    store {
        BIGINT store_id PK
        VARCHAR(30) user_id FK
        BIGINT category_id FK
        VARCHAR(255) business_registration_number
        VARCHAR(255) business_operation_certificate_url
        VARCHAR(150) store_name
        VARCHAR(15) contact_number
        VARCHAR(100) address
        VARCHAR(90) address_detail
        VARCHAR(255) business_hours
        DECIMAL(2,1) average_rating
        TIMESTAMP created_at
        TIMESTAMP modified_at
        TIMESTAMP deleted_at
    }

    %% --------------------------------------------------
    %% 5. notification_type
    %% --------------------------------------------------
    notification_type {
        BIGINT notification_type_id PK
        VARCHAR(255) notification_message
    }

    %% --------------------------------------------------
    %% 6. report_type
    %% --------------------------------------------------
    report_type {
        BIGINT report_type_id PK
        VARCHAR(100) name
        TIMESTAMP created_at
        TIMESTAMP modified_at
        TIMESTAMP deleted_at
    }

    %% --------------------------------------------------
    %% 7. card_company
    %% --------------------------------------------------
    card_company {
        BIGINT card_company_id PK
        VARCHAR(50) card_company_name
        TIMESTAMP created_at
        TIMESTAMP modified_at
        TIMESTAMP deleted_at
    }

    %% --------------------------------------------------
    %% 8. receipt
    %% --------------------------------------------------
    receipt {
        BIGINT receipt_id PK
        VARCHAR(30) user_id FK
        BIGINT store_id FK
        BIGINT card_company_id FK
        LONGTEXT receipt_body
        INT amount
        ENUM('신용','체크','현금') payment_method
        ENUM('승인','취소') transaction_status
        ENUM('Y','N') is_canceled
        TIMESTAMP created_at
        TIMESTAMP deleted_at
    }

    %% --------------------------------------------------
    %% 10. point_product
    %% --------------------------------------------------
    point_product {
        BIGINT point_product_id PK
        VARCHAR(100) product_name
        INT price
        INT quantity
        TIMESTAMP created_at
        TIMESTAMP modified_at
        TIMESTAMP deleted_at
    }

    %% --------------------------------------------------
    %% 11. review
    %% --------------------------------------------------
    review {
        BIGINT review_id PK
        VARCHAR(30) user_id FK
        BIGINT store_id FK
        TEXT content
        INT rating
        TIMESTAMP created_at
        TIMESTAMP modified_at
        TIMESTAMP deleted_at
    }

    %% --------------------------------------------------
    %% 12. comment
    %% --------------------------------------------------
    comment {
        BIGINT comment_id PK
        VARCHAR(30) user_id FK
        BIGINT review_id FK
        VARCHAR(255) content
        TIMESTAMP created_at
        TIMESTAMP modified_at
        TIMESTAMP deleted_at
    }

    %% --------------------------------------------------
    %% 13. review_like
    %% --------------------------------------------------
    review_like {
        BIGINT like_id PK
        BIGINT review_id FK
        VARCHAR(30) user_id FK
        TIMESTAMP created_at
    }

    %% --------------------------------------------------
    %% 14. review_image
    %% --------------------------------------------------
    review_image {
        BIGINT review_image_id PK
        BIGINT review_id FK
        VARCHAR(255) review_image_url
    }

    %% --------------------------------------------------
    %% 15. point
    %% --------------------------------------------------
    point {
        BIGINT point_id PK
        VARCHAR(30) user_id FK
        BIGINT reference_point_id FK
        BIGINT receipt_id FK
        VARCHAR(10) transaction_type
        INT point
        TIMESTAMP created_at
        ENUM('Y','N') is_canceled
    }

    %% --------------------------------------------------
    %% 16. point_exchange_history
    %% --------------------------------------------------
    point_exchange_history {
        BIGINT point_exchange_id PK
        VARCHAR(30) user_id FK
        BIGINT point_product_id FK
        INT quantity
        TIMESTAMP created_at
    }

    %% --------------------------------------------------
    %% 17. favorite
    %% --------------------------------------------------
    favorite {
        BIGINT favorite_id PK
        VARCHAR(30) user_id FK
        BIGINT store_id FK
        TIMESTAMP created_at
        TIMESTAMP deleted_at
    }

    %% --------------------------------------------------
    %% 18. store_image
    %% --------------------------------------------------
    store_image {
        BIGINT store_image_id PK
        BIGINT store_id FK
        VARCHAR(255) store_image_url
    }

    %% --------------------------------------------------
    %% 19. login_history
    %% --------------------------------------------------
    login_history {
        BIGINT login_history_id PK
        VARCHAR(30) user_id FK
        TIMESTAMP login_at
        VARCHAR(50) ip_address
        VARCHAR(50) device_type
    }

    %% --------------------------------------------------
    %% 20. report
    %% --------------------------------------------------
    report {
        BIGINT report_id PK
        BIGINT report_type_id FK
        VARCHAR(30) user_id FK
        BIGINT comment_id FK
        BIGINT review_id FK
        TEXT report_comment
        TIMESTAMP created_at
    }

    %% --------------------------------------------------
    %% 21. penalty_history
    %% --------------------------------------------------
    penalty_history {
        BIGINT penalty_history_id PK
        VARCHAR(30) user_id FK
        VARCHAR(30) admin_id FK
        VARCHAR(255) penalty_reason
        TIMESTAMP start_penalty_at
        TIMESTAMP end_penalty_at
    }

    %% --------------------------------------------------
    %% 22. notification_history
    %% --------------------------------------------------
    notification_history {
        BIGINT notification_history_id PK
        BIGINT notification_type_id FK
        VARCHAR(30) user_id FK
        TIMESTAMP read_at
        TIMESTAMP created_at
    }

    %% --------------------------------------------------
    %% Relationships
    %% --------------------------------------------------
    user }o--|| authority : "FK_AUTHORITY"
    store }o--|| user : "FK_USER_STORE"
    store }o--|| category : "FK_CATEGORY_STORE"
    receipt }o--|| user : "FK_USER_RECEIPT"
    receipt }o--|| store : "FK_STORE_RECEIPT"
    receipt }o--|| card_company : "FK_CARD_COMPANY"
    review }o--|| user : "FK_USER_REVIEW"
    review }o--|| store : "FK_STORE_REVIEW"
    comment }o--|| user : "FK_USER_COMMENT"
    comment }o--|| review : "FK_REVIEW_COMMENT"
    review_like }o--|| review : "FK_REVIEW_LIKE"
    review_like }o--|| user : "FK_USER_LIKE"
    review_image }o--|| review : "FK_REVIEW_IMAGE"
    point }o--|| user : "FK_USER_POINT"
    point }o--|| receipt : "FK_RECEIPT_POINT"
    %% Self-reference for point
    point }o--|| point : "FK_REFERENCE_POINT"
    point_exchange_history }o--|| user : "FK_USER_EXCHANGE"
    point_exchange_history }o--|| point_product : "FK_POINT_PRODUCT"
    favorite }o--|| user : "FK_USER_FAVORITE"
    favorite }o--|| store : "FK_STORE_FAVORITE"
    store_image }o--|| store : "FK_STORE_IMAGE"
    login_history }o--|| user : "FK_USER_LOGIN"
    report }o--|| report_type : "FK_REPORT_TYPE"
    report }o--|| user : "FK_USER_REPORT"
    report }o--|| comment : "FK_COMMENT_REPORT"
    report }o--|| review : "FK_REVIEW_REPORT"
    penalty_history }o--|| user : "FK_USER (user_id)"
    penalty_history }o--|| user : "FK_ADMIN (admin_id)"
    notification_history }o--|| notification_type : "FK_NOTIFICATION_TYPE"
    notification_history }o--|| user : "FK_USER_NOTIFICATION_HISTORY"
