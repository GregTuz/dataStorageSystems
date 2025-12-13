-- Заполняем хабы
INSERT INTO memory.dds.H_CUSTOMER
SELECT
    UPPER(TO_HEX(MD5(TO_UTF8(CAST(custkey AS VARCHAR))))) AS hk_customer,
    custkey AS customer_id,
    CURRENT_TIMESTAMP AS load_ts,
    'tpch.tiny.customer' AS source
FROM tpch.tiny.customer;

INSERT INTO memory.dds.H_NATION
SELECT
    UPPER(TO_HEX(MD5(TO_UTF8(CAST(nationkey AS VARCHAR))))) AS hk_nation,
    nationkey AS nation_id,
    CURRENT_TIMESTAMP AS load_ts,
    'tpch.tiny.nation' AS source
FROM tpch.tiny.nation;

INSERT INTO memory.dds.H_REGION
SELECT
    UPPER(TO_HEX(MD5(TO_UTF8(CAST(regionkey AS VARCHAR))))) AS hk_region,
    regionkey AS region_id,
    CURRENT_TIMESTAMP AS load_ts,
    'tpch.tiny.region' AS source
FROM tpch.tiny.region;

INSERT INTO memory.dds.H_PART
SELECT
    UPPER(TO_HEX(MD5(TO_UTF8(CAST(partkey AS VARCHAR))))) AS hk_part,
    partkey AS part_id,
    CURRENT_TIMESTAMP AS load_ts,
    'tpch.tiny.part' AS source
FROM tpch.tiny.part;

INSERT INTO memory.dds.H_SUPPLIER
SELECT
    UPPER(TO_HEX(MD5(TO_UTF8(CAST(suppkey AS VARCHAR))))) AS hk_supplier,
    suppkey AS supplier_id,
    CURRENT_TIMESTAMP AS load_ts,
    'tpch.tiny.supplier' AS source
FROM tpch.tiny.supplier;

INSERT INTO memory.dds.H_ORDER
SELECT
    UPPER(TO_HEX(MD5(TO_UTF8(CAST(orderkey AS VARCHAR))))) AS hk_order,
    orderkey AS order_id,
    CURRENT_TIMESTAMP AS load_ts,
    'tpch.tiny.orders' AS source
FROM tpch.tiny.orders;

-- Хаполняем инки
INSERT INTO memory.dds.L_ORDER_CUSTOMER
SELECT
    UPPER(TO_HEX(MD5(TO_UTF8(CONCAT(
        CAST(o.orderkey AS VARCHAR), '|', CAST(o.custkey AS VARCHAR)
    ))))) AS hk_order_customer,
    UPPER(TO_HEX(MD5(TO_UTF8(CAST(o.orderkey AS VARCHAR))))) AS hk_order,
    UPPER(TO_HEX(MD5(TO_UTF8(CAST(o.custkey AS VARCHAR))))) AS hk_customer,
    CURRENT_TIMESTAMP AS load_ts,
    'tpch.tiny.orders' AS source
FROM tpch.tiny.orders o;

INSERT INTO memory.dds.L_PART_SUPPLIER
SELECT
    UPPER(TO_HEX(MD5(TO_UTF8(CONCAT(
        CAST(ps.partkey AS VARCHAR), '|', CAST(ps.suppkey AS VARCHAR)
    ))))) AS hk_part_supplier,
    UPPER(TO_HEX(MD5(TO_UTF8(CAST(ps.partkey AS VARCHAR))))) AS hk_part,
    UPPER(TO_HEX(MD5(TO_UTF8(CAST(ps.suppkey AS VARCHAR))))) AS hk_supplier,
    CURRENT_TIMESTAMP AS load_ts,
    'tpch.tiny.partsupp' AS source
FROM tpch.tiny.partsupp ps;

INSERT INTO memory.dds.L_LINEITEM
SELECT
    UPPER(TO_HEX(MD5(TO_UTF8(CONCAT(
        CAST(l.orderkey AS VARCHAR), '|', CAST(l.partkey AS VARCHAR), '|', CAST(l.suppkey AS VARCHAR)
    ))))) AS hk_lineitem,
    UPPER(TO_HEX(MD5(TO_UTF8(CAST(l.orderkey AS VARCHAR))))) AS hk_order,
    UPPER(TO_HEX(MD5(TO_UTF8(CAST(l.partkey AS VARCHAR))))) AS hk_part,
    UPPER(TO_HEX(MD5(TO_UTF8(CAST(l.suppkey AS VARCHAR))))) AS hk_supplier,
    CURRENT_TIMESTAMP AS load_ts,
    'tpch.tiny.lineitem' AS source
FROM tpch.tiny.lineitem l;

-- Заполняем сателлиты
INSERT INTO memory.dds.S_CUSTOMER_DETAILS
SELECT
    UPPER(TO_HEX(MD5(TO_UTF8(CAST(custkey AS VARCHAR))))) AS hk_customer,
    name AS customer_name,
    address AS customer_address,
    phone AS customer_phone,
    acctbal AS customer_acctbal,
    mktsegment AS customer_mktsegment,
    comment AS customer_comment,
    CURRENT_TIMESTAMP AS effective_from,
    TIMESTAMP '9999-12-31 23:59:59.999999' AS effective_to,
    CURRENT_TIMESTAMP AS load_ts,
    'tpch.tiny.customer' AS source
FROM tpch.tiny.customer;

INSERT INTO memory.dds.S_NATION_DETAILS
SELECT
    UPPER(TO_HEX(MD5(TO_UTF8(CAST(nationkey AS VARCHAR))))) AS hk_nation,
    name AS nation_name,
    comment AS nation_comment,
    CURRENT_TIMESTAMP AS effective_from,
    TIMESTAMP '9999-12-31 23:59:59.999999' AS effective_to,
    CURRENT_TIMESTAMP AS load_ts,
    'tpch.tiny.nation' AS source
FROM tpch.tiny.nation;

INSERT INTO memory.dds.S_REGION_DETAILS
SELECT
    UPPER(TO_HEX(MD5(TO_UTF8(CAST(regionkey AS VARCHAR))))) AS hk_region,
    name AS region_name,
    comment AS region_comment,
    CURRENT_TIMESTAMP AS effective_from,
    TIMESTAMP '9999-12-31 23:59:59.999999' AS effective_to,
    CURRENT_TIMESTAMP AS load_ts,
    'tpch.tiny.region' AS source
FROM tpch.tiny.region;

INSERT INTO memory.dds.S_PART_DETAILS
SELECT
    UPPER(TO_HEX(MD5(TO_UTF8(CAST(partkey AS VARCHAR))))) AS hk_part,
    name AS part_name,
    mfgr AS part_mfgr,
    brand AS part_brand,
    type AS part_type,
    size AS part_size,
    container AS part_container,
    retailprice AS part_retailprice,
    comment AS part_comment,
    CURRENT_TIMESTAMP AS effective_from,
    TIMESTAMP '9999-12-31 23:59:59.999999' AS effective_to,
    CURRENT_TIMESTAMP AS load_ts,
    'tpch.tiny.part' AS source
FROM tpch.tiny.part;

INSERT INTO memory.dds.S_SUPPLIER_DETAILS
SELECT
    UPPER(TO_HEX(MD5(TO_UTF8(CAST(suppkey AS VARCHAR))))) AS hk_supplier,
    name AS supplier_name,
    address AS supplier_address,
    phone AS supplier_phone,
    acctbal AS supplier_acctbal,
    comment AS supplier_comment,
    CURRENT_TIMESTAMP AS effective_from,
    TIMESTAMP '9999-12-31 23:59:59.999999' AS effective_to,
    CURRENT_TIMESTAMP AS load_ts,
    'tpch.tiny.supplier' AS source
FROM tpch.tiny.supplier;

INSERT INTO memory.dds.S_ORDER_DETAILS
SELECT
    UPPER(TO_HEX(MD5(TO_UTF8(CAST(orderkey AS VARCHAR))))) AS hk_order,
    orderstatus AS order_status,
    totalprice AS order_totalprice,
    orderdate AS order_date,
    orderpriority AS order_priority,
    clerk AS order_clerk,
    shippriority AS order_shippriority,
    comment AS order_comment,
    CAST(orderdate AS TIMESTAMP) AS effective_from,
    TIMESTAMP '9999-12-31 23:59:59.999999' AS effective_to,
    CURRENT_TIMESTAMP AS load_ts,
    'tpch.tiny.orders' AS source
FROM tpch.tiny.orders;

INSERT INTO memory.dds.S_LINEITEM_DETAILS
SELECT
    UPPER(TO_HEX(MD5(TO_UTF8(CONCAT(
        CAST(orderkey AS VARCHAR), '|', CAST(partkey AS VARCHAR), '|', CAST(suppkey AS VARCHAR)
    ))))) AS hk_lineitem,
    quantity AS lineitem_quantity,
    extendedprice AS lineitem_extendedprice,
    discount AS lineitem_discount,
    tax AS lineitem_tax,
    returnflag AS lineitem_returnflag,
    linestatus AS lineitem_linestatus,
    shipdate AS lineitem_shipdate,
    commitdate AS lineitem_commitdate,
    receiptdate AS lineitem_receiptdate,
    shipinstruct AS lineitem_shipinstruct,
    shipmode AS lineitem_shipmode,
    comment AS lineitem_comment,
    CAST(shipdate AS TIMESTAMP) AS effective_from,
    TIMESTAMP '9999-12-31 23:59:59.999999' AS effective_to,
    CURRENT_TIMESTAMP AS load_ts,
    'tpch.tiny.lineitem' AS source
FROM tpch.tiny.lineitem;
