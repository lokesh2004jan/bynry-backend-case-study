package com.example.bynry.DTO;

import jakarta.validation.constraints.NotBlank;
import lombok.*;
import org.antlr.v4.runtime.misc.NotNull;

import java.math.BigDecimal;
@Data
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class ProductRequest {

        @NotBlank
        private String name;

        @NotBlank
        private String sku;

        @NotNull
        private BigDecimal price;

        @NotNull
        private Long warehouseId;

        @NotNull
        private Integer initialQuantity;




}
