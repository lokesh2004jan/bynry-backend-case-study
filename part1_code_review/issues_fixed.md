#  Code Review - Issues Identified & Fixes (Product Creation API)

##  Problem Overview
The original API was written in Flask and intended to create a new Product along with its inventory. While it compiled, it failed in production due to poor error handling, lack of validation, and business rule violations.

---

##  Issues in Original Code

| Sr No | Issue | Description |
|-------|-------|-------------|
| 1     | ❌ No Input Validation | Assumes all fields like `name`, `sku`, `price`, etc. are present without checks |
| 2     | ❌ No SKU Uniqueness Check | Does not verify if the `sku` already exists, violating business rule |
| 3     | ❌ Not Atomic | Product and Inventory are committed separately; failure in second step causes inconsistent DB state |
| 4     | ❌ No Error Handling | No try-catch blocks; code will throw 500 error if anything fails |
| 5     | ❌ Uses Float-like price | In financial systems, using float is dangerous; price should be handled as a `BigDecimal` |
| 6     | ❌ Hardcoded Single-Warehouse Assumption | Products can exist in multiple warehouses, but only one is assumed |
| 7     | ❌ Poor Response Handling | No status codes used, always returns 200 OK regardless of error |

---

##  Fixes in Spring Boot Version

| Sr No | Fix | Description |
|--|-----|-------------|
| 1 |  Input Validation | Used `@Valid`, `@NotNull`, `@NotBlank` annotations in `ProductRequest` DTO |
| 2 |  SKU Check | Checked with `productRepo.existsBySku()` before saving |
| 3 |  Atomic Transaction | Used `@Transactional` to commit both `Product` and `Inventory` together |
| 4 |  Error Handling | Returns proper `400 Bad Request` for invalid input; fails gracefully |
| 5 |  Safe Price Type | Price is stored as `BigDecimal(10,2)` to ensure precision |
| 6 |  Structured DTO | Used a DTO `ProductRequest` to avoid leaking internal models |
| 7 |  Clear HTTP Responses | Used `ResponseEntity` with meaningful status and messages |

---

##  Spring Boot Files Created

- `Product.java` – Entity for product table
- `Inventory.java` – Entity for inventory table
- `ProductRequest.java` – DTO for request validation
- `ProductController.java` – Controller with `/api/products` POST endpoint
- `ProductRepository.java`, `InventoryRepository.java` – JPA Repositories

---

##  Result

This Spring Boot version is:
- Production-safe
- Business-rule compliant
- Database-consistent
- Cleanly separated using DTOs and JPA





