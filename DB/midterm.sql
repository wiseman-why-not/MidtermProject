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
  `title` VARCHAR(450) NULL,
  `description` TEXT NULL,
  `img_url` VARCHAR(500) NULL,
  `trailer_url` VARCHAR(500) NULL,
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
INSERT INTO `user` (`id`, `username`, `password`, `active`, `first_name`, `last_name`, `email`, `age`, `personal_description`, `phone`, `create_date`, `update_date`, `admin_privledges`) VALUES (1, 'steve100', 'steve', 1, 'Steve', 'Merwin', 'stevegmerwin@gmail.com', 45, 'The best at being the worst', 8177579034, NULL, NULL, 0);
INSERT INTO `user` (`id`, `username`, `password`, `active`, `first_name`, `last_name`, `email`, `age`, `personal_description`, `phone`, `create_date`, `update_date`, `admin_privledges`) VALUES (2, 'marcus21', 'marcus123', 1, 'Marcus', 'Wiseman', 'wiseman@yahoo.com', 21, 'The slow one, living life in the fast lane', 3033033033, NULL, NULL, 0);
INSERT INTO `user` (`id`, `username`, `password`, `active`, `first_name`, `last_name`, `email`, `age`, `personal_description`, `phone`, `create_date`, `update_date`, `admin_privledges`) VALUES (3, 'inzu69', 'inzu123', 1, 'Gabriel', 'Inzurriaga', 'inzu@yahoo.com', 23, 'The sexy one. But only if you find full-body rashes sexy. ', 9090909090, NULL, NULL, 0);
INSERT INTO `user` (`id`, `username`, `password`, `active`, `first_name`, `last_name`, `email`, `age`, `personal_description`, `phone`, `create_date`, `update_date`, `admin_privledges`) VALUES (4, 'nuclearginger13', 'skyler123', 1, 'Skyler', 'Sapp', 'sapp@yahoo.com', 89, 'The old one. The ginger. The legend. ', 4703344029, NULL, NULL, 0);
INSERT INTO `user` (`id`, `username`, `password`, `active`, `first_name`, `last_name`, `email`, `age`, `personal_description`, `phone`, `create_date`, `update_date`, `admin_privledges`) VALUES (5, 'lakitu770', 'lakita123', 1, 'Lakita', 'Speegle', 'lspeegle@email.com', 56, 'A fan of fantasy', 7704562987, NULL, NULL, 0);
INSERT INTO `user` (`id`, `username`, `password`, `active`, `first_name`, `last_name`, `email`, `age`, `personal_description`, `phone`, `create_date`, `update_date`, `admin_privledges`) VALUES (6, 'temp13', 'tempie123', 1, 'Tempie', 'Spry', 'tspry@email.com', 13, 'I love My Little Pony', 3344333434, NULL, NULL, 0);
INSERT INTO `user` (`id`, `username`, `password`, `active`, `first_name`, `last_name`, `email`, `age`, `personal_description`, `phone`, `create_date`, `update_date`, `admin_privledges`) VALUES (7, 'mirrormirror1', 'mirian123', 1, 'Mirian', 'Miura', 'mmiura@email.com', 33, 'Who\'s the fairest of them all? I am!', 4700744070, NULL, NULL, 0);
INSERT INTO `user` (`id`, `username`, `password`, `active`, `first_name`, `last_name`, `email`, `age`, `personal_description`, `phone`, `create_date`, `update_date`, `admin_privledges`) VALUES (8, 'candycane69', 'candance123', 1, 'Candance', 'Wardlaw', 'cwardlaw@email.com', 20, 'Christmas movies are my jam!', 3211445987, NULL, NULL, 0);
INSERT INTO `user` (`id`, `username`, `password`, `active`, `first_name`, `last_name`, `email`, `age`, `personal_description`, `phone`, `create_date`, `update_date`, `admin_privledges`) VALUES (9, 'addycakes', 'adriene123', 1, 'Adriene', 'Coletti', 'acoletti@email.com', 30, 'Yo Adriene!!', 5577933291, NULL, NULL, 0);
INSERT INTO `user` (`id`, `username`, `password`, `active`, `first_name`, `last_name`, `email`, `age`, `personal_description`, `phone`, `create_date`, `update_date`, `admin_privledges`) VALUES (10, 'andymountains', 'anderson123', 1, 'Anderson', 'Arens', 'aarens@email.com', 39, 'This little light of mine. I\'m gonna let it shine. ', 1234567890, NULL, NULL, 0);
INSERT INTO `user` (`id`, `username`, `password`, `active`, `first_name`, `last_name`, `email`, `age`, `personal_description`, `phone`, `create_date`, `update_date`, `admin_privledges`) VALUES (11, 'lejo2001', 'leandro123', 1, 'Leandro', 'Johnson', 'ljohnson@email.com', 19, 'I\'m a little teapot, short and stout... No really... I\'m short and I\'m stout. ', 0987654321, NULL, NULL, 0);
INSERT INTO `user` (`id`, `username`, `password`, `active`, `first_name`, `last_name`, `email`, `age`, `personal_description`, `phone`, `create_date`, `update_date`, `admin_privledges`) VALUES (12, 'windycitywendy', 'wendy123', 1, 'Wendy', 'Dugas', 'wdugas@email.com', 22, 'From the windy city. I\'m kind of a brat. But I have huge....tracts of land.....', 7776665555, NULL, NULL, 0);
INSERT INTO `user` (`id`, `username`, `password`, `active`, `first_name`, `last_name`, `email`, `age`, `personal_description`, `phone`, `create_date`, `update_date`, `admin_privledges`) VALUES (13, 'lrulocke91', 'margaret123', 1, 'Margaret', 'Locke', 'mlocke@email.com', 27, 'Counselor in the making. I\'m better than you are. #SorryNotSorry', 8282228888, NULL, NULL, 0);
INSERT INTO `user` (`id`, `username`, `password`, `active`, `first_name`, `last_name`, `email`, `age`, `personal_description`, `phone`, `create_date`, `update_date`, `admin_privledges`) VALUES (14, 'bambergler', 'meghan123', 1, 'Meghan', 'Bamberger', 'mbamberger@email.com', 32, 'I like binging shows and sitting in my car in my driveway for hours at a time.', 9990001111, NULL, NULL, 0);
INSERT INTO `user` (`id`, `username`, `password`, `active`, `first_name`, `last_name`, `email`, `age`, `personal_description`, `phone`, `create_date`, `update_date`, `admin_privledges`) VALUES (15, 'womanrique11', 'jenna123', 1, 'Jenna', 'Manrique', 'jmanrique@email.com', 24, 'I\'m a strong, independent womanrique. i don\'t need no man! But i\'d like one anyway. ', 1112223334, NULL, NULL, 0);
INSERT INTO `user` (`id`, `username`, `password`, `active`, `first_name`, `last_name`, `email`, `age`, `personal_description`, `phone`, `create_date`, `update_date`, `admin_privledges`) VALUES (16, 'musicman89', 'todd123', 1, 'Todd', 'Green', 'tgreen@email.com', 30, 'I\'m good at music but not much else. Let\'s hang!', 3344028977, NULL, NULL, 0);
INSERT INTO `user` (`id`, `username`, `password`, `active`, `first_name`, `last_name`, `email`, `age`, `personal_description`, `phone`, `create_date`, `update_date`, `admin_privledges`) VALUES (17, 'mizzhu', 'alana123', 1, 'Alana', 'Zhu', 'azhu@email.com', 32, 'I\'m a labor and delivery nurse. That means I deliver the goods. ', 6309630741, NULL, NULL, 0);
INSERT INTO `user` (`id`, `username`, `password`, `active`, `first_name`, `last_name`, `email`, `age`, `personal_description`, `phone`, `create_date`, `update_date`, `admin_privledges`) VALUES (18, 'ladyluck69', 'jennifer123', 1, 'Jennifer', 'Loadman', 'jloadman@email.com', 34, 'I get knocked down. But I get up again. You\'re never going to keep me down. ', 2234556789, NULL, NULL, 0);
INSERT INTO `user` (`id`, `username`, `password`, `active`, `first_name`, `last_name`, `email`, `age`, `personal_description`, `phone`, `create_date`, `update_date`, `admin_privledges`) VALUES (19, 'declansMom', 'brandi123', 1, 'Brandi', 'Jakubiec', 'bjakubiec@email.com', 30, 'Declan\'s mom has got it going on! ', 9987765544, NULL, NULL, 0);
INSERT INTO `user` (`id`, `username`, `password`, `active`, `first_name`, `last_name`, `email`, `age`, `personal_description`, `phone`, `create_date`, `update_date`, `admin_privledges`) VALUES (20, 'GillyweedGirl', 'meagan123', 1, 'Meagan', 'Gillcrist', 'mgillcrist@email.com', 32, 'Sunday Funday brunch, beer, and bed!', 4382950276, NULL, NULL, 0);
INSERT INTO `user` (`id`, `username`, `password`, `active`, `first_name`, `last_name`, `email`, `age`, `personal_description`, `phone`, `create_date`, `update_date`, `admin_privledges`) VALUES (21, 'theOutlaw1980', 'dortha123', 1, 'Dortha', 'Outler', 'doutler@email.com', 40, 'Who let the dogs out?! (Who? who, who, who who?) ', 7777777777, NULL, NULL, 0);
INSERT INTO `user` (`id`, `username`, `password`, `active`, `first_name`, `last_name`, `email`, `age`, `personal_description`, `phone`, `create_date`, `update_date`, `admin_privledges`) VALUES (22, 'HauntingOfHillhouse', 'diedra123', 1, 'Diedra', 'Hillhouse', 'dhillhouse@email.com', 21, 'Hey now, you\'re an all-star. Get your game on. Go play. ', 6666666666, NULL, NULL, 0);
INSERT INTO `user` (`id`, `username`, `password`, `active`, `first_name`, `last_name`, `email`, `age`, `personal_description`, `phone`, `create_date`, `update_date`, `admin_privledges`) VALUES (23, 'RideOrDie1735', 'paul123', 1, 'Paul', 'Revere', 'prevere@email.com', 285, 'One if by land, two if by sea. Or, three if you wanna Hulu and Hang. ', 0000000001, NULL, NULL, 0);
INSERT INTO `user` (`id`, `username`, `password`, `active`, `first_name`, `last_name`, `email`, `age`, `personal_description`, `phone`, `create_date`, `update_date`, `admin_privledges`) VALUES (24, 'fastingfellow', 'mohatma123', 1, 'Mahatma', 'Gandhi', 'mgandhi@email.com', 151, 'I\'m starving. ', 0192834756, NULL, NULL, 0);
INSERT INTO `user` (`id`, `username`, `password`, `active`, `first_name`, `last_name`, `email`, `age`, `personal_description`, `phone`, `create_date`, `update_date`, `admin_privledges`) VALUES (25, 'MagicalMe', 'gilderoy123', 1, 'Gilderoy', 'Lockhart', 'glockhart@hogwarts.com', 45, 'I don\'t even know who I am anymore.', 8768768768, NULL, NULL, 0);
INSERT INTO `user` (`id`, `username`, `password`, `active`, `first_name`, `last_name`, `email`, `age`, `personal_description`, `phone`, `create_date`, `update_date`, `admin_privledges`) VALUES (26, 'FithtthAthWeaponth', 'mike123', 1, 'Mike', 'Tyson', 'mtyson@email.com', 53, 'I don\'t underthtand why people would want to get rid of pigeonth. They don\'t bother no one.', 5312469753, NULL, NULL, 0);
INSERT INTO `user` (`id`, `username`, `password`, `active`, `first_name`, `last_name`, `email`, `age`, `personal_description`, `phone`, `create_date`, `update_date`, `admin_privledges`) VALUES (27, 'HunHunter', 'hua123', 1, 'Hua', 'Mulan', 'hmulan@email.com', 19, 'Let\'s get down to business!', 1435728444, NULL, NULL, 0);
INSERT INTO `user` (`id`, `username`, `password`, `active`, `first_name`, `last_name`, `email`, `age`, `personal_description`, `phone`, `create_date`, `update_date`, `admin_privledges`) VALUES (28, 'RightSaidFred', 'fred123', 1, 'Fred', 'Fredette', 'ffredette@email.com', 44, 'Children should never see a Parent\'s private parts. Also, Denise lies. ', 2223334444, NULL, NULL, 0);
INSERT INTO `user` (`id`, `username`, `password`, `active`, `first_name`, `last_name`, `email`, `age`, `personal_description`, `phone`, `create_date`, `update_date`, `admin_privledges`) VALUES (29, 'babyyodadaddy', 'mando123', 1, 'Mando', 'Lorian', 'mlorian@email.com', 35, 'This is the way. ', 6667770000, NULL, NULL, 0);
INSERT INTO `user` (`id`, `username`, `password`, `active`, `first_name`, `last_name`, `email`, `age`, `personal_description`, `phone`, `create_date`, `update_date`, `admin_privledges`) VALUES (30, 'MacAndFleetwood', 'stevie123', 1, 'Stevie', 'Nicks', 'snicks@email.com', 71, 'Like a white-winged dove; ', 4356579088, NULL, NULL, 0);
INSERT INTO `user` (`id`, `username`, `password`, `active`, `first_name`, `last_name`, `email`, `age`, `personal_description`, `phone`, `create_date`, `update_date`, `admin_privledges`) VALUES (31, 'admin', 'admin123', 1, 'Administrator', 'Account', 'admin@huluandhang.com', 2113, 'Admin is my name. C.R.U.D. is my game. ', 1001001001, NULL, NULL, 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `content`
-- -----------------------------------------------------
START TRANSACTION;
USE `midterm_db`;
INSERT INTO `content` (`id`, `title`, `description`, `img_url`, `trailer_url`, `format`, `release_date`, `create_date`) VALUES (1, '\"Joker\"', 'During the 1980s, a failed stand-up comedian is driven insane and turns to a life of crime and chaos in Gotham City while becoming an infamous psychopathic crime figure.', '/udDclJoHjfjb8Ekgsd4FDteOkCU.jpg', 't433PEQGErc', 1, 2000, '1970-01-01 00:00:02');
INSERT INTO `content` (`id`, `title`, `description`, `img_url`, `trailer_url`, `format`, `release_date`, `create_date`) VALUES (2, '\"Star Wars: The Rise of Skywalker\"', 'The surviving Resistance faces the First Order once again as the journey of Rey, Finn and Poe Dameron continues. With the power and knowledge of generations behind them, the final battle begins.', 'https://image.tmdb.org/t/p/original/db32LaOibwEliAmSL2jjDF6oDdj.jpg', 'adzYW5DZoWs', 1, 2000, '1970-01-01 00:00:02');
INSERT INTO `content` (`id`, `title`, `description`, `img_url`, `trailer_url`, `format`, `release_date`, `create_date`) VALUES (3, '\"Monty Python and the Holy Grail\"', 'King Arthur, accompanied by his squire, recruits his Knights of the Round Table, including Sir Bedevere the Wise, Sir Lancelot the Brave, Sir Robin the Not-Quite-So-Brave-As-Sir-Lancelot and Sir Galahad the Pure. On the way, Arthur battles the Black Knight who, despite having had all his limbs chopped off, insists he can still fight. They reach Camelot, but Arthur decides not  to enter, as \\\"it is a silly place\\\".', 'https://image.tmdb.org/t/p/original/8AVb7tyxZRsbKJNOTJHQZl7JYWO.jpg', 'RDM75-oXGmQ', 1, 2000, '1970-01-01 00:00:02');
INSERT INTO `content` (`id`, `title`, `description`, `img_url`, `trailer_url`, `format`, `release_date`, `create_date`) VALUES (4, '\"The Last Black Man in San Francisco\"', 'Jimmie Fails dreams of reclaiming the Victorian home his grandfather built in the heart of San Francisco. Joined on his quest by his best friend Mont, Jimmie searches for belonging in a rapidly changing city that seems to have left them behind.', 'https://image.tmdb.org/t/p/original/ow9zjibNrz5TYVZ6cqwmvCR1YX1.jpg', 'C0FnJDhY9-0', 1, 2000, '1970-01-01 00:00:02');
INSERT INTO `content` (`id`, `title`, `description`, `img_url`, `trailer_url`, `format`, `release_date`, `create_date`) VALUES (5, '\"Point Break\"', 'In Los Angeles, a gang of bank robbers call themselves The Ex-Presidents commit their crimes while wearing masks of Reagan, Carter, Nixon and Johnson. The F.B.I. believes that the members of the gang could be surfers and send young agent Johnny Utah undercover at the beach to mix with the surfers and gather information.', 'https://image.tmdb.org/t/p/original/eGSfqknufcsXmM2Rb59H9SiNd4T.jpg', 'UsbuQ-jg014', 1, 2000, '1970-01-01 00:00:02');
INSERT INTO `content` (`id`, `title`, `description`, `img_url`, `trailer_url`, `format`, `release_date`, `create_date`) VALUES (122, '\"Howard the Duck\"', 'A scientific experiment unknowingly brings extraterrestrial life forms to the Earth through a laser beam. First is the cigar smoking drake Howard from the duck\'s planet. A few kids try to keep him from the greedy scientists and help him back to his planet. But then a much less friendly being arrives through the beam...', 'https://image.tmdb.org/t/p/w1280/f2pj3SSj1GdFSrS5bUojT56umL6.jpg', 'll6HwvEiVK4', 1, 1986, '1970-01-01 00:00:02');
INSERT INTO `content` (`id`, `title`, `description`, `img_url`, `trailer_url`, `format`, `release_date`, `create_date`) VALUES (6, '”Gladiator\"', 'A former Roman General sets out to exact vengeance against the corrupt emperor who murdered his family and sent him into slavery.', 'https://image.tmdb.org/t/p/w1280/6WBIzCgmDCYrqh64yDREGeDk9d3.jpg', 'owK1qxDselE', 1, 2000, '1970-01-01 00:00:02');
INSERT INTO `content` (`id`, `title`, `description`, `img_url`, `trailer_url`, `format`, `release_date`, `create_date`) VALUES (7, '\"Erin Brockovich\"', 'A twice-divorced mother of three who sees an injustice, takes on the bad guy and wins -- with a little help from her push-up bra. Erin goes to work for an attorney and comes across medical records describing illnesses clustered in one nearby town. She starts investigating and soon exposes a monumental cover-up.', 'https://image.tmdb.org/t/p/w600_and_h900_bestv2/if90sXZkI4aaxdlhxKejpniT9ff.jpg', 'keZXGaDvK2s', 1, 2000, '1970-01-01 00:00:02');
INSERT INTO `content` (`id`, `title`, `description`, `img_url`, `trailer_url`, `format`, `release_date`, `create_date`) VALUES (8, '\"Memento\"', 'Leonard Shelby is tracking down the man who raped and murdered his wife. The difficulty of locating his wife\'s killer, however, is compounded by the fact that he suffers from a rare, untreatable form of short-term memory loss. Although he can recall details of life before his accident, Leonard cannot remember what happened fifteen minutes ago, where he\'s going, or why.', 'https://image.tmdb.org/t/p/w1280/fQMSaP88cf1nz4qwuNEEFtazuDM.jpg', 'Rq9eM4ZXRgs', 1, 2000, '1970-01-01 00:00:02');
INSERT INTO `content` (`id`, `title`, `description`, `img_url`, `trailer_url`, `format`, `release_date`, `create_date`) VALUES (9, '\"Miss Congeniality\"', 'When the local FBI office receives a letter from a terrorist known only as \'The Citizen\', it\'s quickly determined that he\'s planning his next act at the Miss America beauty pageant. Because tough-as-nails Gracie Hart is the only female Agent at the office, she\'s chosen to go undercover as the contestant from New Jersey.', 'https://image.tmdb.org/t/p/w600_and_h900_bestv2/7ujgPH708pOGvl2Y5IYvXeAGPC2.jpg', '8emJD-rR9Cs', 1, 2000, '1970-01-01 00:00:02');
INSERT INTO `content` (`id`, `title`, `description`, `img_url`, `trailer_url`, `format`, `release_date`, `create_date`) VALUES (10, '\"Cast Away\"', 'Chuck, a top international manager for FedEx, and Kelly, a Ph.D. student, are in love and heading towards marriage. Then Chuck\'s plane to Malaysia ditches at sea during a terrible storm. He\'s the only survivor, and he washes up on a tiny island with nothing but some flotsam and jetsam from the aircraft\'s cargo.', 'https://image.tmdb.org/t/p/w600_and_h900_bestv2/w515BrZvczKIxbHurG6HIiYYrba.jpg', '4olwbrY2kwE', 1, 2000, '1970-01-01 00:00:02');
INSERT INTO `content` (`id`, `title`, `description`, `img_url`, `trailer_url`, `format`, `release_date`, `create_date`) VALUES (11, '\"Almost Famous\"', 'In 1973, 15-year-old William Miller\'s unabashed love of music and aspiration to become a rock journalist lands him an assignment from Rolling Stone magazine to interview and tour with the up-and-coming band Stillwater—fronted by lead guitar Russell Hammond, and lead singer Jeff Bebe.', 'https://image.tmdb.org/t/p/w1280/9pNo92j6zSEAUB8pNmcJTkpnkBF.jpg', '6iyp0qcf7-w', 1, 2000, '1970-01-01 00:00:02');
INSERT INTO `content` (`id`, `title`, `description`, `img_url`, `trailer_url`, `format`, `release_date`, `create_date`) VALUES (12, '\"A Beautiful Mind\"', 'John Nash is a brilliant but asocial mathematician fighting schizophrenia. After he accepts secret work in cryptography, his life takes a turn for the nightmarish.', 'https://image.tmdb.org/t/p/w1280/4SFqHDZ1NvWdysucWbgnYlobdxC.jpg', 'WFJgUm7iOKw', 1, 2001, '1970-01-01 00:00:02');
INSERT INTO `content` (`id`, `title`, `description`, `img_url`, `trailer_url`, `format`, `release_date`, `create_date`) VALUES (13, '\"Ocean\'s Eleven\"', 'Less than 24 hours into his parole, charismatic thief Danny Ocean is already rolling out his next plan: In one night, Danny\'s hand-picked crew of specialists will attempt to steal more than $150 million from three Las Vegas casinos. But to score the cash, Danny risks his chances of reconciling with ex-wife, Tess.', 'https://image.tmdb.org/t/p/w1280/o0h76DVXvk5OKjmNez5YY0GODC2.jpg', 'ImMGNQ2OEjo', 1, 2001, '1970-01-01 00:00:02');
INSERT INTO `content` (`id`, `title`, `description`, `img_url`, `trailer_url`, `format`, `release_date`, `create_date`) VALUES (14, '\"Legally Blonde\"', 'Elle Woods has it all. She\'s the president of her sorority, a Hawaiian Tropic girl, Miss June in her campus calendar, and, above all, a natural blonde. She dates the cutest fraternity boy on campus and wants nothing more than to be Mrs. Warner Huntington III. But, there\'s just one thing stopping Warner from popping the question: Elle is too blonde.', 'https://image.tmdb.org/t/p/w1280/1gAnkZNAd3HqgWL7aqSOQFwt7D1.jpg', '6mMDaDiJ0xw', 1, 2001, '1970-01-01 00:00:02');
INSERT INTO `content` (`id`, `title`, `description`, `img_url`, `trailer_url`, `format`, `release_date`, `create_date`) VALUES (15, '\"The Lord of the Rings: The Fellowship of the Ring\"', 'Young hobbit Frodo Baggins, after inheriting a mysterious ring from his uncle Bilbo, must leave his home in order to keep it from falling into the hands of its evil creator. Along the way, a fellowship is formed to protect the ringbearer and make sure that the ring arrives at its final destination: Mt. Doom, the only place where it can be destroyed.', 'https://image.tmdb.org/t/p/w1280/56zTpe2xvaA4alU51sRWPoKPYZy.jpg', 'V75dMMIW2B4', 1, 2001, '1970-01-01 00:00:02');
INSERT INTO `content` (`id`, `title`, `description`, `img_url`, `trailer_url`, `format`, `release_date`, `create_date`) VALUES (16, '\"Harry Potter and the Philosopher’s Stone\"', 'Harry Potter has lived under the stairs at his aunt and uncle\'s house his whole life. But on his 11th birthday, he learns he\'s a powerful wizard -- with a place waiting for him at the Hogwarts School of Witchcraft and Wizardry. As he learns to harness his newfound powers with the help of the school\'s kindly headmaster, Harry uncovers the truth about his parents\' deaths -- and about the villain who\'s to blame.', 'https://image.tmdb.org/t/p/w1280/gHPtCmMeDqjaGqnMrWGDmD3nKd2.jpg', 'PbdM1db3JbY', 1, 2001, '1970-01-01 00:00:02');
INSERT INTO `content` (`id`, `title`, `description`, `img_url`, `trailer_url`, `format`, `release_date`, `create_date`) VALUES (17, '\"Training Day\"', 'On his first day on the job as a narcotics officer, a rookie cop works with a rogue detective who isn\'t what he appears.', 'https://image.tmdb.org/t/p/w1280/sDT2biSB7wzBJdXq9o3ldr7VfvY.jpg', 'gKTVQPOH8ZA', 1, 2001, '1970-01-01 00:00:02');
INSERT INTO `content` (`id`, `title`, `description`, `img_url`, `trailer_url`, `format`, `release_date`, `create_date`) VALUES (18, '\"Moulin Rouge!\"', 'A celebration of love and creative inspiration takes place in the infamous, gaudy and glamorous Parisian nightclub, at the cusp of the 20th century. A young poet, who is plunged into the heady world of Moulin Rouge, begins a passionate affair with the club\'s most notorious and beautiful star.', 'https://image.tmdb.org/t/p/w1280/xhuQz2yKPlWvMvvnf2u9RVkAQx6.jpg', '2PpgPxjzbkA', 1, 2001, '1970-01-01 00:00:02');
INSERT INTO `content` (`id`, `title`, `description`, `img_url`, `trailer_url`, `format`, `release_date`, `create_date`) VALUES (19, '\"The Royal Tenenbaums\"', 'Royal Tenenbaum and his wife Etheline had three children and then they separated. All three children are extraordinary --- all geniuses. Virtually all memory of the brilliance of the young Tenenbaums was subsequently erased by two decades of betrayal, failure, and disaster. Most of this was generally considered to be their father\'s fault. \"The Royal Tenenbaums\" is the story of the family\'s sudden, unexpected reunion one recent winter.', 'https://image.tmdb.org/t/p/w1280/pAKi4Ywdz6mqeD0tm6GOBH3vXap.jpg', '_lWbwXIu8gw', 1, 2001, '1970-01-01 00:00:02');
INSERT INTO `content` (`id`, `title`, `description`, `img_url`, `trailer_url`, `format`, `release_date`, `create_date`) VALUES (20, '\"Shrek\"', 'It ain\'t easy bein\' green -- especially if you\'re a likable (albeit smelly) ogre named Shrek. On a mission to retrieve a gorgeous princess from the clutches of a fire-breathing dragon, Shrek teams up with an unlikely compatriot -- a wisecracking donkey.', 'https://image.tmdb.org/t/p/w1280/140ewbWv8qHStD3mlBDvvGd0Zvu.jpg', 'W37DlG1i61s', 1, 2001, '1970-01-01 00:00:02');
INSERT INTO `content` (`id`, `title`, `description`, `img_url`, `trailer_url`, `format`, `release_date`, `create_date`) VALUES (21, '\"Monsters, Inc.\"', 'James Sullivan and Mike Wazowski are monsters, they earn their living scaring children and are the best in the business... even though they\'re more afraid of the children than they are of them. When a child accidentally enters their world, James and Mike suddenly find that kids are not to be afraid of and they uncover a conspiracy that could threaten all children across the world.', 'https://image.tmdb.org/t/p/w1280/93Y9BGx8blzmZOPSoivkFfaifqU.jpg', '8IBNZ6O2kMk', 1, 2001, '1970-01-01 00:00:02');
INSERT INTO `content` (`id`, `title`, `description`, `img_url`, `trailer_url`, `format`, `release_date`, `create_date`) VALUES (22, '\"Minority Report\"', 'John Anderton is a top \'Precrime\' cop in the late-21st century, when technology can predict crimes before they\'re committed. But Anderton becomes the quarry when another investigator targets him for a murder charge.', 'https://image.tmdb.org/t/p/w1280/dS5AHLt4DhZpisxryIxKJU6Urxb.jpg', 'jdl6eAIx2K4', 1, 2002, '1970-01-01 00:00:02');
INSERT INTO `content` (`id`, `title`, `description`, `img_url`, `trailer_url`, `format`, `release_date`, `create_date`) VALUES (23, '\"Ali\"', 'In 1964, a brash, new pro boxer, fresh from his Olympic gold medal victory, explodes onto the scene: Cassius Clay. Bold and outspoken, he cuts an entirely new image for African Americans in sport with his proud public self-confidence and his unapologetic belief that he is the greatest boxer of all time. Yet at the top of his game, both Ali\'s personal and professional lives face the ultimate test.', 'https://image.tmdb.org/t/p/w1280/gCGoMZXGdU7DY8xgKYle6dJGksT.jpg', 'https://image.tmdb.org/t/p/w1280/gCGoMZXGdU7DY8xgKYle6dJGksT.jpg', 1, 2002, '1970-01-01 00:00:02');
INSERT INTO `content` (`id`, `title`, `description`, `img_url`, `trailer_url`, `format`, `release_date`, `create_date`) VALUES (24, '\"Chicago\"', 'Murderesses Velma Kelly and Roxie Hart find themselves on death row together and fight for the fame that will keep them from the gallows in 1920s Chicago.', 'https://image.tmdb.org/t/p/w1280/v1Sg3GuHDz9uhrKqYozOeCMLSpj.jpg', '9EpaMmF9WVU', 1, 2002, '1970-01-01 00:00:02');
INSERT INTO `content` (`id`, `title`, `description`, `img_url`, `trailer_url`, `format`, `release_date`, `create_date`) VALUES (25, '\"My Big Fat Greek Wedding\"', 'A young Greek woman falls in love with a non-Greek and struggles to get her family to accept him while she comes to terms with her heritage and cultural identity.', 'https://image.tmdb.org/t/p/w1280/vqGs8K6MdMHVPMTgMhzKHBVgu0t.jpg', 'O2mecmDFE-Q', 1, 2002, '1970-01-01 00:00:02');
INSERT INTO `content` (`id`, `title`, `description`, `img_url`, `trailer_url`, `format`, `release_date`, `create_date`) VALUES (26, '\"Gangs of New York\"', 'It\'s 1863. America was born in the streets. Amsterdam Vallon returns to the Five Points of America to seek vengeance against the psychotic gangland kingpin, Bill the Butcher, who murdered his father years earlier. With an eager pickpocket by his side and a whole new army, Vallon fights his way to seek vengeance on the Butcher and restore peace in the area.', 'https://image.tmdb.org/t/p/w1280/lemqKtcCuAano5aqrzxYiKC8kkn.jpg', 'x5YmI2PW9R8', 1, 2002, '1970-01-01 00:00:02');
INSERT INTO `content` (`id`, `title`, `description`, `img_url`, `trailer_url`, `format`, `release_date`, `create_date`) VALUES (27, '\"Harry Potter and the Chamber of Secrets\"', 'Cars fly, trees fight back, and a mysterious house-elf comes to warn Harry Potter at the start of his second year at Hogwarts. Adventure and danger await when bloody writing on a wall announces: The Chamber Of Secrets Has Been Opened. To save Hogwarts will require all of Harry, Ron and Hermione’s magical abilities and courage.', 'https://image.tmdb.org/t/p/w1280/sdEOH0992YZ0QSxgXNIGLq1ToUi.jpg', 'uU-ET1FAv3Y', 1, 2002, '1970-01-01 00:00:02');
INSERT INTO `content` (`id`, `title`, `description`, `img_url`, `trailer_url`, `format`, `release_date`, `create_date`) VALUES (28, '\"The Lord of the Rings: The Two Towers\"', 'Frodo and Sam are trekking to Mordor to destroy the One Ring of Power while Gimli, Legolas and Aragorn search for the orc-captured Merry and Pippin. All along, nefarious wizard Saruman awaits the Fellowship members at the Orthanc Tower in Isengard.', 'https://image.tmdb.org/t/p/w1280/5VTN0pR8gcqV3EPUHHfMGnJYN9L.jpg', 'cvCktPUwkW0', 1, 2002, '1970-01-01 00:00:02');
INSERT INTO `content` (`id`, `title`, `description`, `img_url`, `trailer_url`, `format`, `release_date`, `create_date`) VALUES (29, '\"Men in Black II\"', 'Kay and Jay reunite to provide our best, last and only line of defense against a sinister seductress who levels the toughest challenge yet to the MIB\'s untarnished mission statement – protecting Earth from the scum of the universe. It\'s been four years since the alien-seeking agents averted an intergalactic disaster of epic proportions. Now it\'s a race against the clock as Jay must convince Kay – who not only has absolutely no memory of his time spent with the MIB, but is also the only living person left with the expertise to save the galaxy – to reunite with the MIB before the earth submits to ultimate destruction.', 'https://image.tmdb.org/t/p/w1280/qWjRfBwr4VculczswwojXgoU0mq.jpg', 'p4NJHqoojOU', 1, 2002, '1970-01-01 00:00:02');
INSERT INTO `content` (`id`, `title`, `description`, `img_url`, `trailer_url`, `format`, `release_date`, `create_date`) VALUES (30, '\"Something\'s Gotta Give\"', 'Harry Sanborn is an aged music industry exec with a fondness for younger women like Marin, his latest trophy girlfriend. Things get a little awkward when Harry suffers a heart attack at the home of Marin\'s mother, Erica. Left in the care of Erica and his doctor, a love triangle starts to take shape.', 'https://image.tmdb.org/t/p/w1280/q1DO4rwTGz1VSX2sEqqboPwsXUF.jpg', '6zVzIaEuXS4', 1, 2003, '1970-01-01 00:00:02');
INSERT INTO `content` (`id`, `title`, `description`, `img_url`, `trailer_url`, `format`, `release_date`, `create_date`) VALUES (31, '\"Lost in Translation\"', 'Two lost souls visiting Tokyo -- the young, neglected wife of a photographer and a washed-up movie star shooting a TV commercial -- find an odd solace and pensive freedom to be real in each other\'s company, away from their lives in America.', 'https://image.tmdb.org/t/p/w1280/wkSzJs7oMf8MIr9CQVICsvRfwA7.jpg', 'wixLlPFJgyQ', 1, 2003, '1970-01-01 00:00:02');
INSERT INTO `content` (`id`, `title`, `description`, `img_url`, `trailer_url`, `format`, `release_date`, `create_date`) VALUES (32, '\"The Lord of the Rings: The Return of the King\"', 'Aragorn is revealed as the heir to the ancient kings as he, Gandalf and the other members of the broken fellowship struggle to save Gondor from Sauron\'s forces. Meanwhile, Frodo and Sam take the ring closer to the heart of Mordor, the dark lord\'s realm.', 'https://image.tmdb.org/t/p/w1280/rCzpDGLbOoPwLjy3OAm5NUPOTrC.jpg', 'r5X-hFf6Bwo', 1, 2003, '1970-01-01 00:00:02');
INSERT INTO `content` (`id`, `title`, `description`, `img_url`, `trailer_url`, `format`, `release_date`, `create_date`) VALUES (33, '\"Pirates of the Caribbean: The Curse of the Black Pearl\"', 'Jack Sparrow, a freewheeling 18th-century pirate, quarrels with a rival pirate bent on pillaging Port Royal. When the governor\'s daughter is kidnapped, Sparrow decides to help the girl\'s love save her.', 'https://image.tmdb.org/t/p/w1280/mL3mGWeiANcAeyJQDwEdwpxQKYv.jpg', 'naQr0uTrH_s', 1, 2003, '1970-01-01 00:00:02');
INSERT INTO `content` (`id`, `title`, `description`, `img_url`, `trailer_url`, `format`, `release_date`, `create_date`) VALUES (34, '\"Old School\"', 'Three friends attempt to recapture their glory days by opening up a fraternity near their alma mater.', 'https://image.tmdb.org/t/p/w1280/lvcyZumUoA6OBeqcJknfZVTmKKF.jpg', 'VqtymOtKr48', 1, 2003, '1970-01-01 00:00:02');
INSERT INTO `content` (`id`, `title`, `description`, `img_url`, `trailer_url`, `format`, `release_date`, `create_date`) VALUES (35, '\"Elf\"', 'When young Buddy falls into Santa\'s gift sack on Christmas Eve, he\'s transported back to the North Pole and raised as a toy-making elf by Santa\'s helpers. But as he grows into adulthood, he can\'t shake the nagging feeling that he doesn\'t belong. Buddy vows to visit Manhattan and find his real dad, a workaholic publisher.', 'https://image.tmdb.org/t/p/w1280/9jChHqqcpe0zHNTqkNqWZkwkgil.jpg', 'LMPyILBePfI', 1, 2003, '1970-01-01 00:00:02');
INSERT INTO `content` (`id`, `title`, `description`, `img_url`, `trailer_url`, `format`, `release_date`, `create_date`) VALUES (36, '\"The Incredibles\"', 'Bob Parr has given up his superhero days to log in time as an insurance adjuster and raise his three children with his formerly heroic wife in suburbia. But when he receives a mysterious assignment, it\'s time to get back into costume.', 'https://image.tmdb.org/t/p/w1280/2LqaLgk4Z226KkgPJuiOQ58wvrm.jpg', '-UaGUdNJdRQ', 1, 2004, '1970-01-01 00:00:02');
INSERT INTO `content` (`id`, `title`, `description`, `img_url`, `trailer_url`, `format`, `release_date`, `create_date`) VALUES (37, '\"Eternal Sunshine of the Spotless Mind\"', 'Joel Barish, heartbroken that his girlfriend underwent a procedure to erase him from her memory, decides to do the same. However, as he watches his memories of her fade away, he realises that he still loves her, and may be too late to correct his mistake.', 'https://image.tmdb.org/t/p/w1280/7y3eYvTsGjxPYDtSnumCLIMDkrV.jpg', 'rb9a00bXf-U', 1, 2004, '1970-01-01 00:00:02');
INSERT INTO `content` (`id`, `title`, `description`, `img_url`, `trailer_url`, `format`, `release_date`, `create_date`) VALUES (38, '\"Harry Potter and the Prisoner of Azkaban\"', 'Harry, Ron and Hermione return to Hogwarts for another magic-filled year. Harry comes face to face with danger yet again, this time in the form of escaped convict, Sirius Black—and turns to sympathetic Professor Lupin for help.', 'https://image.tmdb.org/t/p/w1280/sCrAJB4mwiUu9ymq0aRFWY6DcM1.jpg', 'R69laoH02xg', 1, 2004, '1970-01-01 00:00:02');
INSERT INTO `content` (`id`, `title`, `description`, `img_url`, `trailer_url`, `format`, `release_date`, `create_date`) VALUES (39, '\"The Bourne Supremacy\"', 'When a CIA operation to purchase classified Russian documents is blown by a rival agent, who then shows up in the sleepy seaside village where Bourne and Marie have been living. The pair run for their lives and Bourne, who promised retaliation should anyone from his former life attempt contact, is forced to once again take up his life as a trained assassin to survive.', 'https://image.tmdb.org/t/p/w1280/jXwZgmqOtsqsXuB9oGhocOAegCM.jpg', 'ofMkaGkyAPw', 1, 2004, '1970-01-01 00:00:02');
INSERT INTO `content` (`id`, `title`, `description`, `img_url`, `trailer_url`, `format`, `release_date`, `create_date`) VALUES (40, '\"Anchorman: The Legend of Ron Burgundy\"', 'It\'s the 1970s, and San Diego super-sexist anchorman Ron Burgundy is the top dog in local TV, but that\'s all about to change when ambitious reporter Veronica Corningstone arrives as a new employee at his station.', 'https://image.tmdb.org/t/p/w1280/hafNeozn8Q4K6enP2ux5MTMCHjH.jpg', 'NJQ4qEWm9lU', 1, 2004, '1970-01-01 00:00:02');
INSERT INTO `content` (`id`, `title`, `description`, `img_url`, `trailer_url`, `format`, `release_date`, `create_date`) VALUES (41, '\"Brokeback Mountain\"', 'Two modern-day cowboys meet on a shepherding job in the summer of \'63, the two share a raw and powerful summer together that turns into a lifelong relationship conflicting with the lives they are supposed to live.', 'https://image.tmdb.org/t/p/w1280/z2DqVxj17aW6xpimRlCLfhKSfUm.jpg', 'sCytaMge7bY', 1, 2005, '1970-01-01 00:00:02');
INSERT INTO `content` (`id`, `title`, `description`, `img_url`, `trailer_url`, `format`, `release_date`, `create_date`) VALUES (42, '\"The-40-Year-Old Virgin\"', 'Andy Stitzer has a pleasant life with a nice apartment and a job stamping invoices at an electronics store. But at age 40, there\'s one thing Andy hasn\'t done, and it\'s really bothering his sex-obsessed male co-workers: Andy is still a virgin. Determined to help Andy get laid, the guys make it their mission to de-virginize him. But it all seems hopeless until Andy meets small business owner Trish, a single mom.', 'https://image.tmdb.org/t/p/w1280/5WTywBaFoQhjHTaztkKAfcVmxZn.jpg', 'YnDeJn-BX5Q', 1, 2005, '1970-01-01 00:00:02');
INSERT INTO `content` (`id`, `title`, `description`, `img_url`, `trailer_url`, `format`, `release_date`, `create_date`) VALUES (43, '\"Batman Begins\"', 'Driven by tragedy, billionaire Bruce Wayne dedicates his life to uncovering and defeating the corruption that plagues his home, Gotham City. Unable to work within the system, he instead creates a new identity, a symbol of fear for the criminal underworld - The Batman.', 'https://image.tmdb.org/t/p/w1280/dr6x4GyyegBWtinPBzipY02J2lV.jpg', 'neY2xVmOfUM', 1, 2005, '1970-01-01 00:00:02');
INSERT INTO `content` (`id`, `title`, `description`, `img_url`, `trailer_url`, `format`, `release_date`, `create_date`) VALUES (44, '\"The Devil Wears Prada\"', 'Andy moves to New York to work in the fashion industry. Her boss is extremely demanding, cruel and won\'t let her succeed if she doesn\'t fit into the high class elegant look of their magazine.', 'https://image.tmdb.org/t/p/w1280/8unCRm0LeiO0fM6skWAZy3ZfXR1.jpg', 'jSeXR0gQHQI', 1, 2006, '1970-01-01 00:00:02');
INSERT INTO `content` (`id`, `title`, `description`, `img_url`, `trailer_url`, `format`, `release_date`, `create_date`) VALUES (45, '\"The Departed\"', 'To take down South Boston\'s Irish Mafia, the police send in one of their own to infiltrate the underworld, not realizing the syndicate has done likewise. While an undercover cop curries favor with the mob kingpin, a career criminal rises through the police ranks. But both sides soon discover there\'s a mole among them.', 'https://image.tmdb.org/t/p/w1280/tGLO9zw5ZtCeyyEWgbYGgsFxC6i.jpg', 'iojhqm0JTW4', 1, 2006, '1970-01-01 00:00:02');
INSERT INTO `content` (`id`, `title`, `description`, `img_url`, `trailer_url`, `format`, `release_date`, `create_date`) VALUES (46, '\"Dreamgirls\"', 'Three young women dream of becoming pop stars—and get their wish when they\'re chosen to be backup singers for the legendary James \'Thunder\' Early.', 'https://image.tmdb.org/t/p/w1280/jrtyk21qp9oVHveellwoyp825q2.jpg', 'yK4AEkzYDIE', 1, 2006, '1970-01-01 00:00:02');
INSERT INTO `content` (`id`, `title`, `description`, `img_url`, `trailer_url`, `format`, `release_date`, `create_date`) VALUES (47, '\"The Holiday\"', 'Two women, one from the United States and one from the United Kingdom, swap homes at Christmastime after bad breakups with their boyfriends. Each woman finds romance with a local man but realizes that the imminent return home may end the relationship.', 'https://image.tmdb.org/t/p/w1280/ixNtpuq8OVp4IckgzkSJIflFDkw.jpg', 'GNiEbVN-rJk', 1, 2006, '1970-01-01 00:00:02');
INSERT INTO `content` (`id`, `title`, `description`, `img_url`, `trailer_url`, `format`, `release_date`, `create_date`) VALUES (48, '\"Casino Royale\"', 'Le Chiffre, a banker to the world\'s terrorists, is scheduled to participate in a high-stakes poker game in Montenegro, where he intends to use his winnings to establish his financial grip on the terrorist market. M sends Bond—on his maiden mission as a 00 Agent—to attend this game and prevent Le Chiffre from winning. With the help of Vesper Lynd and Felix Leiter, Bond enters the most important poker game in his already dangerous career.', 'https://image.tmdb.org/t/p/w1280/zlWBxz2pTA9p45kUTrI8AQiKrHm.jpg', 'mbZXAyw_fK0', 1, 2006, '1970-01-01 00:00:02');
INSERT INTO `content` (`id`, `title`, `description`, `img_url`, `trailer_url`, `format`, `release_date`, `create_date`) VALUES (49, '\"Little Miss Sunshine\"', 'A family loaded with quirky, colorful characters piles into an old van and road trips to California for little Olive to compete in a beauty pageant.', 'https://image.tmdb.org/t/p/w1280/5ZuviyEOkelod8x5j5CWa45jsw2.jpg', 'VWyH_twcMl0', 1, 2006, '1970-01-01 00:00:02');
INSERT INTO `content` (`id`, `title`, `description`, `img_url`, `trailer_url`, `format`, `release_date`, `create_date`) VALUES (50, '\"Borat\"', 'Kazakh journalist Borat Sagdiyev travels to America to make a documentary. As he zigzags across the nation, Borat meets real people in real situations with hysterical consequences. His backwards behavior generates strong reactions around him exposing prejudices and hypocrisies in American culture.', 'https://image.tmdb.org/t/p/w1280/9yoY43fgCmuCv2tzIr77z9jCx1L.jpg', 'vlnUa_dNsRQ', 1, 2006, '1970-01-01 00:00:02');
INSERT INTO `content` (`id`, `title`, `description`, `img_url`, `trailer_url`, `format`, `release_date`, `create_date`) VALUES (51, '\"Pan\'s Labyrinth\"', 'Living with her tyrannical stepfather in a new home with her pregnant mother, 10-year-old Ofelia feels alone until she explores a decaying labyrinth guarded by a mysterious faun who claims to know her destiny. If she wishes to return to her real father, Ofelia must complete three terrifying tasks.', 'https://image.tmdb.org/t/p/w1280/t0TDsqbCTgSi0AL7k4baZrOYYhi.jpg', 'gPkMx_pfJ5w', 1, 2006, '1970-01-01 00:00:02');
INSERT INTO `content` (`id`, `title`, `description`, `img_url`, `trailer_url`, `format`, `release_date`, `create_date`) VALUES (52, '\"Children of Men\"', 'In 2027, in a chaotic world in which humans can no longer procreate, a former activist agrees to help transport a miraculously pregnant woman to a sanctuary at sea, where her child\'s birth may help scientists save the future of humankind.', 'https://image.tmdb.org/t/p/w1280/gZ6i32Da76EUxta06GL2BxpC4Cn.jpg', '3CdJYhtjEns', 1, 2006, '1970-01-01 00:00:02');
INSERT INTO `content` (`id`, `title`, `description`, `img_url`, `trailer_url`, `format`, `release_date`, `create_date`) VALUES (53, '\"There Will Be Blood\"', 'Ruthless silver miner, turned oil prospector, Daniel Plainview moves to oil-rich California. Using his adopted son to project a trustworthy, family-man image, Plainview cons local landowners into selling him their valuable properties for a pittance. However, local preacher Eli Sunday suspects Plainviews motives and intentions, starting a slow-burning feud that threatens both their lives.', 'https://image.tmdb.org/t/p/w1280/bFgqkuAFBHNuq0oTtewHwuLVWSO.jpg', '0FIm5ATyAY0', 1, 2007, '1970-01-01 00:00:02');
INSERT INTO `content` (`id`, `title`, `description`, `img_url`, `trailer_url`, `format`, `release_date`, `create_date`) VALUES (54, '\"No Country for Old Men\"', 'Llewelyn Moss stumbles upon dead bodies, $2 million and a hoard of heroin in a Texas desert, but methodical killer Anton Chigurh comes looking for it, with local sheriff Ed Tom Bell hot on his trail. The roles of prey and predator blur as the violent pursuit of money and justice collide.', 'https://image.tmdb.org/t/p/w1280/nBaqryObPuxmuAndWUjDE5rriTd.jpg', 'NXDYCPI75Bo', 1, 2007, '1970-01-01 00:00:02');
INSERT INTO `content` (`id`, `title`, `description`, `img_url`, `trailer_url`, `format`, `release_date`, `create_date`) VALUES (55, '\"Transformers\"', 'Young teenager, Sam Witwicky becomes involved in the ancient struggle between two extraterrestrial factions of transforming robots – the heroic Autobots and the evil Decepticons. Sam holds the clue to unimaginable power and the Decepticons will stop at nothing to retrieve it.', 'https://image.tmdb.org/t/p/w1280/bgSHbGEA1OM6qDs3Qba4VlSZsNG.jpg', 'dI4RZIaSC2M', 1, 2007, '1970-01-01 00:00:02');
INSERT INTO `content` (`id`, `title`, `description`, `img_url`, `trailer_url`, `format`, `release_date`, `create_date`) VALUES (56, '\"Knocked Up\"', 'For fun loving party animal Ben Stone, the last thing he ever expected was for his one night stand to show up on his doorstep eight weeks later to tell him she\'s pregnant.', 'https://image.tmdb.org/t/p/w1280/b4OaXw2MW97VvIiZE0Sbn1NfxSh.jpg', 'K6oqO-xMERc', 1, 2007, '1970-01-01 00:00:02');
INSERT INTO `content` (`id`, `title`, `description`, `img_url`, `trailer_url`, `format`, `release_date`, `create_date`) VALUES (57, '\"Superbad\"', 'Two co-dependent high school seniors are forced to deal with separation anxiety after their plan to stage a booze-soaked party goes awry.', 'https://image.tmdb.org/t/p/w1280/7RZWtDkf0mgrxvJNFj43YW2Ugi8.jpg', 'c1JKWi7Mc8U', 1, 2007, '1970-01-01 00:00:02');
INSERT INTO `content` (`id`, `title`, `description`, `img_url`, `trailer_url`, `format`, `release_date`, `create_date`) VALUES (58, '\"Mamma Mia!\"', 'An independent, single mother who owns a small hotel on a Greek island is about to marry off the spirited young daughter she\'s raised alone. But, the daughter has secretly invited three of her mother\'s ex-lovers in the hopes of finding her biological father.', 'https://image.tmdb.org/t/p/w1280/gOm2iMMbC6EonrFzmSQ8xvCa4Ei.jpg', 'XZAvWkBAhkk', 1, 2008, '1970-01-01 00:00:02');
INSERT INTO `content` (`id`, `title`, `description`, `img_url`, `trailer_url`, `format`, `release_date`, `create_date`) VALUES (59, '\"WALL-E\"', 'WALL·E is the last robot left on an Earth that has been overrun with garbage and all humans have fled to outer space. For 700 years he has continued to try and clean up the mess, but has developed some rather interesting human-like qualities. When a ship arrives with a sleek new type of robot, WALL·E thinks he\'s finally found a friend and stows away on the ship when it leaves.', 'https://image.tmdb.org/t/p/w1280/9cJETuLMc6R0bTWRA5i7ctY9bxk.jpg', '8-_9n5DtKOc', 1, 2008, '1970-01-01 00:00:02');
INSERT INTO `content` (`id`, `title`, `description`, `img_url`, `trailer_url`, `format`, `release_date`, `create_date`) VALUES (60, '\"Slumdog Millionaire\"', 'Jamal Malik is an impoverished Indian teen who becomes a contestant on the Hindi version of ‘Who Wants to Be a Millionaire?’ but, after he wins, he is suspected of cheating.', 'https://image.tmdb.org/t/p/w1280/ojgf8iJpS4VX6jJfWGLpuEx0wm.jpg', 'AIzbwV7on6Q', 1, 2008, '1970-01-01 00:00:02');
INSERT INTO `content` (`id`, `title`, `description`, `img_url`, `trailer_url`, `format`, `release_date`, `create_date`) VALUES (61, '\"Twilight\"', 'When Bella Swan moves to a small town in the Pacific Northwest to live with her father, she meets the reclusive Edward Cullen, a mysterious classmate who reveals himself to be a 108-year-old vampire. Despite Edward\'s repeated cautions, Bella can\'t help but fall in love with him, a fatal move that endangers her own life when a coven of bloodsuckers try to challenge the Cullen clan.\n', 'https://image.tmdb.org/t/p/w1280/lcMp3AONdNhjYE9MmTtMMTOiRDP.jpg', 'uxjNDE2fMjI', 1, 2008, '1970-01-01 00:00:02');
INSERT INTO `content` (`id`, `title`, `description`, `img_url`, `trailer_url`, `format`, `release_date`, `create_date`) VALUES (62, '\"Step Brothers\"', 'Brennan Huff and Dale Doback might be grown men. But that doesn\'t stop them from living at home and turning into jealous, competitive stepbrothers when their single parents marry. Brennan\'s constant competition with Dale strains his mom\'s marriage to Dale\'s dad, leaving everyone to wonder whether they\'ll ever see eye to eye.', 'https://image.tmdb.org/t/p/w1280/tDFNUuYkQ4ZeAlrBHeTtimAumXo.jpg', 'CewglxElBK0', 1, 2008, '1970-01-01 00:00:02');
INSERT INTO `content` (`id`, `title`, `description`, `img_url`, `trailer_url`, `format`, `release_date`, `create_date`) VALUES (63, '\"The Dark Knight\"', 'Batman raises the stakes in his war on crime. With the help of Lt. Jim Gordon and District Attorney Harvey Dent, Batman sets out to dismantle the remaining criminal organizations that plague the streets. The partnership proves to be effective, but they soon find themselves prey to a reign of chaos unleashed by a rising criminal mastermind known to the terrified citizens of Gotham as the Joker.', 'https://image.tmdb.org/t/p/w1280/d1zsQMfjuFEl3BVKPfcNTiMf8oT.jpg', 'kmJLuwP3MbY', 1, 2008, '1970-01-01 00:00:02');
INSERT INTO `content` (`id`, `title`, `description`, `img_url`, `trailer_url`, `format`, `release_date`, `create_date`) VALUES (64, '\"Iron Man\"', 'After being held captive in an Afghan cave, billionaire engineer Tony Stark creates a unique weaponized suit of armor to fight evil.', 'https://image.tmdb.org/t/p/w1280/78lPtwv72eTNqFW9COBYI0dWDJa.jpg', '8hYlB38asDY', 1, 2008, '1970-01-01 00:00:02');
INSERT INTO `content` (`id`, `title`, `description`, `img_url`, `trailer_url`, `format`, `release_date`, `create_date`) VALUES (65, '\"Up\"', 'Carl Fredricksen spent his entire life dreaming of exploring the globe and experiencing life to its fullest. But at age 78, life seems to have passed him by, until a twist of fate (and a persistent 8-year old Wilderness Explorer named Russell) gives him a new lease on life.', 'https://image.tmdb.org/t/p/w1280/nk11pvocdb5zbFhX5oq5YiLPYMo.jpg', 'ORFWdXl_zJ4', 1, 2009, '1970-01-01 00:00:02');
INSERT INTO `content` (`id`, `title`, `description`, `img_url`, `trailer_url`, `format`, `release_date`, `create_date`) VALUES (66, '\"It\'s Complicated\"', 'Ten years after their divorce, Jane and Jake Adler unite for their son\'s college graduation and unexpectedly end up sleeping together. But Jake is married, and Jane is embarking on a new romance with her architect. Now, she has to sort out her life—just when she thought she had it all figured out.', 'https://image.tmdb.org/t/p/w1280/foHRwmVZG7m0XMDq15wRuNoKca6.jpg', '_O09NjpB4AI', 1, 2009, '1970-01-01 00:00:02');
INSERT INTO `content` (`id`, `title`, `description`, `img_url`, `trailer_url`, `format`, `release_date`, `create_date`) VALUES (67, '\"The Hangover\"', 'When three friends finally come to after a raucous night of bachelor-party revelry, they find a baby in the closet and a tiger in the bathroom. But they can\'t seem to locate their best friend, Doug – who\'s supposed to be tying the knot. Launching a frantic search for Doug, the trio perseveres through a nasty hangover to try to make it to the church on time.', 'https://image.tmdb.org/t/p/w1280/uluhlXubGu1VxU63X9VHCLWDAYP.jpg', 'jj6wcUes1no', 1, 2009, '1970-01-01 00:00:02');
INSERT INTO `content` (`id`, `title`, `description`, `img_url`, `trailer_url`, `format`, `release_date`, `create_date`) VALUES (68, '\"Avatar\"', 'In the 22nd century, a paraplegic Marine is dispatched to the moon Pandora on a unique mission, but becomes torn between following orders and protecting an alien civilization.', 'https://image.tmdb.org/t/p/w1280/kmcqlZGaSh20zpTbuoF0Cdn07dT.jpg', '5MB3Ea6L-gw', 1, 2009, '1970-01-01 00:00:02');
INSERT INTO `content` (`id`, `title`, `description`, `img_url`, `trailer_url`, `format`, `release_date`, `create_date`) VALUES (69, '\"The Hurt Locker\"', 'Forced to play a dangerous game of cat-and-mouse in the chaos of war, an elite Army bomb squad unit must come together in a city where everyone is a potential enemy and every object could be a deadly bomb.', 'https://image.tmdb.org/t/p/w1280/3ZEqU9Ykmn8zGDUwWnmTfHaaWRB.jpg', 'HIoctqfxNYY', 1, 2009, '1970-01-01 00:00:02');
INSERT INTO `content` (`id`, `title`, `description`, `img_url`, `trailer_url`, `format`, `release_date`, `create_date`) VALUES (70, '\"Precious\"', 'Set in Harlem in 1987, Claireece \"Precious\" Jones is a 16-year-old African American girl born into a life no one would want. She\'s pregnant for the second time by her absent father; at home, she must wait hand and…', 'https://image.tmdb.org/t/p/w1280/lxfzUHApXiiigjSiidj9YBNkeil.jpg', 'urFY3jp759c', 1, 2009, '1970-01-01 00:00:02');
INSERT INTO `content` (`id`, `title`, `description`, `img_url`, `trailer_url`, `format`, `release_date`, `create_date`) VALUES (71, '\"True Grit\"', 'Following the murder of her father by a hired hand, a 14-year-old farm girl sets out to capture the killer. To aid her, she hires the toughest U.S. Marshal she can find—a man with \'true grit\'—Reuben J. \'Rooster\' Cogburn.', 'https://image.tmdb.org/t/p/w1280/qc7vaF5fIeTllAykdP3wldlMyRh.jpg', 'unEO_p71cik', 1, 2010, '1970-01-01 00:00:02');
INSERT INTO `content` (`id`, `title`, `description`, `img_url`, `trailer_url`, `format`, `release_date`, `create_date`) VALUES (72, '\"The Social Network\"', 'On a fall night in 2003, Harvard undergrad and computer programming genius Mark Zuckerberg sits down at his computer and heatedly begins working on a new idea. In a fury of blogging and programming, what begins in his dorm room as a small site among friends soon becomes a global social network and a revolution in communication. A mere six years and 500 million friends later, Mark Zuckerberg is the youngest billionaire in history... but for this entrepreneur, success leads to both personal and legal complications.', 'https://image.tmdb.org/t/p/w1280/ok5Wh8385Kgblq9MSU4VGvazeMH.jpg', 'rxY9fKgK5OQ', 1, 2010, '1970-01-01 00:00:02');
INSERT INTO `content` (`id`, `title`, `description`, `img_url`, `trailer_url`, `format`, `release_date`, `create_date`) VALUES (73, '\"Black Swan\"', 'A journey through the psyche of a young ballerina whose starring role as the duplicitous swan queen turns out to be a part for which she becomes frighteningly perfect.', 'https://image.tmdb.org/t/p/w1280/dQ7uxvsVTspVIsqjfgQj8usJpwX.jpg', '5jaI1XOB-bs', 1, 2010, '1970-01-01 00:00:02');
INSERT INTO `content` (`id`, `title`, `description`, `img_url`, `trailer_url`, `format`, `release_date`, `create_date`) VALUES (74, '\"Harry Potter and the Deathly Hallows: Part 1\"', 'Harry, Ron and Hermione walk away from their last year at Hogwarts to find and destroy the remaining Horcruxes, putting an end to Voldemort\'s bid for immortality. But with Harry\'s beloved Dumbledore dead and Voldemort\'s unscrupulous Death Eaters on the loose, the world is more dangerous than ever.', 'https://image.tmdb.org/t/p/w1280/bk1EWfRW0U76sWZiLDL1T7J0XV9.jpg', '9hXH0Ackz6w', 1, 2010, '1970-01-01 00:00:02');
INSERT INTO `content` (`id`, `title`, `description`, `img_url`, `trailer_url`, `format`, `release_date`, `create_date`) VALUES (75, '\"Winter\'s Bone\"', '17 year-old Ree Dolly sets out to track down her father, who put their house up for his bail bond and then disappeared. If she fails, Ree and her family will be turned out into the Ozark woods. Challenging her outlaw kin\'s code of silence and risking her life, Ree hacks through the lies, evasions and threats offered up by her relatives and begins to piece together the truth.', 'https://image.tmdb.org/t/p/w1280/lUFZr1hEgFbowMHzJhAKx08VMGA.jpg', 'bE_X2pDRXyY', 1, 2010, '1970-01-01 00:00:02');
INSERT INTO `content` (`id`, `title`, `description`, `img_url`, `trailer_url`, `format`, `release_date`, `create_date`) VALUES (76, '\"The Kids Are All Right\"', 'Two women, Nic and Jules, brought a son and daughter into the world through artificial insemination. When one of their children reaches age, both kids go behind their mothers\' backs to meet with the donor. Life becomes so much more interesting when the father, two mothers and children start to become attached to each other.', 'https://image.tmdb.org/t/p/w1280/fPDeK4MmoGfi2X0oWZev7LrbMqM.jpg', 'RixlpHKfb6M', 1, 2010, '1970-01-01 00:00:02');
INSERT INTO `content` (`id`, `title`, `description`, `img_url`, `trailer_url`, `format`, `release_date`, `create_date`) VALUES (77, '\"Harry Potter and the Deathly Hallows: Part 2\"', 'Harry, Ron and Hermione continue their quest to vanquish the evil Voldemort once and for all. Just as things begin to look hopeless for the young wizards, Harry discovers a trio of magical objects that endow him with powers to rival Voldemort\'s formidable skills.', 'https://image.tmdb.org/t/p/w1280/gOduLS90AehfJPoJMizaRkC3Hoz.jpg', 'mObK5XD8udk', 1, 2011, '1970-01-01 00:00:02');
INSERT INTO `content` (`id`, `title`, `description`, `img_url`, `trailer_url`, `format`, `release_date`, `create_date`) VALUES (78, '\"Bridesmaids\"', 'Annie\'s life is a mess. But when she finds out her lifetime best friend is engaged, she simply must serve as Lillian\'s maid of honor. Though lovelorn and broke, Annie bluffs her way through the expensive and bizarre rituals. With one chance to get it perfect, she’ll show Lillian and her bridesmaids just how far you’ll go for someone you love.', 'https://image.tmdb.org/t/p/w1280/x5ucaJZ4FP589Gn3I8l3ZFV3Nl8.jpg', 'FNppLrmdyug', 1, 2011, '1970-01-01 00:00:02');
INSERT INTO `content` (`id`, `title`, `description`, `img_url`, `trailer_url`, `format`, `release_date`, `create_date`) VALUES (79, '\"Thor\"', 'Against his father Odin\'s will, The Mighty Thor - a powerful but arrogant warrior god - recklessly reignites an ancient war. Thor is cast down to Earth and forced to live among humans as punishment. Once here, Thor learns what it takes to be a true hero when the most dangerous villain of his world sends the darkest forces of Asgard to invade Earth.', 'https://image.tmdb.org/t/p/w1280/9zDwvsISU8bR15R2yN3kh1lfqve.jpg', 'uHBnrJowBZE', 1, 2011, '1970-01-01 00:00:02');
INSERT INTO `content` (`id`, `title`, `description`, `img_url`, `trailer_url`, `format`, `release_date`, `create_date`) VALUES (80, '\"Captain America: The First Avenger\"', 'During World War II, Steve Rogers is a sickly man from Brooklyn who\'s transformed into super-soldier Captain America to aid in the war effort. Rogers must stop the Red Skull – Adolf Hitler\'s ruthless head of weaponry, and the leader of an organization that intends to use a mysterious device of untold powers for world domination.', 'https://image.tmdb.org/t/p/w1280/vSNxAJTlD0r02V9sPYpOjqDZXUK.jpg', 'W4DlMggBPvc', 1, 2011, '1970-01-01 00:00:02');
INSERT INTO `content` (`id`, `title`, `description`, `img_url`, `trailer_url`, `format`, `release_date`, `create_date`) VALUES (81, '\"Django Unchained\"', 'With the help of a German bounty hunter, a freed slave sets out to rescue his wife from a brutal Mississippi plantation owner.', 'https://image.tmdb.org/t/p/w1280/eCt596Z4zkqxW5AHz1HEhGm1eif.jpg', 'rC8VJ9aeB_g', 1, 2012, '1970-01-01 00:00:02');
INSERT INTO `content` (`id`, `title`, `description`, `img_url`, `trailer_url`, `format`, `release_date`, `create_date`) VALUES (82, '\"Lincoln\"', 'The revealing story of the 16th US President\'s tumultuous final months in office. In a nation divided by war and the strong winds of change, Lincoln pursues a course of action designed to end the war, unite the country and abolish slavery. With the moral courage and fierce determination to succeed, his choices during this critical moment will change the fate of generations to come.', 'https://image.tmdb.org/t/p/w1280/gkkiDu9srCCbCMxGKwNwKCxK7KF.jpg', 'qiSAbAuLhqs', 1, 2012, '1970-01-01 00:00:02');
INSERT INTO `content` (`id`, `title`, `description`, `img_url`, `trailer_url`, `format`, `release_date`, `create_date`) VALUES (83, '\"The Master\"', 'Freddie, a volatile, heavy-drinking veteran who suffers from post-traumatic stress disorder, finds some semblance of a family when he stumbles onto the ship of Lancaster Dodd, the charismatic leader of a new \"religion\" he forms after World War II.', 'https://image.tmdb.org/t/p/w1280/rUSjbyvYWN9H4az8xt0tDtU7I6v.jpg', '-EGSWpBDbho', 1, 2012, '1970-01-01 00:00:02');
INSERT INTO `content` (`id`, `title`, `description`, `img_url`, `trailer_url`, `format`, `release_date`, `create_date`) VALUES (84, '\"The Hobbit: An Unexpected Journey\"', 'Bilbo Baggins, a hobbit enjoying his quiet life, is swept into an epic quest by Gandalf the Grey and thirteen dwarves who seek to reclaim their mountain home from Smaug, the dragon.', 'https://image.tmdb.org/t/p/w1280/h1XjBJoWdOh8aegBoVYKgABQZSL.jpg', 'gbEefjEwsUs', 1, 2012, '1970-01-01 00:00:02');
INSERT INTO `content` (`id`, `title`, `description`, `img_url`, `trailer_url`, `format`, `release_date`, `create_date`) VALUES (85, '\"Zero Dark Thirty\"', 'A chronicle of the decade-long hunt for al-Qaeda terrorist leader Osama bin Laden after the September 2001 attacks, and his death at the hands of the Navy S.E.A.L. Team 6 in May, 2011.', 'https://image.tmdb.org/t/p/w1280/yg6IDNucLAEj7E5loTyTnUW2pgb.jpg', 'EYFhFYoDAo4', 1, 2012, '1970-01-01 00:00:02');
INSERT INTO `content` (`id`, `title`, `description`, `img_url`, `trailer_url`, `format`, `release_date`, `create_date`) VALUES (86, '\"Silver Linings Playbook\"', 'After spending eight months in a mental institution, a former teacher moves back in with his parents and tries to reconcile with his ex-wife.', 'https://image.tmdb.org/t/p/w1280/ilrZAV2klTB0FLxLb01bOp5pzD9.jpg', 'EI_3ywJLQio', 1, 2012, '1970-01-01 00:00:02');
INSERT INTO `content` (`id`, `title`, `description`, `img_url`, `trailer_url`, `format`, `release_date`, `create_date`) VALUES (87, '\"The Avengers\"', 'When an unexpected enemy emerges and threatens global safety and security, Nick Fury, director of the international peacekeeping agency known as S.H.I.E.L.D., finds himself in need of a team to pull the world back from the brink of disaster. Spanning the globe, a daring recruitment effort begins!', 'https://image.tmdb.org/t/p/w1280/cezWGskPY5x7GaglTTRN4Fugfb8.jpg', 'bGt-saFvkNk', 1, 2012, '1970-01-01 00:00:02');
INSERT INTO `content` (`id`, `title`, `description`, `img_url`, `trailer_url`, `format`, `release_date`, `create_date`) VALUES (88, '\"The Hunger Games\"', 'Every year in the ruins of what was once North America, the nation of Panem forces each of its twelve districts to send a teenage boy and girl to compete in the Hunger Games. Part twisted entertainment, part government intimidation tactic, the Hunger Games are a nationally televised event in which “Tributes” must fight with one another until one survivor remains. Pitted against highly-trained Tributes who have prepared for these Games their entire lives, Katniss is forced to rely upon her sharp instincts as well as the mentorship of drunken former victor Haymitch Abernathy. If she’s ever to return home to District 12, Katniss must make impossible choices in the arena that weigh survival against humanity and life against love. The world will be watching.', 'https://image.tmdb.org/t/p/w1280/iLJdwmzrHFjFwI5lvYAT1gcpRuA.jpg', 'mfmrPu43DF8', 1, 2012, '1970-01-01 00:00:02');
INSERT INTO `content` (`id`, `title`, `description`, `img_url`, `trailer_url`, `format`, `release_date`, `create_date`) VALUES (89, '\"Fast & Furious 6\"', 'Hobbs has Dominic and Brian reassemble their crew to take down a team of mercenaries: Dominic unexpectedly gets convoluted also facing his presumed deceased girlfriend, Letty.', 'https://image.tmdb.org/t/p/w1280/b9gTJKLdSbwcQRKzmqMq3dMfRwI.jpg', 'C_puVuHoR6o', 1, 2013, '1970-01-01 00:00:02');
INSERT INTO `content` (`id`, `title`, `description`, `img_url`, `trailer_url`, `format`, `release_date`, `create_date`) VALUES (90, '\"Gravity\"', 'Dr. Ryan Stone, a brilliant medical engineer on her first Shuttle mission, with veteran astronaut Matt Kowalsky in command of his last flight before retiring. But on a seemingly routine spacewalk, disaster strikes. The Shuttle is destroyed, leaving Stone and Kowalsky completely alone-tethered to nothing but each other and spiraling out into the blackness of space. The deafening silence tells them they have lost any link to Earth and any chance for rescue. As fear turns to panic, every gulp of air eats away at what little oxygen is left. But the only way home may be to go further out into the terrifying expanse of space.', 'https://image.tmdb.org/t/p/w1280/uPxtxhB2Fy9ihVqtBtNGHmknJqV.jpg', 'OiTiKOy59o4', 1, 2013, '1970-01-01 00:00:02');
INSERT INTO `content` (`id`, `title`, `description`, `img_url`, `trailer_url`, `format`, `release_date`, `create_date`) VALUES (91, '\"American Hustle\"', 'A conman and his seductive partner are forced to work for a wild FBI agent, who pushes them into a world of Jersey power-brokers and the Mafia.', 'https://image.tmdb.org/t/p/w1280/mhB7C62lSMpGO2HYNaW6d7W3TVH.jpg', 'h5Cb4SFt7gE', 1, 2013, '1970-01-01 00:00:02');
INSERT INTO `content` (`id`, `title`, `description`, `img_url`, `trailer_url`, `format`, `release_date`, `create_date`) VALUES (92, '\"12 Years a Slave\"', 'In the pre-Civil War United States, Solomon Northup, a free black man from upstate New York, is abducted and sold into slavery. Facing cruelty as well as unexpected kindnesses Solomon struggles not only to stay alive, but to retain his dignity. In the twelfth year of his unforgettable odyssey, Solomon’s chance meeting with a Canadian abolitionist will forever alter his life.', 'https://image.tmdb.org/t/p/w1280/kb3X943WMIJYVg4SOAyK0pmWL5D.jpg', 'z02Ie8wKKRg', 1, 2013, '1970-01-01 00:00:02');
INSERT INTO `content` (`id`, `title`, `description`, `img_url`, `trailer_url`, `format`, `release_date`, `create_date`) VALUES (93, '\"Fruitvale Station\"', 'The true story of Oscar, a 22-year-old Bay Area resident, who crosses paths with friends, enemies, family, and strangers on the last day of 2008.', 'https://image.tmdb.org/t/p/w1280/zwPYTHFCgWYHRW1OoxE23dxZZRX.jpg', 'crMTGCCui5c', 1, 2013, '1970-01-01 00:00:02');
INSERT INTO `content` (`id`, `title`, `description`, `img_url`, `trailer_url`, `format`, `release_date`, `create_date`) VALUES (94, '\"American Sniper\"', 'U.S. Navy SEAL Chris Kyle takes his sole mission—protect his comrades—to heart and becomes one of the most lethal snipers in American history. His pinpoint accuracy not only saves countless lives but also makes him a prime target of insurgents. Despite grave danger and his struggle to be a good husband and father to his family back in the States, Kyle serves four tours of duty in Iraq. However, when he finally returns home, he finds that he cannot leave the war behind.', 'https://image.tmdb.org/t/p/w1280/svPHnYE7N5NAGO49dBmRhq0vDQ3.jpg', '5bP1f_1o-zo', 1, 2014, '1970-01-01 00:00:02');
INSERT INTO `content` (`id`, `title`, `description`, `img_url`, `trailer_url`, `format`, `release_date`, `create_date`) VALUES (95, '\"Guardians of the Galaxy\"', 'Light years from Earth, 26 years after being abducted, Peter Quill finds himself the prime target of a manhunt after discovering an orb wanted by Ronan the Accuser.', 'https://image.tmdb.org/t/p/w1280/y31QB9kn3XSudA15tV7UWQ9XLuW.jpg', 'b7yOuhI1dzU', 1, 2014, '1970-01-01 00:00:02');
INSERT INTO `content` (`id`, `title`, `description`, `img_url`, `trailer_url`, `format`, `release_date`, `create_date`) VALUES (96, '\"Selma\"', '\"Selma,\" as in Alabama, the place where segregation in the South was at its worst, leading to a march that ended in violence, forcing a famous statement by President Lyndon B. Johnson that ultimately led to the signing of the Civil Rights Act.', 'https://image.tmdb.org/t/p/w1280/xj1H3dpEHhouyJNB1lfpkKf9fXX.jpg', 'x6t7vVTxaic', 1, 2014, '1970-01-01 00:00:02');
INSERT INTO `content` (`id`, `title`, `description`, `img_url`, `trailer_url`, `format`, `release_date`, `create_date`) VALUES (97, '\"Mission: Impossible -- Rogue Nation\"', 'Ethan and team take on their most impossible mission yet—eradicating \'The Syndicate\', an International and highly-skilled rogue organisation committed to destroying the IMF.', 'https://image.tmdb.org/t/p/w1280/z2sJd1OvAGZLxgjBdSnQoLCfn3M.jpg', 'F-qBD17wwrQ', 1, 2015, '1970-01-01 00:00:02');
INSERT INTO `content` (`id`, `title`, `description`, `img_url`, `trailer_url`, `format`, `release_date`, `create_date`) VALUES (98, '\"Ant-Man\"', 'Armed with the astonishing ability to shrink in scale but increase in strength, master thief Scott Lang must embrace his inner-hero and help his mentor, Doctor Hank Pym, protect the secret behind his spectacular Ant-Man suit from a new generation of towering threats. Against seemingly insurmountable obstacles, Pym and Lang must plan and pull off a heist that will save the world.', 'https://image.tmdb.org/t/p/w1280/D6e8RJf2qUstnfkTslTXNTUAlT.jpg', 'pWdKf3MneyI', 1, 2015, '1970-01-01 00:00:02');
INSERT INTO `content` (`id`, `title`, `description`, `img_url`, `trailer_url`, `format`, `release_date`, `create_date`) VALUES (99, '\"Creed\"', 'The former World Heavyweight Champion Rocky Balboa serves as a trainer and mentor to Adonis Johnson, the son of his late friend and former rival Apollo Creed.', 'https://image.tmdb.org/t/p/w1280/hKzhV274pkZBSpXfCjUyzbyYKLl.jpg', 'Uv554B7YHk4', 1, 2015, '1970-01-01 00:00:02');
INSERT INTO `content` (`id`, `title`, `description`, `img_url`, `trailer_url`, `format`, `release_date`, `create_date`) VALUES (100, '\"The Revenant\"', 'In the 1820s, a frontiersman, Hugh Glass, sets out on a path of vengeance against those who left him for dead after a bear mauling.', 'https://image.tmdb.org/t/p/w1280/oXUWEc5i3wYyFnL1Ycu8ppxxPvs.jpg', 'QRfj1VCg16Y', 1, 2015, '1970-01-01 00:00:02');
INSERT INTO `content` (`id`, `title`, `description`, `img_url`, `trailer_url`, `format`, `release_date`, `create_date`) VALUES (101, '\"Straight Outta Compton\"', 'In 1987, five young men, using brutally honest rhymes and hardcore beats, put their frustration and anger about life in the most dangerous place in America into the most powerful weapon they had: their music. Taking us back to where it all began, Straight Outta Compton tells the true story of how these cultural rebels—armed only with their lyrics, swagger, bravado and raw talent—stood up to the authorities that meant to keep them down and formed the world’s most dangerous group, N.W.A. And as they spoke the truth that no one had before and exposed life in the hood, their voice ignited a social revolution that is still reverberating today.', 'https://image.tmdb.org/t/p/w1280/X7S1RtotXOZNV7OlgCfh5VKZSB.jpg', 'rsbWEF1Sju0', 1, 2015, '1970-01-01 00:00:02');
INSERT INTO `content` (`id`, `title`, `description`, `img_url`, `trailer_url`, `format`, `release_date`, `create_date`) VALUES (102, '\"Doctor Strange\"', 'After his career is destroyed, a brilliant but arrogant surgeon gets a new lease on life when a sorcerer takes him under her wing and trains him to defend the world against evil.', 'https://image.tmdb.org/t/p/w1280/4PiiNGXj1KENTmCBHeN6Mskj2Fq.jpg', 'HSzx-zryEgM', 1, 2016, '1970-01-01 00:00:02');
INSERT INTO `content` (`id`, `title`, `description`, `img_url`, `trailer_url`, `format`, `release_date`, `create_date`) VALUES (103, '\"Fences\"', 'In 1950s Pittsburgh, a frustrated African-American father struggles with the constraints of poverty, racism, and his own inner demons as he tries to raise a family.', 'https://image.tmdb.org/t/p/w1280/yZFBqealET1TunuVvu4YzcM1orT.jpg', 'a2m6Jvp0bUw', 1, 2016, '1970-01-01 00:00:02');
INSERT INTO `content` (`id`, `title`, `description`, `img_url`, `trailer_url`, `format`, `release_date`, `create_date`) VALUES (104, '\"Spider-man: Homecoming\"', 'Following the events of Captain America: Civil War, Peter Parker, with the help of his mentor Tony Stark, tries to balance his life as an ordinary high school student in Queens, New York City, with fighting crime as his superhero alter ego Spider-Man as a new threat, the Vulture, emerges.\n', 'https://image.tmdb.org/t/p/w1280/c24sv2weTHPsmDa7jEMN0m2P3RT.jpg', 'rk-dF1lIbIg', 1, 2017, '1970-01-01 00:00:02');
INSERT INTO `content` (`id`, `title`, `description`, `img_url`, `trailer_url`, `format`, `release_date`, `create_date`) VALUES (105, '\"The Shape of Water\"', 'An other-worldly story, set against the backdrop of Cold War era America circa 1962, where a mute janitor working at a lab falls in love with an amphibious man being held captive there and devises a plan to help him escape.', 'https://image.tmdb.org/t/p/w1280/vyNMUcdrbWnCSg3evCxuvdKPB5t.jpg', 'XFYWazblaUA', 1, 2017, '1970-01-01 00:00:02');
INSERT INTO `content` (`id`, `title`, `description`, `img_url`, `trailer_url`, `format`, `release_date`, `create_date`) VALUES (106, '\"Lady Bird\"', 'A California high school student plans to escape from her family and small town by going to college in New York, much to the disapproval of wildly loving, deeply opinionated and strong-willed mother.', 'https://image.tmdb.org/t/p/w1280/iySFtKLrWvVzXzlFj7x1zalxi5G.jpg', 'cNi_HC839Wo', 1, 2017, '1970-01-01 00:00:02');
INSERT INTO `content` (`id`, `title`, `description`, `img_url`, `trailer_url`, `format`, `release_date`, `create_date`) VALUES (107, '\"Get Out\"', 'Chris and his girlfriend Rose go upstate to visit her parents for the weekend. At first, Chris reads the family\'s overly accommodating behavior as nervous attempts to deal with their daughter\'s interracial relationship, but as the weekend progresses, a series of increasingly disturbing discoveries lead him to a truth that he never could have imagined.', 'https://image.tmdb.org/t/p/w1280/rdPGUJhadPg7FGFNzavib0iwTor.jpg', 'sRfnevzM9kQ', 1, 2017, '1970-01-01 00:00:02');
INSERT INTO `content` (`id`, `title`, `description`, `img_url`, `trailer_url`, `format`, `release_date`, `create_date`) VALUES (108, '\"Wonder Woman\"', 'An Amazon princess comes to the world of Man in the grips of the First World War to confront the forces of evil and bring an end to human conflict.', 'https://image.tmdb.org/t/p/w1280/imekS7f1OuHyUP2LAiTEM0zBzUz.jpg', '1Q8fG0TtVAY', 1, 2017, '1970-01-01 00:00:02');
INSERT INTO `content` (`id`, `title`, `description`, `img_url`, `trailer_url`, `format`, `release_date`, `create_date`) VALUES (109, '\"Avengers: Infinity War\"', 'As the Avengers and their allies have continued to protect the world from threats too large for any one hero to handle, a new danger has emerged from the cosmic shadows: Thanos. A despot of intergalactic infamy, his goal is to collect all six Infinity Stones, artifacts of unimaginable power, and use them to inflict his twisted will on all of reality. Everything the Avengers have fought for has led up to this moment - the fate of Earth and existence itself has never been more uncertain.\n', 'https://image.tmdb.org/t/p/w1280/7WsyChQLEftFiDOVTGkv3hFpyyt.jpg', '6ZfuNTqbHE8', 1, 2018, '1970-01-01 00:00:02');
INSERT INTO `content` (`id`, `title`, `description`, `img_url`, `trailer_url`, `format`, `release_date`, `create_date`) VALUES (110, '\"Black Panther\"', 'King T\'Challa returns home from America to the reclusive, technologically advanced African nation of Wakanda to serve as his country\'s new leader. However, T\'Challa soon finds that he is challenged for the throne by factions within his own country as well as without. Using powers reserved to Wakandan kings, T\'Challa assumes the Black Panther mantel to join with girlfriend Nakia, the queen-mother, his princess-kid sister, members of the Dora Milaje (the Wakandan \'special forces\') and an American secret agent, to prevent Wakanda from being dragged into a world war.', 'https://image.tmdb.org/t/p/w1280/pO01sYiYyP2qDlp2bLj2E5IyqC5.jpg', 'xjDjIWPwcPU', 1, 2018, '1970-01-01 00:00:02');
INSERT INTO `content` (`id`, `title`, `description`, `img_url`, `trailer_url`, `format`, `release_date`, `create_date`) VALUES (111, '\"Crazy Rich Asians\"', 'An American-born Chinese economics professor accompanies her boyfriend to Singapore for his best friend\'s wedding, only to get thrust into the lives of Asia\'s rich and famous.', 'https://image.tmdb.org/t/p/w1280/1XxL4LJ5WHdrcYcihEZUCgNCpAW.jpg', 'ZQ-YX-5bAs0', 1, 2018, '1970-01-01 00:00:02');
INSERT INTO `content` (`id`, `title`, `description`, `img_url`, `trailer_url`, `format`, `release_date`, `create_date`) VALUES (112, '“Hustlers\"', 'A crew of savvy former strip club employees band together to turn the tables on their Wall Street clients.', 'https://image.tmdb.org/t/p/w1280/zBhv8rsLOfpFW2M5b6wW78Uoojs.jpg', 'P_dfc0iqmig', 1, 2019, '1970-01-01 00:00:02');
INSERT INTO `content` (`id`, `title`, `description`, `img_url`, `trailer_url`, `format`, `release_date`, `create_date`) VALUES (113, '“A Beautiful Day in the Neighborhood”', 'An award-winning cynical journalist, Lloyd Vogel, begrudgingly accepts an assignment to write an Esquire profile piece on the beloved television icon Fred Rogers. After his encounter with Rogers, Vogel\'s perspective on life is transformed.', 'https://image.tmdb.org/t/p/w1280/gk9BPbtPoc9KvGAQPKsJ03YwP9W.jpg', '-VLEPhfEN2M', 1, 2019, '1970-01-01 00:00:02');
INSERT INTO `content` (`id`, `title`, `description`, `img_url`, `trailer_url`, `format`, `release_date`, `create_date`) VALUES (114, '\"Knives Out\"', 'When renowned crime novelist Harlan Thrombey is found dead at his estate just after his 85th birthday, the inquisitive and debonair Detective Benoit Blanc is mysteriously enlisted to investigate. From Harlan\'s dysfunctional family to his devoted staff, Blanc sifts through a web of red herrings and self-serving lies to uncover the truth behind Harlan\'s untimely death.', 'https://image.tmdb.org/t/p/w1280/pThyQovXQrw2m0s9x82twj48Jq4.jpg', 'qGqiHJTsRkQ', 1, 2019, '1970-01-01 00:00:02');
INSERT INTO `content` (`id`, `title`, `description`, `img_url`, `trailer_url`, `format`, `release_date`, `create_date`) VALUES (115, '\"Parasite\"', 'All unemployed, Ki-taek\'s family takes peculiar interest in the wealthy and glamorous Parks for their livelihood until they get entangled in an unexpected incident.', 'https://image.tmdb.org/t/p/w1280/7IiTTgloJzvGI1TAYymCfbfl3vT.jpg', 'isOGD_7hNIY', 1, 2019, '1970-01-01 00:00:02');
INSERT INTO `content` (`id`, `title`, `description`, `img_url`, `trailer_url`, `format`, `release_date`, `create_date`) VALUES (116, '\"Little Women\"', 'Four sisters come of age in America in the aftermath of the Civil War.', 'https://image.tmdb.org/t/p/w1280/mSmiB8XjUnR1GSIljuCPGsk0cwX.jpg', 'AST2-4db4ic', 1, 2019, '1970-01-01 00:00:02');
INSERT INTO `content` (`id`, `title`, `description`, `img_url`, `trailer_url`, `format`, `release_date`, `create_date`) VALUES (117, '\"Marriage Story\"', 'A stage director and an actress struggle through a grueling, coast-to-coast divorce that pushes them to their personal extremes.', 'https://image.tmdb.org/t/p/w1280/pZekG6xabTmZxjmYw10wN84Hp8d.jpg', '492188', 1, 2019, '1970-01-01 00:00:02');
INSERT INTO `content` (`id`, `title`, `description`, `img_url`, `trailer_url`, `format`, `release_date`, `create_date`) VALUES (118, '\"Once Upon a Time…in Hollywood\"', 'Los Angeles, 1969. TV star Rick Dalton, a struggling actor specializing in westerns, and stuntman Cliff Booth, his best friend, try to survive in a constantly changing movie industry. Dalton is the neighbor of the young and promising actress and model Sharon Tate, who has just married the prestigious Polish director Roman Polanski.', 'https://image.tmdb.org/t/p/w1280/8j58iEBw9pOXFD2L0nt0ZXeHviB.jpg', '466272', 1, 2019, '1970-01-01 00:00:02');
INSERT INTO `content` (`id`, `title`, `description`, `img_url`, `trailer_url`, `format`, `release_date`, `create_date`) VALUES (119, '\"The Irishman\"', 'Pennsylvania, 1956. Frank Sheeran, a war veteran of Irish origin who works as a truck driver, accidentally meets mobster Russell Bufalino. Once Frank becomes his trusted man, Bufalino sends him to Chicago with the task of helping Jimmy Hoffa, a powerful union leader related to organized crime, with whom Frank will maintain a close friendship for nearly twenty years.', 'https://image.tmdb.org/t/p/w1280/mbm8k3GFhXS0ROd9AD1gqYbIFbM.jpg', 'X5vxcXGC_f0', 1, 2019, '1970-01-01 00:00:02');
INSERT INTO `content` (`id`, `title`, `description`, `img_url`, `trailer_url`, `format`, `release_date`, `create_date`) VALUES (120, '“CATS\"', 'A tribe of cats called the Jellicles must decide yearly which one will ascend to the Heaviside Layer and come back to a new Jellicle life.', 'https://image.tmdb.org/t/p/w1280/hIJXQFwWskgQcXt2nXMP1zs3Ru9.jpg', 'FtSd844cI7U', 1, 2019, '1970-01-01 00:00:02');
INSERT INTO `content` (`id`, `title`, `description`, `img_url`, `trailer_url`, `format`, `release_date`, `create_date`) VALUES (121, '“The Room”', 'Johnny is a successful banker with great respect for and dedication to the people in his life, especially his future wife Lisa. The happy-go-lucky guy sees his world fall apart when his friends begin to betray him one-by-one.', 'https://image.tmdb.org/t/p/w1280/aUC39cFC2KO8CJ0EV0ijIJRr3PT.jpg', '9-dIdFXeFhs', 1, 2003, '1970-01-01 00:00:02');

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
-- Data for table `favorite_content`
-- -----------------------------------------------------
START TRANSACTION;
USE `midterm_db`;
INSERT INTO `favorite_content` (`user_id`, `content_id`) VALUES (1, 1);
INSERT INTO `favorite_content` (`user_id`, `content_id`) VALUES (1, 2);
INSERT INTO `favorite_content` (`user_id`, `content_id`) VALUES (2, 2);
INSERT INTO `favorite_content` (`user_id`, `content_id`) VALUES (2, 3);
INSERT INTO `favorite_content` (`user_id`, `content_id`) VALUES (3, 3);
INSERT INTO `favorite_content` (`user_id`, `content_id`) VALUES (3, 4);
INSERT INTO `favorite_content` (`user_id`, `content_id`) VALUES (4, 4);
INSERT INTO `favorite_content` (`user_id`, `content_id`) VALUES (4, 5);

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
INSERT INTO `user_genre` (`user_id`, `genre_id`) VALUES (5, 11);

COMMIT;

