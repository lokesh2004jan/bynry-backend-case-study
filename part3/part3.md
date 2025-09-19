# ⚡ Part 3: API Implementation – Low Stock Alerts

## 📌 Problem Overview
We need to implement an endpoint that **returns low-stock alerts** for products in a company.  
Business rules identified:
- Low stock threshold varies by product type
- Only alert for products with **recent sales activity**
- Must handle multiple warehouses per company
- Include supplier information for reordering

---

## 🌐 Endpoint Specification
**`GET /api/companies/{company_id}/alerts/low-stock`**

### ✅ Expected Response
```json
{
  "alerts": [
    {
      "product_id": 123,
      "product_name": "Widget A",
      "sku": "WID-001",
      "warehouse_id": 456,
      "warehouse_name": "Main Warehouse",
      "current_stock": 5,
      "threshold": 20,
      "days_until_stockout": 12,
      "supplier": {
        "id": 789,
        "name": "Supplier Corp",
        "contact_email": "orders@supplier.com"
      }
    }
  ],
  "total_alerts": 1
}
