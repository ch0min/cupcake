-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS = @@UNIQUE_CHECKS, UNIQUE_CHECKS = 0;
SET @OLD_FOREIGN_KEY_CHECKS = @@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS = 0;
SET @OLD_SQL_MODE = @@SQL_MODE, SQL_MODE =
        'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema orderLine
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `orderLine`;

-- -----------------------------------------------------
-- Schema orderLine
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `orderLine` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;
-- -----------------------------------------------------
-- Schema orderLine
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `orderLine`;

-- -----------------------------------------------------
-- Schema orderLine
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `orderLine` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;
-- -----------------------------------------------------
-- Schema new_schema1
-- -----------------------------------------------------
USE `orderLine`;
USE `orderLine`;

-- -----------------------------------------------------
-- Table `orderLine`.`user`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `orderLine`.`user`;

CREATE TABLE IF NOT EXISTS `orderLine`.`user`
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
-- Table `orderLine`.`top`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `orderLine`.`top`;

CREATE TABLE IF NOT EXISTS `orderLine`.`top`
(
    `top_id`   INT         NOT NULL AUTO_INCREMENT,
    `top_name` VARCHAR(45) NOT NULL,
    `price`    INT         NOT NULL,
    PRIMARY KEY (`top_id`)
)
    ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `orderLine`.`bottom`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `orderLine`.`bottom`;

CREATE TABLE IF NOT EXISTS `orderLine`.`bottom`
(
    `bottom_id`   INT         NOT NULL AUTO_INCREMENT,
    `bottom_name` VARCHAR(45) NOT NULL,
    `price`       INT         NOT NULL,
    PRIMARY KEY (`bottom_id`)
)
    ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `orderLine`.`order`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `orderLine`.`order`;

CREATE TABLE IF NOT EXISTS `orderLine`.`order`
(
    `order_id`   INT         NOT NULL AUTO_INCREMENT,
    `username`   VARCHAR(45) NULL,
    `totalprice` INT         NOT NULL,
    PRIMARY KEY (`order_id`),
    INDEX `fk_ordre_user1_idx` (`username` ASC) VISIBLE,
    CONSTRAINT `fk_ordre_user1`
        FOREIGN KEY (`username`)
            REFERENCES `orderLine`.`user` (`username`)
            ON DELETE NO ACTION
            ON UPDATE NO ACTION
)
    ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `orderLine`.`order_line`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `orderLine`.`order_line`;

CREATE TABLE IF NOT EXISTS `orderLine`.`order_line`
(
    `bottom_id`    INT NOT NULL,
    `top_id`       INT NOT NULL,
    `orderline_id` INT NOT NULL,
    `quantity`     INT NOT NULL,
    `totalprice`   INT NOT NULL,
    `order_id`     INT NOT NULL,
    INDEX `fk_bottom_has_top_top1_idx` (`top_id` ASC) VISIBLE,
    INDEX `fk_bottom_has_top_bottom_idx` (`bottom_id` ASC) VISIBLE,
    PRIMARY KEY (`orderline_id`),
    INDEX `fk_order_line_order1_idx` (`order_id` ASC) VISIBLE,
    CONSTRAINT `fk_bottom_has_top_bottom`
        FOREIGN KEY (`bottom_id`)
            REFERENCES `orderLine`.`bottom` (`bottom_id`)
            ON DELETE NO ACTION
            ON UPDATE NO ACTION,
    CONSTRAINT `fk_bottom_has_top_top1`
        FOREIGN KEY (`top_id`)
            REFERENCES `orderLine`.`top` (`top_id`)
            ON DELETE NO ACTION
            ON UPDATE NO ACTION,
    CONSTRAINT `fk_order_line_order1`
        FOREIGN KEY (`order_id`)
            REFERENCES `orderLine`.`order` (`order_id`)
            ON DELETE NO ACTION
            ON UPDATE NO ACTION
)
    ENGINE = InnoDB;


SET SQL_MODE = @OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS = @OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS = @OLD_UNIQUE_CHECKS;
