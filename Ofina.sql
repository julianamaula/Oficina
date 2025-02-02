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
SHOW WARNINGS;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `Cliente`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Cliente` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `Cliente` (
  `idCliente` INT NOT NULL,
  `Nome` VARCHAR(45) NULL,
  `Telefone` VARCHAR(15) NULL,
  `Endereco` VARCHAR(100) NULL,
  `CPF` VARCHAR(11) NULL,
  PRIMARY KEY (`idCliente`))
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `Veiculo`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Veiculo` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `Veiculo` (
  `idVeiculo` INT NOT NULL,
  `renavam` VARCHAR(45) NOT NULL,
  `placa` VARCHAR(45) NOT NULL,
  `modelo` VARCHAR(45) NULL,
  `cor` VARCHAR(45) NULL,
  `ano` VARCHAR(45) NULL,
  `Cliente_idCliente` INT NOT NULL,
  PRIMARY KEY (`idVeiculo`))
ENGINE = InnoDB;

SHOW WARNINGS;
CREATE UNIQUE INDEX `Renavam_UNIQUE` ON `Veiculo` (`renavam` ASC) VISIBLE;

SHOW WARNINGS;
CREATE UNIQUE INDEX `Placa_UNIQUE` ON `Veiculo` (`placa` ASC) VISIBLE;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `EquipeMecanicos`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `EquipeMecanicos` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `EquipeMecanicos` (
  `idEquipeResponsavel` INT NOT NULL,
  `Nome` VARCHAR(45) NULL,
  PRIMARY KEY (`idEquipeResponsavel`))
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `OrdemServico`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `OrdemServico` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `OrdemServico` (
  `idOrdemServico` INT NOT NULL,
  `data_emissao` DATE NULL,
  `Valor` FLOAT NULL,
  `Status` VARCHAR(45) NULL,
  `data_conclusao` DATE NULL,
  `Veiculo_idVeiculo` INT NOT NULL,
  `EquipeMecanicos_idEquipeResponsavel` INT NOT NULL,
  PRIMARY KEY (`idOrdemServico`))
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `Servico`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Servico` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `Servico` (
  `idServico` INT NOT NULL,
  `TiposDeServico` VARCHAR(45) NOT NULL,
  `valor_mao_de_obra` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idServico`))
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `Peca`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Peca` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `Peca` (
  `idPeca` INT NOT NULL,
  `Valor` FLOAT NULL,
  PRIMARY KEY (`idPeca`))
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `Mecanico`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Mecanico` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `Mecanico` (
  `idMecanico` INT NOT NULL,
  `Nome` VARCHAR(45) NULL,
  `Endereco` VARCHAR(45) NULL,
  `Especialidade` VARCHAR(45) NULL,
  `Codigo` VARCHAR(45) NOT NULL,
  `EquipeMecanicos_idEquipeResponsavel` INT NOT NULL,
  PRIMARY KEY (`idMecanico`))
ENGINE = InnoDB;

SHOW WARNINGS;
CREATE UNIQUE INDEX `Nome_UNIQUE` ON `Mecanico` (`Nome` ASC) VISIBLE;

SHOW WARNINGS;
CREATE UNIQUE INDEX `Endereco_UNIQUE` ON `Mecanico` (`Endereco` ASC) VISIBLE;

SHOW WARNINGS;
CREATE UNIQUE INDEX `Especialidade_UNIQUE` ON `Mecanico` (`Especialidade` ASC) VISIBLE;

SHOW WARNINGS;
CREATE UNIQUE INDEX `Codigo_UNIQUE` ON `Mecanico` (`Codigo` ASC) VISIBLE;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `ItemPeca`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ItemPeca` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `ItemPeca` (
  `OrdemServico_idOrdemServico` INT NOT NULL,
  `Peca_idPeca` INT NOT NULL,
  PRIMARY KEY (`OrdemServico_idOrdemServico`, `Peca_idPeca`))
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `ItemServico`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ItemServico` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `ItemServico` (
  `OrdemServico_idOrdemServico` INT NOT NULL,
  `Servico_idServico` INT NOT NULL,
  PRIMARY KEY (`OrdemServico_idOrdemServico`, `Servico_idServico`))
ENGINE = InnoDB;

SHOW WARNINGS;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
