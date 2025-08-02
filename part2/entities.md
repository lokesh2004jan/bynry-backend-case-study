#  JPA Entity Design

## Company
- id (PK)
- name

## Warehouse
- id (PK)
- name
- company_id (FK → Company)

## Product
- id (PK)
- name
- sku (unique)
- price (decimal)
- is_bundle (boolean)

## Inventory
- id (PK)
- product_id (FK → Product)
- warehouse_id (FK → Warehouse)
- quantity (int)
- updated_at (timestamp)

## InventoryLog
- id (PK)
- product_id (FK)
- warehouse_id (FK)
- quantity_change (int)
- reason (string)
- timestamp (auto)

## Supplier
- id (PK)
- name
- contact_email

## ProductSupplier
- product_id (FK → Product)
- supplier_id (FK → Supplier)

## BundleProducts
- bundle_id (FK → Product)
- product_id (FK → Product)
- quantity (int)
