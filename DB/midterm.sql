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
  `personal_description` TEXT NULL,
  `phone` BIGINT(20) NULL,
  `create_date` TIMESTAMP NULL,
  `update_date` TIMESTAMP NULL,
  `admin_privledges` TINYINT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `username_UNIQUE` (`username` ASC),
  UNIQUE INDEX `password_UNIQUE` (`password` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `content`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `content` ;

CREATE TABLE IF NOT EXISTS `content` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(45) NULL,
  `description` TEXT NULL,
  `img_url` VARCHAR(100) NULL,
  `trailer_url` VARCHAR(100) NULL,
  `format` TINYINT NULL,
  `release_date` YEAR(4) NULL,
  `create_date` TIMESTAMP NULL,
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
INSERT INTO `user` (`id`, `username`, `password`, `active`, `first_name`, `last_name`, `email`, `age`, `personal_description`, `phone`, `create_date`, `update_date`, `admin_privledges`) VALUES (1, 'steve', 'steve', 1, 'steve', 'merwin', 'stevegmerwin@gmail.com', 45, 'the best', 8177579034, NULL, NULL, NULL);
INSERT INTO `user` (`id`, `username`, `password`, `active`, `first_name`, `last_name`, `email`, `age`, `personal_description`, `phone`, `create_date`, `update_date`, `admin_privledges`) VALUES (2, 'marcus', 'marcus123', 1, 'marcus', 'wiseman', 'wiseman@yahoo.com', 21, 'the slow one', 3033033033, NULL, NULL, NULL);
INSERT INTO `user` (`id`, `username`, `password`, `active`, `first_name`, `last_name`, `email`, `age`, `personal_description`, `phone`, `create_date`, `update_date`, `admin_privledges`) VALUES (3, 'inzu', 'inzu123', 1, 'gabriel', 'inzurriaga', 'inzu@yahoo.com', 23, 'the sexy one', 9090909090, NULL, NULL, NULL);
INSERT INTO `user` (`id`, `username`, `password`, `active`, `first_name`, `last_name`, `email`, `age`, `personal_description`, `phone`, `create_date`, `update_date`, `admin_privledges`) VALUES (4, 'skyler', 'skyler123', 1, 'skyler', 'sapp', 'sapp@yahoo.com', 89, 'the old one', 877788787, NULL, NULL, NULL);

COMMIT;


-- -----------------------------------------------------
-- Data for table `content`
-- -----------------------------------------------------
START TRANSACTION;
USE `midterm_db`;
INSERT INTO `content` (`id`, `title`, `description`, `img_url`, `trailer_url`, `format`, `release_date`, `create_date`) VALUES (1, 'Joker', 'During the 1980s, a failed stand-up comedian is driven insane and turns to a life of crime and chaos in Gotham City while becoming an infamous psychopathic crime figure.', '/udDclJoHjfjb8Ekgsd4FDteOkCU.jpg', 't433PEQGErc', 1, 2000, '1970-01-01 00:00:02');
INSERT INTO `content` (`id`, `title`, `description`, `img_url`, `trailer_url`, `format`, `release_date`, `create_date`) VALUES (2, 'Star Wars: The Rise of Skywalker', 'The surviving Resistance faces the First Order once again as the journey of Rey, Finn and Poe Dameron continues. With the power and knowledge of generations behind them, the final battle begins.', '/db32LaOibwEliAmSL2jjDF6oDdj.jpg', 'adzYW5DZoWs', 1, 2000, '1970-01-01 00:00:02');
INSERT INTO `content` (`id`, `title`, `description`, `img_url`, `trailer_url`, `format`, `release_date`, `create_date`) VALUES (3, 'Monty Python and the Holy Grail', 'King Arthur, accompanied by his squire, recruits his Knights of the Round Table, including Sir Bedevere the Wise, Sir Lancelot the Brave, Sir Robin the Not-Quite-So-Brave-As-Sir-Lancelot and Sir Galahad the Pure. On the way, Arthur battles the Black Knight who, despite having had all his limbs chopped off, insists he can still fight. They reach Camelot, but Arthur decides not  to enter, as \\\"it is a silly place\\\".', '/8AVb7tyxZRsbKJNOTJHQZl7JYWO.jpg', 'RDM75-oXGmQ', 1, 2000, '1970-01-01 00:00:02');
INSERT INTO `content` (`id`, `title`, `description`, `img_url`, `trailer_url`, `format`, `release_date`, `create_date`) VALUES (4, 'The Last Black Man in San Francisco', 'Jimmie Fails dreams of reclaiming the Victorian home his grandfather built in the heart of San Francisco. Joined on his quest by his best friend Mont, Jimmie searches for belonging in a rapidly changing city that seems to have left them behind.', '/ow9zjibNrz5TYVZ6cqwmvCR1YX1.jpg', 'C0FnJDhY9-0', 1, 2000, '1970-01-01 00:00:02');
INSERT INTO `content` (`id`, `title`, `description`, `img_url`, `trailer_url`, `format`, `release_date`, `create_date`) VALUES (5, 'Point Break', 'In Los Angeles, a gang of bank robbers call themselves The Ex-Presidents commit their crimes while wearing masks of Reagan, Carter, Nixon and Johnson. The F.B.I. believes that the members of the gang could be surfers and send young agent Johnny Utah undercover at the beach to mix with the surfers and gather information.', '/eGSfqknufcsXmM2Rb59H9SiNd4T.jpg', 'UsbuQ-jg014', 1, 2000, '1970-01-01 00:00:02');

COMMIT;


-- -----------------------------------------------------
-- Data for table `genre`
-- -----------------------------------------------------
START TRANSACTION;
USE `midterm_db`;
INSERT INTO `genre` (`id`, `name`) VALUES (1, 'Action');
INSERT INTO `genre` (`id`, `name`) VALUES (2, 'Adventure');
INSERT INTO `genre` (`id`, `name`) VALUES (3, 'Animation');
INSERT INTO `genre` (`id`, `name`) VALUES (4, 'Comedy');
INSERT INTO `genre` (`id`, `name`) VALUES (5, 'Crime');
INSERT INTO `genre` (`id`, `name`) VALUES (6, 'Documentary');
INSERT INTO `genre` (`id`, `name`) VALUES (7, 'Drama');
INSERT INTO `genre` (`id`, `name`) VALUES (8, 'Family');
INSERT INTO `genre` (`id`, `name`) VALUES (9, 'Fantasy');
INSERT INTO `genre` (`id`, `name`) VALUES (10, 'History');
INSERT INTO `genre` (`id`, `name`) VALUES (11, 'Horror');
INSERT INTO `genre` (`id`, `name`) VALUES (12, 'Music');
INSERT INTO `genre` (`id`, `name`) VALUES (13, 'Mystery');
INSERT INTO `genre` (`id`, `name`) VALUES (14, 'Romance');
INSERT INTO `genre` (`id`, `name`) VALUES (15, 'Science Fiction');
INSERT INTO `genre` (`id`, `name`) VALUES (16, 'TV Movie');
INSERT INTO `genre` (`id`, `name`) VALUES (17, 'Thriller');
INSERT INTO `genre` (`id`, `name`) VALUES (18, 'War');
INSERT INTO `genre` (`id`, `name`) VALUES (19, 'Western');

COMMIT;


-- -----------------------------------------------------
-- Data for table `genre_content`
-- -----------------------------------------------------
START TRANSACTION;
USE `midterm_db`;
INSERT INTO `genre_content` (`content_id`, `genre_id`) VALUES (1, 5);
INSERT INTO `genre_content` (`content_id`, `genre_id`) VALUES (1, 7);
INSERT INTO `genre_content` (`content_id`, `genre_id`) VALUES (1, 17);
INSERT INTO `genre_content` (`content_id`, `genre_id`) VALUES (2, 1);
INSERT INTO `genre_content` (`content_id`, `genre_id`) VALUES (2, 2);
INSERT INTO `genre_content` (`content_id`, `genre_id`) VALUES (2, 9);
INSERT INTO `genre_content` (`content_id`, `genre_id`) VALUES (3, 2);
INSERT INTO `genre_content` (`content_id`, `genre_id`) VALUES (3, 4);
INSERT INTO `genre_content` (`content_id`, `genre_id`) VALUES (3, 9);
INSERT INTO `genre_content` (`content_id`, `genre_id`) VALUES (4, 7);
INSERT INTO `genre_content` (`content_id`, `genre_id`) VALUES (5, 1);
INSERT INTO `genre_content` (`content_id`, `genre_id`) VALUES (5, 5);
INSERT INTO `genre_content` (`content_id`, `genre_id`) VALUES (5, 17);

COMMIT;


-- -----------------------------------------------------
-- Data for table `user_genre`
-- -----------------------------------------------------
START TRANSACTION;
USE `midterm_db`;
INSERT INTO `user_genre` (`user_id`, `genre_id`) VALUES (1, 2);
INSERT INTO `user_genre` (`user_id`, `genre_id`) VALUES (1, 3);
INSERT INTO `user_genre` (`user_id`, `genre_id`) VALUES (2, 4);
INSERT INTO `user_genre` (`user_id`, `genre_id`) VALUES (2, 5);
INSERT INTO `user_genre` (`user_id`, `genre_id`) VALUES (3, 6);
INSERT INTO `user_genre` (`user_id`, `genre_id`) VALUES (3, 7);
INSERT INTO `user_genre` (`user_id`, `genre_id`) VALUES (4, 8);
INSERT INTO `user_genre` (`user_id`, `genre_id`) VALUES (4, 9);
INSERT INTO `user_genre` (`user_id`, `genre_id`) VALUES (5, 10);
INSERT INTO `user_genre` (`user_id`, `genre_id`) VALUES (5, DEFAULT);

COMMIT;

