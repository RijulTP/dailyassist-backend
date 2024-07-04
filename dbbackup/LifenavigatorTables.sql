
DROP TABLE IF EXISTS `habit_challenges`;
CREATE TABLE `habit_challenges` (
  `challenge_id` int NOT NULL AUTO_INCREMENT,
  `habit_id` int NOT NULL,
  `day` int NOT NULL,
  `challenge_name` text NOT NULL,
  PRIMARY KEY (`challenge_id`),
  KEY `habit_id` (`habit_id`),
  CONSTRAINT `habit_challenges_ibfk_1` FOREIGN KEY (`habit_id`) REFERENCES `habits` (`habit_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DROP TABLE IF EXISTS `habit_progress`;
CREATE TABLE `habit_progress` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `habit_id` int NOT NULL,
  `last_completed_day` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `habit_id` (`habit_id`),
  CONSTRAINT `habit_progress_ibfk_1` FOREIGN KEY (`habit_id`) REFERENCES `habits` (`habit_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



DROP TABLE IF EXISTS `habit_record`;
CREATE TABLE `habit_record` (
  `record_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `habit_id` int NOT NULL,
  `challenge_id` int NOT NULL,
  PRIMARY KEY (`record_id`),
  KEY `habit_id` (`habit_id`),
  KEY `challenge_id` (`challenge_id`),
  CONSTRAINT `habit_record_ibfk_1` FOREIGN KEY (`habit_id`) REFERENCES `habits` (`habit_id`),
  CONSTRAINT `habit_record_ibfk_2` FOREIGN KEY (`challenge_id`) REFERENCES `habit_challenges` (`challenge_id`),
  CONSTRAINT `habit_record_ibfk_3` FOREIGN KEY (`habit_id`) REFERENCES `habits` (`habit_id`),
  CONSTRAINT `habit_record_ibfk_4` FOREIGN KEY (`challenge_id`) REFERENCES `habit_challenges` (`challenge_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


DROP TABLE IF EXISTS `habits`;
CREATE TABLE `habits` (
  `habit_id` int NOT NULL AUTO_INCREMENT,
  `habit_name` text NOT NULL,
  PRIMARY KEY (`habit_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


DROP TABLE IF EXISTS `survey_choices`;
CREATE TABLE `survey_choices` (
  `choice_id` int NOT NULL AUTO_INCREMENT,
  `survey_question_id` int NOT NULL,
  `choices` text NOT NULL,
  PRIMARY KEY (`choice_id`),
  KEY `survey_question_id` (`survey_question_id`),
  CONSTRAINT `survey_choices_ibfk_1` FOREIGN KEY (`survey_question_id`) REFERENCES `survey_questions` (`survey_question_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


DROP TABLE IF EXISTS `survey_questions`;
CREATE TABLE `survey_questions` (
  `survey_question_id` int NOT NULL AUTO_INCREMENT,
  `survey_id` int NOT NULL,
  `question` text NOT NULL,
  `question_type` text NOT NULL,
  PRIMARY KEY (`survey_question_id`),
  KEY `survey_id` (`survey_id`),
  CONSTRAINT `survey_questions_ibfk_1` FOREIGN KEY (`survey_id`) REFERENCES `surveys` (`survey_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


DROP TABLE IF EXISTS `survey_result`;
CREATE TABLE `survey_result` (
  `result_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `survey_id` int NOT NULL,
  `answer_json` json NOT NULL,
  `survey_response_date` date NOT NULL,
  PRIMARY KEY (`result_id`),
  KEY `survey_id` (`survey_id`),
  CONSTRAINT `survey_result_ibfk_1` FOREIGN KEY (`survey_id`) REFERENCES `surveys` (`survey_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


DROP TABLE IF EXISTS `surveys`;
CREATE TABLE `surveys` (
  `survey_id` int NOT NULL AUTO_INCREMENT,
  `survey_name` text NOT NULL,
  `survey_description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`survey_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


DROP TABLE IF EXISTS `task_set`;
CREATE TABLE `task_set` (
  `task_set_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `date_of_task` date NOT NULL,
  PRIMARY KEY (`task_set_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



DROP TABLE IF EXISTS `tasks`;
CREATE TABLE `tasks` (
  `task_id` int NOT NULL AUTO_INCREMENT,
  `task_set_id` int NOT NULL,
  `task_name` text NOT NULL,
  `task_status` text NOT NULL,
  PRIMARY KEY (`task_id`),
  KEY `task_set_id` (`task_set_id`),
  CONSTRAINT `tasks_ibfk_1` FOREIGN KEY (`task_set_id`) REFERENCES `task_set` (`task_set_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `user_type` varchar(50) NOT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 2024-07-02 18:05:05
