-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema diagramayscripts2
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema diagramayscripts2
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `diagramayscripts2` DEFAULT CHARACTER SET utf8 ;
USE `diagramayscripts2` ;

-- -----------------------------------------------------
-- Table `diagramayscripts2`.`valijas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `diagramayscripts2`.`valijas` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  `precio` INT NOT NULL,
  `descripcion` TEXT NULL,
  `tipodeuso` VARCHAR(45) NOT NULL,
  `stock` INT NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `diagramayscripts2`.`jueguetes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `diagramayscripts2`.`jueguetes` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  `precio` INT NOT NULL,
  `descripcion` TEXT NOT NULL,
  `stock` INT NOT NULL,
  `tipodeuso` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `diagramayscripts2`.`articulosjardin`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `diagramayscripts2`.`articulosjardin` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NULL,
  `descripcion` TEXT NULL,
  `precio` INT NULL,
  `stock` INT NULL,
  `tipodeuso` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `diagramayscripts2`.`tipodeempleado`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `diagramayscripts2`.`tipodeempleado` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `diagramayscripts2`.`empleados`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `diagramayscripts2`.`empleados` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NULL,
  `apellido` VARCHAR(45) NULL,
  `dni` INT NULL,
  `sueldo` INT NULL,
  `rolId` INT NULL,
  PRIMARY KEY (`id`),
  INDEX `FK_empleado_tipoempleado_idx` (`rolId` ASC) VISIBLE,
  CONSTRAINT `FK_empleado_tipoempleado`
    FOREIGN KEY (`rolId`)
    REFERENCES `diagramayscripts2`.`tipodeempleado` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `diagramayscripts2`.`productos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `diagramayscripts2`.`productos` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `categoria` VARCHAR(45) NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `FK_productos_categoria`
    FOREIGN KEY (`id`)
    REFERENCES `diagramayscripts2`.`articulosjardin` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_productos_categoria`
    FOREIGN KEY (`id`)
    REFERENCES `diagramayscripts2`.`jueguetes` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_productos_categoria`
    FOREIGN KEY (`id`)
    REFERENCES `diagramayscripts2`.`valijas` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
