🗃️ Overview
StockFlow is a B2B inventory management platform designed for enterprises managing:

✅ Multiple warehouses
✅ Product bundles & components
✅ Supplier relationships
✅ Real-time stock tracking with audit logs
Perfect for distributors, wholesalers, and logistics providers.
## 🗂 Tables & Relationships

| Table             | Columns                                                                 | Description                                         |
|------------------|------------------------------------------------------------------------|---------------------------------------------------|
| **Company**       | `id (BIGINT PK)`, `name (VARCHAR)`                                     | Represents companies using StockFlow             |
| **Warehouse**     | `id (BIGINT PK)`, `name (VARCHAR)`, `company_id (BIGINT FK → company.id)` | Warehouses owned by companies                     |
| **Product**       | `id (BIGINT PK)`, `name (VARCHAR)`, `sku (VARCHAR UNIQUE)`, `price (DECIMAL)`, `is_bundle (BOOLEAN)` | Product details; bundles are flagged            |
| **Inventory**     | `id (BIGINT PK)`, `product_id (BIGINT FK → product.id)`, `warehouse_id (BIGINT FK → warehouse.id)`, `quantity (INT)`, `updated_at (TIMESTAMP)` | Tracks product quantity per warehouse            |
| **Inventory Log** | `id (BIGINT PK)`, `product_id (BIGINT FK)`, `warehouse_id (BIGINT FK)`, `quantity_change (INT)`, `reason (VARCHAR)`, `created_at (TIMESTAMP)` | Tracks history of inventory changes              |
| **Supplier**      | `id (BIGINT PK)`, `name (VARCHAR)`, `contact_email (VARCHAR)`         | Supplier information                               |
| **Product-Supplier** | `product_id`, `supplier_id (Composite PK)`                           | Many-to-many relationship between products and suppliers |
| **Bundle Products** | `bundle_id`, `component_id`, `quantity`                               | Self-relation table for product bundles          |


💡 Design Notes

✅ SKU is unique to prevent duplicates

✅ Inventory table tracks products across multiple warehouses

✅ Inventory log provides audit trail for stock changes

✅ Bundles managed via self-relation table (bundle_products)

✅ Many-to-many relationship for products and suppliers

✅ Price uses DECIMAL(10,2) for financial accuracy

❓ Questions / Clarifications

Do bundles have their own price or use the sum of components?

Can a product have multiple suppliers?

Should inventory logs track who made the change (user ID)?

Low stock threshold: per product or per warehouse?

Are soft deletes needed for products, warehouses, suppliers?

Do we need product variants (size, color)?