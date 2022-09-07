-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema diagramaYscript
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema diagramaYscript
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `diagramaYscript` DEFAULT CHARACTER SET utf8 ;
USE `diagramaYscript` ;

-- -----------------------------------------------------
-- Table `diagramaYscript`.`categorias`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `diagramaYscript`.`categorias` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `diagramaYscript`.`usuarios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `diagramaYscript`.`usuarios` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `password` VARCHAR(100) NOT NULL,
  `categoriaID` INT NULL,
  PRIMARY KEY (`id`),
  INDEX `FK_usuarios_categorias_idx` (`categoriaID` ASC) VISIBLE,
  CONSTRAINT `FK_usuarios_categorias`
    FOREIGN KEY (`categoriaID`)
    REFERENCES `diagramaYscript`.`categorias` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `diagramaYscript`.`cursos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `diagramaYscript`.`cursos` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `titulo` VARCHAR(45) NULL,
  `descripcion` TEXT NULL,
  `imagen` VARCHAR(45) NULL,
  `fecha_inicio` DATE NULL,
  `fecha_finalizacion` DATE NULL,
  `cupo` INT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `diagramaYscript`.`unidades`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `diagramaYscript`.`unidades` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `titulo` VARCHAR(45) NULL,
  `description` TEXT NULL,
  `fecha_inicio` DATE NULL,
  `cursoId` INT NULL,
  PRIMARY KEY (`id`),
  INDEX `FK_unidades_cursos_idx` (`cursoId` ASC) VISIBLE,
  CONSTRAINT `FK_unidades_cursos`
    FOREIGN KEY (`cursoId`)
    REFERENCES `diagramaYscript`.`cursos` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `diagramaYscript`.`inscripciones`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `diagramaYscript`.`inscripciones` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `usuarioId` INT NOT NULL,
  `cursoId` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `FK_usuarios_cursos_idx` (`usuarioId` ASC) VISIBLE,
  INDEX `FK_cursos_usuarios_idx` (`cursoId` ASC) VISIBLE,
  CONSTRAINT `FK_usuarios_cursos`
    FOREIGN KEY (`usuarioId`)
    REFERENCES `diagramaYscript`.`usuarios` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_cursos_usuarios`
    FOREIGN KEY (`cursoId`)
    REFERENCES `diagramaYscript`.`cursos` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `diagramaYscript`.`clases`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `diagramaYscript`.`clases` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `titulo` VARCHAR(45) NOT NULL,
  `descripcion` TEXT NOT NULL,
  `fecha_inicio` DATE NOT NULL,
  `visibilidad` TINYINT(5) NULL,
  `unidadId` INT NULL,
  PRIMARY KEY (`id`),
  INDEX `FK_clases_unidades_idx` (`unidadId` ASC) VISIBLE,
  CONSTRAINT `FK_clases_unidades`
    FOREIGN KEY (`unidadId`)
    REFERENCES `diagramaYscript`.`unidades` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `diagramaYscript`.`tipos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `diagramaYscript`.`tipos` (
  `id` INT NOT NULL,
  `nombre` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `diagramaYscript`.`bloques`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `diagramaYscript`.`bloques` (
  `id` INT NOT NULL,
  `titulo` VARCHAR(45) NULL,
  `visibilidad` TINYINT NULL,
  `tipoId` INT NOT NULL,
  `claseId` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `FK_bloques_tipos_idx` (`tipoId` ASC) VISIBLE,
  INDEX `FK_bloques_clases_idx` (`claseId` ASC) VISIBLE,
  CONSTRAINT `FK_bloques_tipos`
    FOREIGN KEY (`tipoId`)
    REFERENCES `diagramaYscript`.`tipos` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_bloques_clases`
    FOREIGN KEY (`claseId`)
    REFERENCES `diagramaYscript`.`clases` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
