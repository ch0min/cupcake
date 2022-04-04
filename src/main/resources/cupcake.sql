-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS = @@UNIQUE_CHECKS, UNIQUE_CHECKS = 0;
SET @OLD_FOREIGN_KEY_CHECKS = @@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS = 0;
SET @OLD_SQL_MODE = @@SQL_MODE, SQL_MODE =
        'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema cupcake
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema cupcake
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `cupcake` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;
-- -----------------------------------------------------
-- Schema cupcake
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema cupcake
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `cupcake` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;
-- -----------------------------------------------------
-- Schema new_schema1
-- -----------------------------------------------------
USE `cupcake`;
USE `cupcake`;

-- -----------------------------------------------------
-- Table `cupcake`.`user`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cupcake`.`user`
(
    `username` VARCHAR(45) NOT NULL,
    `password` VARCHAR(45) NOT NULL,
    `role`     VARCHAR(45) NOT NULL,
    PRIMARY KEY (`username`)
)
    ENGINE = InnoDB
    DEFAULT CHARACTER SET = utf8mb4
    COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `cupcake`.`top`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cupcake`.`top`
(
    `top_id`   INT         NOT NULL AUTO_INCREMENT,
    `top_name` VARCHAR(45) NOT NULL,
    `price`    INT         NOT NULL,
    PRIMARY KEY (`top_id`)
)
    ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cupcake`.`bottom`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cupcake`.`bottom`
(
    `bottom_id`   INT         NOT NULL AUTO_INCREMENT,
    `bottom_name` VARCHAR(45) NOT NULL,
    `price`       INT         NOT NULL,
    PRIMARY KEY (`bottom_id`)
)
    ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cupcake`.`cupcake`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cupcake`.`cupcake`
(
    `bottom_id`  INT NOT NULL,
    `top_id`     INT NOT NULL,
    `cupcake_id` INT NOT NULL,
    `amount`     INT NOT NULL,
    INDEX `fk_bottom_has_top_top1_idx` (`top_id` ASC) VISIBLE,
    INDEX `fk_bottom_has_top_bottom_idx` (`bottom_id` ASC) VISIBLE,
    PRIMARY KEY (`cupcake_id`),
    CONSTRAINT `fk_bottom_has_top_bottom`
        FOREIGN KEY (`bottom_id`)
            REFERENCES `cupcake`.`bottom` (`bottom_id`)
            ON DELETE NO ACTION
            ON UPDATE NO ACTION,
    CONSTRAINT `fk_bottom_has_top_top1`
        FOREIGN KEY (`top_id`)
            REFERENCES `cupcake`.`top` (`top_id`)
            ON DELETE NO ACTION
            ON UPDATE NO ACTION
)
    ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cupcake`.`order`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cupcake`.`order`
(
    `order_id`   INT         NOT NULL AUTO_INCREMENT,
    `username`   VARCHAR(45) NULL,
    `cupcake_id` INT         NOT NULL,
    `totalprice` INT         NOT NULL,
    PRIMARY KEY (`order_id`),
    INDEX `fk_ordre_user1_idx` (`username` ASC) VISIBLE,
    INDEX `fk_order_cupcake1_idx` (`cupcake_id` ASC) VISIBLE,
    CONSTRAINT `fk_ordre_user1`
        FOREIGN KEY (`username`)
            REFERENCES `cupcake`.`user` (`username`)
            ON DELETE NO ACTION
            ON UPDATE NO ACTION,
    CONSTRAINT `fk_order_cupcake1`
        FOREIGN KEY (`cupcake_id`)
            REFERENCES `cupcake`.`cupcake` (`cupcake_id`)
            ON DELETE NO ACTION
            ON UPDATE NO ACTION
)
    ENGINE = InnoDB;


SET SQL_MODE = @OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS = @OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS = @OLD_UNIQUE_CHECKS;
