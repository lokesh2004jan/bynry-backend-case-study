#  Design Notes

- SKU is unique to prevent duplicate products
- A product can be stored in many warehouses → inventory table handles quantity
- Inventory log tracks history of stock changes
- Bundles are handled using a self-relationship table (bundle_products)
- Product can have many suppliers → many-to-many relationship
- Used foreign keys for data integrity
- price uses DECIMAL(10, 2) for money precision
