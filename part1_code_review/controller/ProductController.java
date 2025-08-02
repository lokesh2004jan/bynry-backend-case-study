package com.example.bynry.controller;


import com.example.bynry.DTO.ProductRequest;
import com.example.bynry.Repository.InventoryRepository;
import com.example.bynry.Repository.ProductRepository;
import com.example.bynry.model.Inventory;
import com.example.bynry.model.Product;
import jakarta.transaction.Transactional;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.Map;

@RestController
@RequestMapping("/api/products")
@RequiredArgsConstructor
public class ProductController {

    private final ProductRepository productRepo;
    private final InventoryRepository inventoryRepo;

    @PostMapping
    @Transactional
    public ResponseEntity<?> createProduct(@Valid @RequestBody ProductRequest req) {

        if (productRepo.existsBySku(req.getSku())) {
            return ResponseEntity.badRequest().body("SKU already exists.");
        }


        Product product = new Product();
        product.setName(req.getName());
        product.setSku(req.getSku());
        product.setPrice(req.getPrice());

        product = productRepo.save(product);


        Inventory inventory = new Inventory();
        inventory.setProduct(product);
        inventory.setWarehouseId(req.getWarehouseId());
        inventory.setQuantity(req.getInitialQuantity());

        inventoryRepo.save(inventory);


        return ResponseEntity.ok(Map.of(
                "message", "Product created successfully",
                "product_id", product.getId()
        ));
    }
}
