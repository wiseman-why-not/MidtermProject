-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema midterm_db
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `midterm_db` ;

-- -----------------------------------------------------
-- Schema midterm_db
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `midterm_db` DEFAULT CHARACTER SET utf8 ;
USE `midterm_db` ;

-- -----------------------------------------------------
-- Table `user`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `user` ;

CREATE TABLE IF NOT EXISTS `user` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(45) NOT NULL,
  `password` VARCHAR(45) NOT NULL,
  `active` TINYINT NULL,
  `first_name` VARCHAR(45) NULL,
  `last_name` VARCHAR(45) NULL,
  `email` VARCHAR(100) NULL,
  `age` INT NULL,
  `personal_description` VARCHAR(1000) NULL,
  `phone` INT NULL,
  `create_date` DATETIME NULL,
  `update_date` DATETIME NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `username_UNIQUE` (`username` ASC),
  UNIQUE INDEX `password_UNIQUE` (`password` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `content`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `content` ;

CREATE TABLE IF NOT EXISTS `content` (
  `id` INT NOT NULL,
  `title` VARCHAR(45) NULL,
  `description` VARCHAR(1000) NULL,
  `img_url` VARCHAR(100) NULL,
  `trailer_url` VARCHAR(100) NULL,
  `format` VARCHAR(45) NULL,
  `release_date` DATE NULL,
  `create_date` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `genre`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `genre` ;

CREATE TABLE IF NOT EXISTS `genre` (
  `id` INT NOT NULL,
  `name` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `season`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `season` ;

CREATE TABLE IF NOT EXISTS `season` (
  `id` INT NOT NULL,
  `content_id` INT NULL,
  `season_number` INT NULL,
  `content_id1` INT NOT NULL,
  `content_id2` INT NOT NULL,
  PRIMARY KEY (`id`, `content_id1`),
  INDEX `fk_season_content1_idx` (`content_id2` ASC),
  CONSTRAINT `fk_season_content1`
    FOREIGN KEY (`content_id2`)
    REFERENCES `content` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `episode`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `episode` ;

CREATE TABLE IF NOT EXISTS `episode` (
  `id` INT NOT NULL,
  `title` VARCHAR(45) NULL,
  `season_id` INT NULL,
  `season_id1` INT NOT NULL,
  `season_content_id1` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_episode_season1_idx` (`season_id1` ASC, `season_content_id1` ASC),
  CONSTRAINT `fk_episode_season1`
    FOREIGN KEY (`season_id1` , `season_content_id1`)
    REFERENCES `season` (`id` , `content_id1`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `favorite_content`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `favorite_content` ;

CREATE TABLE IF NOT EXISTS `favorite_content` (
  `user_id` INT NOT NULL,
  `content_id` INT NOT NULL,
  PRIMARY KEY (`user_id`, `content_id`),
  INDEX `fk_user_has_content_content1_idx` (`content_id` ASC),
  INDEX `fk_user_has_content_user_idx` (`user_id` ASC),
  CONSTRAINT `fk_user_has_content_user`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_user_has_content_content1`
    FOREIGN KEY (`content_id`)
    REFERENCES `content` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `genre_content`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `genre_content` ;

CREATE TABLE IF NOT EXISTS `genre_content` (
  `content_id` INT NOT NULL,
  `genre_id` INT NOT NULL,
  PRIMARY KEY (`content_id`, `genre_id`),
  INDEX `fk_content_has_genre_genre1_idx` (`genre_id` ASC),
  INDEX `fk_content_has_genre_content1_idx` (`content_id` ASC),
  CONSTRAINT `fk_content_has_genre_content1`
    FOREIGN KEY (`content_id`)
    REFERENCES `content` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_content_has_genre_genre1`
    FOREIGN KEY (`genre_id`)
    REFERENCES `genre` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `user_genre`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `user_genre` ;

CREATE TABLE IF NOT EXISTS `user_genre` (
  `user_id` INT NOT NULL,
  `genre_id` INT NOT NULL,
  PRIMARY KEY (`user_id`, `genre_id`),
  INDEX `fk_user_has_genre_genre1_idx` (`genre_id` ASC),
  INDEX `fk_user_has_genre_user1_idx` (`user_id` ASC),
  CONSTRAINT `fk_user_has_genre_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_user_has_genre_genre1`
    FOREIGN KEY (`genre_id`)
    REFERENCES `genre` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SET SQL_MODE = '';
DROP USER IF EXISTS steve@localhost;
SET SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';
CREATE USER 'steve'@'localhost' IDENTIFIED BY 'hulu';

GRANT SELECT, INSERT, TRIGGER, UPDATE, DELETE ON TABLE * TO 'steve'@'localhost';

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `user`
-- -----------------------------------------------------
START TRANSACTION;
USE `midterm_db`;
INSERT INTO `user` (`id`, `username`, `password`, `active`, `first_name`, `last_name`, `email`, `age`, `personal_description`, `phone`, `create_date`, `update_date`) VALUES (1, 'steve', 'steve', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `user` (`id`, `username`, `password`, `active`, `first_name`, `last_name`, `email`, `age`, `personal_description`, `phone`, `create_date`, `update_date`) VALUES (2, 'user2', 'user', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

COMMIT;

