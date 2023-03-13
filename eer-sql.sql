-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`playlists`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`playlists` (
  `PlaylistId` INT NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(120) NOT NULL,
  PRIMARY KEY (`PlaylistId`),
  UNIQUE INDEX `PlaylistId_UNIQUE` (`PlaylistId` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`media_types`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`media_types` (
  `MediaTypeId` INT NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(120) NULL,
  PRIMARY KEY (`MediaTypeId`),
  UNIQUE INDEX `MediaTypeId_UNIQUE` (`MediaTypeId` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`artists`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`artists` (
  `ArtistId` INT NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(120) NULL,
  PRIMARY KEY (`ArtistId`),
  UNIQUE INDEX `ArtistId_UNIQUE` (`ArtistId` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`genres`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`genres` (
  `GenreId` INT NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(120) NULL,
  PRIMARY KEY (`GenreId`),
  UNIQUE INDEX `GenreId_UNIQUE` (`GenreId` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`employees`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`employees` (
  `EmployeeId` INT NOT NULL AUTO_INCREMENT,
  `LastName` VARCHAR(20) NOT NULL,
  `FirstName` VARCHAR(20) NOT NULL,
  `Title` VARCHAR(30) NULL,
  `ReportsTo` INT NULL,
  `BirthDate` DATETIME NULL,
  `HireDate` DATETIME NULL,
  `Address` VARCHAR(70) NULL,
  `City` VARCHAR(40) NULL,
  `State` VARCHAR(40) NULL,
  `Country` VARCHAR(40) NULL,
  `PostalCode` VARCHAR(10) NULL,
  `Phone` VARCHAR(24) NULL,
  `Fax` VARCHAR(24) NULL,
  `Email` VARCHAR(60) NULL,
  PRIMARY KEY (`EmployeeId`),
  UNIQUE INDEX `EmployeeId_UNIQUE` (`EmployeeId` ASC) VISIBLE,
  CONSTRAINT `ReportsTo`
    FOREIGN KEY (`EmployeeId`)
    REFERENCES `mydb`.`employees` (`ReportsTo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`customers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`customers` (
  `CustomerId` INT NOT NULL AUTO_INCREMENT,
  `FirstName` VARCHAR(40) NOT NULL,
  `LastName` VARCHAR(20) NOT NULL,
  `Company` VARCHAR(80) NULL,
  `Address` VARCHAR(70) NULL,
  `City` VARCHAR(40) NULL,
  `State` VARCHAR(40) NULL,
  `Country` VARCHAR(40) NULL,
  `PostalCode` VARCHAR(10) NULL,
  `Phone` VARCHAR(24) NULL,
  `Fax` VARCHAR(24) NULL,
  `Email` VARCHAR(60) NOT NULL,
  `SupportRepId` VARCHAR(45) NULL,
  PRIMARY KEY (`CustomerId`),
  UNIQUE INDEX `CustomerId_UNIQUE` (`CustomerId` ASC) VISIBLE,
  CONSTRAINT `SupportRepId`
    FOREIGN KEY ()
    REFERENCES `mydb`.`employees` ()
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`invoices`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`invoices` (
  `InvoiceId` INT NOT NULL AUTO_INCREMENT,
  `CustomerId` INT NOT NULL,
  `InvoiceDate` DATETIME NOT NULL,
  `BillingAddress` VARCHAR(70) NULL,
  `BillingCity` VARCHAR(40) NULL,
  `BillingState` VARCHAR(40) NULL,
  `BillingCountry` VARCHAR(40) NULL,
  `BillingPostalCode` VARCHAR(10) NULL,
  `Total` DECIMAL(10,2) NOT NULL,
  PRIMARY KEY (`InvoiceId`),
  UNIQUE INDEX `InvoiceId_UNIQUE` (`InvoiceId` ASC) VISIBLE,
  INDEX `CustomerId_idx` (`CustomerId` ASC) VISIBLE,
  CONSTRAINT `CustomerId`
    FOREIGN KEY (`CustomerId`)
    REFERENCES `mydb`.`customers` (`CustomerId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`albums`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`albums` (
  `AlbumId` INT NOT NULL AUTO_INCREMENT,
  `Title` VARCHAR(160) NOT NULL,
  `ArtistId` INT NOT NULL,
  PRIMARY KEY (`AlbumId`),
  UNIQUE INDEX `AlbumId_UNIQUE` (`AlbumId` ASC) VISIBLE,
  INDEX `ArtistId_idx` (`ArtistId` ASC) VISIBLE,
  CONSTRAINT `ArtistId`
    FOREIGN KEY (`ArtistId`)
    REFERENCES `mydb`.`artists` (`ArtistId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`tracks`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`tracks` (
  `TrackId` INT NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(200) NOT NULL,
  `AlbumId` INT NULL,
  `MediaTypeId` INT NOT NULL,
  `GenreId` INT NULL,
  `Composer` VARCHAR(220) NULL,
  `Milliseconds` INT NOT NULL,
  `Bytes` INT NULL,
  `UnitPrice` DECIMAL(10,2) NOT NULL,
  PRIMARY KEY (`TrackId`),
  UNIQUE INDEX `TrackId_UNIQUE` (`TrackId` ASC) VISIBLE,
  INDEX `AlbumId_idx` (`AlbumId` ASC) VISIBLE,
  INDEX `GenreId_idx` (`GenreId` ASC) VISIBLE,
  INDEX `MediaTypeId_idx` (`MediaTypeId` ASC) VISIBLE,
  CONSTRAINT `AlbumId`
    FOREIGN KEY (`AlbumId`)
    REFERENCES `mydb`.`albums` (`AlbumId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `GenreId`
    FOREIGN KEY (`GenreId`)
    REFERENCES `mydb`.`genres` (`GenreId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `MediaTypeId`
    FOREIGN KEY (`MediaTypeId`)
    REFERENCES `mydb`.`media_types` (`MediaTypeId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`playlist_track`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`playlist_track` (
  `PlaylistId` INT NOT NULL,
  `TrackId` INT NOT NULL,
  PRIMARY KEY (`PlaylistId`, `TrackId`),
  INDEX `TrackId_idx` (`TrackId` ASC) VISIBLE,
  CONSTRAINT `PlaylistId`
    FOREIGN KEY (`PlaylistId`)
    REFERENCES `mydb`.`playlists` (`PlaylistId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `TrackId`
    FOREIGN KEY (`TrackId`)
    REFERENCES `mydb`.`tracks` (`TrackId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`invoice_items`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`invoice_items` (
  `InvoiceLineId` INT NOT NULL AUTO_INCREMENT,
  `InvoiceId` INT NOT NULL,
  `TrackId` INT NOT NULL,
  `UnitPrice` DECIMAL(10,2) NOT NULL,
  `Quantity` INT NOT NULL,
  PRIMARY KEY (`InvoiceLineId`),
  UNIQUE INDEX `InvoiceLineId_UNIQUE` (`InvoiceLineId` ASC) VISIBLE,
  INDEX `InvoiceId_idx` (`InvoiceId` ASC) VISIBLE,
  INDEX `TrackId_idx` (`TrackId` ASC) VISIBLE,
  CONSTRAINT `InvoiceId`
    FOREIGN KEY (`InvoiceId`)
    REFERENCES `mydb`.`invoices` (`InvoiceId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `TrackId`
    FOREIGN KEY (`TrackId`)
    REFERENCES `mydb`.`tracks` (`TrackId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
