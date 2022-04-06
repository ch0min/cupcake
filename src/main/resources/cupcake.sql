-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS = @@UNIQUE_CHECKS, UNIQUE_CHECKS = 0;
SET @OLD_FOREIGN_KEY_CHECKS = @@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS = 0;
SET @OLD_SQL_MODE = @@SQL_MODE, SQL_MODE =
        'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema new_schema1
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema cupcake
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `cupcake`;

-- -----------------------------------------------------
-- Schema cupcake
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `cupcake` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;
-- -----------------------------------------------------
-- Schema cupcake_test
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `cupcake_test`;

-- -----------------------------------------------------
-- Schema cupcake_test
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `cupcake_test` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;
-- -----------------------------------------------------
-- Schema cupcake
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `cupcake`;

-- -----------------------------------------------------
-- Schema cupcake
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `cupcake` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;
USE `cupcake`;

-- -----------------------------------------------------
-- Table `cupcake`.`bottom`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `cupcake`.`bottom`;

CREATE TABLE IF NOT EXISTS `cupcake`.`bottom`
(
    `bottom_name` VARCHAR(45) NOT NULL,
    `price`       INT         NOT NULL,
    PRIMARY KEY (`bottom_name`)
)
    ENGINE = InnoDB
    DEFAULT CHARACTER SET = utf8mb4
    COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `cupcake`.`user`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `cupcake`.`user`;

CREATE TABLE IF NOT EXISTS `cupcake`.`user`
(
    `username` VARCHAR(45) NOT NULL,
    `password` VARCHAR(45) NOT NULL,
    `role`     VARCHAR(45) NOT NULL,
    `balance`  INT         NOT NULL,
    PRIMARY KEY (`username`)
)
    ENGINE = InnoDB
    DEFAULT CHARACTER SET = utf8mb4
    COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `cupcake`.`order`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `cupcake`.`order`;

CREATE TABLE IF NOT EXISTS `cupcake`.`order`
(
    `order_id`   INT         NOT NULL AUTO_INCREMENT,
    `username`   VARCHAR(45) NULL DEFAULT NULL,
    `totalprice` INT         NOT NULL,
    PRIMARY KEY (`order_id`),
    INDEX `fk_ordre_user1_idx` (`username` ASC) VISIBLE,
    CONSTRAINT `fk_ordre_user1`
        FOREIGN KEY (`username`)
            REFERENCES `cupcake`.`user` (`username`)
)
    ENGINE = InnoDB
    DEFAULT CHARACTER SET = utf8mb4
    COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `cupcake`.`top`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `cupcake`.`top`;

CREATE TABLE IF NOT EXISTS `cupcake`.`top`
(
    `top_name` VARCHAR(45) NOT NULL,
    `price`    INT         NOT NULL,
    PRIMARY KEY (`top_name`)
)
    ENGINE = InnoDB
    DEFAULT CHARACTER SET = utf8mb4
    COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `cupcake`.`order_line`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `cupcake`.`order_line`;

CREATE TABLE IF NOT EXISTS `cupcake`.`order_line`
(
    `cupcake_id`  INT         NOT NULL,
    `bottom_name` VARCHAR(45) NOT NULL,
    `top_name`    VARCHAR(45) NOT NULL,
    `quantity`    INT         NOT NULL,
    `order_id`    INT         NOT NULL,
    `totalprice`  INT         NOT NULL,
    PRIMARY KEY (`cupcake_id`),
    INDEX `fk_bottom_has_top_top1_idx` (`top_name` ASC) VISIBLE,
    INDEX `fk_bottom_has_top_bottom_idx` (`bottom_name` ASC) VISIBLE,
    INDEX `fk_order_line_order1_idx` (`order_id` ASC) VISIBLE,
    CONSTRAINT `fk_bottom_has_top_bottom`
        FOREIGN KEY (`bottom_name`)
            REFERENCES `cupcake`.`bottom` (`bottom_name`),
    CONSTRAINT `fk_bottom_has_top_top1`
        FOREIGN KEY (`top_name`)
            REFERENCES `cupcake`.`top` (`top_name`),
    CONSTRAINT `fk_order_line_order1`
        FOREIGN KEY (`order_id`)
            REFERENCES `cupcake`.`order` (`order_id`)
)
    ENGINE = InnoDB
    DEFAULT CHARACTER SET = utf8mb4
    COLLATE = utf8mb4_0900_ai_ci;

USE `cupcake_test`;

-- -----------------------------------------------------
-- Table `cupcake_test`.`user`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `cupcake_test`.`user`;

CREATE TABLE IF NOT EXISTS `cupcake_test`.`user`
(
    `username` VARCHAR(45) NOT NULL,
    `password` VARCHAR(45) NOT NULL,
    `role`     VARCHAR(45) NOT NULL,
    `balance`  INT         NOT NULL,
    PRIMARY KEY (`username`)
)
    ENGINE = InnoDB
    DEFAULT CHARACTER SET = utf8mb4
    COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `cupcake_test`.`order`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `cupcake_test`.`order`;

CREATE TABLE IF NOT EXISTS `cupcake_test`.`order`
(
    `order_id`   INT         NOT NULL AUTO_INCREMENT,
    `username`   VARCHAR(45) NULL DEFAULT NULL,
    `totalprice` INT         NOT NULL,
    PRIMARY KEY (`order_id`),
    INDEX `fk_ordre_user1_idx` (`username` ASC) VISIBLE,
    CONSTRAINT `fk_ordre_user1`
        FOREIGN KEY (`username`)
            REFERENCES `cupcake_test`.`user` (`username`)
)
    ENGINE = InnoDB
    DEFAULT CHARACTER SET = utf8mb4
    COLLATE = utf8mb4_0900_ai_ci;

USE `cupcake`;

SET SQL_MODE = @OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS = @OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS = @OLD_UNIQUE_CHECKS;