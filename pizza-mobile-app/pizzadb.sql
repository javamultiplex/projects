-- phpMyAdmin SQL Dump
-- version 3.5.2.2
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: May 19, 2014 at 04:05 PM
-- Server version: 5.5.27
-- PHP Version: 5.4.7

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `pizzadb`
--

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE IF NOT EXISTS `category` (
  `cat1` varchar(20) COLLATE utf32_bin NOT NULL,
  `cat2` varchar(20) COLLATE utf32_bin NOT NULL,
  `price1` double NOT NULL,
  `price2` double NOT NULL,
  `price3` double NOT NULL,
  `catid` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`catid`),
  KEY `price2` (`price2`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf32 COLLATE=utf32_bin AUTO_INCREMENT=5 ;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`cat1`, `cat2`, `price1`, `price2`, `price3`, `catid`) VALUES
('Veg', 'Treat', 100, 170, 250, 1),
('Non-Veg', 'Special', 130, 200, 300, 2),
('Veg', 'Special', 150, 250, 325, 3),
('Non-Veg', 'Treat', 170, 270, 350, 4);

-- --------------------------------------------------------

--
-- Table structure for table `cityaddress`
--

CREATE TABLE IF NOT EXISTS `cityaddress` (
  `city` varchar(20) COLLATE utf32_bin NOT NULL,
  `address` varchar(200) COLLATE utf32_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_bin;

--
-- Dumping data for table `cityaddress`
--

INSERT INTO `cityaddress` (`city`, `address`) VALUES
('dehradun', 'Rajpur Road'),
('dehradun', 'paciffic mall'),
('Roorkee', 'IIT roorkee');

-- --------------------------------------------------------

--
-- Table structure for table `citylocation`
--

CREATE TABLE IF NOT EXISTS `citylocation` (
  `city` varchar(20) COLLATE utf32_bin NOT NULL,
  `location` varchar(20) COLLATE utf32_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_bin;

--
-- Dumping data for table `citylocation`
--

INSERT INTO `citylocation` (`city`, `location`) VALUES
('dehradun', 'rajpur road'),
('dehradun', 'sahastradhara road'),
('Luknow', 'clock tower'),
('dehradun', 'clement town');

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE IF NOT EXISTS `customer` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(20) COLLATE utf32_bin NOT NULL,
  `Password` varchar(20) COLLATE utf32_bin NOT NULL,
  `Email` varchar(50) COLLATE utf32_bin NOT NULL,
  `Gender` varchar(8) COLLATE utf32_bin NOT NULL,
  `Contact` bigint(13) NOT NULL,
  `Address` varchar(60) COLLATE utf32_bin NOT NULL,
  `Location` varchar(30) COLLATE utf32_bin NOT NULL,
  `City` varchar(10) COLLATE utf32_bin NOT NULL,
  `State` varchar(20) COLLATE utf32_bin NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf32 COLLATE=utf32_bin AUTO_INCREMENT=130 ;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`Id`, `Name`, `Password`, `Email`, `Gender`, `Contact`, `Address`, `Location`, `City`, `State`) VALUES
(1, 'Rohit', 'abcd', 'geurohit.21@gmail.com', 'Male', 9760183803, 'Graphic Era University', 'rajpur road', 'dehradun', 'uttarakhand'),
(128, 'Piyush', '12345', 'abc@gmail.com', 'male', 9837029971, 'clock tower', 'rajpur road', 'dehradun', 'uttarakhand'),
(129, 'harshi', 'abc', 'harshi0906@gmail.com', 'Female', 8533808325, 'dehradun', 'rajpur road', 'dehradun', 'uttarakhand');

-- --------------------------------------------------------

--
-- Table structure for table `offers`
--

CREATE TABLE IF NOT EXISTS `offers` (
  `Id` int(11) NOT NULL,
  `constraints` varchar(100) COLLATE utf32_bin NOT NULL,
  `cat` int(11) NOT NULL,
  `benefits1` varchar(20) COLLATE utf32_bin DEFAULT NULL,
  `benefit2` float NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_bin;

--
-- Dumping data for table `offers`
--

INSERT INTO `offers` (`Id`, `constraints`, `cat`, `benefits1`, `benefit2`) VALUES
(1, 'fxyz,ghy', 1, 'cold', 0),
(2, '200', 2, NULL, 10),
(3, 'fxyz,ghy', 1, 'cold', 0.3);

-- --------------------------------------------------------

--
-- Table structure for table `order`
--

CREATE TABLE IF NOT EXISTS `order` (
  `Order_id` int(11) NOT NULL AUTO_INCREMENT,
  `Date` varchar(30) COLLATE utf32_bin NOT NULL,
  `Order_Details` varchar(200) COLLATE utf32_bin NOT NULL,
  `Total_price` decimal(10,0) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `Type` varchar(10) COLLATE utf32_bin NOT NULL,
  `Address` varchar(30) COLLATE utf32_bin NOT NULL,
  `Location` varchar(20) COLLATE utf32_bin NOT NULL,
  `city` varchar(20) COLLATE utf32_bin NOT NULL,
  `state` varchar(20) COLLATE utf32_bin NOT NULL,
  PRIMARY KEY (`Order_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf32 COLLATE=utf32_bin AUTO_INCREMENT=2 ;

--
-- Dumping data for table `order`
--

INSERT INTO `order` (`Order_id`, `Date`, `Order_Details`, `Total_price`, `customer_id`, `Type`, `Address`, `Location`, `city`, `state`) VALUES
(1, 'sjd', 'sdkjc', 3342, 1, '', '', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `order_placed`
--

CREATE TABLE IF NOT EXISTS `order_placed` (
  `order_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL,
  `item_list` varchar(500) COLLATE utf32_bin NOT NULL,
  `time` varchar(20) COLLATE utf32_bin NOT NULL,
  `total_cost` float NOT NULL,
  `type` varchar(20) COLLATE utf32_bin NOT NULL,
  `location` varchar(30) COLLATE utf32_bin NOT NULL,
  `city` varchar(20) COLLATE utf32_bin NOT NULL,
  `state` varchar(20) COLLATE utf32_bin NOT NULL,
  `address` varchar(30) COLLATE utf32_bin NOT NULL,
  PRIMARY KEY (`order_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf32 COLLATE=utf32_bin AUTO_INCREMENT=27 ;

--
-- Dumping data for table `order_placed`
--

INSERT INTO `order_placed` (`order_id`, `customer_id`, `item_list`, `time`, `total_cost`, `type`, `location`, `city`, `state`, `address`) VALUES
(13, 1, '   fxyz    13     01    13.0   fgt    13     01    13.0', 'Thu May 08 13:56:57 ', 26, 'Home Delivery', 'rajpur road', 'dehradun', 'uttarakhand', '213'),
(15, 1, 'Name,QTY,Unit Price,Price;fxyz,13,01,13.0;fgt,13,01,13.0', 'Thu May 08 14:22:31 ', 26, 'Home Delivery', 'rajpur road', 'dehradun', 'uttarakhand', '122'),
(16, 1, 'Name,QTY,Unit Price,Price;ghy,13,01,13.0;ghy,13,01,13.0;fxyz,13,01,13.0', 'Mon May 12 13:55:11 ', 39.6, 'Home Delivery', 'rajpur road', 'dehradun', 'uttarakhand', '4'),
(17, 1, 'Name,QTY,Unit Price,Price;fxyz,13,10,130.0', 'Tue May 13 19:05:59 ', 130, 'home delivery', '', '', '', ''),
(18, 1, 'Name,QTY,Unit Price,Price;fxyz,13,10,130.0;fxyz,17,10,170.0', 'Tue May 13 19:42:06 ', 300, 'take away', '', '', '', ''),
(19, 1, 'Name,QTY,Unit Price,Price;fxyz,13,10,130.0', 'Tue May 13 19:45:25 ', 0, 'take away', '', '', '', ''),
(20, 1, 'Name,QTY,Unit Price,Price', 'Fri May 16 10:11:47 ', 0, 'take away', '', '', '', ''),
(21, 1, 'Name,QTY,Unit Price,Price', 'Sat May 17 10:51:26 ', 0, 'take away', '', '', '', ''),
(22, 1, 'Name,QTY,Unit Price,Price;Spicy Delight,100,1,100.0;Spicy Delight,170,1,170.0', 'Sat May 17 05:30:36 ', 270, 'home delivery', '', '', '', ''),
(23, 1, 'Name,QTY,Unit Price,Price', 'Mon May 19 13:23:13 ', 0, 'take away', '', '', '', ''),
(24, 1, 'Name,QTY,Unit Price,Price;Spicy Delight,100,1,100.0;Spicy Delight,170,1,170.0;Spicy Delight,100,1,100.0;Spicy Delight,170,1,170.0;Spicy Delight,100,1,100.0;Spicy Delight,170,1,170.0', 'Mon May 19 13:24:39 ', 810, 'Home Delivery', 'clock tower', 'Luknow', 'Uttar pradesh', ''),
(25, 1, 'Name,QTY,Unit Price,Price', 'Mon May 19 14:08:08 ', 0, 'Home Delivery', 'rajpur road', 'dehradun', 'uttarakhand', ''),
(26, 1, 'Name,QTY,Unit Price,Price', 'Mon May 19 14:28:53 ', 0, 'take away', '', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `pizza`
--

CREATE TABLE IF NOT EXISTS `pizza` (
  `Id` int(15) NOT NULL AUTO_INCREMENT,
  `Name` varchar(20) COLLATE utf32_bin NOT NULL,
  `catid` int(11) NOT NULL,
  `Description` varchar(100) COLLATE utf32_bin NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf32 COLLATE=utf32_bin AUTO_INCREMENT=9 ;

--
-- Dumping data for table `pizza`
--

INSERT INTO `pizza` (`Id`, `Name`, `catid`, `Description`) VALUES
(1, 'Spicy Delight', 1, 'mushroom, cheese, onion'),
(2, 'Keema Do Pyaza', 2, 'onion, tomato'),
(3, 'Farm House', 1, 'corn, mushroom'),
(4, 'Chicken Maxicon', 2, 'Spicy Chicken, Tomato'),
(5, 'Peppy Panner', 3, 'Paneer, Onion'),
(6, 'Maxicon Green Wave', 3, 'Capsicom, Tomato'),
(7, 'Zesty Chicken', 4, 'Chicken, Extra Cheese'),
(8, 'Chicken Delight', 4, 'Chicken Sausages, Barbeque Chicken');

-- --------------------------------------------------------

--
-- Table structure for table `side`
--

CREATE TABLE IF NOT EXISTS `side` (
  `Id` int(11) NOT NULL,
  `Name` varchar(20) COLLATE utf32_bin NOT NULL,
  `cat` varchar(20) COLLATE utf32_bin NOT NULL,
  `price1` double NOT NULL,
  `price2` double DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_bin;

--
-- Dumping data for table `side`
--

INSERT INTO `side` (`Id`, `Name`, `cat`, `price1`, `price2`) VALUES
(1, 'cold', 'veg', 30, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `statecity`
--

CREATE TABLE IF NOT EXISTS `statecity` (
  `state` varchar(20) COLLATE utf32_bin NOT NULL,
  `city` varchar(20) COLLATE utf32_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_bin;

--
-- Dumping data for table `statecity`
--

INSERT INTO `statecity` (`state`, `city`) VALUES
('uttarakhand', 'dehradun'),
('uttarakhand', 'Roorkee'),
('Uttar pradesh', 'Luknow');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
