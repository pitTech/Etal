-- MySQL Script generated by MySQL Workbench
-- Sun Jan 21 01:58:34 2018
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`student`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`student` (
  `idstudent` INT NOT NULL,
  `name` VARCHAR(45) NULL,
  PRIMARY KEY (`idstudent`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`subjects`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`subjects` (
  `idsubjects` INT NOT NULL,
  `name` VARCHAR(45) NULL,
  `techer` VARCHAR(45) NULL,
  `location` VARCHAR(45) NULL,
  `numweek` INT NULL,
  PRIMARY KEY (`idsubjects`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`class`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`class` (
  `idclass` INT NOT NULL,
  `weeknum` INT NULL,
  `date` DATETIME NULL,
  PRIMARY KEY (`idclass`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`student_has_subjects`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`student_has_subjects` (
  `student_idstudent` INT NOT NULL,
  `subjects_idsubjects` INT NOT NULL,
  PRIMARY KEY (`student_idstudent`, `subjects_idsubjects`),
  INDEX `fk_student_has_subjects_subjects1_idx` (`subjects_idsubjects` ASC),
  INDEX `fk_student_has_subjects_student_idx` (`student_idstudent` ASC),
  CONSTRAINT `fk_student_has_subjects_student`
    FOREIGN KEY (`student_idstudent`)
    REFERENCES `mydb`.`student` (`idstudent`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_student_has_subjects_subjects1`
    FOREIGN KEY (`subjects_idsubjects`)
    REFERENCES `mydb`.`subjects` (`idsubjects`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`subjects_has_class`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`subjects_has_class` (
  `subjects_idsubjects` INT NOT NULL,
  `class_idclass` INT NOT NULL,
  PRIMARY KEY (`subjects_idsubjects`, `class_idclass`),
  INDEX `fk_subjects_has_class_class1_idx` (`class_idclass` ASC),
  INDEX `fk_subjects_has_class_subjects1_idx` (`subjects_idsubjects` ASC),
  CONSTRAINT `fk_subjects_has_class_subjects1`
    FOREIGN KEY (`subjects_idsubjects`)
    REFERENCES `mydb`.`subjects` (`idsubjects`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_subjects_has_class_class1`
    FOREIGN KEY (`class_idclass`)
    REFERENCES `mydb`.`class` (`idclass`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`attendance`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`attendance` (
  `idattendance` INT NOT NULL,
  `student_idstudent` INT NOT NULL,
  `class_idclass` INT NOT NULL,
  `time` DATETIME NULL,
  PRIMARY KEY (`idattendance`),
  INDEX `fk_attendance_student1_idx` (`student_idstudent` ASC),
  INDEX `fk_attendance_class1_idx` (`class_idclass` ASC),
  CONSTRAINT `fk_attendance_student1`
    FOREIGN KEY (`student_idstudent`)
    REFERENCES `mydb`.`student` (`idstudent`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_attendance_class1`
    FOREIGN KEY (`class_idclass`)
    REFERENCES `mydb`.`class` (`idclass`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
