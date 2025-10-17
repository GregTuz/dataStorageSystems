CREATE TABLE student49.hub_sale (
    h_sale_hk           CHAR(32)        NOT NULL,
    sale_business_key   VARCHAR(255)    NOT NULL,
    h_load_date         TIMESTAMP       NOT NULL DEFAULT CURRENT_TIMESTAMP,
    h_load_source       VARCHAR(50)     NOT NULL,
    CONSTRAINT pk_hub_sale PRIMARY KEY (h_sale_hk)
);

CREATE TABLE student49.hub_customer (
    h_customer_hk          CHAR(32)        NOT NULL,
    customer_business_key  VARCHAR(255)    NOT NULL,
    h_load_date            TIMESTAMP       NOT NULL DEFAULT CURRENT_TIMESTAMP,
    h_load_source          VARCHAR(50)     NOT NULL,
    CONSTRAINT pk_hub_customer PRIMARY KEY (h_customer_hk)
);

CREATE TABLE student49.hub_product (
    h_product_hk          CHAR(32)        NOT NULL,
    product_business_key  VARCHAR(255)    NOT NULL,
    h_load_date           TIMESTAMP       NOT NULL DEFAULT CURRENT_TIMESTAMP,
    h_load_source         VARCHAR(50)     NOT NULL,
    CONSTRAINT pk_hub_product PRIMARY KEY (h_product_hk)
);

CREATE TABLE student49.hub_shipment (
    h_shipment_hk          CHAR(32)        NOT NULL,
    shipment_business_key  VARCHAR(50)     NOT NULL,
    h_load_date            TIMESTAMP       NOT NULL DEFAULT CURRENT_TIMESTAMP,
    h_load_source          VARCHAR(50)     NOT NULL,
    CONSTRAINT pk_hub_shipment PRIMARY KEY (h_shipment_hk)
);

CREATE TABLE student49.lnk_sale_detail (
    l_sale_detail_hk    CHAR(32)        NOT NULL,
    h_sale_hk           CHAR(32)        NOT NULL,
    h_customer_hk       CHAR(32)        NOT NULL,
    h_product_hk        CHAR(32)        NOT NULL,
    h_shipment_hk       CHAR(32)        NOT NULL,
    l_load_date         TIMESTAMP       NOT NULL DEFAULT CURRENT_TIMESTAMP,
    l_load_source       VARCHAR(50)     NOT NULL,
    CONSTRAINT pk_lnk_sale_detail PRIMARY KEY (l_sale_detail_hk),
    CONSTRAINT fk_lnk_sale_detail_sale FOREIGN KEY (h_sale_hk) REFERENCES student49.hub_sale(h_sale_hk),
    CONSTRAINT fk_lnk_sale_detail_customer FOREIGN KEY (h_customer_hk) REFERENCES student49.hub_customer(h_customer_hk),
    CONSTRAINT fk_lnk_sale_detail_product FOREIGN KEY (h_product_hk) REFERENCES student49.hub_product(h_product_hk),
    CONSTRAINT fk_lnk_sale_detail_shipment FOREIGN KEY (h_shipment_hk) REFERENCES student49.hub_shipment(h_shipment_hk)
);

CREATE TABLE student49.sat_customer_demographic (
    h_customer_hk     CHAR(32)      NOT NULL,
    load_date         TIMESTAMP     NOT NULL,
    segment           VARCHAR(20)   NOT NULL,
    hash_diff         CHAR(32),
    load_source       VARCHAR(50)   NOT NULL,
    CONSTRAINT pk_sat_customer_demo PRIMARY KEY (h_customer_hk, load_date),
    CONSTRAINT fk_sat_customer_demo_cust FOREIGN KEY (h_customer_hk) REFERENCES student49.hub_customer(h_customer_hk)
) DISTRIBUTED REPLICATED;

CREATE TABLE student49.sat_customer_location (
    h_customer_hk   CHAR(32)      NOT NULL,
    load_date       TIMESTAMP     NOT NULL,
    country         VARCHAR(50),
    city            VARCHAR(50),
    state           VARCHAR(50),
    region          VARCHAR(20),
    postal_code     VARCHAR(20),
    hash_diff       CHAR(32),
    load_source     VARCHAR(50)   NOT NULL,
    CONSTRAINT pk_sat_customer_loc PRIMARY KEY (h_customer_hk, load_date),
    CONSTRAINT fk_sat_customer_loc_cust FOREIGN KEY (h_customer_hk) REFERENCES student49.hub_customer(h_customer_hk)
) DISTRIBUTED REPLICATED;

CREATE TABLE student49.sat_product_classification (
    h_product_hk     CHAR(32)      NOT NULL,
    load_date        TIMESTAMP     NOT NULL,
    category         VARCHAR(50),
    sub_category     VARCHAR(50),
    hash_diff        CHAR(32),
    load_source      VARCHAR(50)   NOT NULL,
    CONSTRAINT pk_sat_product_class PRIMARY KEY (h_product_hk, load_date),
    CONSTRAINT fk_sat_product_class_prod FOREIGN KEY (h_product_hk) REFERENCES student49.hub_product(h_product_hk)
) DISTRIBUTED REPLICATED;

CREATE TABLE student49.sat_sale_transaction (
    l_sale_detail_hk CHAR(32)      NOT NULL,
    load_date        TIMESTAMP     NOT NULL,
    quantity         INTEGER       NOT NULL,
    sales            NUMERIC(10,4) NOT NULL,
    discount         NUMERIC(3,2)  NOT NULL,
    profit           NUMERIC(10,4) NOT NULL,
    hash_diff        CHAR(32),
    load_source      VARCHAR(50)   NOT NULL,
    CONSTRAINT pk_sat_sale_trans PRIMARY KEY (l_sale_detail_hk, load_date),
    CONSTRAINT fk_sat_sale_trans_link FOREIGN KEY (l_sale_detail_hk) REFERENCES student49.lnk_sale_detail(l_sale_detail_hk)
) DISTRIBUTED REPLICATED;