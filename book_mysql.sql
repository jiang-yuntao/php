-- phpMyAdmin SQL Dump
-- version 3.4.10.1
-- http://www.phpmyadmin.net
--
-- 主机: localhost
-- 生成日期: 2015 年 03 月 18 日 14:23
-- 服务器版本: 5.5.20
-- PHP 版本: 5.3.10

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `book`
--
CREATE DATABASE IF NOT EXISTS `book` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `book`;

-- --------------------------------------------------------

--
-- 表的结构 `board`
--

DROP TABLE IF EXISTS `board`;
CREATE TABLE IF NOT EXISTS `board` (
  `user` varchar(50) NOT NULL,
  `time` varchar(30) NOT NULL,
  `message` varchar(300) NOT NULL,
  KEY `time` (`time`),
  KEY `time_2` (`time`),
  KEY `user` (`user`),
  KEY `user_2` (`user`),
  KEY `time_3` (`time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `board`
--

INSERT INTO `board` (`user`, `time`, `message`) VALUES
('cpc', '2015-02-13 09:36:37pm', '这里是留言内容1'),
('cpc', '2015-02-13 09:37:18pm', '这里是留言内容2'),
('ceit', '2015-02-13 09:38:28pm', '这里是留言内容3'),
('ceit', '2015-02-13 09:39:59pm', '这里是留言内容4'),
('cpc', '2015-02-13 09:43:08pm', '这里是留言内容5'),
('cpc', '2015-02-13 09:44:43pm', '这里是留言内容6'),
('cpc', '2015-02-13 09:48:30pm', '这里是留言内容7');

-- --------------------------------------------------------

--
-- 表的结构 `book_message`
--

DROP TABLE IF EXISTS `book_message`;
CREATE TABLE IF NOT EXISTS `book_message` (
  `sy` int(15) NOT NULL DEFAULT '0',
  `book_title` varchar(50) DEFAULT NULL,
  `author` varchar(50) DEFAULT NULL,
  `add_time` varchar(50) DEFAULT NULL,
  `type` varchar(50) DEFAULT NULL,
  `money` float DEFAULT NULL,
  `number` int(15) DEFAULT NULL,
  `num` int(10) NOT NULL,
  PRIMARY KEY (`num`),
  KEY `num` (`num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `book_message`
--

INSERT INTO `book_message` (`sy`, `book_title`, `author`, `add_time`, `type`, `money`, `number`, `num`) VALUES
(0, '图书名1', '作者1', '2015-02-13 09:36:37pm', '程序语言', 1, 12, 1),
(0, '图书名2', '作者2', '2015-02-13 09:48:30pm', '程序语言', 12, 3, 2),
(0, '图书名3', '作者3', '2015-02-13 09:36:37pm', '程序语言', 1, 12, 3),
(0, '图书名4', '作者4', '2015-02-13 09:48:30pm', '程序语言', 12, 3, 4),
(0, '图书名5', '作者5', '2015-02-13 09:36:37pm', '程序语言', 1, 12, 5),
(0, '图书名6', '作者6', '2015-02-13 09:48:30pm', '程序语言', 12, 3, 6),
(0, '图书名7', '作者7', '2015-02-13 09:36:37pm', '程序语言', 1, 12, 7),
(0, '图书名8', '作者8', '2015-02-13 09:48:30pm', '程序语言', 12, 3, 8),
(0, '图书名9', '作者9', '2015-02-13 09:36:37pm', '程序语言', 1, 12, 9),
(0, '图书名10', '作者10', '2015-02-13 09:48:30pm', '程序语言', 12, 3, 10),
(0, '图书名11', '作者11', '2015-02-13 09:36:37pm', '程序语言', 1, 12, 11),
(0, '图书名12', '作者12', '2015-02-13 09:48:30pm', '程序语言', 12, 3, 12),
(0, '图书名13', '作者13', '2015-02-13 09:36:37pm', '程序语言', 1, 12, 13),
(0, '图书名14', '作者14', '2015-02-13 09:48:30pm', '程序语言', 12, 3, 14),
(0, '图书名15', '作者15', '2015-02-13 09:36:37pm', '程序语言', 1, 12, 15),
(0, '图书名16', '作者16', '2015-02-13 09:48:30pm', '程序语言', 12, 3, 16);

-- --------------------------------------------------------

--
-- 表的结构 `borrow`
--

DROP TABLE IF EXISTS `borrow`;
CREATE TABLE IF NOT EXISTS `borrow` (
  `user` varchar(20) NOT NULL,
  `book_id` int(15) DEFAULT NULL,
  `time` varchar(30) CHARACTER SET latin1 DEFAULT NULL,
  KEY `user` (`user`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `account` varchar(50) CHARACTER SET latin1 NOT NULL DEFAULT '',
  `password` varchar(50) CHARACTER SET latin1 NOT NULL DEFAULT '',
  `nickname` varchar(50) NOT NULL DEFAULT '',
  `class` varchar(15) CHARACTER SET latin1 NOT NULL DEFAULT '',
  PRIMARY KEY (`account`,`password`,`nickname`,`class`),
  KEY `account` (`account`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `user`
--

INSERT INTO `user` (`account`, `password`, `nickname`, `class`) VALUES
('ceit', 'ceit', 'ceit', '0'),
('cpc', 'cpc', 'me me me', '0'),
('super', 'super', '管理员', '1');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
