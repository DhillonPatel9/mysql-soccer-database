CREATE TABLE `field` (
  `field_id` int NOT NULL AUTO_INCREMENT,
  `park_name` varchar(45) NOT NULL,
  `field_num` int NOT NULL,
  `field_name` varchar(45) NOT NULL,
  PRIMARY KEY (`field_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;

CREATE TABLE `sponsor` (
  `sponsor_id` int NOT NULL AUTO_INCREMENT,
  `sponsor_name` varchar(45) NOT NULL,
  `sponsor_address` varchar(45) NOT NULL,
  `sponsor_email` varchar(45) NOT NULL,
  PRIMARY KEY (`sponsor_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;

CREATE TABLE `team` (
  `team_id` int NOT NULL AUTO_INCREMENT,
  `team_name` varchar(45) NOT NULL,
  `sponsor_id` int NOT NULL,
  PRIMARY KEY (`team_id`),
  KEY `fk_team_sponsor1_idx` (`sponsor_id`),
  CONSTRAINT `fk_team_sponsor1` FOREIGN KEY (`sponsor_id`) REFERENCES `sponsor` (`sponsor_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4;

CREATE TABLE `coach` (
  `coach_id` int NOT NULL AUTO_INCREMENT,
  `first_name` varchar(45) NOT NULL,
  `middle_name` varchar(1) DEFAULT NULL,
  `last_name` varchar(45) NOT NULL,
  `coach_age` int NOT NULL,
  `coach_gender` varchar(45) NOT NULL,
  `coach_type` varchar(15) NOT NULL,
  `team_id` int NOT NULL,
  PRIMARY KEY (`coach_id`),
  KEY `fk_coach_team1_idx` (`team_id`),
  CONSTRAINT `fk_coach_team1` FOREIGN KEY (`team_id`) REFERENCES `team` (`team_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4;

CREATE TABLE `matches` (
  `match_id` int NOT NULL AUTO_INCREMENT,
  `match_date` date NOT NULL,
  `match_start_time` varchar(4) NOT NULL,
  `home_team_name` varchar(45) NOT NULL,
  `away_team_name` varchar(45) NOT NULL,
  `ref_first_name` varchar(45) NOT NULL,
  `ref_middle_initial` varchar(1) DEFAULT NULL,
  `ref_last_name` varchar(45) NOT NULL,
  `match_score` varchar(5) NOT NULL,
  `winner` varchar(45) NOT NULL,
  `season` varchar(6) NOT NULL,
  `field_id` int NOT NULL,
  PRIMARY KEY (`match_id`),
  KEY `fk_match_field1_idx` (`field_id`),
  CONSTRAINT `fk_match_field1` FOREIGN KEY (`field_id`) REFERENCES `field` (`field_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4;

CREATE TABLE `player` (
  `player_id` int NOT NULL AUTO_INCREMENT,
  `jersey_num` int NOT NULL,
  `first_name` varchar(45) NOT NULL,
  `middle_initial` varchar(1) DEFAULT NULL,
  `last_name` varchar(45) NOT NULL,
  `player_position` varchar(45) NOT NULL,
  `player_age` int NOT NULL,
  `player_gender` varchar(45) NOT NULL,
  `is_team_captain` varchar(1) NOT NULL,
  `team_id` int NOT NULL,
  PRIMARY KEY (`player_id`),
  KEY `fk_player_team1_idx` (`team_id`),
  CONSTRAINT `fk_player_team1` FOREIGN KEY (`team_id`) REFERENCES `team` (`team_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=143 DEFAULT CHARSET=utf8mb4;

-- Add age constraint as this is an adult league.
ALTER TABLE `player`
ADD CONSTRAINT age_check CHECK (player.player_age >=18);

CREATE TABLE `player_match_stats` (
  `player_stats_id` int NOT NULL AUTO_INCREMENT,
  `goals_scored` int NOT NULL,
  `goal_assists` int NOT NULL,
  `possession_percent` int NOT NULL,
  `pass_counts` int NOT NULL,
  `passing_chains` int NOT NULL,
  `tackle_count` int NOT NULL,
  `match_id` int NOT NULL,
  `player_id` int NOT NULL,
  PRIMARY KEY (`player_stats_id`,`match_id`,`player_id`),
  KEY `fk_player_match_stats_match_idx` (`match_id`),
  KEY `fk_player_match_stats_player1_idx` (`player_id`),
  CONSTRAINT `fk_player_match_stats_match` FOREIGN KEY (`match_id`) REFERENCES `matches` (`match_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_player_match_stats_player1` FOREIGN KEY (`player_id`) REFERENCES `player` (`player_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=285 DEFAULT CHARSET=utf8mb4;