Выбор сущностей для Data Vault:

**Хабы**:
- `H_CUSTOMER` — по `custkey`  
- `H_NATION` — по `nationkey`  
- `H_REGION` — по `regionkey`  
- `H_PART` — по `partkey`  
- `H_SUPPLIER` — по `suppkey`  
- `H_ORDER` — по `orderkey`  

**Линки**:  
- `L_ORDER_CUSTOMER` — связь заказа и клиента (`orderkey`, `custkey`)  
- `L_PART_SUPPLIER` — связь товара и поставщика (`partkey`, `suppkey`)  
- `L_LINEITEM` — связь заказа, товара и поставщика (`orderkey`, `partkey`, `suppkey`)  

**Сателлиты**:  
- `S_CUSTOMER_DETAILS`  
- `S_NATION_DETAILS`  
- `S_REGION_DETAILS`  
- `S_PART_DETAILS`  
- `S_SUPPLIER_DETAILS`  
- `S_ORDER_DETAILS`  
- `S_LINEITEM_DETAILS`
