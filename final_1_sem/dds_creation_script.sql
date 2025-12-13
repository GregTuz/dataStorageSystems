-- Хабы
CREATE TABLE IF NOT EXISTS memory.dds.H_CUSTOMER (
    hk_customer CHAR(32),
    customer_id BIGINT,
    load_ts TIMESTAMP(6),
    source VARCHAR
);

CREATE TABLE IF NOT EXISTS memory.dds.H_NATION (
    hk_nation CHAR(32),
    nation_id BIGINT,
    load_ts TIMESTAMP(6),
    source VARCHAR
);

CREATE TABLE IF NOT EXISTS memory.dds.H_REGION (
    hk_region CHAR(32),
    region_id BIGINT,
    load_ts TIMESTAMP(6),
    source VARCHAR
);

CREATE TABLE IF NOT EXISTS memory.dds.H_PART (
    hk_part CHAR(32),
    part_id BIGINT,
    load_ts TIMESTAMP(6),
    source VARCHAR
);

CREATE TABLE IF NOT EXISTS memory.dds.H_SUPPLIER (
    hk_supplier CHAR(32),
    supplier_id BIGINT,
    load_ts TIMESTAMP(6),
    source VARCHAR
);

CREATE TABLE IF NOT EXISTS memory.dds.H_ORDER (
    hk_order CHAR(32),
    order_id BIGINT,
    load_ts TIMESTAMP(6),
    source VARCHAR
);

-- Линки
CREATE TABLE IF NOT EXISTS memory.dds.L_ORDER_CUSTOMER (
    hk_order_customer CHAR(32),
    hk_order CHAR(32),
    hk_customer CHAR(32),
    load_ts TIMESTAMP(6),
    source VARCHAR
);

CREATE TABLE IF NOT EXISTS memory.dds.L_PART_SUPPLIER (
    hk_part_supplier CHAR(32),
    hk_part CHAR(32),
    hk_supplier CHAR(32),
    load_ts TIMESTAMP(6),
    source VARCHAR
);

CREATE TABLE IF NOT EXISTS memory.dds.L_LINEITEM (
    hk_lineitem CHAR(32),
    hk_order CHAR(32),
    hk_part CHAR(32),
    hk_supplier CHAR(32),
    load_ts TIMESTAMP(6),
    source VARCHAR
);

-- Сателлиты
CREATE TABLE IF NOT EXISTS memory.dds.S_CUSTOMER_DETAILS (
    hk_customer CHAR(32),
    customer_name VARCHAR,
    customer_address VARCHAR,
    customer_phone VARCHAR,
    customer_acctbal DOUBLE,
    customer_mktsegment VARCHAR,
    customer_comment VARCHAR,
    effective_from TIMESTAMP(6),
    effective_to TIMESTAMP(6),
    load_ts TIMESTAMP(6),
    source VARCHAR
);

CREATE TABLE IF NOT EXISTS memory.dds.S_NATION_DETAILS (
    hk_nation CHAR(32),
    nation_name VARCHAR,
    nation_comment VARCHAR,
    effective_from TIMESTAMP(6),
    effective_to TIMESTAMP(6),
    load_ts TIMESTAMP(6),
    source VARCHAR
);

CREATE TABLE IF NOT EXISTS memory.dds.S_REGION_DETAILS (
    hk_region CHAR(32),
    region_name VARCHAR,
    region_comment VARCHAR,
    effective_from TIMESTAMP(6),
    effective_to TIMESTAMP(6),
    load_ts TIMESTAMP(6),
    source VARCHAR
);

CREATE TABLE IF NOT EXISTS memory.dds.S_PART_DETAILS (
    hk_part CHAR(32),
    part_name VARCHAR,
    part_mfgr VARCHAR,
    part_brand VARCHAR,
    part_type VARCHAR,
    part_size INT,
    part_container VARCHAR,
    part_retailprice DOUBLE,
    part_comment VARCHAR,
    effective_from TIMESTAMP(6),
    effective_to TIMESTAMP(6),
    load_ts TIMESTAMP(6),
    source VARCHAR
);

CREATE TABLE IF NOT EXISTS memory.dds.S_SUPPLIER_DETAILS (
    hk_supplier CHAR(32),
    supplier_name VARCHAR,
    supplier_address VARCHAR,
    supplier_phone VARCHAR,
    supplier_acctbal DOUBLE,
    supplier_comment VARCHAR,
    effective_from TIMESTAMP(6),
    effective_to TIMESTAMP(6),
    load_ts TIMESTAMP(6),
    source VARCHAR
);

CREATE TABLE IF NOT EXISTS memory.dds.S_ORDER_DETAILS (
    hk_order CHAR(32),
    order_status CHAR(1),
    order_totalprice DOUBLE,
    order_date DATE,
    order_priority VARCHAR,
    order_clerk VARCHAR,
    order_shippriority INT,
    order_comment VARCHAR,
    effective_from TIMESTAMP(6),
    effective_to TIMESTAMP(6),
    load_ts TIMESTAMP(6),
    source VARCHAR
);

CREATE TABLE IF NOT EXISTS memory.dds.S_LINEITEM_DETAILS (
    hk_lineitem CHAR(32),
    lineitem_quantity DOUBLE,
    lineitem_extendedprice DOUBLE,
    lineitem_discount DOUBLE,
    lineitem_tax DOUBLE,
    lineitem_returnflag CHAR(1),
    lineitem_linestatus CHAR(1),
    lineitem_shipdate DATE,
    lineitem_commitdate DATE,
    lineitem_receiptdate DATE,
    lineitem_shipinstruct VARCHAR,
    lineitem_shipmode VARCHAR,
    lineitem_comment VARCHAR,
    effective_from TIMESTAMP(6),
    effective_to TIMESTAMP(6),
    load_ts TIMESTAMP(6),
    source VARCHAR
);
