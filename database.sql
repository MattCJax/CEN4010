-- phpMyAdmin SQL Dump
-- version 4.5.4.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Feb 18, 2016 at 05:37 AM
-- Server version: 10.1.9-MariaDB
-- PHP Version: 5.6.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cen4010`
--

-- --------------------------------------------------------

--
-- Table structure for table `breed`
--

CREATE TABLE `breed` (
  `breed_wk` int(11) NOT NULL,
  `pet_type_wk` int(11) NOT NULL,
  `name` varchar(20) NOT NULL,
  `create_dt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `color`
--

CREATE TABLE `color` (
  `color_wk` int(11) NOT NULL,
  `name` varchar(15) NOT NULL,
  `create_dt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `comment`
--

CREATE TABLE `comment` (
  `comment_wk` int(11) NOT NULL,
  `user_wk` int(11) NOT NULL,
  `pet_wk` int(11) NOT NULL,
  `body` text NOT NULL,
  `is_flagged` tinyint(1) NOT NULL DEFAULT '0',
  `create_dt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `image`
--

CREATE TABLE `image` (
  `image_wk` int(11) NOT NULL,
  `pet_wk` int(11) NOT NULL,
  `file_name` varchar(255) NOT NULL,
  `create_dt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `log`
--

CREATE TABLE `log` (
  `log_wk` int(11) NOT NULL,
  `user_wk` int(11) NOT NULL,
  `url` varchar(255) NOT NULL,
  `ip` varchar(45) NOT NULL,
  `create_dt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `page`
--

CREATE TABLE `page` (
  `page_wk` int(11) NOT NULL,
  `name` varchar(20) NOT NULL,
  `body` text NOT NULL,
  `last_update_dt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0',
  `create_dt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `page`
--

INSERT INTO `page` (`page_wk`, `name`, `body`, `last_update_dt`, `is_deleted`, `create_dt`) VALUES
(1, 'Test', 'testing the body', '2016-02-17 22:54:26', 1, '2016-02-17 22:29:37'),
(3, 'Tests', 'testing the create', '2016-02-17 22:30:32', 0, '2016-02-17 22:30:32'),
(5, 'Testsss', 'testing the create', '2016-02-17 22:32:00', 0, '2016-02-17 22:32:00'),
(6, 'Testssss', 'testing the create', '2016-02-17 22:32:00', 0, '2016-02-17 22:32:00'),
(9, 'This is a Test', 'testing the create', '2016-02-17 22:38:17', 0, '2016-02-17 22:38:17');

-- --------------------------------------------------------

--
-- Table structure for table `pet`
--

CREATE TABLE `pet` (
  `pet_wk` int(11) NOT NULL,
  `pet_type_wk` int(11) NOT NULL,
  `breed_wk` int(11) NOT NULL,
  `color_wk` int(11) NOT NULL,
  `status_wk` int(11) NOT NULL,
  `image_wk` int(11) NOT NULL,
  `name` varchar(15) NOT NULL,
  `age` int(2) NOT NULL,
  `weight` float NOT NULL,
  `acquired_dt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `is_rescued` tinyint(1) NOT NULL DEFAULT '0',
  `last_update_dt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0',
  `create_dt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `pet_to_vaccination`
--

CREATE TABLE `pet_to_vaccination` (
  `pet_to_vaccination_wk` int(11) NOT NULL,
  `pet_wk` int(11) NOT NULL,
  `vaccination_wk` int(11) NOT NULL,
  `create_dt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `pet_type`
--

CREATE TABLE `pet_type` (
  `pet_type_wk` int(11) NOT NULL,
  `name` varchar(15) NOT NULL,
  `create_dt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `pet_wish_list`
--

CREATE TABLE `pet_wish_list` (
  `pet_wish_list_wk` int(11) NOT NULL,
  `user_wk` int(11) NOT NULL,
  `pet_wk` int(11) NOT NULL,
  `create_dt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `reset_password`
--

CREATE TABLE `reset_password` (
  `reset_password_wk` int(11) NOT NULL,
  `user_wk` int(11) NOT NULL,
  `random_key` int(11) NOT NULL,
  `create_dt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `is_reset` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `role`
--

CREATE TABLE `role` (
  `role_wk` int(11) NOT NULL,
  `name` varchar(15) NOT NULL,
  `create_dt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `setting`
--

CREATE TABLE `setting` (
  `setting_wk` int(11) NOT NULL,
  `variable_name` varchar(50) NOT NULL,
  `variable_value` varchar(255) NOT NULL,
  `create_dt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `status`
--

CREATE TABLE `status` (
  `status_wk` int(11) NOT NULL,
  `name` varchar(15) NOT NULL,
  `create_dt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `status`
--

INSERT INTO `status` (`status_wk`, `name`, `create_dt`) VALUES
(2, 'blerp', '2016-02-17 22:11:26');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `user_wk` int(11) NOT NULL,
  `role_wk` int(11) NOT NULL,
  `username` varchar(15) NOT NULL,
  `email_address` varchar(50) NOT NULL,
  `hashed_password` varchar(40) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `phone_number` int(10) NOT NULL,
  `is_notifications_enabled` bit(1) NOT NULL DEFAULT b'1',
  `create_dt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_update_dt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0',
  `deleted_dt` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `vaccination`
--

CREATE TABLE `vaccination` (
  `vaccination_wk` int(11) NOT NULL,
  `name` varchar(20) NOT NULL,
  `create_dt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `watch_list`
--

CREATE TABLE `watch_list` (
  `watch_list_wk` int(11) NOT NULL,
  `user_wk` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `last_update_dt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `create_dt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `watch_list_column`
--

CREATE TABLE `watch_list_column` (
  `watch_list_column_entry_wk` int(11) NOT NULL,
  `display_name` varchar(20) NOT NULL,
  `column_name` varchar(40) NOT NULL,
  `create_dt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `watch_list_detail`
--

CREATE TABLE `watch_list_detail` (
  `watch_list_detail_wk` int(11) NOT NULL,
  `watch_list_wk` int(11) NOT NULL,
  `watch_list_column_entry_wk` int(11) NOT NULL,
  `value1` varchar(20) NOT NULL,
  `value2` int(11) DEFAULT NULL,
  `create_dt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `breed`
--
ALTER TABLE `breed`
  ADD PRIMARY KEY (`breed_wk`),
  ADD UNIQUE KEY `name` (`name`),
  ADD KEY `pet_type_wk` (`pet_type_wk`),
  ADD KEY `create_dt` (`create_dt`);

--
-- Indexes for table `color`
--
ALTER TABLE `color`
  ADD PRIMARY KEY (`color_wk`),
  ADD UNIQUE KEY `name` (`name`),
  ADD KEY `create_dt` (`create_dt`);

--
-- Indexes for table `comment`
--
ALTER TABLE `comment`
  ADD PRIMARY KEY (`comment_wk`),
  ADD KEY `user_wk` (`user_wk`),
  ADD KEY `pet_wk` (`pet_wk`),
  ADD KEY `create_dt` (`create_dt`),
  ADD KEY `is_flagged` (`is_flagged`);

--
-- Indexes for table `image`
--
ALTER TABLE `image`
  ADD PRIMARY KEY (`image_wk`),
  ADD UNIQUE KEY `file_name` (`file_name`),
  ADD KEY `pet_wk` (`pet_wk`),
  ADD KEY `create_dt` (`create_dt`),
  ADD KEY `is_deleted` (`is_deleted`);

--
-- Indexes for table `log`
--
ALTER TABLE `log`
  ADD PRIMARY KEY (`log_wk`),
  ADD KEY `user_wk` (`user_wk`),
  ADD KEY `create_dt` (`create_dt`);

--
-- Indexes for table `page`
--
ALTER TABLE `page`
  ADD PRIMARY KEY (`page_wk`),
  ADD UNIQUE KEY `name` (`name`),
  ADD KEY `last_update_dt` (`last_update_dt`),
  ADD KEY `is_deleted` (`is_deleted`),
  ADD KEY `create_dt` (`create_dt`);

--
-- Indexes for table `pet`
--
ALTER TABLE `pet`
  ADD PRIMARY KEY (`pet_wk`),
  ADD KEY `pet_type_wk` (`pet_type_wk`),
  ADD KEY `breed_wk` (`breed_wk`),
  ADD KEY `color_wk` (`color_wk`),
  ADD KEY `status_wk` (`status_wk`),
  ADD KEY `is_deleted` (`is_deleted`),
  ADD KEY `create_dt` (`create_dt`);

--
-- Indexes for table `pet_to_vaccination`
--
ALTER TABLE `pet_to_vaccination`
  ADD PRIMARY KEY (`pet_to_vaccination_wk`),
  ADD KEY `pet_wk` (`pet_wk`),
  ADD KEY `vaccination_wk` (`vaccination_wk`),
  ADD KEY `is_deleted` (`is_deleted`),
  ADD KEY `create_dt` (`create_dt`);

--
-- Indexes for table `pet_type`
--
ALTER TABLE `pet_type`
  ADD PRIMARY KEY (`pet_type_wk`),
  ADD UNIQUE KEY `name` (`name`),
  ADD KEY `create_dt` (`create_dt`);

--
-- Indexes for table `pet_wish_list`
--
ALTER TABLE `pet_wish_list`
  ADD PRIMARY KEY (`pet_wish_list_wk`),
  ADD KEY `user_wk` (`user_wk`),
  ADD KEY `pet_wk` (`pet_wk`),
  ADD KEY `create_dt` (`create_dt`),
  ADD KEY `is_deleted` (`is_deleted`);

--
-- Indexes for table `reset_password`
--
ALTER TABLE `reset_password`
  ADD PRIMARY KEY (`reset_password_wk`),
  ADD UNIQUE KEY `random_key` (`random_key`),
  ADD KEY `user_wk` (`user_wk`),
  ADD KEY `request_dt` (`create_dt`);

--
-- Indexes for table `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`role_wk`),
  ADD UNIQUE KEY `name` (`name`),
  ADD KEY `create_dt` (`create_dt`);

--
-- Indexes for table `setting`
--
ALTER TABLE `setting`
  ADD PRIMARY KEY (`setting_wk`),
  ADD UNIQUE KEY `variable_name` (`variable_name`);

--
-- Indexes for table `status`
--
ALTER TABLE `status`
  ADD PRIMARY KEY (`status_wk`),
  ADD UNIQUE KEY `name` (`name`),
  ADD KEY `create_dt` (`create_dt`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`user_wk`),
  ADD UNIQUE KEY `email_address` (`email_address`,`username`),
  ADD KEY `deleted_dt` (`deleted_dt`),
  ADD KEY `is_deleted` (`is_deleted`),
  ADD KEY `create_dt` (`create_dt`),
  ADD KEY `role_wk` (`role_wk`);

--
-- Indexes for table `vaccination`
--
ALTER TABLE `vaccination`
  ADD PRIMARY KEY (`vaccination_wk`),
  ADD UNIQUE KEY `name` (`name`),
  ADD KEY `create_dt` (`create_dt`);

--
-- Indexes for table `watch_list`
--
ALTER TABLE `watch_list`
  ADD PRIMARY KEY (`watch_list_wk`),
  ADD KEY `user_wk` (`user_wk`),
  ADD KEY `create_dt` (`create_dt`),
  ADD KEY `is_deleted` (`is_deleted`);

--
-- Indexes for table `watch_list_column`
--
ALTER TABLE `watch_list_column`
  ADD PRIMARY KEY (`watch_list_column_entry_wk`),
  ADD UNIQUE KEY `display_name` (`display_name`),
  ADD KEY `create_dt` (`create_dt`),
  ADD KEY `is_deleted` (`is_deleted`);

--
-- Indexes for table `watch_list_detail`
--
ALTER TABLE `watch_list_detail`
  ADD PRIMARY KEY (`watch_list_detail_wk`),
  ADD KEY `watch_list_wk` (`watch_list_wk`),
  ADD KEY `watch_list_column_entry_wk` (`watch_list_column_entry_wk`),
  ADD KEY `create_dt` (`create_dt`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `breed`
--
ALTER TABLE `breed`
  MODIFY `breed_wk` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `color`
--
ALTER TABLE `color`
  MODIFY `color_wk` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `comment`
--
ALTER TABLE `comment`
  MODIFY `comment_wk` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `image`
--
ALTER TABLE `image`
  MODIFY `image_wk` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `log`
--
ALTER TABLE `log`
  MODIFY `log_wk` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `page`
--
ALTER TABLE `page`
  MODIFY `page_wk` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `pet`
--
ALTER TABLE `pet`
  MODIFY `pet_wk` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `pet_to_vaccination`
--
ALTER TABLE `pet_to_vaccination`
  MODIFY `pet_to_vaccination_wk` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `pet_type`
--
ALTER TABLE `pet_type`
  MODIFY `pet_type_wk` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `pet_wish_list`
--
ALTER TABLE `pet_wish_list`
  MODIFY `pet_wish_list_wk` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `reset_password`
--
ALTER TABLE `reset_password`
  MODIFY `reset_password_wk` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `role`
--
ALTER TABLE `role`
  MODIFY `role_wk` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `setting`
--
ALTER TABLE `setting`
  MODIFY `setting_wk` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `status`
--
ALTER TABLE `status`
  MODIFY `status_wk` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `user_wk` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `vaccination`
--
ALTER TABLE `vaccination`
  MODIFY `vaccination_wk` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `watch_list`
--
ALTER TABLE `watch_list`
  MODIFY `watch_list_wk` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `watch_list_column`
--
ALTER TABLE `watch_list_column`
  MODIFY `watch_list_column_entry_wk` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `watch_list_detail`
--
ALTER TABLE `watch_list_detail`
  MODIFY `watch_list_detail_wk` int(11) NOT NULL AUTO_INCREMENT;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
