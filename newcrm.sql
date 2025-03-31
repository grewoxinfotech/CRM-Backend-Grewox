-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 31, 2025 at 02:53 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `newcrm`
--

-- --------------------------------------------------------

--
-- Table structure for table `accounts`
--

CREATE TABLE `accounts` (
  `id` varchar(255) NOT NULL,
  `bankHolderName` varchar(255) NOT NULL,
  `bankName` varchar(255) NOT NULL,
  `accountNumber` varchar(255) NOT NULL,
  `openingBalance` decimal(10,2) NOT NULL,
  `contactNumber` varchar(255) NOT NULL,
  `bankAddress` varchar(255) NOT NULL,
  `client_id` varchar(255) DEFAULT NULL,
  `created_by` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `activities`
--

CREATE TABLE `activities` (
  `id` varchar(255) NOT NULL,
  `related_id` varchar(255) NOT NULL,
  `activity_from` varchar(255) NOT NULL,
  `activity_id` varchar(255) NOT NULL,
  `action` varchar(255) NOT NULL,
  `performed_by` varchar(255) NOT NULL,
  `activity_message` varchar(255) NOT NULL,
  `client_id` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `allowanceoptions`
--

CREATE TABLE `allowanceoptions` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `client_id` varchar(255) NOT NULL,
  `created_by` varchar(255) DEFAULT NULL,
  `updated_by` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `allowances`
--

CREATE TABLE `allowances` (
  `id` varchar(255) NOT NULL,
  `employeeId` varchar(255) NOT NULL,
  `allowanceOption` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `currency` varchar(255) NOT NULL,
  `amount` int(11) NOT NULL,
  `client_id` varchar(255) NOT NULL,
  `created_by` varchar(255) DEFAULT NULL,
  `updated_by` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `announcements`
--

CREATE TABLE `announcements` (
  `id` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `branch` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`branch`)),
  `time` varchar(255) NOT NULL,
  `date` varchar(255) NOT NULL,
  `client_id` varchar(255) DEFAULT NULL,
  `created_by` varchar(255) DEFAULT NULL,
  `updated_by` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `appraisals`
--

CREATE TABLE `appraisals` (
  `id` varchar(255) NOT NULL,
  `employee` varchar(255) NOT NULL,
  `branch` varchar(255) NOT NULL,
  `businessProcess` int(11) NOT NULL,
  `oralCommunication` int(11) NOT NULL,
  `leadership` int(11) NOT NULL,
  `projectManagement` int(11) NOT NULL,
  `allocatingResources` int(11) NOT NULL,
  `overallRating` int(11) NOT NULL,
  `client_id` varchar(255) DEFAULT NULL,
  `created_by` varchar(255) DEFAULT NULL,
  `updated_by` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `attendances`
--

CREATE TABLE `attendances` (
  `id` varchar(255) NOT NULL,
  `employee` varchar(255) NOT NULL,
  `date` date NOT NULL,
  `startTime` time DEFAULT NULL,
  `endTime` time DEFAULT NULL,
  `late` varchar(255) DEFAULT NULL,
  `halfDay` tinyint(1) DEFAULT 0,
  `client_id` varchar(255) DEFAULT NULL,
  `created_by` varchar(255) DEFAULT NULL,
  `updated_by` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `audittrails`
--

CREATE TABLE `audittrails` (
  `id` varchar(255) NOT NULL,
  `url` varchar(255) NOT NULL,
  `activity` varchar(255) NOT NULL,
  `params` varchar(255) NOT NULL,
  `query` varchar(255) NOT NULL,
  `payload` varchar(255) NOT NULL,
  `response` varchar(255) NOT NULL,
  `duration` varchar(255) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `audittrails`
--

INSERT INTO `audittrails` (`id`, `url`, `activity`, `params`, `query`, `payload`, `response`, `duration`, `createdAt`, `updatedAt`) VALUES
('03lDwbJ52iHEtBRlI1bWovS', '/api/v1/currencies?page=1&limit=100', 'GET api/v1/currencies?page=1&limit=100', '{}', '{\"page\":1,\"limit\":100}', '{}', '{\"success\":true,\"message\":\"Currencies fetched successfully\",\"data\":[{\"id\":\"29gCwt8wWQg7CPgG96847iD\",\"currencyName\":\"Euro\",\"currencyIcon\":\"€\",\"currencyCode\":\"EUR\",\"created_by\":null,\"updated_by\":null,\"createdAt\":\"2025-03-31T04:23:06.000Z\",\"updatedAt\":\"2025-', '0.03 seconds', '2025-03-31 18:05:19', '2025-03-31 18:05:19'),
('0cGiOxgNDi2qw5aabDlodnV', '/api/v1/clients', 'GET api/v1/clients', '{}', '{}', '{}', '{\"success\":true,\"message\":\"Clients fetched successfully\",\"data\":[{\"conversations\":{},\"id\":\"7aRxfVTXsxd31PyBz9WzEjx\",\"employeeId\":null,\"username\":\"Quantum Enterprises\",\"password\":\"$2b$12$OCduts6PI5L0YSEOVKT73uvS2zlUOaAPNMKWIxOO8tA/YpS1K.TRS\",\"email\":\"quant', '0.00 seconds', '2025-03-31 09:34:44', '2025-03-31 09:34:44'),
('0gnDeNbGQvLCV8e3QKWQinD', '/api/v1/sub-clients', 'GET api/v1/sub-clients', '{}', '{}', '{}', '{\"success\":true,\"message\":\"SubClients fetched successfully\",\"data\":[{\"conversations\":{},\"id\":\"9VDWw1NRr3hnVRf82reZODt\",\"employeeId\":null,\"username\":\"Quantum Innovations\",\"password\":\"$2b$12$mn0gG674rbqCn0UiYh7kuuZPDY.iZquWfgnPbgjYrwphrOOTtty86\",\"email\":\"qu', '0.03 seconds', '2025-03-31 17:13:27', '2025-03-31 17:13:27'),
('0hRrbiD8iNGJ0kOORBBWwQl', '/api/v1/projects', 'GET api/v1/projects', '{}', '{}', '{}', '{\"success\":true,\"message\":\"Projects fetched successfully\",\"data\":[]}', '0.03 seconds', '2025-03-31 10:48:55', '2025-03-31 10:48:55'),
('0Kw2iMoeWtl5y97fhOOzjrk', '/api/v1/stages', 'GET api/v1/stages', '{}', '{}', '{}', '{\"success\":true,\"message\":\"Stages fetched successfully\",\"data\":[{\"id\":\"1j1Mfax4tYdOONQGLA23CeQ\",\"stageType\":\"deal\",\"stageName\":\"Lead Received\",\"pipeline\":\"iiUsXOteVUFiCIMkgR6DObO\",\"client_id\":\"4kykUHcg5oLrhNDkfCLNYYG\",\"created_by\":\"Silverline Systems\",\"up', '0.01 seconds', '2025-03-31 10:30:48', '2025-03-31 10:30:48'),
('0LghUg94hOfePhGu3AEs7D4', '/api/v1/leads', 'GET api/v1/leads', '{}', '{}', '{}', '{\"success\":true,\"message\":\"Lead fetched successfully\",\"data\":[{\"id\":\"31LINvHYSM5u4avuq7Wrjlh\",\"leadTitle\":\"TechPro Solutions Website Modernization\",\"leadStage\":\"eTzCUBr5Y232i82lxUoP9vJ\",\"currency\":\"INR\",\"leadValue\":850000,\"company_name\":\" TechPro Solution', '0.04 seconds', '2025-03-31 17:48:23', '2025-03-31 17:48:23'),
('0LMCynfGFDCNK7tSWdI3n7b', '/api/v1/clients', 'GET api/v1/clients', '{}', '{}', '{}', '{\"success\":true,\"message\":\"Clients fetched successfully\",\"data\":[{\"conversations\":{},\"id\":\"4kykUHcg5oLrhNDkfCLNYYG\",\"employeeId\":null,\"username\":\"Silverline Systems\",\"password\":\"$2b$12$.2Ia/XUZHrA7BEsLyf6uGuo9wgP9rGamovaR/ICL6YHHBDXVI5nIy\",\"email\":\"silver', '0.01 seconds', '2025-03-31 10:13:59', '2025-03-31 10:13:59'),
('0NP3hOL65cToM78kZJarV9u', '/api/v1/auth/verify-signup', 'POST api/v1/auth/verify-signup', '{}', '{}', '{\"otp\":\"395496\"}', '{\"success\":true,\"message\":\"Registration completed successfully\",\"data\":{\"success\":true,\"token\":\"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjBhTVRPUlEyN3dHMDBIdDVSRWhxMTNwIiwicm9sZSI6IkJ1c2luZXNzIEFuYWx5c3QiLCJpYXQiOjE3NDM0MDA4ODcsImV4cCI6MTc0MzQ4NzI4N3', '3.21 seconds', '2025-03-31 11:31:30', '2025-03-31 11:31:30'),
('0r30rvqzZmxfEtrg60VpG2k', '/api/v1/currencies?', 'GET api/v1/currencies?', '{}', '{}', '{}', '{\"success\":true,\"message\":\"Currencies fetched successfully\",\"data\":[{\"id\":\"29gCwt8wWQg7CPgG96847iD\",\"currencyName\":\"Euro\",\"currencyIcon\":\"€\",\"currencyCode\":\"EUR\",\"created_by\":null,\"updated_by\":null,\"createdAt\":\"2025-03-31T04:23:06.000Z\",\"updatedAt\":\"2025-', '0.04 seconds', '2025-03-31 15:54:49', '2025-03-31 15:54:49'),
('10CyLW4hs8AA4xf1XM5yM1c', '/api/v1/auth', 'GET api/v1/auth', '{}', '{}', '{}', '{\"success\":true,\"message\":\"Users fetched successfully\",\"data\":[{\"conversations\":{},\"id\":\"0aMTORQ27wG00Ht5REhq13p\",\"employeeId\":null,\"username\":\" ba.silverline\",\"password\":\"$2b$12$NT.meyBZRWfJve/VLDgQo.bwhzGz1ElPJcoihKL2lokuJpOAqHk6W\",\"email\":\"ba.silverlin', '0.02 seconds', '2025-03-31 14:25:30', '2025-03-31 14:25:30'),
('128gXJFQIdffM4tXMvl8S69', '/api/v1/labels/4kykUHcg5oLrhNDkfCLNYYG', 'GET api/v1/labels/4kykUHcg5oLrhNDkfCLNYYG', '{\"id\":\"4kykUHcg5oLrhNDkfCLNYYG\"}', '{}', '{}', '{\"success\":true,\"message\":\"Tags retrieved successfully\",\"data\":[{\"id\":\"0ga51ZccuIiGGEudOSNNRDJ\",\"related_id\":\"4kykUHcg5oLrhNDkfCLNYYG\",\"lableType\":\"source\",\"name\":\"Phone\",\"color\":\"#34495E\",\"client_id\":\"4kykUHcg5oLrhNDkfCLNYYG\",\"created_by\":\"system\",\"updat', '0.02 seconds', '2025-03-31 17:23:43', '2025-03-31 17:23:43'),
('12ghc45PSEI3vvDj9XoIrFr', '/api/v1/deals/dmciOE2OiF952YsPFd0NPQi', 'PUT api/v1/deals/dmciOE2OiF952YsPFd0NPQi', '{\"id\":\"dmciOE2OiF952YsPFd0NPQi\"}', '{}', '{\"stage\":\"ucHxzJDG8XiUl7sMzJz0OJL\"}', '{\"success\":true,\"message\":\"Deal updated successfully\",\"data\":{\"id\":\"dmciOE2OiF952YsPFd0NPQi\",\"leadTitle\":null,\"firstName\":null,\"lastName\":null,\"email\":null,\"phone\":null,\"dealName\":\"Cloud ERP Implementation\",\"pipeline\":\"iiUsXOteVUFiCIMkgR6DObO\",\"stage\":\"uc', '0.01 seconds', '2025-03-31 17:46:20', '2025-03-31 17:46:20'),
('13qGaTQmbxKtUsHsNMqDLB5', '/api/v1/employees', 'POST api/v1/employees', '{}', '{}', '{\"firstName\":\"Neha \",\"lastName\":\"Singh\",\"username\":\"neha.singh\",\"email\":\"neha.singh.silverline@yopmail.com\",\"password\":\"NehaSinghr@2525\",\"phone\":\"6543210987\",\"address\":\"Silicon Towers\\n567/A Tech Park Road\\nElectronic City Phase 2\\nPune, Maharashtra - 411', '{\"success\":true,\"message\":\"Please verify your email to complete registration\",\"data\":{\"sessionToken\":\"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjRreWtVSGNnNW9McmhORGtmQ0xOWVlHIiwidXNlcm5hbWUiOiJuZWhhLnNpbmdoIiwiZW1haWwiOiJuZWhhLnNpbmdoLnNpbHZlcmxpbmVA', '3.96 seconds', '2025-03-31 12:52:50', '2025-03-31 12:52:50'),
('14YSXh0ekOTr0LFBIxBYhz7', '/api/v1/auth/login', 'POST api/v1/auth/login', '{}', '{}', '{\"login\":\"Silverline Systems\",\"password\":\"SilverlineSystems2525\"}', '{\"success\":true,\"message\":\"Login successful\",\"data\":{\"token\":\"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6IlNpbHZlcmxpbmUgU3lzdGVtcyIsImVtYWlsIjoic2lsdmVybGluZXN5c3RlbXNAeW9wbWFpbC5jb20iLCJwaG9uZSI6bnVsbCwiaWQiOiI0a3lrVUhjZzVvTHJoTkRrZkNMTllZRyIs', '0.33 seconds', '2025-03-31 11:25:23', '2025-03-31 11:25:23'),
('15bQvA9vGN3VhRPFfz6xeGn', '/api/v1/employees', 'POST api/v1/employees', '{}', '{}', '{\"firstName\":\"priya\",\"lastName\":\"patel\",\"username\":\"priya.patel\",\"email\":\"priya.patel.silverline@yopmail.com\",\"password\":\"Priyapatel@2525\",\"phone\":\"8765432109\",\"address\":\"Green Valley Residency\\n45/B Sunflower Lane\\nBehind City Hospital\\nBangalore, Karnat', '{\"success\":true,\"message\":\"Please verify your email to complete registration\",\"data\":{\"sessionToken\":\"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjRreWtVSGNnNW9McmhORGtmQ0xOWVlHIiwidXNlcm5hbWUiOiJwcml5YS5wYXRlbCIsImVtYWlsIjoicHJpeWEucGF0ZWwuc2lsdmVybGlu', '2.71 seconds', '2025-03-31 12:45:02', '2025-03-31 12:45:02'),
('1HJR5w28WeyprDtj6cvosmV', '/api/v1/proposals?page=1&limit=10', 'GET api/v1/proposals?page=1&limit=10', '{}', '{\"page\":\"1\",\"limit\":\"10\"}', '{}', '{\"success\":true,\"message\":\"Proposal fetched successfully\",\"data\":[]}', '0.10 seconds', '2025-03-31 17:21:17', '2025-03-31 17:21:17'),
('1hjySW34Q1gUZDlMrP9Aofc', '/api/v1/leads', 'GET api/v1/leads', '{}', '{}', '{}', '{\"success\":true,\"message\":\"Lead fetched successfully\",\"data\":[{\"id\":\"31LINvHYSM5u4avuq7Wrjlh\",\"leadTitle\":\"TechPro Solutions Website Modernization\",\"leadStage\":\"BYNYLCidEQll0qKymn79W76\",\"currency\":\"INR\",\"leadValue\":850000,\"company_name\":\" TechPro Solution', '0.01 seconds', '2025-03-31 16:57:08', '2025-03-31 16:57:08'),
('1mANDFoK0ph3gC2ebVc5pSc', '/api/v1/taxes', 'GET api/v1/taxes', '{}', '{}', '{}', '{\"success\":true,\"message\":\"Tax fetched successfully\",\"data\":[]}', '0.08 seconds', '2025-03-31 17:21:17', '2025-03-31 17:21:17'),
('1PmLb6lDB329kr0q6V4yOCf', '/api/v1/designations', 'GET api/v1/designations', '{}', '{}', '{}', '{\"success\":true,\"message\":\"Designation fetched successfully\",\"data\":[{\"id\":\"flbhBdf5hBLZTNbwhc12BY7\",\"branch\":\"UH8lBWZZAkctwuRFiCz5PMB\",\"designation_name\":\"HR Manager\",\"client_id\":\"4kykUHcg5oLrhNDkfCLNYYG\",\"created_by\":\"Silverline Systems\",\"updated_by\":nu', '0.04 seconds', '2025-03-31 14:30:48', '2025-03-31 14:30:48'),
('1psFLu5m2jvy6hE1hsFuAWQ', '/api/v1/roles', 'GET api/v1/roles', '{}', '{}', '{}', '{\"success\":true,\"message\":\"Roles fetched successfully\",\"data\":[{\"id\":\"03qarcBedPhsVY3A1IKMMyW\",\"role_name\":\"System Administrator\",\"permissions\":\"{\\\"dashboards-project-list\\\":[{\\\"key\\\":\\\"dashboards-project-list\\\",\\\"permissions\\\":[\\\"view\\\",\\\"create\\\",\\\"upda', '0.01 seconds', '2025-03-31 11:00:14', '2025-03-31 11:00:14'),
('1scIbgfa7JoGcgpNbVfk7nz', '/api/v1/subscriptions?page=1&limit=100&search=', 'GET api/v1/subscriptions?page=1&limit=100&search=', '{}', '{}', '{}', '{\"success\":true,\"message\":\"Plans retrieved successfully\",\"data\":[{\"id\":\"uzptLdgqYFRoK23ORcMgQrg\",\"name\":\"Basic Plan\",\"currency\":\"INR\",\"price\":\"999.00\",\"duration\":\"Per Month\",\"trial_period\":\"7\",\"max_users\":\"5\",\"max_clients\":\"10\",\"max_customers\":\"50\",\"max_v', '0.03 seconds', '2025-03-31 10:47:39', '2025-03-31 10:47:39'),
('1uI9EKzDetqdt54zO1x4x3B', '/api/v1/clients', 'GET api/v1/clients', '{}', '{}', '{}', '{\"success\":true,\"message\":\"Clients fetched successfully\",\"data\":[{\"conversations\":{},\"id\":\"4kykUHcg5oLrhNDkfCLNYYG\",\"employeeId\":null,\"username\":\"Silverline Systems\",\"password\":\"$2b$12$.2Ia/XUZHrA7BEsLyf6uGuo9wgP9rGamovaR/ICL6YHHBDXVI5nIy\",\"email\":\"silver', '0.00 seconds', '2025-03-31 10:48:02', '2025-03-31 10:48:02'),
('1vNmgSfqFHeliijNfoNbyAU', '/api/v1/designations', 'POST api/v1/designations', '{}', '{}', '{\"designation_name\":\"Test Lead\",\"branch\":\"haQEJiCePwC0KeJsmUWsSZ7\"}', '{\"success\":true,\"message\":\"Designation created successfully\",\"data\":{\"id\":\"X2KYPor0OTGDRcP4b0h9nE5\",\"updated_by\":null,\"branch\":\"haQEJiCePwC0KeJsmUWsSZ7\",\"designation_name\":\"Test Lead\",\"client_id\":\"4kykUHcg5oLrhNDkfCLNYYG\",\"created_by\":\"Silverline Systems\"', '0.01 seconds', '2025-03-31 12:28:33', '2025-03-31 12:28:33'),
('1YvjnJdLE1yN6cRhKgQfIka', '/api/v1/products', 'GET api/v1/products', '{}', '{}', '{}', '{\"success\":true,\"message\":\"Product fetched successfully\",\"data\":[]}', '0.04 seconds', '2025-03-31 17:48:06', '2025-03-31 17:48:06'),
('21XGrb2cqYQlGsJwNczagVY', '/api/v1/clients', 'GET api/v1/clients', '{}', '{}', '{}', '{\"success\":true,\"message\":\"Clients fetched successfully\",\"data\":[{\"conversations\":{},\"id\":\"7aRxfVTXsxd31PyBz9WzEjx\",\"employeeId\":null,\"username\":\"Quantum Enterprises\",\"password\":\"$2b$12$OCduts6PI5L0YSEOVKT73uvS2zlUOaAPNMKWIxOO8tA/YpS1K.TRS\",\"email\":\"quant', '0.01 seconds', '2025-03-31 09:36:55', '2025-03-31 09:36:55'),
('29JnkgNniVc0TEfjytUrz7j', '/api/v1/leads', 'GET api/v1/leads', '{}', '{}', '{}', '{\"success\":true,\"message\":\"Lead fetched successfully\",\"data\":[{\"id\":\"31LINvHYSM5u4avuq7Wrjlh\",\"leadTitle\":\"TechPro Solutions Website Modernization\",\"leadStage\":\"BYNYLCidEQll0qKymn79W76\",\"currency\":\"INR\",\"leadValue\":850000,\"company_name\":\" TechPro Solution', '0.05 seconds', '2025-03-31 16:51:41', '2025-03-31 16:51:41'),
('2hBzrNgG8RLFUKtgFSJ5QBg', '/api/v1/products', 'GET api/v1/products', '{}', '{}', '{}', '{\"success\":true,\"message\":\"Product fetched successfully\",\"data\":[]}', '0.07 seconds', '2025-03-31 17:15:30', '2025-03-31 17:15:30'),
('2mB5qpSWVrsYDLRrdcPFEE4', '/api/v1/labels/4kykUHcg5oLrhNDkfCLNYYG', 'GET api/v1/labels/4kykUHcg5oLrhNDkfCLNYYG', '{\"id\":\"4kykUHcg5oLrhNDkfCLNYYG\"}', '{}', '{}', '{\"success\":true,\"message\":\"Tags retrieved successfully\",\"data\":[{\"id\":\"0ga51ZccuIiGGEudOSNNRDJ\",\"related_id\":\"4kykUHcg5oLrhNDkfCLNYYG\",\"lableType\":\"source\",\"name\":\"Phone\",\"color\":\"#34495E\",\"client_id\":\"4kykUHcg5oLrhNDkfCLNYYG\",\"created_by\":\"system\",\"updat', '0.05 seconds', '2025-03-31 16:46:37', '2025-03-31 16:46:37'),
('2O0jgdfszFSYwKfronFrIST', '/api/v1/leads/31LINvHYSM5u4avuq7Wrjlh', 'PUT api/v1/leads/31LINvHYSM5u4avuq7Wrjlh', '{\"id\":\"31LINvHYSM5u4avuq7Wrjlh\"}', '{}', '{\"leadTitle\":\"TechPro Solutions Website Modernization\",\"firstName\":\"TechPro\",\"lastName\":\" Solutions\",\"email\":\"rajesh@techpro.com\",\"telephone\":\"+91 9876543210\",\"company_name\":\" TechPro Solutions\",\"address\":\" Tech Park, Whitefield, Bangalore\",\"leadValue\":85', '{\"success\":true,\"message\":\"Lead updated successfully!\",\"data\":{\"id\":\"31LINvHYSM5u4avuq7Wrjlh\",\"leadTitle\":\"TechPro Solutions Website Modernization\",\"leadStage\":\"BYNYLCidEQll0qKymn79W76\",\"currency\":\"INR\",\"leadValue\":850000,\"company_name\":\" TechPro Solution', '0.01 seconds', '2025-03-31 14:37:52', '2025-03-31 14:37:52'),
('2pxKYW41hjzWDybn38A0Go6', '/api/v1/countries?page=1&limit=100', 'GET api/v1/countries?page=1&limit=100', '{}', '{\"page\":1,\"limit\":100}', '{}', '{\"success\":true,\"message\":\"Countries fetched successfully\",\"data\":[{\"id\":\"0YNW00eJIaSTu6T8IZXJZ2W\",\"countryName\":\"Kuwait\",\"countryCode\":\"KW\",\"phoneCode\":\"+965\",\"created_by\":null,\"updated_by\":null,\"createdAt\":\"2025-03-31T03:52:28.000Z\",\"updatedAt\":\"2025-03', '0.05 seconds', '2025-03-31 14:30:48', '2025-03-31 14:30:48'),
('2Rik8RIBbqajMz78R5QqnK8', '/api/v1/countries?', 'GET api/v1/countries?', '{}', '{}', '{}', '{\"success\":true,\"message\":\"Countries fetched successfully\",\"data\":[{\"id\":\"0YNW00eJIaSTu6T8IZXJZ2W\",\"countryName\":\"Kuwait\",\"countryCode\":\"KW\",\"phoneCode\":\"+965\",\"created_by\":null,\"updated_by\":null,\"createdAt\":\"2025-03-31T03:52:28.000Z\",\"updatedAt\":\"2025-03', '0.02 seconds', '2025-03-31 10:49:35', '2025-03-31 10:49:35'),
('2sSkjFv1qkQHPDI2rCwqNcU', '/api/v1/labels/4kykUHcg5oLrhNDkfCLNYYG', 'GET api/v1/labels/4kykUHcg5oLrhNDkfCLNYYG', '{\"id\":\"4kykUHcg5oLrhNDkfCLNYYG\"}', '{}', '{}', '{\"success\":true,\"message\":\"Tags retrieved successfully\",\"data\":[{\"id\":\"0ga51ZccuIiGGEudOSNNRDJ\",\"related_id\":\"4kykUHcg5oLrhNDkfCLNYYG\",\"lableType\":\"source\",\"name\":\"Phone\",\"color\":\"#34495E\",\"client_id\":\"4kykUHcg5oLrhNDkfCLNYYG\",\"created_by\":\"system\",\"updat', '0.02 seconds', '2025-03-31 14:25:30', '2025-03-31 14:25:30'),
('2tjsIKDiy8aPr1niT02cje9', '/api/v1/auth/login', 'POST api/v1/auth/login', '{}', '{}', '{\"login\":\"superadmin@nexisvision.com\",\"password\":\"SuperAdmin@123\"}', '{\"success\":true,\"message\":\"Login successful\",\"data\":{\"token\":\"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6InN1cGVyYWRtaW4iLCJlbWFpbCI6InN1cGVyYWRtaW5AbmV4aXN2aXNpb24uY29tIiwicGhvbmUiOm51bGwsImlkIjoiZTNxVFUwYkVtbEl2WXU4djRqRm1qeHYiLCJyb2xlIjoiWmVp', '0.09 seconds', '2025-03-31 14:41:34', '2025-03-31 14:41:34'),
('2xZk8KyzhJvrrNgM0nHfL5q', '/api/v1/designations', 'GET api/v1/designations', '{}', '{}', '{}', '{\"success\":true,\"message\":\"Designation fetched successfully\",\"data\":[{\"id\":\"LaqJYdtzPX2CHjbxPYthMrD\",\"branch\":\"UH8lBWZZAkctwuRFiCz5PMB\",\"designation_name\":\"Finance Analyst\",\"client_id\":\"4kykUHcg5oLrhNDkfCLNYYG\",\"created_by\":\"Silverline Systems\",\"updated_b', '0.01 seconds', '2025-03-31 12:24:30', '2025-03-31 12:24:30'),
('2YL4tZ18P5buPh9XdTjHOCR', '/api/v1/countries?page=1&limit=100', 'GET api/v1/countries?page=1&limit=100', '{}', '{\"page\":1,\"limit\":100}', '{}', '{\"success\":true,\"message\":\"Countries fetched successfully\",\"data\":[{\"id\":\"0YNW00eJIaSTu6T8IZXJZ2W\",\"countryName\":\"Kuwait\",\"countryCode\":\"KW\",\"phoneCode\":\"+965\",\"created_by\":null,\"updated_by\":null,\"createdAt\":\"2025-03-31T03:52:28.000Z\",\"updatedAt\":\"2025-03', '0.03 seconds', '2025-03-31 10:50:09', '2025-03-31 10:50:09'),
('2ZYl1DrdtjxakRnfLtF8dpa', '/api/v1/sub-clients', 'POST api/v1/sub-clients', '{}', '{}', '{\"username\":\"CloudBridge Technologies\",\"email\":\"cloudBridge.technologies@yopmail.com\",\"password\":\"CloudBridgeTechnologies@2525\"}', '{\"success\":true,\"message\":\"Please verify your email to complete registration\",\"data\":{\"sessionToken\":\"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjRreWtVSGNnNW9McmhORGtmQ0xOWVlHIiwidXNlcm5hbWUiOiJDbG91ZEJyaWRnZSBUZWNobm9sb2dpZXMiLCJlbWFpbCI6ImNsb3VkQnJp', '3.48 seconds', '2025-03-31 11:55:43', '2025-03-31 11:55:43'),
('301Yz96qOybRWQrYTtjSNgE', '/api/v1/clients', 'GET api/v1/clients', '{}', '{}', '{}', '{\"success\":true,\"message\":\"Clients fetched successfully\",\"data\":[{\"conversations\":{},\"id\":\"4kykUHcg5oLrhNDkfCLNYYG\",\"employeeId\":null,\"username\":\"Silverline Systems\",\"password\":\"$2b$12$.2Ia/XUZHrA7BEsLyf6uGuo9wgP9rGamovaR/ICL6YHHBDXVI5nIy\",\"email\":\"silver', '0.01 seconds', '2025-03-31 10:12:34', '2025-03-31 10:12:34'),
('3A1qrJLneS6SUNmibyT2JUX', '/api/v1/roles', 'GET api/v1/roles', '{}', '{}', '{}', '{\"success\":true,\"message\":\"Roles fetched successfully\",\"data\":[{\"id\":\"03qarcBedPhsVY3A1IKMMyW\",\"role_name\":\"System Administrator\",\"permissions\":\"{\\\"dashboards-project-list\\\":[{\\\"key\\\":\\\"dashboards-project-list\\\",\\\"permissions\\\":[\\\"view\\\",\\\"create\\\",\\\"upda', '0.08 seconds', '2025-03-31 16:57:06', '2025-03-31 16:57:06'),
('3DO26aa1HOj0tCyArRUjrFb', '/api/v1/auth', 'GET api/v1/auth', '{}', '{}', '{}', '{\"success\":true,\"message\":\"Users fetched successfully\",\"data\":[{\"conversations\":{},\"id\":\"0aMTORQ27wG00Ht5REhq13p\",\"employeeId\":null,\"username\":\" ba.silverline\",\"password\":\"$2b$12$NT.meyBZRWfJve/VLDgQo.bwhzGz1ElPJcoihKL2lokuJpOAqHk6W\",\"email\":\"ba.silverlin', '0.05 seconds', '2025-03-31 14:31:48', '2025-03-31 14:31:48'),
('3f8fupx2IXCYhm19NDEAh5E', '/api/v1/products', 'GET api/v1/products', '{}', '{}', '{}', '{\"success\":true,\"message\":\"Product fetched successfully\",\"data\":[]}', '0.01 seconds', '2025-03-31 17:23:43', '2025-03-31 17:23:43'),
('3h4tOVNFhrFY8jwL0zn8GWZ', '/api/v1/clients', 'GET api/v1/clients', '{}', '{}', '{}', '{\"success\":true,\"message\":\"Clients fetched successfully\",\"data\":[{\"conversations\":{},\"id\":\"AsPoso1y1OL5uY5URy57ZPw\",\"employeeId\":null,\"username\":\"GreenLeaf Solutions\",\"password\":\"$2b$12$jdkUAwOHEDU4Li1jNErGY.aJ/pFQwK8d9.7d8diQpXEj06F83taGG\",\"email\":\"green', '0.01 seconds', '2025-03-31 09:30:36', '2025-03-31 09:30:36'),
('3MrYYN4BGNukPJ8iGDUEdXV', '/api/v1/labels/4kykUHcg5oLrhNDkfCLNYYG', 'GET api/v1/labels/4kykUHcg5oLrhNDkfCLNYYG', '{\"id\":\"4kykUHcg5oLrhNDkfCLNYYG\"}', '{}', '{}', '{\"success\":true,\"message\":\"Tags retrieved successfully\",\"data\":[{\"id\":\"0ga51ZccuIiGGEudOSNNRDJ\",\"related_id\":\"4kykUHcg5oLrhNDkfCLNYYG\",\"lableType\":\"source\",\"name\":\"Phone\",\"color\":\"#34495E\",\"client_id\":\"4kykUHcg5oLrhNDkfCLNYYG\",\"created_by\":\"system\",\"updat', '0.03 seconds', '2025-03-31 17:23:44', '2025-03-31 17:23:44'),
('3O3mOJxfPORmUhL2ktX3btZ', '/api/v1/deals', 'GET api/v1/deals', '{}', '{}', '{}', '{\"success\":true,\"message\":\"Deal fetched successfully\",\"data\":[{\"id\":\"dmciOE2OiF952YsPFd0NPQi\",\"leadTitle\":null,\"firstName\":null,\"lastName\":null,\"email\":null,\"phone\":null,\"dealName\":\"Cloud ERP Implementation\",\"pipeline\":\"iiUsXOteVUFiCIMkgR6DObO\",\"stage\":\"u', '0.01 seconds', '2025-03-31 17:55:15', '2025-03-31 17:55:15'),
('3ppUmqTRi8MLLBza8U1skJE', '/api/v1/notes/dmciOE2OiF952YsPFd0NPQi', 'GET api/v1/notes/dmciOE2OiF952YsPFd0NPQi', '{\"id\":\"dmciOE2OiF952YsPFd0NPQi\"}', '{}', '{}', '{\"success\":true,\"message\":\"Notes fetched successfully\",\"data\":[]}', '0.01 seconds', '2025-03-31 17:48:10', '2025-03-31 17:48:10'),
('3Qnw4zUZFek9CwDoyYawrHy', '/api/v1/currencies?', 'GET api/v1/currencies?', '{}', '{}', '{}', '{\"success\":true,\"message\":\"Currencies fetched successfully\",\"data\":[{\"id\":\"29gCwt8wWQg7CPgG96847iD\",\"currencyName\":\"Euro\",\"currencyIcon\":\"€\",\"currencyCode\":\"EUR\",\"created_by\":null,\"updated_by\":null,\"createdAt\":\"2025-03-31T04:23:06.000Z\",\"updatedAt\":\"2025-', '0.00 seconds', '2025-03-31 17:48:23', '2025-03-31 17:48:23'),
('3SKDcYuyscAGCdOP0OCBALG', '/api/v1/taxes', 'GET api/v1/taxes', '{}', '{}', '{}', '{\"success\":true,\"message\":\"Tax fetched successfully\",\"data\":[]}', '0.05 seconds', '2025-03-31 17:13:43', '2025-03-31 17:13:43'),
('3X9pLEroIehazQknSodYNRd', '/api/v1/clients', 'GET api/v1/clients', '{}', '{}', '{}', '{\"success\":true,\"message\":\"Clients fetched successfully\",\"data\":[{\"conversations\":{},\"id\":\"4kykUHcg5oLrhNDkfCLNYYG\",\"employeeId\":null,\"username\":\"Silverline Systems\",\"password\":\"$2b$12$.2Ia/XUZHrA7BEsLyf6uGuo9wgP9rGamovaR/ICL6YHHBDXVI5nIy\",\"email\":\"silver', '0.02 seconds', '2025-03-31 15:54:11', '2025-03-31 15:54:11'),
('48mHZrxhdPnK45OicuUbA0p', '/api/v1/countries?page=1&limit=100', 'GET api/v1/countries?page=1&limit=100', '{}', '{\"page\":1,\"limit\":100}', '{}', '{\"success\":true,\"message\":\"Countries fetched successfully\",\"data\":[{\"id\":\"0YNW00eJIaSTu6T8IZXJZ2W\",\"countryName\":\"Kuwait\",\"countryCode\":\"KW\",\"phoneCode\":\"+965\",\"created_by\":null,\"updated_by\":null,\"createdAt\":\"2025-03-31T03:52:28.000Z\",\"updatedAt\":\"2025-03', '0.02 seconds', '2025-03-31 10:23:10', '2025-03-31 10:23:10'),
('490N9ic64CCJHQmI3dgGhQG', '/api/v1/tasks/e3qTU0bEmlIvYu8v4jFmjxv', 'GET api/v1/tasks/e3qTU0bEmlIvYu8v4jFmjxv', '{\"id\":\"e3qTU0bEmlIvYu8v4jFmjxv\"}', '{}', '{}', '{\"success\":true,\"message\":\"Tasks fetched successfully\",\"data\":[]}', '0.01 seconds', '2025-03-31 10:56:29', '2025-03-31 10:56:29'),
('4ARSE786e9maoKpdvzTBA7d', '/api/v1/pipelines', 'GET api/v1/pipelines', '{}', '{}', '{}', '{\"success\":true,\"message\":\"Pipelines fetched successfully\",\"data\":[{\"id\":\"iiUsXOteVUFiCIMkgR6DObO\",\"pipeline_name\":\"Marketing\",\"client_id\":\"4kykUHcg5oLrhNDkfCLNYYG\",\"created_by\":\"Silverline Systems\",\"updated_by\":null,\"createdAt\":\"2025-03-31T05:00:29.000Z\"', '0.02 seconds', '2025-03-31 10:30:45', '2025-03-31 10:30:45'),
('4AVfAigS6cdraEibNc9114x', '/api/v1/labels/4kykUHcg5oLrhNDkfCLNYYG', 'GET api/v1/labels/4kykUHcg5oLrhNDkfCLNYYG', '{\"id\":\"4kykUHcg5oLrhNDkfCLNYYG\"}', '{}', '{}', '{\"success\":true,\"message\":\"Tags retrieved successfully\",\"data\":[{\"id\":\"0ga51ZccuIiGGEudOSNNRDJ\",\"related_id\":\"4kykUHcg5oLrhNDkfCLNYYG\",\"lableType\":\"source\",\"name\":\"Phone\",\"color\":\"#34495E\",\"client_id\":\"4kykUHcg5oLrhNDkfCLNYYG\",\"created_by\":\"system\",\"updat', '0.08 seconds', '2025-03-31 14:25:30', '2025-03-31 14:25:30'),
('4Et3w5Un6dFUWDqn3JYylfb', '/api/v1/clients', 'GET api/v1/clients', '{}', '{}', '{}', '{\"success\":true,\"message\":\"Clients fetched successfully\",\"data\":[{\"conversations\":{},\"id\":\"4kykUHcg5oLrhNDkfCLNYYG\",\"employeeId\":null,\"username\":\"Silverline Systems\",\"password\":\"$2b$12$.2Ia/XUZHrA7BEsLyf6uGuo9wgP9rGamovaR/ICL6YHHBDXVI5nIy\",\"email\":\"silver', '0.02 seconds', '2025-03-31 09:41:26', '2025-03-31 09:41:26'),
('4i8MGScGr1XvEhUhbUiBpfe', '/api/v1/countries?page=1&limit=100', 'GET api/v1/countries?page=1&limit=100', '{}', '{\"page\":1,\"limit\":100}', '{}', '{\"success\":true,\"message\":\"Countries fetched successfully\",\"data\":[{\"id\":\"0YNW00eJIaSTu6T8IZXJZ2W\",\"countryName\":\"Kuwait\",\"countryCode\":\"KW\",\"phoneCode\":\"+965\",\"created_by\":null,\"updated_by\":null,\"createdAt\":\"2025-03-31T03:52:28.000Z\",\"updatedAt\":\"2025-03', '0.06 seconds', '2025-03-31 10:08:20', '2025-03-31 10:08:20'),
('4jrnX2FZa558j2ovHKDSNYd', '/api/v1/sub-clients', 'GET api/v1/sub-clients', '{}', '{}', '{}', '{\"success\":false,\"message\":\"Cannot read properties of null (reading \'id\')\"}', '0.01 seconds', '2025-03-31 11:42:09', '2025-03-31 11:42:09'),
('4mI1PpU16Kciaq3QKe7Jc2f', '/api/v1/branches', 'GET api/v1/branches', '{}', '{}', '{}', '{\"success\":true,\"message\":\"Branches fetched successfully\",\"data\":[]}', '0.07 seconds', '2025-03-31 12:04:14', '2025-03-31 12:04:14'),
('4Ny9ycZB1W1njbTyCpPdoaG', '/api/v1/employees', 'GET api/v1/employees', '{}', '{}', '{}', '{\"success\":true,\"message\":\"Employees fetched successfully\",\"data\":[]}', '0.01 seconds', '2025-03-31 12:32:13', '2025-03-31 12:32:13'),
('4TjptSfQCrtdNH18RwbFIf5', '/api/v1/leads', 'POST api/v1/leads', '{}', '{}', '{\"leadTitle\":\"Global Retail IT Infrastructure\",\"interest_level\":\"low\",\"currency\":\"INR\",\"leadValue\":2500000,\"source\":\"4pWxPgYS3TRJhWLFX3z630b\",\"status\":\"Kg4y1cj6ItKMqBNKpQoYk0g\",\"category\":\"Koxnx1YhcOOCJznFmwVgMY3\",\"lead_members\":{\"lead_members\":[\"qOaIRiAf', '{\"success\":true,\"message\":\"Lead created successfully!\",\"data\":{\"id\":\"YlSczjJh8OpXkCVEZYpMIs9\",\"files\":null,\"lead_score\":null,\"updated_by\":null,\"leadStage\":\"icIkzFa9jKpV26cO64IJS7f\",\"leadTitle\":\"Global Retail IT Infrastructure\",\"firstName\":\"Sarah \",\"lastNa', '0.15 seconds', '2025-03-31 16:56:37', '2025-03-31 16:56:37'),
('508rFuIA4Imuq3Brnctf22z', '/api/v1/countries?page=1&limit=100', 'GET api/v1/countries?page=1&limit=100', '{}', '{\"page\":1,\"limit\":100}', '{}', '{\"success\":true,\"message\":\"Countries fetched successfully\",\"data\":[{\"id\":\"0YNW00eJIaSTu6T8IZXJZ2W\",\"countryName\":\"Kuwait\",\"countryCode\":\"KW\",\"phoneCode\":\"+965\",\"created_by\":null,\"updated_by\":null,\"createdAt\":\"2025-03-31T03:52:28.000Z\",\"updatedAt\":\"2025-03', '0.16 seconds', '2025-03-31 12:59:52', '2025-03-31 12:59:52'),
('51G9EVim5eEPLkI2AJRo9kf', '/api/v1/taxes/FSq4XX9i6eb0ghsGzTZqkLW', 'PUT api/v1/taxes/FSq4XX9i6eb0ghsGzTZqkLW', '{\"id\":\"FSq4XX9i6eb0ghsGzTZqkLW\"}', '{}', '{\"gstName\":\"PPT\",\"gstPercentage\":\"1\"}', '{\"success\":true,\"message\":\"Tax updated successfully\",\"data\":{\"id\":\"FSq4XX9i6eb0ghsGzTZqkLW\",\"gstName\":\"PPT\",\"gstPercentage\":\"1\",\"client_id\":\"4kykUHcg5oLrhNDkfCLNYYG\",\"created_by\":\"Silverline Systems\",\"updated_by\":\"Silverline Systems\",\"createdAt\":\"2025-03-', '0.02 seconds', '2025-03-31 17:22:21', '2025-03-31 17:22:21'),
('5B5bdiUbD4ayoliUbDjFBt3', '/api/v1/branches', 'POST api/v1/branches', '{}', '{}', '{\"branchName\":\"Delhi \",\"branchManager\":\"W3LxNVQLCC7zrhxTyTlBnvz\",\"branchAddress\":\"Cyber Hub, Tower B, 3rd Floor\\nSector 18, Gurugram\\nDelhi NCR, Haryana - 122002\"}', '{\"success\":true,\"message\":\"Branch created successfully\",\"data\":{\"id\":\"haQEJiCePwC0KeJsmUWsSZ7\",\"updated_by\":null,\"branchName\":\"Delhi \",\"branchAddress\":\"Cyber Hub, Tower B, 3rd Floor\\nSector 18, Gurugram\\nDelhi NCR, Haryana - 122002\",\"branchManager\":\"W3LxN', '0.01 seconds', '2025-03-31 12:20:50', '2025-03-31 12:20:50'),
('5cbBBEL43Ybb3WbG1BUDmiN', '/api/v1/countries?', 'GET api/v1/countries?', '{}', '{}', '{}', '{\"success\":true,\"message\":\"Countries fetched successfully\",\"data\":[{\"id\":\"0YNW00eJIaSTu6T8IZXJZ2W\",\"countryName\":\"Kuwait\",\"countryCode\":\"KW\",\"phoneCode\":\"+965\",\"created_by\":null,\"updated_by\":null,\"createdAt\":\"2025-03-31T03:52:28.000Z\",\"updatedAt\":\"2025-03', '0.02 seconds', '2025-03-31 17:48:23', '2025-03-31 17:48:23'),
('5cdXYRs8jXgavTxmF3acJJJ', '/api/v1/auth', 'GET api/v1/auth', '{}', '{}', '{}', '{\"success\":true,\"message\":\"Users fetched successfully\",\"data\":[{\"conversations\":{},\"id\":\"4kykUHcg5oLrhNDkfCLNYYG\",\"employeeId\":null,\"username\":\"Silverline Systems\",\"password\":\"$2b$12$.2Ia/XUZHrA7BEsLyf6uGuo9wgP9rGamovaR/ICL6YHHBDXVI5nIy\",\"email\":\"silverli', '0.01 seconds', '2025-03-31 11:17:09', '2025-03-31 11:17:09'),
('5F6904aE5QjZ3FgIoF0s3Pr', '/api/v1/leads/YXfrACvHnsutJstpTU5Tu24', 'PUT api/v1/leads/YXfrACvHnsutJstpTU5Tu24', '{\"id\":\"YXfrACvHnsutJstpTU5Tu24\"}', '{}', '{\"leadStage\":\"icIkzFa9jKpV26cO64IJS7f\"}', '{\"success\":true,\"message\":\"Lead updated successfully!\",\"data\":{\"id\":\"YXfrACvHnsutJstpTU5Tu24\",\"leadTitle\":\"HealthCare App Development\",\"leadStage\":\"icIkzFa9jKpV26cO64IJS7f\",\"currency\":\"INR\",\"leadValue\":1500000,\"company_name\":\"MediTech Solutions\",\"firstNam', '0.01 seconds', '2025-03-31 16:57:01', '2025-03-31 16:57:01'),
('5itVBesmDdOoCFUarKWIOVX', '/api/v1/stages', 'GET api/v1/stages', '{}', '{}', '{}', '{\"success\":true,\"message\":\"Stages fetched successfully\",\"data\":[{\"id\":\"1j1Mfax4tYdOONQGLA23CeQ\",\"stageType\":\"deal\",\"stageName\":\"Lead Received\",\"pipeline\":\"iiUsXOteVUFiCIMkgR6DObO\",\"client_id\":\"4kykUHcg5oLrhNDkfCLNYYG\",\"created_by\":\"Silverline Systems\",\"up', '0.02 seconds', '2025-03-31 16:07:43', '2025-03-31 16:07:43'),
('5n4iWgQQdYuKxfVNX7F9VcD', '/api/v1/labels/4kykUHcg5oLrhNDkfCLNYYG', 'GET api/v1/labels/4kykUHcg5oLrhNDkfCLNYYG', '{\"id\":\"4kykUHcg5oLrhNDkfCLNYYG\"}', '{}', '{}', '{\"success\":true,\"message\":\"Tags retrieved successfully\",\"data\":[{\"id\":\"0ga51ZccuIiGGEudOSNNRDJ\",\"related_id\":\"4kykUHcg5oLrhNDkfCLNYYG\",\"lableType\":\"source\",\"name\":\"Phone\",\"color\":\"#34495E\",\"client_id\":\"4kykUHcg5oLrhNDkfCLNYYG\",\"created_by\":\"system\",\"updat', '0.01 seconds', '2025-03-31 10:49:35', '2025-03-31 10:49:35'),
('5NZLBWAp8ObGoe8E6bYCMP0', '/api/v1/departments', 'POST api/v1/departments', '{}', '{}', '{\"department_name\":\"QA\",\"branch\":\"haQEJiCePwC0KeJsmUWsSZ7\"}', '{\"success\":true,\"message\":\"Department created successfully\",\"data\":{\"id\":\"mXwMtsZBDZktY3YRkoRvAvi\",\"updated_by\":null,\"branch\":\"haQEJiCePwC0KeJsmUWsSZ7\",\"department_name\":\"QA\",\"client_id\":\"4kykUHcg5oLrhNDkfCLNYYG\",\"created_by\":\"Silverline Systems\",\"updated', '0.03 seconds', '2025-03-31 12:28:02', '2025-03-31 12:28:02'),
('5oI0XsJhjoxP6OIOxBC0CU9', '/api/v1/auth', 'GET api/v1/auth', '{}', '{}', '{}', '{\"success\":true,\"message\":\"Users fetched successfully\",\"data\":[{\"conversations\":{},\"id\":\"0aMTORQ27wG00Ht5REhq13p\",\"employeeId\":null,\"username\":\" ba.silverline\",\"password\":\"$2b$12$NT.meyBZRWfJve/VLDgQo.bwhzGz1ElPJcoihKL2lokuJpOAqHk6W\",\"email\":\"ba.silverlin', '0.04 seconds', '2025-03-31 16:44:01', '2025-03-31 16:44:01'),
('5OX6C8LbgowPgBjGGlpWfDo', '/api/v1/countries?', 'GET api/v1/countries?', '{}', '{}', '{}', '{\"success\":true,\"message\":\"Countries fetched successfully\",\"data\":[{\"id\":\"0YNW00eJIaSTu6T8IZXJZ2W\",\"countryName\":\"Kuwait\",\"countryCode\":\"KW\",\"phoneCode\":\"+965\",\"created_by\":null,\"updated_by\":null,\"createdAt\":\"2025-03-31T03:52:28.000Z\",\"updatedAt\":\"2025-03', '0.00 seconds', '2025-03-31 14:31:48', '2025-03-31 14:31:48'),
('5Sduxmd1VHDCc00csKhHsh6', '/api/v1/auth', 'GET api/v1/auth', '{}', '{}', '{}', '{\"success\":true,\"message\":\"Users fetched successfully\",\"data\":[{\"conversations\":{},\"id\":\"4kykUHcg5oLrhNDkfCLNYYG\",\"employeeId\":null,\"username\":\"Silverline Systems\",\"password\":\"$2b$12$.2Ia/XUZHrA7BEsLyf6uGuo9wgP9rGamovaR/ICL6YHHBDXVI5nIy\",\"email\":\"silverli', '0.01 seconds', '2025-03-31 11:26:39', '2025-03-31 11:26:39'),
('63HSmuxyHV0SIoFXLpmjB3X', '/api/v1/auth/login', 'POST api/v1/auth/login', '{}', '{}', '{\"login\":\"superadmin@nexisvision.com\",\"password\":\"SuperAdmin@123\"}', '{\"success\":true,\"message\":\"Login successful\",\"data\":{\"token\":\"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6InN1cGVyYWRtaW4iLCJlbWFpbCI6InN1cGVyYWRtaW5AbmV4aXN2aXNpb24uY29tIiwicGhvbmUiOm51bGwsImlkIjoiZTNxVFUwYkVtbEl2WXU4djRqRm1qeHYiLCJyb2xlIjoiWmVp', '0.10 seconds', '2025-03-31 10:44:46', '2025-03-31 10:44:46'),
('6br72itdYhwMIC9iqHgAKb1', '/api/v1/roles', 'GET api/v1/roles', '{}', '{}', '{}', '{\"success\":true,\"message\":\"Roles fetched successfully\",\"data\":[{\"id\":\"vI5ukP3myMKhjXXeHsmq1Rj\",\"role_name\":\"client\",\"permissions\":null,\"client_id\":null,\"created_by\":\"superadmin\",\"updated_by\":null,\"createdAt\":\"2025-03-31T03:57:18.000Z\",\"updatedAt\":\"2025-03', '0.04 seconds', '2025-03-31 10:48:55', '2025-03-31 10:48:55'),
('6ExxzmPkjlKrq99OQeeJnBN', '/api/v1/countries?', 'GET api/v1/countries?', '{}', '{}', '{}', '{\"success\":true,\"message\":\"Countries fetched successfully\",\"data\":[{\"id\":\"0YNW00eJIaSTu6T8IZXJZ2W\",\"countryName\":\"Kuwait\",\"countryCode\":\"KW\",\"phoneCode\":\"+965\",\"created_by\":null,\"updated_by\":null,\"createdAt\":\"2025-03-31T03:52:28.000Z\",\"updatedAt\":\"2025-03', '0.01 seconds', '2025-03-31 16:57:06', '2025-03-31 16:57:06'),
('6ME1mDjBuettIhY88EUvGSp', '/api/v1/auth/login', 'POST api/v1/auth/login', '{}', '{}', '{\"login\":\"superadmin@nexisvision.com\",\"password\":\"SuperAdmin@123\"}', '{\"success\":true,\"message\":\"Login successful\",\"data\":{\"token\":\"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6InN1cGVyYWRtaW4iLCJlbWFpbCI6InN1cGVyYWRtaW5AbmV4aXN2aXNpb24uY29tIiwicGhvbmUiOm51bGwsImlkIjoiZTNxVFUwYkVtbEl2WXU4djRqRm1qeHYiLCJyb2xlIjoiWmVp', '0.10 seconds', '2025-03-31 10:14:29', '2025-03-31 10:14:29'),
('6olwtTlAzwX7tNiC3rDrcFc', '/api/v1/departments', 'GET api/v1/departments', '{}', '{}', '{}', '{\"success\":true,\"message\":\"Department fetched successfully\",\"data\":[{\"id\":\"6aVUek1kX78VHjoDjhnJDAD\",\"branch\":\"UH8lBWZZAkctwuRFiCz5PMB\",\"department_name\":\"Development\",\"client_id\":\"4kykUHcg5oLrhNDkfCLNYYG\",\"created_by\":\"Silverline Systems\",\"updated_by\":nul', '0.01 seconds', '2025-03-31 12:23:15', '2025-03-31 12:23:15'),
('6u0jyGFf74GtriXBV6NRfqn', '/api/v1/auth/login', 'POST api/v1/auth/login', '{}', '{}', '{\"login\":\"Silverline Systems\",\"password\":\"SilverlineSystems2525\"}', '{\"success\":true,\"message\":\"Login successful\",\"data\":{\"token\":\"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6IlNpbHZlcmxpbmUgU3lzdGVtcyIsImVtYWlsIjoic2lsdmVybGluZXN5c3RlbXNAeW9wbWFpbC5jb20iLCJwaG9uZSI6bnVsbCwiaWQiOiI0a3lrVUhjZzVvTHJoTkRrZkNMTllZRyIs', '0.34 seconds', '2025-03-31 11:17:42', '2025-03-31 11:17:42'),
('6UcB7gnPnPDqTMqqdwYayY2', '/api/v1/currencies?', 'GET api/v1/currencies?', '{}', '{}', '{}', '{\"success\":true,\"message\":\"Currencies fetched successfully\",\"data\":[{\"id\":\"29gCwt8wWQg7CPgG96847iD\",\"currencyName\":\"Euro\",\"currencyIcon\":\"€\",\"currencyCode\":\"EUR\",\"created_by\":null,\"updated_by\":null,\"createdAt\":\"2025-03-31T04:23:06.000Z\",\"updatedAt\":\"2025-', '0.03 seconds', '2025-03-31 16:46:37', '2025-03-31 16:46:37'),
('6V95OrxEuXiueKMvK7vMeYR', '/api/v1/leads/YXfrACvHnsutJstpTU5Tu24', 'PUT api/v1/leads/YXfrACvHnsutJstpTU5Tu24', '{\"id\":\"YXfrACvHnsutJstpTU5Tu24\"}', '{}', '{\"leadStage\":\"eTzCUBr5Y232i82lxUoP9vJ\"}', '{\"success\":true,\"message\":\"Lead updated successfully!\",\"data\":{\"id\":\"YXfrACvHnsutJstpTU5Tu24\",\"leadTitle\":\"HealthCare App Development\",\"leadStage\":\"eTzCUBr5Y232i82lxUoP9vJ\",\"currency\":\"INR\",\"leadValue\":1500000,\"company_name\":\"MediTech Solutions\",\"firstNam', '0.01 seconds', '2025-03-31 16:57:13', '2025-03-31 16:57:13'),
('6xblzIn1wXhEuFS2SMNqhf6', '/api/v1/sub-clients', 'GET api/v1/sub-clients', '{}', '{}', '{}', '{\"success\":false,\"message\":\"Cannot read properties of null (reading \'id\')\"}', '0.09 seconds', '2025-03-31 10:48:55', '2025-03-31 10:48:55'),
('6zNZSFliGsNF9v2pCYaAOaw', '/api/v1/auth/login', 'POST api/v1/auth/login', '{}', '{}', '{\"login\":\"Horizon Ventures\",\"password\":\"HorizonVentures@2525\"}', '{\"success\":false,\"message\":\"No active subscription found\"}', '0.00 seconds', '2025-03-31 09:45:14', '2025-03-31 09:45:14'),
('7fM0WKCaBB0JrZ5v8sxbQLB', '/api/v1/auth/login', 'POST api/v1/auth/login', '{}', '{}', '{\"login\":\"Horizon Ventures\",\"password\":\"HorizonVentures@2525\"}', '{\"success\":false,\"message\":\"No active subscription found\"}', '0.00 seconds', '2025-03-31 09:45:11', '2025-03-31 09:45:11'),
('7HR4ou5ACTumfCDGkATi6p5', '/api/v1/departments', 'GET api/v1/departments', '{}', '{}', '{}', '{\"success\":true,\"message\":\"Department fetched successfully\",\"data\":[{\"id\":\"6aVUek1kX78VHjoDjhnJDAD\",\"branch\":\"UH8lBWZZAkctwuRFiCz5PMB\",\"department_name\":\"Development\",\"client_id\":\"4kykUHcg5oLrhNDkfCLNYYG\",\"created_by\":\"Silverline Systems\",\"updated_by\":nul', '0.01 seconds', '2025-03-31 12:11:13', '2025-03-31 12:11:13'),
('7hWPrSuZSbIsHiiyfwm6WuC', '/api/v1/roles', 'GET api/v1/roles', '{}', '{}', '{}', '{\"success\":true,\"message\":\"Roles fetched successfully\",\"data\":[{\"id\":\"03qarcBedPhsVY3A1IKMMyW\",\"role_name\":\"System Administrator\",\"permissions\":\"{\\\"dashboards-project-list\\\":[{\\\"key\\\":\\\"dashboards-project-list\\\",\\\"permissions\\\":[\\\"view\\\",\\\"create\\\",\\\"upda', '0.03 seconds', '2025-03-31 17:38:51', '2025-03-31 17:38:51'),
('7N8KaCBh72wNuOuIZ6WfD3b', '/api/v1/labels/4kykUHcg5oLrhNDkfCLNYYG', 'GET api/v1/labels/4kykUHcg5oLrhNDkfCLNYYG', '{\"id\":\"4kykUHcg5oLrhNDkfCLNYYG\"}', '{}', '{}', '{\"success\":true,\"message\":\"Tags retrieved successfully\",\"data\":[{\"id\":\"0ga51ZccuIiGGEudOSNNRDJ\",\"related_id\":\"4kykUHcg5oLrhNDkfCLNYYG\",\"lableType\":\"source\",\"name\":\"Phone\",\"color\":\"#34495E\",\"client_id\":\"4kykUHcg5oLrhNDkfCLNYYG\",\"created_by\":\"system\",\"updat', '0.02 seconds', '2025-03-31 14:31:27', '2025-03-31 14:31:27'),
('7oEB6QmYJkbIgLg8Pu8UZ1U', '/api/v1/auth/verify-signup', 'POST api/v1/auth/verify-signup', '{}', '{}', '{\"otp\":\"786923\"}', '{\"success\":true,\"message\":\"Registration completed successfully\",\"data\":{\"success\":true,\"token\":\"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6InFPYUlSaUFmbW1HY2xkbkRjVUFkNTFKIiwicm9sZSI6ImVtcGxveWVlIiwiaWF0IjoxNzQzNDA1NTMwLCJleHAiOjE3NDM0OTE5MzB9.DjRXoLexV', '2.42 seconds', '2025-03-31 12:48:52', '2025-03-31 12:48:52'),
('7oilOnELIV4xOR6AuvPJ5b7', '/api/v1/labels/4kykUHcg5oLrhNDkfCLNYYG', 'GET api/v1/labels/4kykUHcg5oLrhNDkfCLNYYG', '{\"id\":\"4kykUHcg5oLrhNDkfCLNYYG\"}', '{}', '{}', '{\"success\":true,\"message\":\"Tags retrieved successfully\",\"data\":[{\"id\":\"0ga51ZccuIiGGEudOSNNRDJ\",\"related_id\":\"4kykUHcg5oLrhNDkfCLNYYG\",\"lableType\":\"source\",\"name\":\"Phone\",\"color\":\"#34495E\",\"client_id\":\"4kykUHcg5oLrhNDkfCLNYYG\",\"created_by\":\"system\",\"updat', '0.03 seconds', '2025-03-31 17:38:51', '2025-03-31 17:38:51'),
('7OZGnp5uMmkRS095GurdE6m', '/api/v1/clients', 'POST api/v1/clients', '{}', '{}', '{\"username\":\"GreenLeaf Solutions\",\"email\":\"greenleafsolutions@yopmail.com\",\"password\":\"GreenLeafSolutions@2525\"}', '{\"success\":true,\"message\":\"OTP sent to email\",\"data\":{\"sessionToken\":\"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6ImUzcVRVMGJFbWxJdll1OHY0akZtanh2IiwidXNlcm5hbWUiOiJHcmVlbkxlYWYgU29sdXRpb25zIiwiZW1haWwiOiJncmVlbmxlYWZzb2x1dGlvbnNAeW9wbWFpbC5jb20iLCJyb2xl', '3.53 seconds', '2025-03-31 09:29:08', '2025-03-31 09:29:08'),
('7PnMlmldHuAATItJ7kum3As', '/api/v1/auth', 'GET api/v1/auth', '{}', '{}', '{}', '{\"success\":true,\"message\":\"Users fetched successfully\",\"data\":[{\"conversations\":{},\"id\":\"4kykUHcg5oLrhNDkfCLNYYG\",\"employeeId\":null,\"username\":\"Silverline Systems\",\"password\":\"$2b$12$.2Ia/XUZHrA7BEsLyf6uGuo9wgP9rGamovaR/ICL6YHHBDXVI5nIy\",\"email\":\"silverli', '0.03 seconds', '2025-03-31 10:48:55', '2025-03-31 10:48:55'),
('7QJlEtdjgzoIrJ4horyS2LL', '/api/v1/sub-clients', 'GET api/v1/sub-clients', '{}', '{}', '{}', '{\"success\":true,\"message\":\"SubClients fetched successfully\",\"data\":[{\"conversations\":{},\"id\":\"yxycYESzDheRycH00QSw3sc\",\"employeeId\":null,\"username\":\"TechPro Solutions\",\"password\":\"$2b$12$s/h5jUhubCRhTgMo0Fyev.INqHMG7Ir5UL6kh8kdqpfuqT3fCyE3C\",\"email\":\"tech', '0.01 seconds', '2025-03-31 11:47:35', '2025-03-31 11:47:35'),
('7RKGKjbuApm9YeOtRpmpohg', '/api/v1/auth/signup', 'POST api/v1/auth/signup', '{}', '{}', '{\"username\":\"pm.silverline\",\"email\":\"pm.silverline@yopmail.com\",\"password\":\"Pmsilverline@2525\",\"role_id\":\"pcmMgRgxCKK2LPLL2SXqjep\"}', '{\"success\":true,\"message\":\"Please verify your email to complete registration\",\"data\":{\"sessionToken\":\"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjRreWtVSGNnNW9McmhORGtmQ0xOWVlHIiwidXNlcm5hbWUiOiJwbS5zaWx2ZXJsaW5lIiwiZW1haWwiOiJwbS5zaWx2ZXJsaW5lQHlvcG1h', '2.66 seconds', '2025-03-31 11:16:47', '2025-03-31 11:16:47'),
('7RNfi6nD3Yeu460bLdgoJMM', '/api/v1/countries?page=1&limit=100', 'GET api/v1/countries?page=1&limit=100', '{}', '{\"page\":1,\"limit\":100}', '{}', '{\"success\":true,\"message\":\"Countries fetched successfully\",\"data\":[{\"id\":\"0YNW00eJIaSTu6T8IZXJZ2W\",\"countryName\":\"Kuwait\",\"countryCode\":\"KW\",\"phoneCode\":\"+965\",\"created_by\":null,\"updated_by\":null,\"createdAt\":\"2025-03-31T03:52:28.000Z\",\"updatedAt\":\"2025-03', '0.04 seconds', '2025-03-31 17:23:43', '2025-03-31 17:23:43'),
('7rWpbUlNxLHAOGOWTo0i42E', '/api/v1/auth/login', 'POST api/v1/auth/login', '{}', '{}', '{\"login\":\"Horizon Ventures\",\"password\":\"HorizonVentures@2525\"}', '{\"success\":false,\"message\":\"No active subscription found\"}', '0.01 seconds', '2025-03-31 09:45:12', '2025-03-31 09:45:12'),
('7RZIJFGkr3Y0KQGVPk59JvR', '/api/v1/auth/admin-login', 'POST api/v1/auth/admin-login', '{}', '{}', '{\"email\":\"silverlinesystems@yopmail.com\"}', '{\"success\":true,\"message\":\"Login successful\",\"data\":{\"token\":\"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6IlNpbHZlcmxpbmUgU3lzdGVtcyIsImVtYWlsIjoic2lsdmVybGluZXN5c3RlbXNAeW9wbWFpbC5jb20iLCJwaG9uZSI6bnVsbCwiaWQiOiI0a3lrVUhjZzVvTHJoTkRrZkNMTllZRyIs', '0.04 seconds', '2025-03-31 09:43:32', '2025-03-31 09:43:32'),
('7S20xwoVE4kqkAKu4NrkrTQ', '/api/v1/roles', 'GET api/v1/roles', '{}', '{}', '{}', '{\"success\":true,\"message\":\"Roles fetched successfully\",\"data\":[{\"id\":\"03qarcBedPhsVY3A1IKMMyW\",\"role_name\":\"System Administrator\",\"permissions\":\"{\\\"dashboards-project-list\\\":[{\\\"key\\\":\\\"dashboards-project-list\\\",\\\"permissions\\\":[\\\"view\\\",\\\"create\\\",\\\"upda', '0.01 seconds', '2025-03-31 12:31:56', '2025-03-31 12:31:56'),
('7tc5SMI3Y6fsdguJR4VGdOy', '/api/v1/auth/login', 'POST api/v1/auth/login', '{}', '{}', '{\"login\":\"superadmin@nexisvision.com\",\"password\":\"SuperAdmin@123\"}', '{\"success\":true,\"message\":\"Login successful\",\"data\":{\"token\":\"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6InN1cGVyYWRtaW4iLCJlbWFpbCI6InN1cGVyYWRtaW5AbmV4aXN2aXNpb24uY29tIiwicGhvbmUiOm51bGwsImlkIjoiZTNxVFUwYkVtbEl2WXU4djRqRm1qeHYiLCJyb2xlIjoiWmVp', '0.08 seconds', '2025-03-31 10:12:44', '2025-03-31 10:12:44'),
('7ucZ0NwUtu8sloHixqqAaiP', '/api/v1/leads?', 'GET api/v1/leads?', '{}', '{}', '{}', '{\"success\":true,\"message\":\"Lead fetched successfully\",\"data\":[{\"id\":\"31LINvHYSM5u4avuq7Wrjlh\",\"leadTitle\":\"TechPro Solutions Website Modernization\",\"leadStage\":\"eTzCUBr5Y232i82lxUoP9vJ\",\"currency\":\"INR\",\"leadValue\":850000,\"company_name\":\" TechPro Solution', '0.10 seconds', '2025-03-31 17:14:58', '2025-03-31 17:14:58'),
('7VdkTmH8zOIp5xqhKE6eTw6', '/api/v1/leads', 'GET api/v1/leads', '{}', '{}', '{}', '{\"success\":true,\"message\":\"Lead fetched successfully\",\"data\":[{\"id\":\"31LINvHYSM5u4avuq7Wrjlh\",\"leadTitle\":\"TechPro Solutions Website Modernization\",\"leadStage\":\"BYNYLCidEQll0qKymn79W76\",\"currency\":\"INR\",\"leadValue\":850000,\"company_name\":\" TechPro Solution', '0.02 seconds', '2025-03-31 16:00:54', '2025-03-31 16:00:54'),
('82RqHIp4SKXH6tQEd1SCCdK', '/api/v1/roles', 'GET api/v1/roles', '{}', '{}', '{}', '{\"success\":true,\"message\":\"Roles fetched successfully\",\"data\":[{\"id\":\"03qarcBedPhsVY3A1IKMMyW\",\"role_name\":\"System Administrator\",\"permissions\":\"{\\\"dashboards-project-list\\\":[{\\\"key\\\":\\\"dashboards-project-list\\\",\\\"permissions\\\":[\\\"view\\\",\\\"create\\\",\\\"upda', '0.01 seconds', '2025-03-31 10:59:16', '2025-03-31 10:59:16'),
('8aDbmXXX9pjqSqiXglVMLLW', '/api/v1/deals', 'GET api/v1/deals', '{}', '{}', '{}', '{\"success\":true,\"message\":\"Deal fetched successfully\",\"data\":[{\"id\":\"dmciOE2OiF952YsPFd0NPQi\",\"leadTitle\":null,\"firstName\":null,\"lastName\":null,\"email\":null,\"phone\":null,\"dealName\":\"Cloud ERP Implementation\",\"pipeline\":\"iiUsXOteVUFiCIMkgR6DObO\",\"stage\":\"k', '0.01 seconds', '2025-03-31 17:46:16', '2025-03-31 17:46:16'),
('8ajSe3jLs2IHX9Niu8Iyozk', '/api/v1/auth/login', 'POST api/v1/auth/login', '{}', '{}', '{\"login\":\"superadmin@nexisvision.com\",\"password\":\"SuperAdmin@123\"}', '{\"success\":true,\"message\":\"Login successful\",\"data\":{\"token\":\"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6InN1cGVyYWRtaW4iLCJlbWFpbCI6InN1cGVyYWRtaW5AbmV4aXN2aXNpb24uY29tIiwicGhvbmUiOm51bGwsImlkIjoiZTNxVFUwYkVtbEl2WXU4djRqRm1qeHYiLCJyb2xlIjoiWmVp', '0.12 seconds', '2025-03-31 09:22:22', '2025-03-31 09:22:22'),
('8djrnCm9wt3Dv0tbpwvkoIZ', '/api/v1/roles/hQG7DPggtFQUMhEUdJjADL3', 'PUT api/v1/roles/hQG7DPggtFQUMhEUdJjADL3', '{\"id\":\"hQG7DPggtFQUMhEUdJjADL3\"}', '{}', '{\"role_name\":\"sub-client\",\"permissions\":{\"dashboards-project-list\":[{\"key\":\"dashboards-project-list\",\"permissions\":[\"view\"]}]}}', '{\"success\":true,\"message\":\"Role updated successfully\",\"data\":{\"id\":\"hQG7DPggtFQUMhEUdJjADL3\",\"role_name\":\"sub-client\",\"permissions\":{\"dashboards-project-list\":[{\"key\":\"dashboards-project-list\",\"permissions\":[\"view\"]}]},\"client_id\":\"4kykUHcg5oLrhNDkfCLNYYG', '0.01 seconds', '2025-03-31 12:31:56', '2025-03-31 12:31:56'),
('8ipr9xBqwPaJcR7sRktjUMt', '/api/v1/proposals?page=1&limit=10', 'GET api/v1/proposals?page=1&limit=10', '{}', '{\"page\":\"1\",\"limit\":\"10\"}', '{}', '{\"success\":true,\"message\":\"Proposal fetched successfully\",\"data\":[]}', '0.05 seconds', '2025-03-31 17:13:43', '2025-03-31 17:13:43'),
('8IrCpNTkwjlo3yzln8s8zJ6', '/api/v1/products', 'GET api/v1/products', '{}', '{}', '{}', '{\"success\":true,\"message\":\"Product fetched successfully\",\"data\":[]}', '0.05 seconds', '2025-03-31 17:38:51', '2025-03-31 17:38:51'),
('8LVOISWrdmrweSPQK0ovmSG', '/api/v1/departments', 'POST api/v1/departments', '{}', '{}', '{\"department_name\":\"Marketing\",\"branch\":\"bjHlRDFkaJBOh3kg2EP52VH\"}', '{\"success\":true,\"message\":\"Department created successfully\",\"data\":{\"id\":\"pUzEV1Givmo50CcSeJCyz5V\",\"updated_by\":null,\"branch\":\"bjHlRDFkaJBOh3kg2EP52VH\",\"department_name\":\"Marketing\",\"client_id\":\"4kykUHcg5oLrhNDkfCLNYYG\",\"created_by\":\"Silverline Systems\",\"', '0.01 seconds', '2025-03-31 12:24:54', '2025-03-31 12:24:54'),
('8Ney8teaLwZV1LxB4tW46jN', '/api/v1/sub-clients', 'GET api/v1/sub-clients', '{}', '{}', '{}', '{\"success\":false,\"message\":\"Cannot read properties of null (reading \'id\')\"}', '0.04 seconds', '2025-03-31 11:17:49', '2025-03-31 11:17:49'),
('8nnGnCqx9aQILHhs1PQK1pm', '/api/v1/designations', 'POST api/v1/designations', '{}', '{}', '{\"designation_name\":\"Sales Executive\",\"branch\":\"haQEJiCePwC0KeJsmUWsSZ7\"}', '{\"success\":true,\"message\":\"Designation created successfully\",\"data\":{\"id\":\"ZUxdUD2SYQiKojDORUPrULQ\",\"updated_by\":null,\"branch\":\"haQEJiCePwC0KeJsmUWsSZ7\",\"designation_name\":\"Sales Executive\",\"client_id\":\"4kykUHcg5oLrhNDkfCLNYYG\",\"created_by\":\"Silverline Sy', '0.01 seconds', '2025-03-31 12:24:30', '2025-03-31 12:24:30'),
('8x0hacWUxA6OE1ygIHXj8Oh', '/api/v1/subscriptions/assign', 'POST api/v1/subscriptions/assign', '{}', '{}', '{\"client_id\":\"4kykUHcg5oLrhNDkfCLNYYG\",\"plan_id\":\"7jkFMDlerBM0I8peB1i6QHG\",\"start_date\":\"2025-03-06T00:00:00.000Z\",\"end_date\":\"2025-03-31T00:00:00.000Z\",\"status\":\"active\",\"payment_status\":\"paid\"}', '{\"success\":false,\"message\":\"Client already has an active subscription\"}', '0.01 seconds', '2025-03-31 10:48:02', '2025-03-31 10:48:02'),
('8XndzF0LuJtxqHg23wj9Skl', '/api/v1/auth', 'GET api/v1/auth', '{}', '{}', '{}', '{\"success\":true,\"message\":\"Users fetched successfully\",\"data\":[{\"conversations\":{},\"id\":\"4kykUHcg5oLrhNDkfCLNYYG\",\"employeeId\":null,\"username\":\"Silverline Systems\",\"password\":\"$2b$12$.2Ia/XUZHrA7BEsLyf6uGuo9wgP9rGamovaR/ICL6YHHBDXVI5nIy\",\"email\":\"silverli', '0.08 seconds', '2025-03-31 11:21:22', '2025-03-31 11:21:22'),
('97fsP989zgSEXaHx1iAIEWn', '/api/v1/roles', 'POST api/v1/roles', '{}', '{}', '{\"role_name\":\"Support Specialist\",\"permissions\":{\"dashboards-mail\":[{\"key\":\"dashboards-mail\",\"permissions\":[\"view\",\"create\",\"update\",\"delete\"]}],\"dashboards-chat\":[{\"key\":\"dashboards-chat\",\"permissions\":[\"view\",\"create\",\"update\",\"delete\"]}],\"dashboards-ca', '{\"success\":true,\"message\":\"Role created successfully\",\"data\":{\"id\":\"28RtGJ3pSZXAZTC5FKpuGMR\",\"updated_by\":null,\"role_name\":\"Support Specialist\",\"permissions\":{\"dashboards-mail\":[{\"key\":\"dashboards-mail\",\"permissions\":[\"view\",\"create\",\"update\",\"delete\"]}],', '0.01 seconds', '2025-03-31 11:00:43', '2025-03-31 11:00:43'),
('9mvUf7KyplCDLLMyPdV1PGo', '/api/v1/subscriptions?page=1&limit=100&search=', 'GET api/v1/subscriptions?page=1&limit=100&search=', '{}', '{}', '{}', '{\"success\":true,\"message\":\"Plans retrieved successfully\",\"data\":[{\"id\":\"uzptLdgqYFRoK23ORcMgQrg\",\"name\":\"Basic Plan\",\"currency\":\"INR\",\"price\":\"999.00\",\"duration\":\"Per Month\",\"trial_period\":\"7\",\"max_users\":\"5\",\"max_clients\":\"10\",\"max_customers\":\"50\",\"max_v', '0.02 seconds', '2025-03-31 10:12:34', '2025-03-31 10:12:34'),
('9paZshazzHfbSgeWMDx6TE0', '/api/v1/deals', 'GET api/v1/deals', '{}', '{}', '{}', '{\"success\":true,\"message\":\"Deal fetched successfully\",\"data\":[{\"id\":\"dmciOE2OiF952YsPFd0NPQi\",\"leadTitle\":null,\"firstName\":null,\"lastName\":null,\"email\":null,\"phone\":null,\"dealName\":\"Cloud ERP Implementation\",\"pipeline\":\"iiUsXOteVUFiCIMkgR6DObO\",\"stage\":\"T', '0.01 seconds', '2025-03-31 17:46:17', '2025-03-31 17:46:17');
INSERT INTO `audittrails` (`id`, `url`, `activity`, `params`, `query`, `payload`, `response`, `duration`, `createdAt`, `updatedAt`) VALUES
('9S5uQwCFghbgPd8dj661B45', '/api/v1/currencies?page=1&limit=100', 'GET api/v1/currencies?page=1&limit=100', '{}', '{\"page\":1,\"limit\":100}', '{}', '{\"success\":true,\"message\":\"Currencies fetched successfully\",\"data\":[{\"id\":\"29gCwt8wWQg7CPgG96847iD\",\"currencyName\":\"Euro\",\"currencyIcon\":\"€\",\"currencyCode\":\"EUR\",\"created_by\":null,\"updated_by\":null,\"createdAt\":\"2025-03-31T04:23:06.000Z\",\"updatedAt\":\"2025-', '0.01 seconds', '2025-03-31 17:48:06', '2025-03-31 17:48:06'),
('9SzKn5PxmmyUNsigvWKB8cQ', '/api/v1/employees', 'GET api/v1/employees', '{}', '{}', '{}', '{\"success\":true,\"message\":\"Employees fetched successfully\",\"data\":[{\"conversations\":{},\"id\":\"uRxNhU6mrI44fedl6HiOBYM\",\"employeeId\":\"EMP#1\",\"username\":\"rahul.sharma\",\"password\":\"$2b$12$TQXuI3L/vn0vhGz/aZquW.mKH0e1x/.CSBj9q7nfFmkuLURsdmSPi\",\"email\":\"rahul.s', '0.01 seconds', '2025-03-31 12:41:00', '2025-03-31 12:41:00'),
('9thTBvrefptN4d8lHlkvjRb', '/api/v1/sub-clients', 'GET api/v1/sub-clients', '{}', '{}', '{}', '{\"success\":false,\"message\":\"Cannot read properties of null (reading \'id\')\"}', '0.01 seconds', '2025-03-31 11:45:40', '2025-03-31 11:45:40'),
('9Tk9P18tLfWBtx67n8aYL44', '/api/v1/currencies?limit=100', 'GET api/v1/currencies?limit=100', '{}', '{\"limit\":100}', '{}', '{\"success\":true,\"message\":\"Currencies fetched successfully\",\"data\":[{\"id\":\"29gCwt8wWQg7CPgG96847iD\",\"currencyName\":\"Euro\",\"currencyIcon\":\"€\",\"currencyCode\":\"EUR\",\"created_by\":null,\"updated_by\":null,\"createdAt\":\"2025-03-31T04:23:06.000Z\",\"updatedAt\":\"2025-', '0.03 seconds', '2025-03-31 17:16:06', '2025-03-31 17:16:06'),
('9u9oFFYcaZHf2ghDoDD2Exc', '/api/v1/stages', 'GET api/v1/stages', '{}', '{}', '{}', '{\"success\":true,\"message\":\"Stages fetched successfully\",\"data\":[{\"id\":\"1j1Mfax4tYdOONQGLA23CeQ\",\"stageType\":\"deal\",\"stageName\":\"Lead Received\",\"pipeline\":\"iiUsXOteVUFiCIMkgR6DObO\",\"client_id\":\"4kykUHcg5oLrhNDkfCLNYYG\",\"created_by\":\"Silverline Systems\",\"up', '0.07 seconds', '2025-03-31 14:31:48', '2025-03-31 14:31:48'),
('9wNDWfp72WPtaWhpAmtMLex', '/api/v1/labels/4kykUHcg5oLrhNDkfCLNYYG', 'GET api/v1/labels/4kykUHcg5oLrhNDkfCLNYYG', '{\"id\":\"4kykUHcg5oLrhNDkfCLNYYG\"}', '{}', '{}', '{\"success\":true,\"message\":\"Tags retrieved successfully\",\"data\":[{\"id\":\"0ga51ZccuIiGGEudOSNNRDJ\",\"related_id\":\"4kykUHcg5oLrhNDkfCLNYYG\",\"lableType\":\"source\",\"name\":\"Phone\",\"color\":\"#34495E\",\"client_id\":\"4kykUHcg5oLrhNDkfCLNYYG\",\"created_by\":\"system\",\"updat', '0.09 seconds', '2025-03-31 15:54:49', '2025-03-31 15:54:49'),
('9X8tQeV1UFxDvSOcHTkbETX', '/api/v1/departments', 'GET api/v1/departments', '{}', '{}', '{}', '{\"success\":true,\"message\":\"Department fetched successfully\",\"data\":[{\"id\":\"0DQCpwzdzU2mZWnGcqM91AC\",\"branch\":\"haQEJiCePwC0KeJsmUWsSZ7\",\"department_name\":\" Sales\",\"client_id\":\"4kykUHcg5oLrhNDkfCLNYYG\",\"created_by\":\"Silverline Systems\",\"updated_by\":null,\"cr', '0.05 seconds', '2025-03-31 14:30:48', '2025-03-31 14:30:48'),
('9yxtBLUqfMMQqEfqYU8IrFX', '/api/v1/leads/31LINvHYSM5u4avuq7Wrjlh', 'GET api/v1/leads/31LINvHYSM5u4avuq7Wrjlh', '{\"id\":\"31LINvHYSM5u4avuq7Wrjlh\"}', '{}', '{}', '{\"success\":true,\"message\":\"Lead fetched successfully\",\"data\":{\"id\":\"31LINvHYSM5u4avuq7Wrjlh\",\"leadTitle\":\"TechPro Solutions Website Modernization\",\"leadStage\":\"BYNYLCidEQll0qKymn79W76\",\"currency\":\"INR\",\"leadValue\":850000,\"company_name\":\" TechPro Solutions', '0.02 seconds', '2025-03-31 16:07:43', '2025-03-31 16:07:43'),
('A0ZjB5NbXF9h67NbEZSfiKT', '/api/v1/products', 'GET api/v1/products', '{}', '{}', '{}', '{\"success\":true,\"message\":\"Product fetched successfully\",\"data\":[]}', '0.05 seconds', '2025-03-31 18:05:19', '2025-03-31 18:05:19'),
('a6HJf1gpF62bebUSr1yoBFM', '/api/v1/countries?page=1&limit=100', 'GET api/v1/countries?page=1&limit=100', '{}', '{\"page\":1,\"limit\":100}', '{}', '{\"success\":true,\"message\":\"Countries fetched successfully\",\"data\":[{\"id\":\"0YNW00eJIaSTu6T8IZXJZ2W\",\"countryName\":\"Kuwait\",\"countryCode\":\"KW\",\"phoneCode\":\"+965\",\"created_by\":null,\"updated_by\":null,\"createdAt\":\"2025-03-31T03:52:28.000Z\",\"updatedAt\":\"2025-03', '0.02 seconds', '2025-03-31 10:47:39', '2025-03-31 10:47:39'),
('A8osLHn0g10ctGKTggkUGw1', '/api/v1/clients', 'POST api/v1/clients', '{}', '{}', '{\"username\":\"BlueWave Consulting\",\"email\":\"bluewaveconsulting@yopmail.com\",\"password\":\"BlueWaveConsulting@2525\"}', '{\"success\":true,\"message\":\"OTP sent to email\",\"data\":{\"sessionToken\":\"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6ImUzcVRVMGJFbWxJdll1OHY0akZtanh2IiwidXNlcm5hbWUiOiJCbHVlV2F2ZSBDb25zdWx0aW5nIiwiZW1haWwiOiJibHVld2F2ZWNvbnN1bHRpbmdAeW9wbWFpbC5jb20iLCJyb2xl', '2.78 seconds', '2025-03-31 09:32:11', '2025-03-31 09:32:11'),
('A9RMUNHYKjXvycUHKDlyOvL', '/api/v1/leads', 'GET api/v1/leads', '{}', '{}', '{}', '{\"success\":true,\"message\":\"Lead fetched successfully\",\"data\":[{\"id\":\"31LINvHYSM5u4avuq7Wrjlh\",\"leadTitle\":\"TechPro Solutions Website Modernization\",\"leadStage\":\"BYNYLCidEQll0qKymn79W76\",\"currency\":\"INR\",\"leadValue\":850000,\"company_name\":\" TechPro Solution', '0.04 seconds', '2025-03-31 16:46:37', '2025-03-31 16:46:37'),
('Aax2nRc3wIGng8ZnUnLqLGt', '/api/v1/leads', 'GET api/v1/leads', '{}', '{}', '{}', '{\"success\":true,\"message\":\"Lead fetched successfully\",\"data\":[{\"id\":\"31LINvHYSM5u4avuq7Wrjlh\",\"leadTitle\":\"TechPro Solutions Website Modernization\",\"leadStage\":\"BYNYLCidEQll0qKymn79W76\",\"currency\":\"INR\",\"leadValue\":850000,\"company_name\":\" TechPro Solution', '0.04 seconds', '2025-03-31 16:56:57', '2025-03-31 16:56:57'),
('AdbPq2h1P6KfjZMDTKQLqEL', '/api/v1/labels/4kykUHcg5oLrhNDkfCLNYYG', 'GET api/v1/labels/4kykUHcg5oLrhNDkfCLNYYG', '{\"id\":\"4kykUHcg5oLrhNDkfCLNYYG\"}', '{}', '{}', '{\"success\":true,\"message\":\"Tags retrieved successfully\",\"data\":[{\"id\":\"0ga51ZccuIiGGEudOSNNRDJ\",\"related_id\":\"4kykUHcg5oLrhNDkfCLNYYG\",\"lableType\":\"source\",\"name\":\"Phone\",\"color\":\"#34495E\",\"client_id\":\"4kykUHcg5oLrhNDkfCLNYYG\",\"created_by\":\"system\",\"updat', '0.25 seconds', '2025-03-31 11:41:48', '2025-03-31 11:41:48'),
('AEn1KKeQNdzwuWR5fI9UW1m', '/api/v1/subscriptions?page=1&limit=10&search=', 'GET api/v1/subscriptions?page=1&limit=10&search=', '{}', '{}', '{}', '{\"success\":true,\"message\":\"Plans retrieved successfully\",\"data\":[{\"id\":\"uzptLdgqYFRoK23ORcMgQrg\",\"name\":\"Basic Plan\",\"currency\":\"INR\",\"price\":\"999.00\",\"duration\":\"Per Month\",\"trial_period\":\"7\",\"max_users\":\"5\",\"max_clients\":\"10\",\"max_customers\":\"50\",\"max_v', '0.01 seconds', '2025-03-31 10:46:40', '2025-03-31 10:46:40'),
('aeZXclcMdvo7BrqbH4JMcIG', '/api/v1/leads', 'GET api/v1/leads', '{}', '{}', '{}', '{\"success\":true,\"message\":\"Lead fetched successfully\",\"data\":[]}', '0.11 seconds', '2025-03-31 14:25:30', '2025-03-31 14:25:30'),
('ahgFRxARPozteUicN2T0mJq', '/api/v1/auth', 'GET api/v1/auth', '{}', '{}', '{}', '{\"success\":true,\"message\":\"Users fetched successfully\",\"data\":[{\"conversations\":{},\"id\":\"4kykUHcg5oLrhNDkfCLNYYG\",\"employeeId\":null,\"username\":\"Silverline Systems\",\"password\":\"$2b$12$.2Ia/XUZHrA7BEsLyf6uGuo9wgP9rGamovaR/ICL6YHHBDXVI5nIy\",\"email\":\"silverli', '0.05 seconds', '2025-03-31 10:28:44', '2025-03-31 10:28:44'),
('aoZlvLGkUWu5OF7PDPQDeCn', '/api/v1/designations', 'POST api/v1/designations', '{}', '{}', '{\"designation_name\":\"Finance Analyst\",\"branch\":\"UH8lBWZZAkctwuRFiCz5PMB\"}', '{\"success\":true,\"message\":\"Designation created successfully\",\"data\":{\"id\":\"LaqJYdtzPX2CHjbxPYthMrD\",\"updated_by\":null,\"branch\":\"UH8lBWZZAkctwuRFiCz5PMB\",\"designation_name\":\"Finance Analyst\",\"client_id\":\"4kykUHcg5oLrhNDkfCLNYYG\",\"created_by\":\"Silverline Sy', '0.01 seconds', '2025-03-31 12:23:26', '2025-03-31 12:23:26'),
('aQTJpZAAOQL9QNsDclizoyn', '/api/v1/sales-revenue', 'GET api/v1/sales-revenue', '{}', '{}', '{}', '{\"success\":true,\"message\":\"Sales revenue fetched successfully\",\"data\":[]}', '0.01 seconds', '2025-03-31 10:52:42', '2025-03-31 10:52:42'),
('asFY2HlVzEp97GgbrwmkrHK', '/api/v1/auth/verify-signup', 'POST api/v1/auth/verify-signup', '{}', '{}', '{\"otp\":\"528588\"}', '{\"success\":true,\"message\":\"Registration completed successfully\",\"data\":{\"success\":true,\"token\":\"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjlWRFd3MU5ScjNoblZSZjgycmVaT0R0Iiwicm9sZSI6InN1Yi1jbGllbnQiLCJpYXQiOjE3NDM0MDIyMTYsImV4cCI6MTc0MzQ4ODYxNn0.LFBcVd', '3.26 seconds', '2025-03-31 11:53:40', '2025-03-31 11:53:40'),
('AsuFFjJecKcdyuf2BEjncFV', '/api/v1/clients', 'GET api/v1/clients', '{}', '{}', '{}', '{\"success\":true,\"message\":\"Clients fetched successfully\",\"data\":[{\"conversations\":{},\"id\":\"4kykUHcg5oLrhNDkfCLNYYG\",\"employeeId\":null,\"username\":\"Silverline Systems\",\"password\":\"$2b$12$.2Ia/XUZHrA7BEsLyf6uGuo9wgP9rGamovaR/ICL6YHHBDXVI5nIy\",\"email\":\"silver', '0.02 seconds', '2025-03-31 10:47:39', '2025-03-31 10:47:39'),
('aun1RaldUpPc2N6cJLJZr4P', '/api/v1/sub-clients', 'GET api/v1/sub-clients', '{}', '{}', '{}', '{\"success\":true,\"message\":\"SubClients fetched successfully\",\"data\":[{\"conversations\":{},\"id\":\"9VDWw1NRr3hnVRf82reZODt\",\"employeeId\":null,\"username\":\"Quantum Innovations\",\"password\":\"$2b$12$mn0gG674rbqCn0UiYh7kuuZPDY.iZquWfgnPbgjYrwphrOOTtty86\",\"email\":\"qu', '0.01 seconds', '2025-03-31 11:57:08', '2025-03-31 11:57:08'),
('AVDARNEzQBEvFT3jVR7pAuf', '/api/v1/clients', 'GET api/v1/clients', '{}', '{}', '{}', '{\"success\":true,\"message\":\"Clients fetched successfully\",\"data\":[{\"conversations\":{},\"id\":\"4kykUHcg5oLrhNDkfCLNYYG\",\"employeeId\":null,\"username\":\"Silverline Systems\",\"password\":\"$2b$12$.2Ia/XUZHrA7BEsLyf6uGuo9wgP9rGamovaR/ICL6YHHBDXVI5nIy\",\"email\":\"silver', '0.01 seconds', '2025-03-31 09:43:10', '2025-03-31 09:43:10'),
('aVhnGh7Xfdll1ZkZ2lPMCLP', '/api/v1/stages', 'GET api/v1/stages', '{}', '{}', '{}', '{\"success\":true,\"message\":\"Stages fetched successfully\",\"data\":[{\"id\":\"1j1Mfax4tYdOONQGLA23CeQ\",\"stageType\":\"deal\",\"stageName\":\"Lead Received\",\"pipeline\":\"iiUsXOteVUFiCIMkgR6DObO\",\"client_id\":\"4kykUHcg5oLrhNDkfCLNYYG\",\"created_by\":\"Silverline Systems\",\"up', '0.08 seconds', '2025-03-31 11:10:04', '2025-03-31 11:10:04'),
('AvswJVbzPr1e0bk5BRut8y6', '/api/v1/auth/verify-signup', 'POST api/v1/auth/verify-signup', '{}', '{}', '{\"otp\":\"966614\"}', '{\"success\":true,\"message\":\"Registration completed successfully\",\"data\":{\"success\":true,\"token\":\"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6ImxzQTNiV3dpSFlVUmdjeFYxcDlKS1lMIiwicm9sZSI6ImNsaWVudCIsImlhdCI6MTc0MzM5NDE3OSwiZXhwIjoxNzQzNDgwNTc5fQ.2oR0Aq4o_ic', '2.67 seconds', '2025-03-31 09:39:41', '2025-03-31 09:39:41'),
('az9UIslYa66zJSRaovZ17Q1', '/api/v1/stages', 'GET api/v1/stages', '{}', '{}', '{}', '{\"success\":true,\"message\":\"Stages fetched successfully\",\"data\":[]}', '0.13 seconds', '2025-03-31 10:28:44', '2025-03-31 10:28:44'),
('B4bjCUDhN8l2nEDUlxXnov3', '/api/v1/leads', 'GET api/v1/leads', '{}', '{}', '{}', '{\"success\":true,\"message\":\"Lead fetched successfully\",\"data\":[{\"id\":\"31LINvHYSM5u4avuq7Wrjlh\",\"leadTitle\":\"TechPro Solutions Website Modernization\",\"leadStage\":\"BYNYLCidEQll0qKymn79W76\",\"currency\":\"INR\",\"leadValue\":850000,\"company_name\":\" TechPro Solution', '0.19 seconds', '2025-03-31 14:37:53', '2025-03-31 14:37:53'),
('B5bGAVWvVflv5MHzBndpNpj', '/api/v1/sub-clients', 'GET api/v1/sub-clients', '{}', '{}', '{}', '{\"success\":false,\"message\":\"Cannot read properties of null (reading \'id\')\"}', '0.01 seconds', '2025-03-31 10:51:06', '2025-03-31 10:51:06'),
('B7xodyXc9xR39ZRthiY5VOW', '/api/v1/currencies?', 'GET api/v1/currencies?', '{}', '{}', '{}', '{\"success\":true,\"message\":\"Currencies fetched successfully\",\"data\":[{\"id\":\"29gCwt8wWQg7CPgG96847iD\",\"currencyName\":\"Euro\",\"currencyIcon\":\"€\",\"currencyCode\":\"EUR\",\"created_by\":null,\"updated_by\":null,\"createdAt\":\"2025-03-31T04:23:06.000Z\",\"updatedAt\":\"2025-', '0.07 seconds', '2025-03-31 14:31:27', '2025-03-31 14:31:27'),
('bBO1mFVBSOm5vcEGhe5OLdy', '/api/v1/countries?', 'GET api/v1/countries?', '{}', '{}', '{}', '{\"success\":true,\"message\":\"Countries fetched successfully\",\"data\":[{\"id\":\"0YNW00eJIaSTu6T8IZXJZ2W\",\"countryName\":\"Kuwait\",\"countryCode\":\"KW\",\"phoneCode\":\"+965\",\"created_by\":null,\"updated_by\":null,\"createdAt\":\"2025-03-31T03:52:28.000Z\",\"updatedAt\":\"2025-03', '0.04 seconds', '2025-03-31 14:25:30', '2025-03-31 14:25:30'),
('BBW0WNlMMGhudVLSAbGvWAn', '/api/v1/leads', 'GET api/v1/leads', '{}', '{}', '{}', '{\"success\":true,\"message\":\"Lead fetched successfully\",\"data\":[{\"id\":\"31LINvHYSM5u4avuq7Wrjlh\",\"leadTitle\":\"TechPro Solutions Website Modernization\",\"leadStage\":\"eTzCUBr5Y232i82lxUoP9vJ\",\"currency\":\"INR\",\"leadValue\":850000,\"company_name\":\" TechPro Solution', '0.01 seconds', '2025-03-31 17:12:35', '2025-03-31 17:12:35'),
('BDUmtAdCNxlCY0zJmIx1lFr', '/api/v1/leads', 'GET api/v1/leads', '{}', '{}', '{}', '{\"success\":true,\"message\":\"Lead fetched successfully\",\"data\":[{\"id\":\"31LINvHYSM5u4avuq7Wrjlh\",\"leadTitle\":\"TechPro Solutions Website Modernization\",\"leadStage\":\"BYNYLCidEQll0qKymn79W76\",\"currency\":\"INR\",\"leadValue\":850000,\"company_name\":\" TechPro Solution', '0.01 seconds', '2025-03-31 14:37:28', '2025-03-31 14:37:28'),
('bEp6XdPE7LkMzPP9IdR29Hy', '/api/v1/deals', 'GET api/v1/deals', '{}', '{}', '{}', '{\"success\":true,\"message\":\"Deal fetched successfully\",\"data\":[{\"id\":\"dmciOE2OiF952YsPFd0NPQi\",\"leadTitle\":null,\"firstName\":null,\"lastName\":null,\"email\":null,\"phone\":null,\"dealName\":\"Cloud ERP Implementation\",\"pipeline\":\"iiUsXOteVUFiCIMkgR6DObO\",\"stage\":\"u', '0.01 seconds', '2025-03-31 17:46:30', '2025-03-31 17:46:30'),
('BFw4eNeDjLDfGYfqVSK4zrZ', '/api/v1/labels/4kykUHcg5oLrhNDkfCLNYYG', 'GET api/v1/labels/4kykUHcg5oLrhNDkfCLNYYG', '{\"id\":\"4kykUHcg5oLrhNDkfCLNYYG\"}', '{}', '{}', '{\"success\":true,\"message\":\"Tags retrieved successfully\",\"data\":[{\"id\":\"0ga51ZccuIiGGEudOSNNRDJ\",\"related_id\":\"4kykUHcg5oLrhNDkfCLNYYG\",\"lableType\":\"source\",\"name\":\"Phone\",\"color\":\"#34495E\",\"client_id\":\"4kykUHcg5oLrhNDkfCLNYYG\",\"created_by\":\"system\",\"updat', '0.12 seconds', '2025-03-31 16:47:23', '2025-03-31 16:47:23'),
('BHN2Wc44AOdal5FVf0oV8gY', '/api/v1/projects', 'GET api/v1/projects', '{}', '{}', '{}', '{\"success\":true,\"message\":\"Projects fetched successfully\",\"data\":[]}', '0.03 seconds', '2025-03-31 10:56:31', '2025-03-31 10:56:31'),
('bib1kvqB42pbvCJlsvkCfgN', '/api/v1/labels/4kykUHcg5oLrhNDkfCLNYYG', 'GET api/v1/labels/4kykUHcg5oLrhNDkfCLNYYG', '{\"id\":\"4kykUHcg5oLrhNDkfCLNYYG\"}', '{}', '{}', '{\"success\":true,\"message\":\"Tags retrieved successfully\",\"data\":[{\"id\":\"0ga51ZccuIiGGEudOSNNRDJ\",\"related_id\":\"4kykUHcg5oLrhNDkfCLNYYG\",\"lableType\":\"source\",\"name\":\"Phone\",\"color\":\"#34495E\",\"client_id\":\"4kykUHcg5oLrhNDkfCLNYYG\",\"created_by\":\"system\",\"updat', '0.01 seconds', '2025-03-31 14:31:27', '2025-03-31 14:31:27'),
('bJN8smeLAfqzjROkBTGD2lK', '/api/v1/auth/admin-login', 'POST api/v1/auth/admin-login', '{}', '{}', '{\"email\":\"silverlinesystems@yopmail.com\"}', '{\"success\":true,\"message\":\"Login successful\",\"data\":{\"token\":\"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6IlNpbHZlcmxpbmUgU3lzdGVtcyIsImVtYWlsIjoic2lsdmVybGluZXN5c3RlbXNAeW9wbWFpbC5jb20iLCJwaG9uZSI6bnVsbCwiaWQiOiI0a3lrVUhjZzVvTHJoTkRrZkNMTllZRyIs', '0.02 seconds', '2025-03-31 10:28:36', '2025-03-31 10:28:36'),
('bKQRtGSwK2Jrg5r0hWfOFY5', '/api/v1/auth/verify-signup', 'POST api/v1/auth/verify-signup', '{}', '{}', '{\"otp\":\"149172\"}', '{\"success\":true,\"message\":\"Registration completed successfully\",\"data\":{\"success\":true,\"token\":\"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6InlkcmlJUGpMeUFQVDFPR2lwRjVJSHNZIiwicm9sZSI6ImVtcGxveWVlIiwiaWF0IjoxNzQzNDA1OTQyLCJleHAiOjE3NDM0OTIzNDJ9.nQSV2bWzw', '3.17 seconds', '2025-03-31 12:55:45', '2025-03-31 12:55:45'),
('blKNJbi2klrJ7ePOKaSbrS8', '/api/v1/currencies?page=1&limit=100', 'GET api/v1/currencies?page=1&limit=100', '{}', '{\"page\":1,\"limit\":100}', '{}', '{\"success\":true,\"message\":\"Currencies fetched successfully\",\"data\":[{\"id\":\"29gCwt8wWQg7CPgG96847iD\",\"currencyName\":\"Euro\",\"currencyIcon\":\"€\",\"currencyCode\":\"EUR\",\"created_by\":null,\"updated_by\":null,\"createdAt\":\"2025-03-31T04:23:06.000Z\",\"updatedAt\":\"2025-', '0.02 seconds', '2025-03-31 10:14:31', '2025-03-31 10:14:31'),
('BmfgrABkDqCh4meOQ8OIuKF', '/api/v1/labels/4kykUHcg5oLrhNDkfCLNYYG', 'GET api/v1/labels/4kykUHcg5oLrhNDkfCLNYYG', '{\"id\":\"4kykUHcg5oLrhNDkfCLNYYG\"}', '{}', '{}', '{\"success\":true,\"message\":\"Tags retrieved successfully\",\"data\":[{\"id\":\"0ga51ZccuIiGGEudOSNNRDJ\",\"related_id\":\"4kykUHcg5oLrhNDkfCLNYYG\",\"lableType\":\"source\",\"name\":\"Phone\",\"color\":\"#34495E\",\"client_id\":\"4kykUHcg5oLrhNDkfCLNYYG\",\"created_by\":\"system\",\"updat', '0.04 seconds', '2025-03-31 10:49:35', '2025-03-31 10:49:35'),
('bN6OEyiErOWlJx7RmxJyOyY', '/api/v1/auth', 'GET api/v1/auth', '{}', '{}', '{}', '{\"success\":true,\"message\":\"Users fetched successfully\",\"data\":[{\"conversations\":{},\"id\":\"4kykUHcg5oLrhNDkfCLNYYG\",\"employeeId\":null,\"username\":\"Silverline Systems\",\"password\":\"$2b$12$.2Ia/XUZHrA7BEsLyf6uGuo9wgP9rGamovaR/ICL6YHHBDXVI5nIy\",\"email\":\"silverli', '0.00 seconds', '2025-03-31 11:16:47', '2025-03-31 11:16:47'),
('BNuxjXuittsu2QpMapolR0b', '/api/v1/auth/admin-login', 'POST api/v1/auth/admin-login', '{}', '{}', '{\"email\":\"silverlinesystems@yopmail.com\"}', '{\"success\":true,\"message\":\"Login successful\",\"data\":{\"token\":\"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6IlNpbHZlcmxpbmUgU3lzdGVtcyIsImVtYWlsIjoic2lsdmVybGluZXN5c3RlbXNAeW9wbWFpbC5jb20iLCJwaG9uZSI6bnVsbCwiaWQiOiI0a3lrVUhjZzVvTHJoTkRrZkNMTllZRyIs', '0.01 seconds', '2025-03-31 09:52:46', '2025-03-31 09:52:46'),
('Bq96k5N4SfvN7Q1gYWJxQB9', '/api/v1/clients', 'GET api/v1/clients', '{}', '{}', '{}', '{\"success\":true,\"message\":\"Clients fetched successfully\",\"data\":[{\"conversations\":{},\"id\":\"7aRxfVTXsxd31PyBz9WzEjx\",\"employeeId\":null,\"username\":\"Quantum Enterprises\",\"password\":\"$2b$12$OCduts6PI5L0YSEOVKT73uvS2zlUOaAPNMKWIxOO8tA/YpS1K.TRS\",\"email\":\"quant', '0.02 seconds', '2025-03-31 09:32:35', '2025-03-31 09:32:35'),
('BQJTt4rvXUdPJaGggC7ySPV', '/api/v1/taxes', 'POST api/v1/taxes', '{}', '{}', '{\"gstName\":\"PPT\",\"gstPercentage\":\"88\"}', '{\"success\":true,\"message\":\"Tax created successfully\",\"data\":{\"id\":\"FSq4XX9i6eb0ghsGzTZqkLW\",\"updated_by\":null,\"gstName\":\"PPT\",\"gstPercentage\":\"88\",\"client_id\":\"4kykUHcg5oLrhNDkfCLNYYG\",\"created_by\":\"Silverline Systems\",\"updatedAt\":\"2025-03-31T11:52:09.900', '0.02 seconds', '2025-03-31 17:22:09', '2025-03-31 17:22:09'),
('bSl5M9ATyl4Z4HcU8wX2xth', '/api/v1/leads', 'GET api/v1/leads', '{}', '{}', '{}', '{\"success\":true,\"message\":\"Lead fetched successfully\",\"data\":[{\"id\":\"31LINvHYSM5u4avuq7Wrjlh\",\"leadTitle\":\"TechPro Solutions Website Modernization\",\"leadStage\":\"BYNYLCidEQll0qKymn79W76\",\"currency\":\"INR\",\"leadValue\":850000,\"company_name\":\" TechPro Solution', '0.01 seconds', '2025-03-31 16:57:13', '2025-03-31 16:57:13'),
('buJrtU6mGaQgE8KXSDNdIRj', '/api/v1/labels/4kykUHcg5oLrhNDkfCLNYYG', 'GET api/v1/labels/4kykUHcg5oLrhNDkfCLNYYG', '{\"id\":\"4kykUHcg5oLrhNDkfCLNYYG\"}', '{}', '{}', '{\"success\":true,\"message\":\"Tags retrieved successfully\",\"data\":[{\"id\":\"0ga51ZccuIiGGEudOSNNRDJ\",\"related_id\":\"4kykUHcg5oLrhNDkfCLNYYG\",\"lableType\":\"source\",\"name\":\"Phone\",\"color\":\"#34495E\",\"client_id\":\"4kykUHcg5oLrhNDkfCLNYYG\",\"created_by\":\"system\",\"updat', '0.04 seconds', '2025-03-31 17:12:25', '2025-03-31 17:12:25'),
('BWa1FCLq9Jhbz2arzeEbutZ', '/api/v1/sub-clients', 'GET api/v1/sub-clients', '{}', '{}', '{}', '{\"success\":false,\"message\":\"Cannot read properties of null (reading \'id\')\"}', '0.01 seconds', '2025-03-31 10:50:08', '2025-03-31 10:50:08'),
('Bxa5vLlt0QZ1Q0NjYEcI0CB', '/api/v1/auth', 'GET api/v1/auth', '{}', '{}', '{}', '{\"success\":true,\"message\":\"Users fetched successfully\",\"data\":[{\"conversations\":{},\"id\":\"0aMTORQ27wG00Ht5REhq13p\",\"employeeId\":null,\"username\":\" ba.silverline\",\"password\":\"$2b$12$NT.meyBZRWfJve/VLDgQo.bwhzGz1ElPJcoihKL2lokuJpOAqHk6W\",\"email\":\"ba.silverlin', '0.02 seconds', '2025-03-31 17:38:51', '2025-03-31 17:38:51'),
('c2yDfYYFVXvENDD5Op2k3W0', '/api/v1/roles', 'GET api/v1/roles', '{}', '{}', '{}', '{\"success\":true,\"message\":\"Roles fetched successfully\",\"data\":[{\"id\":\"03qarcBedPhsVY3A1IKMMyW\",\"role_name\":\"System Administrator\",\"permissions\":\"{\\\"dashboards-project-list\\\":[{\\\"key\\\":\\\"dashboards-project-list\\\",\\\"permissions\\\":[\\\"view\\\",\\\"create\\\",\\\"upda', '0.07 seconds', '2025-03-31 11:24:13', '2025-03-31 11:24:13'),
('C4pBdjIql6Aav2U7WnSJKRR', '/api/v1/branches', 'GET api/v1/branches', '{}', '{}', '{}', '{\"success\":true,\"message\":\"Branches fetched successfully\",\"data\":[{\"id\":\"bjHlRDFkaJBOh3kg2EP52VH\",\"branchName\":\"Bangalore\",\"branchAddress\":\"Tech Park One, 4th Floor\\nWhitefield Main Road\\nBangalore, Karnataka - 560066\",\"branchManager\":\"wPHc9cisqOzzpTW0Mpz', '0.26 seconds', '2025-03-31 12:59:52', '2025-03-31 12:59:52'),
('C6ETKggpQYAXTFeqSUwVjKh', '/api/v1/labels/4kykUHcg5oLrhNDkfCLNYYG', 'GET api/v1/labels/4kykUHcg5oLrhNDkfCLNYYG', '{\"id\":\"4kykUHcg5oLrhNDkfCLNYYG\"}', '{}', '{}', '{\"success\":true,\"message\":\"Tags retrieved successfully\",\"data\":[{\"id\":\"0ga51ZccuIiGGEudOSNNRDJ\",\"related_id\":\"4kykUHcg5oLrhNDkfCLNYYG\",\"lableType\":\"source\",\"name\":\"Phone\",\"color\":\"#34495E\",\"client_id\":\"4kykUHcg5oLrhNDkfCLNYYG\",\"created_by\":\"system\",\"updat', '0.01 seconds', '2025-03-31 15:54:49', '2025-03-31 15:54:49'),
('c8byXMPJWAk4kWItCje55CD', '/api/v1/countries?page=1&limit=100', 'GET api/v1/countries?page=1&limit=100', '{}', '{\"page\":1,\"limit\":100}', '{}', '{\"success\":true,\"message\":\"Countries fetched successfully\",\"data\":[{\"id\":\"0YNW00eJIaSTu6T8IZXJZ2W\",\"countryName\":\"Kuwait\",\"countryCode\":\"KW\",\"phoneCode\":\"+965\",\"created_by\":null,\"updated_by\":null,\"createdAt\":\"2025-03-31T03:52:28.000Z\",\"updatedAt\":\"2025-03', '0.03 seconds', '2025-03-31 09:46:32', '2025-03-31 09:46:32'),
('CAjIO8cITrfyI6Y9b6ayvuG', '/api/v1/leads', 'GET api/v1/leads', '{}', '{}', '{}', '{\"success\":true,\"message\":\"Lead fetched successfully\",\"data\":[{\"id\":\"31LINvHYSM5u4avuq7Wrjlh\",\"leadTitle\":\"TechPro Solutions Website Modernization\",\"leadStage\":\"BYNYLCidEQll0qKymn79W76\",\"currency\":\"INR\",\"leadValue\":850000,\"company_name\":\" TechPro Solution', '0.01 seconds', '2025-03-31 16:57:12', '2025-03-31 16:57:12'),
('chq2uNZG1S4UBfm2S1P7qSy', '/api/v1/currencies?page=1&limit=100', 'GET api/v1/currencies?page=1&limit=100', '{}', '{\"page\":1,\"limit\":100}', '{}', '{\"success\":true,\"message\":\"Currencies fetched successfully\",\"data\":[{\"id\":\"29gCwt8wWQg7CPgG96847iD\",\"currencyName\":\"Euro\",\"currencyIcon\":\"€\",\"currencyCode\":\"EUR\",\"created_by\":null,\"updated_by\":null,\"createdAt\":\"2025-03-31T04:23:06.000Z\",\"updatedAt\":\"2025-', '0.01 seconds', '2025-03-31 17:23:43', '2025-03-31 17:23:43'),
('Cifu5ssbDGrCOFv33evERLp', '/api/v1/labels/4kykUHcg5oLrhNDkfCLNYYG', 'GET api/v1/labels/4kykUHcg5oLrhNDkfCLNYYG', '{\"id\":\"4kykUHcg5oLrhNDkfCLNYYG\"}', '{}', '{}', '{\"success\":true,\"message\":\"Tags retrieved successfully\",\"data\":[{\"id\":\"0ga51ZccuIiGGEudOSNNRDJ\",\"related_id\":\"4kykUHcg5oLrhNDkfCLNYYG\",\"lableType\":\"source\",\"name\":\"Phone\",\"color\":\"#34495E\",\"client_id\":\"4kykUHcg5oLrhNDkfCLNYYG\",\"created_by\":\"system\",\"updat', '0.01 seconds', '2025-03-31 16:00:54', '2025-03-31 16:00:54'),
('ciZPhjHyrMG0kzb0d1qSTCo', '/api/v1/branches', 'GET api/v1/branches', '{}', '{}', '{}', '{\"success\":true,\"message\":\"Branches fetched successfully\",\"data\":[{\"id\":\"UH8lBWZZAkctwuRFiCz5PMB\",\"branchName\":\"Mumbai\",\"branchAddress\":\"Silverline Tower, Plot No. 15\\nSector 30, Vashi\\nNavi Mumbai, Maharashtra - 400705\",\"branchManager\":\"wPHc9cisqOzzpTW0M', '0.13 seconds', '2025-03-31 12:19:34', '2025-03-31 12:19:34'),
('cn4B5rIOuiDBxP99PkS6zc7', '/api/v1/auth/login', 'POST api/v1/auth/login', '{}', '{}', '{\"login\":\"superadmin@nexisvision.com\",\"password\":\"SuperAdmin@123\"}', '{\"success\":true,\"message\":\"Login successful\",\"data\":{\"token\":\"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6InN1cGVyYWRtaW4iLCJlbWFpbCI6InN1cGVyYWRtaW5AbmV4aXN2aXNpb24uY29tIiwicGhvbmUiOm51bGwsImlkIjoiZTNxVFUwYkVtbEl2WXU4djRqRm1qeHYiLCJyb2xlIjoiWmVp', '0.08 seconds', '2025-03-31 09:52:55', '2025-03-31 09:52:55'),
('cQoWcCUkypP5ysQ1XTdgzFB', '/api/v1/auth/login', 'POST api/v1/auth/login', '{}', '{}', '{\"login\":\"Horizon Ventures\",\"password\":\"HorizonVentures@2525\"}', '{\"success\":false,\"message\":\"No active subscription found\"}', '0.01 seconds', '2025-03-31 09:45:10', '2025-03-31 09:45:10'),
('cr0A77dTLi4Ji22sSa6HVKs', '/api/v1/products', 'GET api/v1/products', '{}', '{}', '{}', '{\"success\":true,\"message\":\"Product fetched successfully\",\"data\":[]}', '0.01 seconds', '2025-03-31 10:52:38', '2025-03-31 10:52:38'),
('CRLABE9S3yctiWnlJC38UDK', '/api/v1/currencies?page=1&limit=100', 'GET api/v1/currencies?page=1&limit=100', '{}', '{\"page\":1,\"limit\":100}', '{}', '{\"success\":true,\"message\":\"Currencies fetched successfully\",\"data\":[{\"id\":\"29gCwt8wWQg7CPgG96847iD\",\"currencyName\":\"Euro\",\"currencyIcon\":\"€\",\"currencyCode\":\"EUR\",\"created_by\":null,\"updated_by\":null,\"createdAt\":\"2025-03-31T04:23:06.000Z\",\"updatedAt\":\"2025-', '0.04 seconds', '2025-03-31 17:38:51', '2025-03-31 17:38:51'),
('CWtJatuahkUV15TkHvHKAt1', '/api/v1/countries?page=1&limit=100', 'GET api/v1/countries?page=1&limit=100', '{}', '{\"page\":1,\"limit\":100}', '{}', '{\"success\":true,\"message\":\"Countries fetched successfully\",\"data\":[{\"id\":\"0YNW00eJIaSTu6T8IZXJZ2W\",\"countryName\":\"Kuwait\",\"countryCode\":\"KW\",\"phoneCode\":\"+965\",\"created_by\":null,\"updated_by\":null,\"createdAt\":\"2025-03-31T03:52:28.000Z\",\"updatedAt\":\"2025-03', '0.03 seconds', '2025-03-31 10:28:35', '2025-03-31 10:28:35'),
('cXqk6GzfC7jv7KTCKsKiUC5', '/api/v1/roles', 'GET api/v1/roles', '{}', '{}', '{}', '{\"success\":true,\"message\":\"Roles fetched successfully\",\"data\":[{\"id\":\"03qarcBedPhsVY3A1IKMMyW\",\"role_name\":\"System Administrator\",\"permissions\":\"{\\\"dashboards-project-list\\\":[{\\\"key\\\":\\\"dashboards-project-list\\\",\\\"permissions\\\":[\\\"view\\\",\\\"create\\\",\\\"upda', '0.01 seconds', '2025-03-31 10:58:53', '2025-03-31 10:58:53'),
('czxJZiRmlsmVYcAfWeTZn43', '/api/v1/leads', 'GET api/v1/leads', '{}', '{}', '{}', '{\"success\":true,\"message\":\"Lead fetched successfully\",\"data\":[{\"id\":\"31LINvHYSM5u4avuq7Wrjlh\",\"leadTitle\":\"TechPro Solutions Website Modernization\",\"leadStage\":\"BYNYLCidEQll0qKymn79W76\",\"currency\":\"INR\",\"leadValue\":850000,\"company_name\":\" TechPro Solution', '0.01 seconds', '2025-03-31 16:57:11', '2025-03-31 16:57:11'),
('D9QZIXRfpLlzBJ29v51sqsB', '/api/v1/departments', 'GET api/v1/departments', '{}', '{}', '{}', '{\"success\":true,\"message\":\"Department fetched successfully\",\"data\":[{\"id\":\"0DQCpwzdzU2mZWnGcqM91AC\",\"branch\":\"haQEJiCePwC0KeJsmUWsSZ7\",\"department_name\":\" Sales\",\"client_id\":\"4kykUHcg5oLrhNDkfCLNYYG\",\"created_by\":\"Silverline Systems\",\"updated_by\":null,\"cr', '0.01 seconds', '2025-03-31 12:25:57', '2025-03-31 12:25:57'),
('DCeNe1NzGMPdwgHDbBOpFOa', '/api/v1/sub-clients', 'GET api/v1/sub-clients', '{}', '{}', '{}', '{\"success\":false,\"message\":\"Cannot read properties of null (reading \'id\')\"}', '0.01 seconds', '2025-03-31 11:42:06', '2025-03-31 11:42:06'),
('DfEejC2Zgy5I4LqXJ0soaae', '/api/v1/auth/verify-signup', 'POST api/v1/auth/verify-signup', '{}', '{}', '{\"otp\":\"663054\"}', '{\"success\":true,\"message\":\"Registration completed successfully\",\"data\":{\"success\":true,\"token\":\"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6Imh6aTN2S2p3RDVvOEpSRU14djlCclVTIiwicm9sZSI6InN1Yi1jbGllbnQiLCJpYXQiOjE3NDM0MDIyOTQsImV4cCI6MTc0MzQ4ODY5NH0.sbpI28', '2.45 seconds', '2025-03-31 11:54:57', '2025-03-31 11:54:57'),
('dgcdT1FWro4TmYTFmORgC4U', '/api/v1/designations', 'POST api/v1/designations', '{}', '{}', '{\"designation_name\":\"Senior Software Engineer\",\"branch\":\"UH8lBWZZAkctwuRFiCz5PMB\"}', '{\"success\":true,\"message\":\"Designation created successfully\",\"data\":{\"id\":\"UUBCv7KfYd6JRjBUizsgD4o\",\"updated_by\":null,\"branch\":\"UH8lBWZZAkctwuRFiCz5PMB\",\"designation_name\":\"Senior Software Engineer\",\"client_id\":\"4kykUHcg5oLrhNDkfCLNYYG\",\"created_by\":\"Silv', '0.03 seconds', '2025-03-31 12:12:36', '2025-03-31 12:12:36'),
('dH55K2CjOzk1gYAI7sblbbB', '/api/v1/labels/4kykUHcg5oLrhNDkfCLNYYG', 'GET api/v1/labels/4kykUHcg5oLrhNDkfCLNYYG', '{\"id\":\"4kykUHcg5oLrhNDkfCLNYYG\"}', '{}', '{}', '{\"success\":true,\"message\":\"Tags retrieved successfully\",\"data\":[{\"id\":\"0ga51ZccuIiGGEudOSNNRDJ\",\"related_id\":\"4kykUHcg5oLrhNDkfCLNYYG\",\"lableType\":\"source\",\"name\":\"Phone\",\"color\":\"#34495E\",\"client_id\":\"4kykUHcg5oLrhNDkfCLNYYG\",\"created_by\":\"system\",\"updat', '0.06 seconds', '2025-03-31 14:31:27', '2025-03-31 14:31:27'),
('DJ1DSn0Z0ge27BLHTcKhXiC', '/api/v1/roles', 'GET api/v1/roles', '{}', '{}', '{}', '{\"success\":true,\"message\":\"Roles fetched successfully\",\"data\":[{\"id\":\"vI5ukP3myMKhjXXeHsmq1Rj\",\"role_name\":\"client\",\"permissions\":null,\"client_id\":null,\"created_by\":\"superadmin\",\"updated_by\":null,\"createdAt\":\"2025-03-31T03:57:18.000Z\",\"updatedAt\":\"2025-03', '0.01 seconds', '2025-03-31 10:58:38', '2025-03-31 10:58:38'),
('DjG0spQ20IBz37MuCcuyVTc', '/api/v1/sub-clients', 'POST api/v1/sub-clients', '{}', '{}', '{\"username\":\"TechPro Solutions\",\"email\":\"techpro.solutions@yopmail.com\",\"password\":\"TechProSolutions@2525\"}', '{\"success\":true,\"message\":\"Please verify your email to complete registration\",\"data\":{\"sessionToken\":\"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjRreWtVSGNnNW9McmhORGtmQ0xOWVlHIiwidXNlcm5hbWUiOiJUZWNoUHJvIFNvbHV0aW9ucyIsImVtYWlsIjoidGVjaHByby5zb2x1dGlv', '2.86 seconds', '2025-03-31 11:47:09', '2025-03-31 11:47:09'),
('dKAO4ulMf58ecw0ptOSnZg9', '/api/v1/auth/admin-login', 'POST api/v1/auth/admin-login', '{}', '{}', '{\"email\":\"silverlinesystems@yopmail.com\"}', '{\"success\":true,\"message\":\"Login successful\",\"data\":{\"token\":\"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6IlNpbHZlcmxpbmUgU3lzdGVtcyIsImVtYWlsIjoic2lsdmVybGluZXN5c3RlbXNAeW9wbWFpbC5jb20iLCJwaG9uZSI6bnVsbCwiaWQiOiI0a3lrVUhjZzVvTHJoTkRrZkNMTllZRyIs', '0.01 seconds', '2025-03-31 10:14:06', '2025-03-31 10:14:06'),
('DKu5ofczabs536fp8Y7PUXu', '/api/v1/currencies?', 'GET api/v1/currencies?', '{}', '{}', '{}', '{\"success\":true,\"message\":\"Currencies fetched successfully\",\"data\":[{\"id\":\"29gCwt8wWQg7CPgG96847iD\",\"currencyName\":\"Euro\",\"currencyIcon\":\"€\",\"currencyCode\":\"EUR\",\"created_by\":null,\"updated_by\":null,\"createdAt\":\"2025-03-31T04:23:06.000Z\",\"updatedAt\":\"2025-', '0.03 seconds', '2025-03-31 10:48:55', '2025-03-31 10:48:55'),
('DMA51XsnctsdP7NQDKAYdda', '/api/v1/auth', 'GET api/v1/auth', '{}', '{}', '{}', '{\"success\":true,\"message\":\"Users fetched successfully\",\"data\":[{\"conversations\":{},\"id\":\"0aMTORQ27wG00Ht5REhq13p\",\"employeeId\":null,\"username\":\" ba.silverline\",\"password\":\"$2b$12$NT.meyBZRWfJve/VLDgQo.bwhzGz1ElPJcoihKL2lokuJpOAqHk6W\",\"email\":\"ba.silverlin', '0.01 seconds', '2025-03-31 17:15:46', '2025-03-31 17:15:46'),
('dNw3j2b81OhDCqYxJ0Prefe', '/api/v1/stages', 'GET api/v1/stages', '{}', '{}', '{}', '{\"success\":true,\"message\":\"Stages fetched successfully\",\"data\":[{\"id\":\"1j1Mfax4tYdOONQGLA23CeQ\",\"stageType\":\"deal\",\"stageName\":\"Lead Received\",\"pipeline\":\"iiUsXOteVUFiCIMkgR6DObO\",\"client_id\":\"4kykUHcg5oLrhNDkfCLNYYG\",\"created_by\":\"Silverline Systems\",\"up', '0.12 seconds', '2025-03-31 16:47:23', '2025-03-31 16:47:23'),
('dpHsb1OgU2dFnlRkbCvTBbY', '/api/v1/leads?', 'GET api/v1/leads?', '{}', '{}', '{}', '{\"success\":true,\"message\":\"Lead fetched successfully\",\"data\":[{\"id\":\"31LINvHYSM5u4avuq7Wrjlh\",\"leadTitle\":\"TechPro Solutions Website Modernization\",\"leadStage\":\"eTzCUBr5Y232i82lxUoP9vJ\",\"currency\":\"INR\",\"leadValue\":850000,\"company_name\":\" TechPro Solution', '0.05 seconds', '2025-03-31 17:16:06', '2025-03-31 17:16:06'),
('dtLVYOxwk9KJTu9p1EEMdEZ', '/api/v1/currencies?page=1&limit=100', 'GET api/v1/currencies?page=1&limit=100', '{}', '{\"page\":1,\"limit\":100}', '{}', '{\"success\":true,\"message\":\"Currencies fetched successfully\",\"data\":[{\"id\":\"29gCwt8wWQg7CPgG96847iD\",\"currencyName\":\"Euro\",\"currencyIcon\":\"€\",\"currencyCode\":\"EUR\",\"created_by\":null,\"updated_by\":null,\"createdAt\":\"2025-03-31T04:23:06.000Z\",\"updatedAt\":\"2025-', '0.06 seconds', '2025-03-31 14:30:48', '2025-03-31 14:30:48'),
('dUbIy8g64CnJZ0nyZxjVa0h', '/api/v1/auth/login', 'POST api/v1/auth/login', '{}', '{}', '{\"login\":\"ba.silverline\",\"password\":\"Techsilverline@2525\"}', '{\"success\":false,\"message\":\"User not found\"}', '0.01 seconds', '2025-03-31 11:25:16', '2025-03-31 11:25:16'),
('DuWyHSkiNbfl6Wa2J8YX6K0', '/api/v1/deals/dmciOE2OiF952YsPFd0NPQi', 'GET api/v1/deals/dmciOE2OiF952YsPFd0NPQi', '{\"id\":\"dmciOE2OiF952YsPFd0NPQi\"}', '{}', '{}', '{\"success\":true,\"message\":\"Deal fetched successfully\",\"data\":{\"id\":\"dmciOE2OiF952YsPFd0NPQi\",\"leadTitle\":null,\"firstName\":null,\"lastName\":null,\"email\":null,\"phone\":null,\"dealName\":\"Cloud ERP Implementation\",\"pipeline\":\"iiUsXOteVUFiCIMkgR6DObO\",\"stage\":\"uc', '0.02 seconds', '2025-03-31 18:11:35', '2025-03-31 18:11:35'),
('duxBtcSuAHlE5QzkXAG4oLr', '/api/v1/countries?', 'GET api/v1/countries?', '{}', '{}', '{}', '{\"success\":true,\"message\":\"Countries fetched successfully\",\"data\":[{\"id\":\"0YNW00eJIaSTu6T8IZXJZ2W\",\"countryName\":\"Kuwait\",\"countryCode\":\"KW\",\"phoneCode\":\"+965\",\"created_by\":null,\"updated_by\":null,\"createdAt\":\"2025-03-31T03:52:28.000Z\",\"updatedAt\":\"2025-03', '0.03 seconds', '2025-03-31 16:46:37', '2025-03-31 16:46:37'),
('dwdHXY20uuSuTNztdIp9Bx4', '/api/v1/auth', 'GET api/v1/auth', '{}', '{}', '{}', '{\"success\":true,\"message\":\"Users fetched successfully\",\"data\":[{\"conversations\":{},\"id\":\"4kykUHcg5oLrhNDkfCLNYYG\",\"employeeId\":null,\"username\":\"Silverline Systems\",\"password\":\"$2b$12$.2Ia/XUZHrA7BEsLyf6uGuo9wgP9rGamovaR/ICL6YHHBDXVI5nIy\",\"email\":\"silverli', '0.01 seconds', '2025-03-31 11:31:13', '2025-03-31 11:31:13'),
('DyFiqtkK0NlPAJ7wLTvGWnh', '/api/v1/labels/4kykUHcg5oLrhNDkfCLNYYG', 'GET api/v1/labels/4kykUHcg5oLrhNDkfCLNYYG', '{\"id\":\"4kykUHcg5oLrhNDkfCLNYYG\"}', '{}', '{}', '{\"success\":true,\"message\":\"Tags retrieved successfully\",\"data\":[{\"id\":\"0ga51ZccuIiGGEudOSNNRDJ\",\"related_id\":\"4kykUHcg5oLrhNDkfCLNYYG\",\"lableType\":\"source\",\"name\":\"Phone\",\"color\":\"#34495E\",\"client_id\":\"4kykUHcg5oLrhNDkfCLNYYG\",\"created_by\":\"system\",\"updat', '0.01 seconds', '2025-03-31 16:57:06', '2025-03-31 16:57:06'),
('E1dRjRfGixkzoN2RTq3URmw', '/api/v1/countries?', 'GET api/v1/countries?', '{}', '{}', '{}', '{\"success\":true,\"message\":\"Countries fetched successfully\",\"data\":[{\"id\":\"0YNW00eJIaSTu6T8IZXJZ2W\",\"countryName\":\"Kuwait\",\"countryCode\":\"KW\",\"phoneCode\":\"+965\",\"created_by\":null,\"updated_by\":null,\"createdAt\":\"2025-03-31T03:52:28.000Z\",\"updatedAt\":\"2025-03', '0.03 seconds', '2025-03-31 16:47:23', '2025-03-31 16:47:23'),
('E3nwx4z1csCbKGkyuITk5eZ', '/api/v1/leads/YlSczjJh8OpXkCVEZYpMIs9', 'PUT api/v1/leads/YlSczjJh8OpXkCVEZYpMIs9', '{\"id\":\"YlSczjJh8OpXkCVEZYpMIs9\"}', '{}', '{\"leadStage\":\"eTzCUBr5Y232i82lxUoP9vJ\"}', '{\"success\":true,\"message\":\"Lead updated successfully!\",\"data\":{\"id\":\"YlSczjJh8OpXkCVEZYpMIs9\",\"leadTitle\":\"Global Retail IT Infrastructure\",\"leadStage\":\"eTzCUBr5Y232i82lxUoP9vJ\",\"currency\":\"INR\",\"leadValue\":2500000,\"company_name\":\"Global Retail Corp\",\"fir', '0.01 seconds', '2025-03-31 16:57:08', '2025-03-31 16:57:08'),
('e84L0qGWxyecfNZ7wXmWonC', '/api/v1/departments', 'GET api/v1/departments', '{}', '{}', '{}', '{\"success\":true,\"message\":\"Department fetched successfully\",\"data\":[{\"id\":\"6aVUek1kX78VHjoDjhnJDAD\",\"branch\":\"UH8lBWZZAkctwuRFiCz5PMB\",\"department_name\":\"Development\",\"client_id\":\"4kykUHcg5oLrhNDkfCLNYYG\",\"created_by\":\"Silverline Systems\",\"updated_by\":nul', '0.01 seconds', '2025-03-31 12:18:07', '2025-03-31 12:18:07'),
('Eb6RmE6tOOa20F4JQD8BLSL', '/api/v1/labels/4kykUHcg5oLrhNDkfCLNYYG', 'GET api/v1/labels/4kykUHcg5oLrhNDkfCLNYYG', '{\"id\":\"4kykUHcg5oLrhNDkfCLNYYG\"}', '{}', '{}', '{\"success\":true,\"message\":\"Tags retrieved successfully\",\"data\":[{\"id\":\"0ga51ZccuIiGGEudOSNNRDJ\",\"related_id\":\"4kykUHcg5oLrhNDkfCLNYYG\",\"lableType\":\"source\",\"name\":\"Phone\",\"color\":\"#34495E\",\"client_id\":\"4kykUHcg5oLrhNDkfCLNYYG\",\"created_by\":\"system\",\"updat', '0.01 seconds', '2025-03-31 16:00:54', '2025-03-31 16:00:54'),
('EBOlhamsrJTYXnEovfF4OTp', '/api/v1/countries?page=1&limit=100', 'GET api/v1/countries?page=1&limit=100', '{}', '{\"page\":1,\"limit\":100}', '{}', '{\"success\":true,\"message\":\"Countries fetched successfully\",\"data\":[{\"id\":\"0YNW00eJIaSTu6T8IZXJZ2W\",\"countryName\":\"Kuwait\",\"countryCode\":\"KW\",\"phoneCode\":\"+965\",\"created_by\":null,\"updated_by\":null,\"createdAt\":\"2025-03-31T03:52:28.000Z\",\"updatedAt\":\"2025-03', '0.05 seconds', '2025-03-31 12:32:13', '2025-03-31 12:32:13'),
('eeCXUMrMGcVycRdw9gh7Gjt', '/api/v1/leads', 'GET api/v1/leads', '{}', '{}', '{}', '{\"success\":true,\"message\":\"Lead fetched successfully\",\"data\":[{\"id\":\"31LINvHYSM5u4avuq7Wrjlh\",\"leadTitle\":\"TechPro Solutions Website Modernization\",\"leadStage\":\"BYNYLCidEQll0qKymn79W76\",\"currency\":\"INR\",\"leadValue\":850000,\"company_name\":\" TechPro Solution', '0.05 seconds', '2025-03-31 16:56:37', '2025-03-31 16:56:37'),
('ehTDVSh1QyJO4MtTPN93MgA', '/api/v1/products', 'GET api/v1/products', '{}', '{}', '{}', '{\"success\":true,\"message\":\"Product fetched successfully\",\"data\":[]}', '0.01 seconds', '2025-03-31 10:55:55', '2025-03-31 10:55:55'),
('eI4j6SwmLiqB6rba2xk2eUr', '/api/v1/deals/dmciOE2OiF952YsPFd0NPQi', 'GET api/v1/deals/dmciOE2OiF952YsPFd0NPQi', '{\"id\":\"dmciOE2OiF952YsPFd0NPQi\"}', '{}', '{}', '{\"success\":true,\"message\":\"Deal fetched successfully\",\"data\":{\"id\":\"dmciOE2OiF952YsPFd0NPQi\",\"leadTitle\":null,\"firstName\":null,\"lastName\":null,\"email\":null,\"phone\":null,\"dealName\":\"Cloud ERP Implementation\",\"pipeline\":\"iiUsXOteVUFiCIMkgR6DObO\",\"stage\":\"uc', '0.01 seconds', '2025-03-31 17:48:06', '2025-03-31 17:48:06'),
('eJofkf6pg3wEOXWnLusVLzD', '/api/v1/customers', 'GET api/v1/customers', '{}', '{}', '{}', '{\"success\":true,\"message\":\"Customer fetched successfully\",\"data\":[]}', '0.01 seconds', '2025-03-31 17:15:10', '2025-03-31 17:15:10'),
('ELbNQy2UOR8Uyzekpq5Cpyi', '/api/v1/leads', 'GET api/v1/leads', '{}', '{}', '{}', '{\"success\":true,\"message\":\"Lead fetched successfully\",\"data\":[{\"id\":\"31LINvHYSM5u4avuq7Wrjlh\",\"leadTitle\":\"TechPro Solutions Website Modernization\",\"leadStage\":\"BYNYLCidEQll0qKymn79W76\",\"currency\":\"INR\",\"leadValue\":850000,\"company_name\":\" TechPro Solution', '0.01 seconds', '2025-03-31 16:57:00', '2025-03-31 16:57:00'),
('elWvEIYD2w9C2eg0hBk7wym', '/api/v1/clients', 'GET api/v1/clients', '{}', '{}', '{}', '{\"success\":false,\"message\":\"Cannot read properties of null (reading \'id\')\"}', '0.04 seconds', '2025-03-31 09:22:28', '2025-03-31 09:22:28'),
('EMarX7Rd8CRNcpa0iW8BE7F', '/api/v1/sub-clients', 'GET api/v1/sub-clients', '{}', '{}', '{}', '{\"success\":true,\"message\":\"SubClients fetched successfully\",\"data\":[{\"conversations\":{},\"id\":\"yxycYESzDheRycH00QSw3sc\",\"employeeId\":null,\"username\":\"TechPro Solutions\",\"password\":\"$2b$12$s/h5jUhubCRhTgMo0Fyev.INqHMG7Ir5UL6kh8kdqpfuqT3fCyE3C\",\"email\":\"tech', '0.06 seconds', '2025-03-31 11:47:43', '2025-03-31 11:47:43'),
('ENn59CXu46JqISAda9AFE9i', '/api/v1/countries?page=1&limit=100', 'GET api/v1/countries?page=1&limit=100', '{}', '{\"page\":1,\"limit\":100}', '{}', '{\"success\":true,\"message\":\"Countries fetched successfully\",\"data\":[{\"id\":\"0YNW00eJIaSTu6T8IZXJZ2W\",\"countryName\":\"Kuwait\",\"countryCode\":\"KW\",\"phoneCode\":\"+965\",\"created_by\":null,\"updated_by\":null,\"createdAt\":\"2025-03-31T03:52:28.000Z\",\"updatedAt\":\"2025-03', '0.01 seconds', '2025-03-31 10:12:34', '2025-03-31 10:12:34'),
('Epg15nD21HNZISwcBsOsxaa', '/api/v1/roles', 'GET api/v1/roles', '{}', '{}', '{}', '{\"success\":true,\"message\":\"Roles fetched successfully\",\"data\":[{\"id\":\"vI5ukP3myMKhjXXeHsmq1Rj\",\"role_name\":\"client\",\"permissions\":null,\"client_id\":null,\"created_by\":\"superadmin\",\"updated_by\":null,\"createdAt\":\"2025-03-31T03:57:18.000Z\",\"updatedAt\":\"2025-03', '0.12 seconds', '2025-03-31 10:28:44', '2025-03-31 10:28:44'),
('ERZDlw20tjfljaLv7Ag7mZ4', '/api/v1/projects', 'GET api/v1/projects', '{}', '{}', '{}', '{\"success\":true,\"message\":\"Projects fetched successfully\",\"data\":[]}', '0.08 seconds', '2025-03-31 11:01:16', '2025-03-31 11:01:16'),
('ETWD8gAMupS0sFWJxCopRAZ', '/api/v1/countries?page=1&limit=100', 'GET api/v1/countries?page=1&limit=100', '{}', '{\"page\":1,\"limit\":100}', '{}', '{\"success\":true,\"message\":\"Countries fetched successfully\",\"data\":[{\"id\":\"0YNW00eJIaSTu6T8IZXJZ2W\",\"countryName\":\"Kuwait\",\"countryCode\":\"KW\",\"phoneCode\":\"+965\",\"created_by\":null,\"updated_by\":null,\"createdAt\":\"2025-03-31T03:52:28.000Z\",\"updatedAt\":\"2025-03', '0.00 seconds', '2025-03-31 17:48:25', '2025-03-31 17:48:25'),
('ETZOZYlcYbQVpQ4so2ECljo', '/api/v1/branches', 'GET api/v1/branches', '{}', '{}', '{}', '{\"success\":true,\"message\":\"Branches fetched successfully\",\"data\":[{\"id\":\"bjHlRDFkaJBOh3kg2EP52VH\",\"branchName\":\"Bangalore\",\"branchAddress\":\"Tech Park One, 4th Floor\\nWhitefield Main Road\\nBangalore, Karnataka - 560066\",\"branchManager\":\"wPHc9cisqOzzpTW0Mpz', '0.08 seconds', '2025-03-31 12:32:13', '2025-03-31 12:32:13'),
('eVo09hYCkFmf9b6klbBSYeT', '/api/v1/currencies?limit=100', 'GET api/v1/currencies?limit=100', '{}', '{\"limit\":100}', '{}', '{\"success\":true,\"message\":\"Currencies fetched successfully\",\"data\":[{\"id\":\"29gCwt8wWQg7CPgG96847iD\",\"currencyName\":\"Euro\",\"currencyIcon\":\"€\",\"currencyCode\":\"EUR\",\"created_by\":null,\"updated_by\":null,\"createdAt\":\"2025-03-31T04:23:06.000Z\",\"updatedAt\":\"2025-', '0.02 seconds', '2025-03-31 17:14:58', '2025-03-31 17:14:58'),
('ewh7i6GWkyJAL7XVgQXyJw0', '/api/v1/clients', 'GET api/v1/clients', '{}', '{}', '{}', '{\"success\":true,\"message\":\"Clients fetched successfully\",\"data\":[{\"conversations\":{},\"id\":\"Wek9GHYyp9ebFwzjFZHtuvA\",\"employeeId\":null,\"username\":\"TechVision Dynamics\",\"password\":\"$2b$12$9kHm79TeiEE8cMBO54AwgOqIV8w6C4965S4Psi2k8hZg6nsMYimuC\",\"email\":\"techV', '0.01 seconds', '2025-03-31 09:29:08', '2025-03-31 09:29:08'),
('EzTBJCLkJkIFNAQM7Yd9VbR', '/api/v1/subscriptions?page=1&limit=100&search=', 'GET api/v1/subscriptions?page=1&limit=100&search=', '{}', '{}', '{}', '{\"success\":true,\"message\":\"Plans retrieved successfully\",\"data\":[{\"id\":\"uzptLdgqYFRoK23ORcMgQrg\",\"name\":\"Basic Plan\",\"currency\":\"INR\",\"price\":\"999.00\",\"duration\":\"Per Month\",\"trial_period\":\"7\",\"max_users\":\"5\",\"max_clients\":\"10\",\"max_customers\":\"50\",\"max_v', '0.07 seconds', '2025-03-31 14:41:38', '2025-03-31 14:41:38'),
('FBDa7X8Yb4h8NAOrs3yyuwV', '/api/v1/currencies?limit=100', 'GET api/v1/currencies?limit=100', '{}', '{\"limit\":100}', '{}', '{\"success\":true,\"message\":\"Currencies fetched successfully\",\"data\":[{\"id\":\"29gCwt8wWQg7CPgG96847iD\",\"currencyName\":\"Euro\",\"currencyIcon\":\"€\",\"currencyCode\":\"EUR\",\"created_by\":null,\"updated_by\":null,\"createdAt\":\"2025-03-31T04:23:06.000Z\",\"updatedAt\":\"2025-', '0.03 seconds', '2025-03-31 17:13:43', '2025-03-31 17:13:43'),
('FCVttvSXY5bDQSjXX1uRw3x', '/api/v1/stages', 'GET api/v1/stages', '{}', '{}', '{}', '{\"success\":true,\"message\":\"Stages fetched successfully\",\"data\":[{\"id\":\"1j1Mfax4tYdOONQGLA23CeQ\",\"stageType\":\"deal\",\"stageName\":\"Lead Received\",\"pipeline\":\"iiUsXOteVUFiCIMkgR6DObO\",\"client_id\":\"4kykUHcg5oLrhNDkfCLNYYG\",\"created_by\":\"Silverline Systems\",\"up', '0.08 seconds', '2025-03-31 16:45:00', '2025-03-31 16:45:00'),
('fDp0qmbhidDDZR4ybB2d9o6', '/api/v1/deals', 'GET api/v1/deals', '{}', '{}', '{}', '{\"success\":true,\"message\":\"Deal fetched successfully\",\"data\":[{\"id\":\"dmciOE2OiF952YsPFd0NPQi\",\"leadTitle\":null,\"firstName\":null,\"lastName\":null,\"email\":null,\"phone\":null,\"dealName\":\"Cloud ERP Implementation\",\"pipeline\":\"iiUsXOteVUFiCIMkgR6DObO\",\"stage\":\"1', '0.01 seconds', '2025-03-31 17:46:09', '2025-03-31 17:46:09'),
('ffIdoEUdzgB8EExPYrfr6s8', '/api/v1/labels/4kykUHcg5oLrhNDkfCLNYYG', 'GET api/v1/labels/4kykUHcg5oLrhNDkfCLNYYG', '{\"id\":\"4kykUHcg5oLrhNDkfCLNYYG\"}', '{}', '{}', '{\"success\":true,\"message\":\"Tags retrieved successfully\",\"data\":[{\"id\":\"0ga51ZccuIiGGEudOSNNRDJ\",\"related_id\":\"4kykUHcg5oLrhNDkfCLNYYG\",\"lableType\":\"source\",\"name\":\"Phone\",\"color\":\"#34495E\",\"client_id\":\"4kykUHcg5oLrhNDkfCLNYYG\",\"created_by\":\"system\",\"updat', '0.16 seconds', '2025-03-31 17:23:43', '2025-03-31 17:23:43'),
('fGJqNZubyHnEiEpMfFjDpje', '/api/v1/clients', 'POST api/v1/clients', '{}', '{}', '{\"username\":\"Stellar Innovations\",\"email\":\"stellarinnovations@yopmail.com\",\"password\":\"StellarInnovations@yopmail.com\"}', '{\"success\":false,\"message\":\"⚠️ Create a strong password\",\"error\":{\"message\":\"Create a strong password\",\"code\":\"BAD_REQUEST\"},\"statusCode\":400}', '0.01 seconds', '2025-03-31 09:33:31', '2025-03-31 09:33:31'),
('fhFQe7ykP86ZzK9VgEoZwy6', '/api/v1/branches', 'GET api/v1/branches', '{}', '{}', '{}', '{\"success\":true,\"message\":\"Branches fetched successfully\",\"data\":[{\"id\":\"bjHlRDFkaJBOh3kg2EP52VH\",\"branchName\":\"Bangalore\",\"branchAddress\":\"Tech Park One, 4th Floor\\nWhitefield Main Road\\nBangalore, Karnataka - 560066\",\"branchManager\":\"wPHc9cisqOzzpTW0Mpz', '0.01 seconds', '2025-03-31 12:20:50', '2025-03-31 12:20:50'),
('fihWYsBgqUOrmVCejWad1AS', '/api/v1/deals/dmciOE2OiF952YsPFd0NPQi', 'PUT api/v1/deals/dmciOE2OiF952YsPFd0NPQi', '{\"id\":\"dmciOE2OiF952YsPFd0NPQi\"}', '{}', '{\"stage\":\"ucHxzJDG8XiUl7sMzJz0OJL\"}', '{\"success\":true,\"message\":\"Deal updated successfully\",\"data\":{\"id\":\"dmciOE2OiF952YsPFd0NPQi\",\"leadTitle\":null,\"firstName\":null,\"lastName\":null,\"email\":null,\"phone\":null,\"dealName\":\"Cloud ERP Implementation\",\"pipeline\":\"iiUsXOteVUFiCIMkgR6DObO\",\"stage\":\"uc', '0.01 seconds', '2025-03-31 17:46:20', '2025-03-31 17:46:20'),
('FiPBszIFfWcftqqZ4dZh5bZ', '/api/v1/attendance', 'GET api/v1/attendance', '{}', '{}', '{}', '{\"success\":true,\"message\":\"Attendance fetched successfully\",\"data\":[]}', '0.17 seconds', '2025-03-31 12:24:21', '2025-03-31 12:24:21'),
('fJGAL0BwbXvMnBv1nz9A3Ok', '/api/v1/roles', 'GET api/v1/roles', '{}', '{}', '{}', '{\"success\":true,\"message\":\"Roles fetched successfully\",\"data\":[{\"id\":\"03qarcBedPhsVY3A1IKMMyW\",\"role_name\":\"System Administrator\",\"permissions\":\"{\\\"dashboards-project-list\\\":[{\\\"key\\\":\\\"dashboards-project-list\\\",\\\"permissions\\\":[\\\"view\\\",\\\"create\\\",\\\"upda', '0.07 seconds', '2025-03-31 17:23:43', '2025-03-31 17:23:43'),
('FJNQWLdqwyHBaKzNcssrbBH', '/api/v1/deals', 'GET api/v1/deals', '{}', '{}', '{}', '{\"success\":true,\"message\":\"Deal fetched successfully\",\"data\":[{\"id\":\"dmciOE2OiF952YsPFd0NPQi\",\"leadTitle\":null,\"firstName\":null,\"lastName\":null,\"email\":null,\"phone\":null,\"dealName\":\"Cloud ERP Implementation\",\"pipeline\":\"iiUsXOteVUFiCIMkgR6DObO\",\"stage\":\"u', '0.01 seconds', '2025-03-31 17:46:20', '2025-03-31 17:46:20'),
('FKCtqaCy6UEzxNZW7k8UANH', '/api/v1/subscriptions/assign', 'POST api/v1/subscriptions/assign', '{}', '{}', '{\"client_id\":\"4kykUHcg5oLrhNDkfCLNYYG\",\"plan_id\":\"uzptLdgqYFRoK23ORcMgQrg\",\"start_date\":\"2025-03-21T00:00:00.000Z\",\"end_date\":\"2025-03-31T00:00:00.000Z\",\"status\":\"active\",\"payment_status\":\"paid\"}', '{\"success\":true,\"message\":\"Subscription plan assigned successfully\",\"data\":{\"id\":\"PLGtptJFFV4blMJfFi8AeBR\",\"current_vendors_count\":0,\"current_customers_count\":0,\"updated_by\":null,\"client_id\":\"4kykUHcg5oLrhNDkfCLNYYG\",\"plan_id\":\"uzptLdgqYFRoK23ORcMgQrg\",\"s', '3.53 seconds', '2025-03-31 10:13:59', '2025-03-31 10:13:59'),
('fnR3WMWssQ6He70DD3tr9y7', '/api/v1/auth/login', 'POST api/v1/auth/login', '{}', '{}', '{\"login\":\"Horizon Ventures\",\"password\":\"HorizonVentures@2525\"}', '{\"success\":false,\"message\":\"No active subscription found\"}', '0.02 seconds', '2025-03-31 09:45:07', '2025-03-31 09:45:07');
INSERT INTO `audittrails` (`id`, `url`, `activity`, `params`, `query`, `payload`, `response`, `duration`, `createdAt`, `updatedAt`) VALUES
('Fnx4e3g1u0JbPdHMgy0n70c', '/api/v1/subscriptions/assign', 'GET api/v1/subscriptions/assign', '{}', '{}', '{}', '{\"success\":true,\"message\":\"Assigned Plans fetched successfully\",\"data\":[{\"id\":\"PLGtptJFFV4blMJfFi8AeBR\",\"client_id\":\"4kykUHcg5oLrhNDkfCLNYYG\",\"plan_id\":\"uzptLdgqYFRoK23ORcMgQrg\",\"start_date\":\"2025-03-21T00:00:00.000Z\",\"end_date\":\"2025-04-07T18:29:59.000Z\"', '0.01 seconds', '2025-03-31 10:14:31', '2025-03-31 10:14:31'),
('FPTUPn6LDdXeWtc0tmEsXDz', '/api/v1/clients', 'GET api/v1/clients', '{}', '{}', '{}', '{\"success\":true,\"message\":\"Clients fetched successfully\",\"data\":[{\"conversations\":{},\"id\":\"Wek9GHYyp9ebFwzjFZHtuvA\",\"employeeId\":null,\"username\":\"TechVision Dynamics\",\"password\":\"$2b$12$9kHm79TeiEE8cMBO54AwgOqIV8w6C4965S4Psi2k8hZg6nsMYimuC\",\"email\":\"techV', '0.02 seconds', '2025-03-31 09:27:35', '2025-03-31 09:27:35'),
('FQS4GnG4xH5VTMLvDHXNxli', '/api/v1/labels/4kykUHcg5oLrhNDkfCLNYYG', 'GET api/v1/labels/4kykUHcg5oLrhNDkfCLNYYG', '{\"id\":\"4kykUHcg5oLrhNDkfCLNYYG\"}', '{}', '{}', '{\"success\":true,\"message\":\"Tags retrieved successfully\",\"data\":[{\"id\":\"0ga51ZccuIiGGEudOSNNRDJ\",\"related_id\":\"4kykUHcg5oLrhNDkfCLNYYG\",\"lableType\":\"source\",\"name\":\"Phone\",\"color\":\"#34495E\",\"client_id\":\"4kykUHcg5oLrhNDkfCLNYYG\",\"created_by\":\"system\",\"updat', '0.06 seconds', '2025-03-31 14:31:48', '2025-03-31 14:31:48'),
('FSvb5rjv27bWGf3vF1UIo4m', '/api/v1/invoices/single/dmciOE2OiF952YsPFd0NPQi', 'GET api/v1/invoices/single/dmciOE2OiF952YsPFd0NPQi', '{\"id\":\"dmciOE2OiF952YsPFd0NPQi\"}', '{}', '{}', '{\"success\":true,\"message\":\"Invoice fetched successfully\",\"data\":[]}', '0.04 seconds', '2025-03-31 17:48:06', '2025-03-31 17:48:06'),
('fzh1pNSHOqgRYjI7gZgiEmU', '/api/v1/clients', 'GET api/v1/clients', '{}', '{}', '{}', '{\"success\":true,\"message\":\"Clients fetched successfully\",\"data\":[{\"conversations\":{},\"id\":\"7aRxfVTXsxd31PyBz9WzEjx\",\"employeeId\":null,\"username\":\"Quantum Enterprises\",\"password\":\"$2b$12$OCduts6PI5L0YSEOVKT73uvS2zlUOaAPNMKWIxOO8tA/YpS1K.TRS\",\"email\":\"quant', '0.01 seconds', '2025-03-31 09:39:27', '2025-03-31 09:39:27'),
('g3UokL4rT6J5DYzvTMMgTAa', '/api/v1/taxes', 'GET api/v1/taxes', '{}', '{}', '{}', '{\"success\":true,\"message\":\"Tax fetched successfully\",\"data\":[{\"id\":\"FSq4XX9i6eb0ghsGzTZqkLW\",\"gstName\":\"PPT\",\"gstPercentage\":\"1\",\"client_id\":\"4kykUHcg5oLrhNDkfCLNYYG\",\"created_by\":\"Silverline Systems\",\"updated_by\":\"Silverline Systems\",\"createdAt\":\"2025-03', '0.05 seconds', '2025-03-31 18:05:19', '2025-03-31 18:05:19'),
('G7m4whmYDfdACl9UycNqBvC', '/api/v1/subscriptions?page=1&limit=10&search=', 'GET api/v1/subscriptions?page=1&limit=10&search=', '{}', '{}', '{}', '{\"success\":true,\"message\":\"Plans retrieved successfully\",\"data\":[]}', '0.01 seconds', '2025-03-31 09:53:06', '2025-03-31 09:53:06'),
('g9oi8P9nLqUr672i0O7zeui', '/api/v1/clients', 'GET api/v1/clients', '{}', '{}', '{}', '{\"success\":true,\"message\":\"Clients fetched successfully\",\"data\":[]}', '0.01 seconds', '2025-03-31 09:27:22', '2025-03-31 09:27:22'),
('GC0ujJ7rLIcidWJyeK3SMKf', '/api/v1/employees', 'POST api/v1/employees', '{}', '{}', '{\"firstName\":\"Sneha \",\"lastName\":\"Gupta\",\"username\":\" sneha.gupta\",\"email\":\"sneha.gupta.silverline@yopmail.com\",\"password\":\"Snehagupta@2525\",\"phone\":\"4321098765\",\"address\":\"Golden Plaza\\n892 Ring Road\\nNear Metro Station, Rajouri Garden\\nNew Delhi - 11002', '{\"success\":true,\"message\":\"Please verify your email to complete registration\",\"data\":{\"sessionToken\":\"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjRreWtVSGNnNW9McmhORGtmQ0xOWVlHIiwidXNlcm5hbWUiOiIgc25laGEuZ3VwdGEiLCJlbWFpbCI6InNuZWhhLmd1cHRhLnNpbHZlcmxp', '3.66 seconds', '2025-03-31 12:55:25', '2025-03-31 12:55:25'),
('gf3Rlsp1sS7kfZX0IuwvXKt', '/api/v1/departments', 'GET api/v1/departments', '{}', '{}', '{}', '{\"success\":true,\"message\":\"Department fetched successfully\",\"data\":[{\"id\":\"6aVUek1kX78VHjoDjhnJDAD\",\"branch\":\"UH8lBWZZAkctwuRFiCz5PMB\",\"department_name\":\"Development\",\"client_id\":\"4kykUHcg5oLrhNDkfCLNYYG\",\"created_by\":\"Silverline Systems\",\"updated_by\":nul', '0.01 seconds', '2025-03-31 12:22:16', '2025-03-31 12:22:16'),
('GgNfEL86F6Mlo3DQhAJxQhc', '/api/v1/currencies?', 'GET api/v1/currencies?', '{}', '{}', '{}', '{\"success\":true,\"message\":\"Currencies fetched successfully\",\"data\":[{\"id\":\"29gCwt8wWQg7CPgG96847iD\",\"currencyName\":\"Euro\",\"currencyIcon\":\"€\",\"currencyCode\":\"EUR\",\"created_by\":null,\"updated_by\":null,\"createdAt\":\"2025-03-31T04:23:06.000Z\",\"updatedAt\":\"2025-', '0.00 seconds', '2025-03-31 14:31:48', '2025-03-31 14:31:48'),
('gHUaA0D7pfx4mpJSubQIF4B', '/api/v1/departments', 'POST api/v1/departments', '{}', '{}', '{\"department_name\":\"HR\",\"branch\":\"UH8lBWZZAkctwuRFiCz5PMB\"}', '{\"success\":true,\"message\":\"Department created successfully\",\"data\":{\"id\":\"8Yhv5i8Eu5y3rn3kJLY8VWC\",\"updated_by\":null,\"branch\":\"UH8lBWZZAkctwuRFiCz5PMB\",\"department_name\":\"HR\",\"client_id\":\"4kykUHcg5oLrhNDkfCLNYYG\",\"created_by\":\"Silverline Systems\",\"updated', '0.01 seconds', '2025-03-31 12:27:18', '2025-03-31 12:27:18'),
('gJcC11Cf5wjrUahV866XUTb', '/api/v1/auth', 'GET api/v1/auth', '{}', '{}', '{}', '{\"success\":true,\"message\":\"Users fetched successfully\",\"data\":[{\"conversations\":{},\"id\":\"0aMTORQ27wG00Ht5REhq13p\",\"employeeId\":null,\"username\":\" ba.silverline\",\"password\":\"$2b$12$NT.meyBZRWfJve/VLDgQo.bwhzGz1ElPJcoihKL2lokuJpOAqHk6W\",\"email\":\"ba.silverlin', '0.09 seconds', '2025-03-31 16:57:06', '2025-03-31 16:57:06'),
('GKpK3nfQ6K8Byf1nyIBuB1d', '/api/v1/subscriptions', 'POST api/v1/subscriptions', '{}', '{}', '{\"name\":\"Basic Plan\",\"currency\":\"INR\",\"price\":999,\"duration\":\"Per Month\",\"trial_period\":\"7\",\"storage_limit\":\"10\",\"max_users\":\"5\",\"max_clients\":\"10\",\"max_vendors\":\"20\",\"max_customers\":\"50\",\"status\":\"active\",\"features\":{}}', '{\"success\":true,\"message\":\"Plan created successfully\",\"data\":{\"id\":\"uzptLdgqYFRoK23ORcMgQrg\",\"updated_by\":null,\"name\":\"Basic Plan\",\"currency\":\"INR\",\"price\":999,\"duration\":\"Per Month\",\"trial_period\":\"7\",\"max_users\":\"5\",\"max_clients\":\"10\",\"max_customers\":\"5', '0.08 seconds', '2025-03-31 10:12:10', '2025-03-31 10:12:10'),
('gLoE61AdlB1mLEkX0DLfTIi', '/api/v1/inquiry', 'GET api/v1/inquiry', '{}', '{}', '{}', '{\"success\":true,\"message\":\"Inquiry fetched successfully\",\"data\":[]}', '0.01 seconds', '2025-03-31 14:42:30', '2025-03-31 14:42:30'),
('GNKEpcDsAgqkNhS6kOWduQp', '/api/v1/leads/31LINvHYSM5u4avuq7Wrjlh', 'PUT api/v1/leads/31LINvHYSM5u4avuq7Wrjlh', '{\"id\":\"31LINvHYSM5u4avuq7Wrjlh\"}', '{}', '{\"leadStage\":\"BYNYLCidEQll0qKymn79W76\"}', '{\"success\":true,\"message\":\"Lead updated successfully!\",\"data\":{\"id\":\"31LINvHYSM5u4avuq7Wrjlh\",\"leadTitle\":\"TechPro Solutions Website Modernization\",\"leadStage\":\"BYNYLCidEQll0qKymn79W76\",\"currency\":\"INR\",\"leadValue\":850000,\"company_name\":\" TechPro Solution', '0.02 seconds', '2025-03-31 14:37:28', '2025-03-31 14:37:28'),
('GphP8jSRuqqcZUgoBpkjKr1', '/api/v1/departments', 'POST api/v1/departments', '{}', '{}', '{\"department_name\":\" Design\",\"branch\":\"bjHlRDFkaJBOh3kg2EP52VH\"}', '{\"success\":true,\"message\":\"Department created successfully\",\"data\":{\"id\":\"WpZ22PfzjzV1wJkWa5vjaRv\",\"updated_by\":null,\"branch\":\"bjHlRDFkaJBOh3kg2EP52VH\",\"department_name\":\" Design\",\"client_id\":\"4kykUHcg5oLrhNDkfCLNYYG\",\"created_by\":\"Silverline Systems\",\"up', '0.01 seconds', '2025-03-31 12:29:13', '2025-03-31 12:29:13'),
('gQQ3yNsEtKU46zO3wDb9G1i', '/api/v1/deals', 'GET api/v1/deals', '{}', '{}', '{}', '{\"success\":true,\"message\":\"Deal fetched successfully\",\"data\":[]}', '0.05 seconds', '2025-03-31 10:50:09', '2025-03-31 10:50:09'),
('GtzUhhaAzUXvhAa5sBHk8fJ', '/api/v1/departments', 'GET api/v1/departments', '{}', '{}', '{}', '{\"success\":true,\"message\":\"Department fetched successfully\",\"data\":[{\"id\":\"0DQCpwzdzU2mZWnGcqM91AC\",\"branch\":\"haQEJiCePwC0KeJsmUWsSZ7\",\"department_name\":\" Sales\",\"client_id\":\"4kykUHcg5oLrhNDkfCLNYYG\",\"created_by\":\"Silverline Systems\",\"updated_by\":null,\"cr', '0.01 seconds', '2025-03-31 12:23:57', '2025-03-31 12:23:57'),
('GwcHfBwggEVdZEaJdWvfWeV', '/api/v1/projects', 'GET api/v1/projects', '{}', '{}', '{}', '{\"success\":true,\"message\":\"Projects fetched successfully\",\"data\":[]}', '0.01 seconds', '2025-03-31 14:25:33', '2025-03-31 14:25:33'),
('h408RR7MLs2VkZPDXYSv8Wx', '/api/v1/labels/4kykUHcg5oLrhNDkfCLNYYG', 'GET api/v1/labels/4kykUHcg5oLrhNDkfCLNYYG', '{\"id\":\"4kykUHcg5oLrhNDkfCLNYYG\"}', '{}', '{}', '{\"success\":true,\"message\":\"Tags retrieved successfully\",\"data\":[{\"id\":\"0ga51ZccuIiGGEudOSNNRDJ\",\"related_id\":\"4kykUHcg5oLrhNDkfCLNYYG\",\"lableType\":\"source\",\"name\":\"Phone\",\"color\":\"#34495E\",\"client_id\":\"4kykUHcg5oLrhNDkfCLNYYG\",\"created_by\":\"system\",\"updat', '0.01 seconds', '2025-03-31 16:57:06', '2025-03-31 16:57:06'),
('h4EG8GTA6AMtGtBxlv8Px2c', '/api/v1/labels/4kykUHcg5oLrhNDkfCLNYYG', 'GET api/v1/labels/4kykUHcg5oLrhNDkfCLNYYG', '{\"id\":\"4kykUHcg5oLrhNDkfCLNYYG\"}', '{}', '{}', '{\"success\":true,\"message\":\"Tags retrieved successfully\",\"data\":[{\"id\":\"0ga51ZccuIiGGEudOSNNRDJ\",\"related_id\":\"4kykUHcg5oLrhNDkfCLNYYG\",\"lableType\":\"source\",\"name\":\"Phone\",\"color\":\"#34495E\",\"client_id\":\"4kykUHcg5oLrhNDkfCLNYYG\",\"created_by\":\"system\",\"updat', '0.01 seconds', '2025-03-31 11:41:49', '2025-03-31 11:41:49'),
('H8EAnf0udQzWJcw0sSjOOUd', '/api/v1/projects', 'GET api/v1/projects', '{}', '{}', '{}', '{\"success\":true,\"message\":\"Projects fetched successfully\",\"data\":[]}', '0.03 seconds', '2025-03-31 17:13:27', '2025-03-31 17:13:27'),
('H9r1ucRK4W1I24fXQ4PbdZ0', '/api/v1/departments', 'GET api/v1/departments', '{}', '{}', '{}', '{\"success\":true,\"message\":\"Department fetched successfully\",\"data\":[]}', '0.06 seconds', '2025-03-31 12:04:14', '2025-03-31 12:04:14'),
('ha0bCE3dvPsimf3U2xVi4tQ', '/api/v1/designations', 'POST api/v1/designations', '{}', '{}', '{\"designation_name\":\"Senior Software Engineer\",\"branch\":\"UH8lBWZZAkctwuRFiCz5PMB\"}', '{\"success\":false,\"message\":\"Designation name already exists for the given branch and department\"}', '0.01 seconds', '2025-03-31 12:12:50', '2025-03-31 12:12:50'),
('Ha8khlAG5cRzcFE7g1LYEcK', '/api/v1/stages', 'GET api/v1/stages', '{}', '{}', '{}', '{\"success\":true,\"message\":\"Stages fetched successfully\",\"data\":[{\"id\":\"1j1Mfax4tYdOONQGLA23CeQ\",\"stageType\":\"deal\",\"stageName\":\"Lead Received\",\"pipeline\":\"iiUsXOteVUFiCIMkgR6DObO\",\"client_id\":\"4kykUHcg5oLrhNDkfCLNYYG\",\"created_by\":\"Silverline Systems\",\"up', '0.07 seconds', '2025-03-31 15:54:49', '2025-03-31 15:54:49'),
('HBbjp8kI02jTt6aw1KfZZTJ', '/api/v1/clients', 'POST api/v1/clients', '{}', '{}', '{\"username\":\"Quantum Enterprises\",\"email\":\"quantumeenterprises@yopmail.com\",\"password\":\"QuantumEnterprises@2525\"}', '{\"success\":true,\"message\":\"OTP sent to email\",\"data\":{\"sessionToken\":\"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6ImUzcVRVMGJFbWxJdll1OHY0akZtanh2IiwidXNlcm5hbWUiOiJRdWFudHVtIEVudGVycHJpc2VzIiwiZW1haWwiOiJxdWFudHVtZWVudGVycHJpc2VzQHlvcG1haWwuY29tIiwicm9s', '2.83 seconds', '2025-03-31 09:30:36', '2025-03-31 09:30:36'),
('hCCT6Ullhe9IDygybulqvz1', '/api/v1/currencies?', 'GET api/v1/currencies?', '{}', '{}', '{}', '{\"success\":true,\"message\":\"Currencies fetched successfully\",\"data\":[{\"id\":\"29gCwt8wWQg7CPgG96847iD\",\"currencyName\":\"Euro\",\"currencyIcon\":\"€\",\"currencyCode\":\"EUR\",\"created_by\":null,\"updated_by\":null,\"createdAt\":\"2025-03-31T04:23:06.000Z\",\"updatedAt\":\"2025-', '0.09 seconds', '2025-03-31 10:28:44', '2025-03-31 10:28:44'),
('HD4BXc2TXTxrz4g5SwGiIrL', '/api/v1/labels/4kykUHcg5oLrhNDkfCLNYYG', 'GET api/v1/labels/4kykUHcg5oLrhNDkfCLNYYG', '{\"id\":\"4kykUHcg5oLrhNDkfCLNYYG\"}', '{}', '{}', '{\"success\":true,\"message\":\"Tags retrieved successfully\",\"data\":[{\"id\":\"0ga51ZccuIiGGEudOSNNRDJ\",\"related_id\":\"4kykUHcg5oLrhNDkfCLNYYG\",\"lableType\":\"source\",\"name\":\"Phone\",\"color\":\"#34495E\",\"client_id\":\"4kykUHcg5oLrhNDkfCLNYYG\",\"created_by\":\"system\",\"updat', '0.08 seconds', '2025-03-31 17:23:44', '2025-03-31 17:23:44'),
('hDEhBtcvIFh926aABV63jQu', '/api/v1/auth', 'GET api/v1/auth', '{}', '{}', '{}', '{\"success\":true,\"message\":\"Users fetched successfully\",\"data\":[{\"conversations\":{},\"id\":\"0aMTORQ27wG00Ht5REhq13p\",\"employeeId\":null,\"username\":\" ba.silverline\",\"password\":\"$2b$12$NT.meyBZRWfJve/VLDgQo.bwhzGz1ElPJcoihKL2lokuJpOAqHk6W\",\"email\":\"ba.silverlin', '0.06 seconds', '2025-03-31 17:02:27', '2025-03-31 17:02:27'),
('HHnrkxpDv97vjOXtpm9SqiO', '/api/v1/sub-clients', 'GET api/v1/sub-clients', '{}', '{}', '{}', '{\"success\":false,\"message\":\"Cannot read properties of null (reading \'id\')\"}', '0.03 seconds', '2025-03-31 10:42:03', '2025-03-31 10:42:03'),
('Hj1YUqTKhcNO5ghXQ9RMSlT', '/api/v1/departments', 'GET api/v1/departments', '{}', '{}', '{}', '{\"success\":true,\"message\":\"Department fetched successfully\",\"data\":[{\"id\":\"0DQCpwzdzU2mZWnGcqM91AC\",\"branch\":\"haQEJiCePwC0KeJsmUWsSZ7\",\"department_name\":\" Sales\",\"client_id\":\"4kykUHcg5oLrhNDkfCLNYYG\",\"created_by\":\"Silverline Systems\",\"updated_by\":null,\"cr', '0.23 seconds', '2025-03-31 12:59:52', '2025-03-31 12:59:52'),
('hK0ZFoOGn2akXeZnrf6xYnP', '/api/v1/auth/login', 'POST api/v1/auth/login', '{}', '{}', '{\"login\":\"superadmin@nexisvision.com\",\"password\":\"SuperAdmin@123\"}', '{\"success\":true,\"message\":\"Login successful\",\"data\":{\"token\":\"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6InN1cGVyYWRtaW4iLCJlbWFpbCI6InN1cGVyYWRtaW5AbmV4aXN2aXNpb24uY29tIiwicGhvbmUiOm51bGwsImlkIjoiZTNxVFUwYkVtbEl2WXU4djRqRm1qeHYiLCJyb2xlIjoiWmVp', '0.19 seconds', '2025-03-31 10:23:08', '2025-03-31 10:23:08'),
('hKhK9Qe5ghgzoqXNLKpmQZZ', '/api/v1/auth/verify-signup', 'POST api/v1/auth/verify-signup', '{}', '{}', '{\"otp\":\"493671\"}', '{\"success\":true,\"message\":\"Registration completed successfully\",\"data\":{\"success\":true,\"token\":\"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IkVZeEwyanVtdFY0aDJyaUN4RVhMY0dwIiwicm9sZSI6ImNsaWVudCIsImlhdCI6MTc0MzM5Mzc1MiwiZXhwIjoxNzQzNDgwMTUyfQ.R2oY7exsxop', '2.87 seconds', '2025-03-31 09:32:34', '2025-03-31 09:32:34'),
('HneGYLPySJW63yjmnVd5CBP', '/api/v1/designations', 'GET api/v1/designations', '{}', '{}', '{}', '{\"success\":true,\"message\":\"Designation fetched successfully\",\"data\":[{\"id\":\"flbhBdf5hBLZTNbwhc12BY7\",\"branch\":\"UH8lBWZZAkctwuRFiCz5PMB\",\"designation_name\":\"HR Manager\",\"client_id\":\"4kykUHcg5oLrhNDkfCLNYYG\",\"created_by\":\"Silverline Systems\",\"updated_by\":nu', '0.01 seconds', '2025-03-31 12:29:47', '2025-03-31 12:29:47'),
('HOHeTvcTfCIl4mmsjmLp3jB', '/api/v1/leads', 'GET api/v1/leads', '{}', '{}', '{}', '{\"success\":true,\"message\":\"Lead fetched successfully\",\"data\":[{\"id\":\"31LINvHYSM5u4avuq7Wrjlh\",\"leadTitle\":\"TechPro Solutions Website Modernization\",\"leadStage\":\"BYNYLCidEQll0qKymn79W76\",\"currency\":\"INR\",\"leadValue\":850000,\"company_name\":\" TechPro Solution', '0.01 seconds', '2025-03-31 17:12:34', '2025-03-31 17:12:34'),
('HOrMthXs7lDTSSSK61vIuOd', '/api/v1/leads/31LINvHYSM5u4avuq7Wrjlh', 'PUT api/v1/leads/31LINvHYSM5u4avuq7Wrjlh', '{\"id\":\"31LINvHYSM5u4avuq7Wrjlh\"}', '{}', '{\"leadStage\":\"eTzCUBr5Y232i82lxUoP9vJ\"}', '{\"success\":true,\"message\":\"Lead updated successfully!\",\"data\":{\"id\":\"31LINvHYSM5u4avuq7Wrjlh\",\"leadTitle\":\"TechPro Solutions Website Modernization\",\"leadStage\":\"eTzCUBr5Y232i82lxUoP9vJ\",\"currency\":\"INR\",\"leadValue\":850000,\"company_name\":\" TechPro Solution', '0.01 seconds', '2025-03-31 17:12:35', '2025-03-31 17:12:35'),
('Hq4UU5U2OA33pNtHc9XFSya', '/api/v1/roles', 'POST api/v1/roles', '{}', '{}', '{\"role_name\":\"Technical Lead\",\"permissions\":{\"dashboards-sales\":[{\"key\":\"dashboards-sales\",\"permissions\":[\"view\",\"create\",\"update\",\"delete\"]}],\"dashboards-lead\":[{\"key\":\"dashboards-lead\",\"permissions\":[\"view\",\"create\",\"update\",\"delete\"]}],\"dashboards-deal', '{\"success\":true,\"message\":\"Role created successfully\",\"data\":{\"id\":\"SE8IBig8OMMQRI2yX7Exzhm\",\"updated_by\":null,\"role_name\":\"Technical Lead\",\"permissions\":{\"dashboards-sales\":[{\"key\":\"dashboards-sales\",\"permissions\":[\"view\",\"create\",\"update\",\"delete\"]}],\"d', '0.01 seconds', '2025-03-31 10:59:52', '2025-03-31 10:59:52'),
('hqVOKrJRJOg6eTciwAy5Bda', '/api/v1/countries?page=1&limit=100', 'GET api/v1/countries?page=1&limit=100', '{}', '{\"page\":1,\"limit\":100}', '{}', '{\"success\":true,\"message\":\"Countries fetched successfully\",\"data\":[{\"id\":\"0YNW00eJIaSTu6T8IZXJZ2W\",\"countryName\":\"Kuwait\",\"countryCode\":\"KW\",\"phoneCode\":\"+965\",\"created_by\":null,\"updated_by\":null,\"createdAt\":\"2025-03-31T03:52:28.000Z\",\"updatedAt\":\"2025-03', '0.02 seconds', '2025-03-31 17:38:51', '2025-03-31 17:38:51'),
('hR6MtyysIR5RnlRoVC4LKOZ', '/api/v1/clients', 'POST api/v1/clients', '{}', '{}', '{\"username\":\"Apex Global Trading\",\"email\":\"apexglobaltrading@yopmail.com\",\"password\":\"ApexGlobalTrading@2525\"}', '{\"success\":true,\"message\":\"OTP sent to email\",\"data\":{\"sessionToken\":\"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6ImUzcVRVMGJFbWxJdll1OHY0akZtanh2IiwidXNlcm5hbWUiOiJBcGV4IEdsb2JhbCBUcmFkaW5nIiwiZW1haWwiOiJhcGV4Z2xvYmFsdHJhZGluZ0B5b3BtYWlsLmNvbSIsInJvbGVf', '2.76 seconds', '2025-03-31 09:34:44', '2025-03-31 09:34:44'),
('htHVvFFwXSaXYzjpzv6F1tB', '/api/v1/employees', 'GET api/v1/employees', '{}', '{}', '{}', '{\"success\":true,\"message\":\"Employees fetched successfully\",\"data\":[{\"conversations\":{},\"id\":\"qOaIRiAfmmGcldnDcUAd51J\",\"employeeId\":\"EMP#3\",\"username\":\"amit.kumar\",\"password\":\"$2b$12$IhhZ5UUIkLAYY6.S9Tv4oeRGDwZGaPWGExusQ1ytrJ1qKG4K2T0ye\",\"email\":\"amit.kuma', '0.01 seconds', '2025-03-31 12:52:50', '2025-03-31 12:52:50'),
('hug3Jtt89ZTWpYsCrg0DNaY', '/api/v1/clients', 'POST api/v1/clients', '{}', '{}', '{\"username\":\"Horizon Ventures\",\"email\":\"horizonventures@yopmail.com\",\"password\":\"HorizonVentures@2525\"}', '{\"success\":true,\"message\":\"OTP sent to email\",\"data\":{\"sessionToken\":\"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6ImUzcVRVMGJFbWxJdll1OHY0akZtanh2IiwidXNlcm5hbWUiOiJIb3Jpem9uIFZlbnR1cmVzIiwiZW1haWwiOiJob3Jpem9udmVudHVyZXNAeW9wbWFpbC5jb20iLCJyb2xlX2lkIjoi', '3.36 seconds', '2025-03-31 09:43:10', '2025-03-31 09:43:10'),
('Hzdxe8ftlTNQErs9p7TAU8X', '/api/v1/currencies?', 'GET api/v1/currencies?', '{}', '{}', '{}', '{\"success\":true,\"message\":\"Currencies fetched successfully\",\"data\":[{\"id\":\"29gCwt8wWQg7CPgG96847iD\",\"currencyName\":\"Euro\",\"currencyIcon\":\"€\",\"currencyCode\":\"EUR\",\"created_by\":null,\"updated_by\":null,\"createdAt\":\"2025-03-31T04:23:06.000Z\",\"updatedAt\":\"2025-', '0.07 seconds', '2025-03-31 11:41:48', '2025-03-31 11:41:48'),
('i04D1qXhhMj74tIXHNjGxDi', '/api/v1/sub-clients', 'GET api/v1/sub-clients', '{}', '{}', '{}', '{\"success\":true,\"message\":\"SubClients fetched successfully\",\"data\":[{\"conversations\":{},\"id\":\"9VDWw1NRr3hnVRf82reZODt\",\"employeeId\":null,\"username\":\"Quantum Innovations\",\"password\":\"$2b$12$mn0gG674rbqCn0UiYh7kuuZPDY.iZquWfgnPbgjYrwphrOOTtty86\",\"email\":\"qu', '0.01 seconds', '2025-03-31 11:53:40', '2025-03-31 11:53:40'),
('I1smRHujFWelWuVSRIYiF6z', '/api/v1/countries?page=1&limit=100', 'GET api/v1/countries?page=1&limit=100', '{}', '{\"page\":1,\"limit\":100}', '{}', '{\"success\":true,\"message\":\"Countries fetched successfully\",\"data\":[{\"id\":\"0YNW00eJIaSTu6T8IZXJZ2W\",\"countryName\":\"Kuwait\",\"countryCode\":\"KW\",\"phoneCode\":\"+965\",\"created_by\":null,\"updated_by\":null,\"createdAt\":\"2025-03-31T03:52:28.000Z\",\"updatedAt\":\"2025-03', '0.04 seconds', '2025-03-31 12:04:14', '2025-03-31 12:04:14'),
('I2mUUjEd3diqqMImLOfONsw', '/api/v1/roles', 'GET api/v1/roles', '{}', '{}', '{}', '{\"success\":true,\"message\":\"Roles fetched successfully\",\"data\":[{\"id\":\"03qarcBedPhsVY3A1IKMMyW\",\"role_name\":\"System Administrator\",\"permissions\":\"{\\\"dashboards-project-list\\\":[{\\\"key\\\":\\\"dashboards-project-list\\\",\\\"permissions\\\":[\\\"view\\\",\\\"create\\\",\\\"upda', '0.06 seconds', '2025-03-31 16:47:23', '2025-03-31 16:47:23'),
('I3zg17XhS7teRPLjBD4916n', '/api/v1/currencies?page=1&limit=100', 'GET api/v1/currencies?page=1&limit=100', '{}', '{\"page\":1,\"limit\":100}', '{}', '{\"success\":true,\"message\":\"Currencies fetched successfully\",\"data\":[{\"id\":\"29gCwt8wWQg7CPgG96847iD\",\"currencyName\":\"Euro\",\"currencyIcon\":\"€\",\"currencyCode\":\"EUR\",\"created_by\":null,\"updated_by\":null,\"createdAt\":\"2025-03-31T04:23:06.000Z\",\"updatedAt\":\"2025-', '0.03 seconds', '2025-03-31 12:04:14', '2025-03-31 12:04:14'),
('I41blXalm5e7PRIONL0OfmU', '/api/v1/designations', 'GET api/v1/designations', '{}', '{}', '{}', '{\"success\":true,\"message\":\"Designation fetched successfully\",\"data\":[]}', '0.05 seconds', '2025-03-31 12:04:14', '2025-03-31 12:04:14'),
('I8BDOkaIPX0A0naCIVRGuGL', '/api/v1/employees', 'GET api/v1/employees', '{}', '{}', '{}', '{\"success\":true,\"message\":\"Employees fetched successfully\",\"data\":[{\"conversations\":{},\"id\":\"qOaIRiAfmmGcldnDcUAd51J\",\"employeeId\":\"EMP#3\",\"username\":\"amit.kumar\",\"password\":\"$2b$12$IhhZ5UUIkLAYY6.S9Tv4oeRGDwZGaPWGExusQ1ytrJ1qKG4K2T0ye\",\"email\":\"amit.kuma', '0.01 seconds', '2025-03-31 12:48:52', '2025-03-31 12:48:52'),
('iBmdt0TAOF0M7S0Pz4hNFX5', '/api/v1/roles', 'GET api/v1/roles', '{}', '{}', '{}', '{\"success\":true,\"message\":\"Roles fetched successfully\",\"data\":[{\"id\":\"vI5ukP3myMKhjXXeHsmq1Rj\",\"role_name\":\"client\",\"permissions\":null,\"client_id\":null,\"created_by\":\"superadmin\",\"updated_by\":null,\"createdAt\":\"2025-03-31T03:57:18.000Z\",\"updatedAt\":\"2025-03', '0.25 seconds', '2025-03-31 10:31:11', '2025-03-31 10:31:11'),
('iE8vdy1U7ZaM4RDJ0TVhN5y', '/api/v1/departments', 'POST api/v1/departments', '{}', '{}', '{\"department_name\":\" Sales\",\"branch\":\"haQEJiCePwC0KeJsmUWsSZ7\"}', '{\"success\":true,\"message\":\"Department created successfully\",\"data\":{\"id\":\"0DQCpwzdzU2mZWnGcqM91AC\",\"updated_by\":null,\"branch\":\"haQEJiCePwC0KeJsmUWsSZ7\",\"department_name\":\" Sales\",\"client_id\":\"4kykUHcg5oLrhNDkfCLNYYG\",\"created_by\":\"Silverline Systems\",\"upd', '0.01 seconds', '2025-03-31 12:23:56', '2025-03-31 12:23:56'),
('Ij24pvKSEFel3PPPO9FsELF', '/api/v1/auth/verify-signup', 'POST api/v1/auth/verify-signup', '{}', '{}', '{\"otp\":\"160265\"}', '{\"success\":true,\"message\":\"Registration completed successfully\",\"data\":{\"success\":true,\"token\":\"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6ImVFRTV3V2ZURGpKUDdNTzlhd3UwSlFaIiwicm9sZSI6InN1Yi1jbGllbnQiLCJpYXQiOjE3NDM0MDI0NDAsImV4cCI6MTc0MzQ4ODg0MH0.jCtBhb', '2.50 seconds', '2025-03-31 11:57:22', '2025-03-31 11:57:22'),
('IkCXlL7T7j9xgjcCnDPMmty', '/api/v1/leaves', 'GET api/v1/leaves', '{}', '{}', '{}', '{\"success\":true,\"message\":\"Leave fetched successfully\",\"data\":[]}', '0.16 seconds', '2025-03-31 12:24:21', '2025-03-31 12:24:21'),
('itG1BonrInoAwz5hJKIneT4', '/api/v1/branches', 'GET api/v1/branches', '{}', '{}', '{}', '{\"success\":true,\"message\":\"Branches fetched successfully\",\"data\":[{\"id\":\"bjHlRDFkaJBOh3kg2EP52VH\",\"branchName\":\"Bangalore\",\"branchAddress\":\"Tech Park One, 4th Floor\\nWhitefield Main Road\\nBangalore, Karnataka - 560066\",\"branchManager\":\"wPHc9cisqOzzpTW0Mpz', '0.01 seconds', '2025-03-31 12:20:04', '2025-03-31 12:20:04'),
('iV2ivLkA44HiuLffgmXvf2f', '/api/v1/sub-clients', 'GET api/v1/sub-clients', '{}', '{}', '{}', '{\"success\":true,\"message\":\"SubClients fetched successfully\",\"data\":[{\"conversations\":{},\"id\":\"9VDWw1NRr3hnVRf82reZODt\",\"employeeId\":null,\"username\":\"Quantum Innovations\",\"password\":\"$2b$12$mn0gG674rbqCn0UiYh7kuuZPDY.iZquWfgnPbgjYrwphrOOTtty86\",\"email\":\"qu', '0.01 seconds', '2025-03-31 11:54:57', '2025-03-31 11:54:57'),
('IWXuYRhtwSj4A4szzFjUi0d', '/api/v1/labels/4kykUHcg5oLrhNDkfCLNYYG', 'GET api/v1/labels/4kykUHcg5oLrhNDkfCLNYYG', '{\"id\":\"4kykUHcg5oLrhNDkfCLNYYG\"}', '{}', '{}', '{\"success\":true,\"message\":\"Tags retrieved successfully\",\"data\":[{\"id\":\"0ga51ZccuIiGGEudOSNNRDJ\",\"related_id\":\"4kykUHcg5oLrhNDkfCLNYYG\",\"lableType\":\"source\",\"name\":\"Phone\",\"color\":\"#34495E\",\"client_id\":\"4kykUHcg5oLrhNDkfCLNYYG\",\"created_by\":\"system\",\"updat', '0.01 seconds', '2025-03-31 14:31:48', '2025-03-31 14:31:48'),
('IYVZxSsriSWJDbiHuYcexIc', '/api/v1/sub-clients', 'GET api/v1/sub-clients', '{}', '{}', '{}', '{\"success\":false,\"message\":\"Cannot read properties of null (reading \'id\')\"}', '0.08 seconds', '2025-03-31 11:01:16', '2025-03-31 11:01:16'),
('jcdSScdmXpL2Y7cngWEeFIW', '/api/v1/branches', 'POST api/v1/branches', '{}', '{}', '{\"branchName\":\"Hyderabad\",\"branchManager\":\"wPHc9cisqOzzpTW0MpzX8pR\",\"branchAddress\":\"Cyber Gateway, Block 2\\nHITEC City, Madhapur\\nHyderabad, Telangana - 500081\"}', '{\"success\":true,\"message\":\"Branch created successfully\",\"data\":{\"id\":\"NwHBv2Lg2D3w5gZgx5o3sy9\",\"updated_by\":null,\"branchName\":\"Hyderabad\",\"branchAddress\":\"Cyber Gateway, Block 2\\nHITEC City, Madhapur\\nHyderabad, Telangana - 500081\",\"branchManager\":\"wPHc9c', '0.02 seconds', '2025-03-31 12:21:45', '2025-03-31 12:21:45'),
('JeuW239nToKuuWEcSyyDemf', '/api/v1/branches', 'GET api/v1/branches', '{}', '{}', '{}', '{\"success\":true,\"message\":\"Branches fetched successfully\",\"data\":[{\"id\":\"bjHlRDFkaJBOh3kg2EP52VH\",\"branchName\":\"Bangalore\",\"branchAddress\":\"Tech Park One, 4th Floor\\nWhitefield Main Road\\nBangalore, Karnataka - 560066\",\"branchManager\":\"wPHc9cisqOzzpTW0Mpz', '0.05 seconds', '2025-03-31 14:30:48', '2025-03-31 14:30:48'),
('jIjE6nQckbqdlPrXY9RIrNF', '/api/v1/auth/admin-login', 'POST api/v1/auth/admin-login', '{}', '{}', '{\"email\":\"admin.silverline@yopmail.com\"}', '{\"success\":true,\"message\":\"Login successful\",\"data\":{\"token\":\"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6ImFkbWluLnNpbHZlcmxpbmUiLCJlbWFpbCI6ImFkbWluLnNpbHZlcmxpbmVAeW9wbWFpbC5jb20iLCJwaG9uZSI6bnVsbCwiaWQiOiJ3UEhjOWNpc3FPenpwVFcwTXB6WDhwUiIsInJv', '0.01 seconds', '2025-03-31 11:17:17', '2025-03-31 11:17:17'),
('jJKMkDHKb8rlfgk41GSYVXU', '/api/v1/roles', 'POST api/v1/roles', '{}', '{}', '{\"role_name\":\"Business Analyst\",\"permissions\":{\"dashboards-mail\":[{\"key\":\"dashboards-mail\",\"permissions\":[\"view\",\"create\",\"update\",\"delete\"]}],\"dashboards-chat\":[{\"key\":\"dashboards-chat\",\"permissions\":[\"view\",\"create\",\"update\",\"delete\"]}],\"dashboards-cale', '{\"success\":true,\"message\":\"Role created successfully\",\"data\":{\"id\":\"jdWbdnTrMDss1mxhqXBUhpI\",\"updated_by\":null,\"role_name\":\"Business Analyst\",\"permissions\":{\"dashboards-mail\":[{\"key\":\"dashboards-mail\",\"permissions\":[\"view\",\"create\",\"update\",\"delete\"]}],\"d', '0.01 seconds', '2025-03-31 11:00:14', '2025-03-31 11:00:14'),
('JjZlUgDoi87wSdggcIWtSC0', '/api/v1/auth', 'GET api/v1/auth', '{}', '{}', '{}', '{\"success\":true,\"message\":\"Users fetched successfully\",\"data\":[{\"conversations\":{},\"id\":\"0aMTORQ27wG00Ht5REhq13p\",\"employeeId\":null,\"username\":\" ba.silverline\",\"password\":\"$2b$12$NT.meyBZRWfJve/VLDgQo.bwhzGz1ElPJcoihKL2lokuJpOAqHk6W\",\"email\":\"ba.silverlin', '0.03 seconds', '2025-03-31 17:23:43', '2025-03-31 17:23:43'),
('jK1gahTUaVNpsN2fD8jSnUk', '/api/v1/branches/UH8lBWZZAkctwuRFiCz5PMB', 'PUT api/v1/branches/UH8lBWZZAkctwuRFiCz5PMB', '{\"id\":\"UH8lBWZZAkctwuRFiCz5PMB\"}', '{}', '{\"branchName\":\"Mumbai\",\"branchManager\":\"wPHc9cisqOzzpTW0MpzX8pR\",\"branchAddress\":\"Silverline Tower, Plot No. 15\\nSector 30, Vashi\\nNavi Mumbai, Maharashtra - 400705\"}', '{\"success\":true,\"message\":\"Branch updated successfully\",\"data\":{\"id\":\"UH8lBWZZAkctwuRFiCz5PMB\",\"branchName\":\"Mumbai\",\"branchAddress\":\"Silverline Tower, Plot No. 15\\nSector 30, Vashi\\nNavi Mumbai, Maharashtra - 400705\",\"branchManager\":\"wPHc9cisqOzzpTW0MpzX', '0.03 seconds', '2025-03-31 12:18:20', '2025-03-31 12:18:20'),
('JlLnqvw0HFLtSPZ8jOq0dT8', '/api/v1/labels/4kykUHcg5oLrhNDkfCLNYYG', 'GET api/v1/labels/4kykUHcg5oLrhNDkfCLNYYG', '{\"id\":\"4kykUHcg5oLrhNDkfCLNYYG\"}', '{}', '{}', '{\"success\":true,\"message\":\"Tags retrieved successfully\",\"data\":[{\"id\":\"0ga51ZccuIiGGEudOSNNRDJ\",\"related_id\":\"4kykUHcg5oLrhNDkfCLNYYG\",\"lableType\":\"source\",\"name\":\"Phone\",\"color\":\"#34495E\",\"client_id\":\"4kykUHcg5oLrhNDkfCLNYYG\",\"created_by\":\"system\",\"updat', '0.01 seconds', '2025-03-31 10:49:35', '2025-03-31 10:49:35'),
('jMoV5V7UXHSBVA5yiwalsev', '/api/v1/pipelines', 'GET api/v1/pipelines', '{}', '{}', '{}', '{\"success\":true,\"message\":\"Pipelines fetched successfully\",\"data\":[{\"id\":\"iiUsXOteVUFiCIMkgR6DObO\",\"pipeline_name\":\"Marketing\",\"client_id\":\"4kykUHcg5oLrhNDkfCLNYYG\",\"created_by\":\"Silverline Systems\",\"updated_by\":null,\"createdAt\":\"2025-03-31T05:00:29.000Z\"', '0.03 seconds', '2025-03-31 17:38:51', '2025-03-31 17:38:51'),
('jqP9Rk6XOZbNj0CJqlTyaKB', '/api/v1/designations', 'GET api/v1/designations', '{}', '{}', '{}', '{\"success\":true,\"message\":\"Designation fetched successfully\",\"data\":[{\"id\":\"LaqJYdtzPX2CHjbxPYthMrD\",\"branch\":\"UH8lBWZZAkctwuRFiCz5PMB\",\"designation_name\":\"Finance Analyst\",\"client_id\":\"4kykUHcg5oLrhNDkfCLNYYG\",\"created_by\":\"Silverline Systems\",\"updated_b', '0.01 seconds', '2025-03-31 12:25:14', '2025-03-31 12:25:14'),
('JShVr1cObzIPEVaW323ZHfA', '/api/v1/clients', 'GET api/v1/clients', '{}', '{}', '{}', '{\"success\":true,\"message\":\"Clients fetched successfully\",\"data\":[{\"conversations\":{},\"id\":\"7aRxfVTXsxd31PyBz9WzEjx\",\"employeeId\":null,\"username\":\"Quantum Enterprises\",\"password\":\"$2b$12$OCduts6PI5L0YSEOVKT73uvS2zlUOaAPNMKWIxOO8tA/YpS1K.TRS\",\"email\":\"quant', '0.00 seconds', '2025-03-31 09:33:42', '2025-03-31 09:33:42'),
('JSoMv7lb5shZZd1HSRNswzx', '/api/v1/sub-clients', 'GET api/v1/sub-clients', '{}', '{}', '{}', '{\"success\":true,\"message\":\"SubClients fetched successfully\",\"data\":[{\"conversations\":{},\"id\":\"9VDWw1NRr3hnVRf82reZODt\",\"employeeId\":null,\"username\":\"Quantum Innovations\",\"password\":\"$2b$12$mn0gG674rbqCn0UiYh7kuuZPDY.iZquWfgnPbgjYrwphrOOTtty86\",\"email\":\"qu', '0.03 seconds', '2025-03-31 14:32:14', '2025-03-31 14:32:14'),
('jtciWpQ1L2FqtJPw75RMo8t', '/api/v1/designations', 'GET api/v1/designations', '{}', '{}', '{}', '{\"success\":true,\"message\":\"Designation fetched successfully\",\"data\":[{\"id\":\"flbhBdf5hBLZTNbwhc12BY7\",\"branch\":\"UH8lBWZZAkctwuRFiCz5PMB\",\"designation_name\":\"HR Manager\",\"client_id\":\"4kykUHcg5oLrhNDkfCLNYYG\",\"created_by\":\"Silverline Systems\",\"updated_by\":nu', '0.23 seconds', '2025-03-31 12:59:52', '2025-03-31 12:59:52'),
('jvLR6pbjV3GeKZ5LNEJgOL4', '/api/v1/leads', 'GET api/v1/leads', '{}', '{}', '{}', '{\"success\":true,\"message\":\"Lead fetched successfully\",\"data\":[{\"id\":\"31LINvHYSM5u4avuq7Wrjlh\",\"leadTitle\":\"TechPro Solutions Website Modernization\",\"leadStage\":\"BYNYLCidEQll0qKymn79W76\",\"currency\":\"INR\",\"leadValue\":850000,\"company_name\":\" TechPro Solution', '0.01 seconds', '2025-03-31 14:40:53', '2025-03-31 14:40:53'),
('JvyZvaNNLky5xMAm1z2DR5b', '/api/v1/leads', 'GET api/v1/leads', '{}', '{}', '{}', '{\"success\":true,\"message\":\"Lead fetched successfully\",\"data\":[]}', '0.15 seconds', '2025-03-31 11:41:48', '2025-03-31 11:41:48'),
('jXjyKtFtg1fvAt17x4v0fNZ', '/api/v1/auth/admin-login', 'POST api/v1/auth/admin-login', '{}', '{}', '{\"email\":\"silverlinesystems@yopmail.com\"}', '{\"success\":true,\"message\":\"Login successful\",\"data\":{\"token\":\"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6IlNpbHZlcmxpbmUgU3lzdGVtcyIsImVtYWlsIjoic2lsdmVybGluZXN5c3RlbXNAeW9wbWFpbC5jb20iLCJwaG9uZSI6bnVsbCwiaWQiOiI0a3lrVUhjZzVvTHJoTkRrZkNMTllZRyIs', '0.01 seconds', '2025-03-31 10:48:49', '2025-03-31 10:48:49'),
('jy2HV4pp33RvEvUcnfrF8jv', '/api/v1/roles', 'GET api/v1/roles', '{}', '{}', '{}', '{\"success\":true,\"message\":\"Roles fetched successfully\",\"data\":[{\"id\":\"03qarcBedPhsVY3A1IKMMyW\",\"role_name\":\"System Administrator\",\"permissions\":\"{\\\"dashboards-project-list\\\":[{\\\"key\\\":\\\"dashboards-project-list\\\",\\\"permissions\\\":[\\\"view\\\",\\\"create\\\",\\\"upda', '0.05 seconds', '2025-03-31 11:47:43', '2025-03-31 11:47:43'),
('k119jxtmWpFsInML46JWxEV', '/api/v1/sub-clients', 'GET api/v1/sub-clients', '{}', '{}', '{}', '{\"success\":true,\"message\":\"SubClients fetched successfully\",\"data\":[{\"conversations\":{},\"id\":\"9VDWw1NRr3hnVRf82reZODt\",\"employeeId\":null,\"username\":\"Quantum Innovations\",\"password\":\"$2b$12$mn0gG674rbqCn0UiYh7kuuZPDY.iZquWfgnPbgjYrwphrOOTtty86\",\"email\":\"qu', '0.01 seconds', '2025-03-31 11:54:43', '2025-03-31 11:54:43'),
('k15iVUvU5cuMThBcpMwghVs', '/api/v1/roles', 'GET api/v1/roles', '{}', '{}', '{}', '{\"success\":true,\"message\":\"Roles fetched successfully\",\"data\":[{\"id\":\"03qarcBedPhsVY3A1IKMMyW\",\"role_name\":\"System Administrator\",\"permissions\":\"{\\\"dashboards-project-list\\\":[{\\\"key\\\":\\\"dashboards-project-list\\\",\\\"permissions\\\":[\\\"view\\\",\\\"create\\\",\\\"upda', '0.11 seconds', '2025-03-31 12:19:34', '2025-03-31 12:19:34'),
('k20twcVd1MwTqsjNcposkP9', '/api/v1/currencies?', 'GET api/v1/currencies?', '{}', '{}', '{}', '{\"success\":true,\"message\":\"Currencies fetched successfully\",\"data\":[{\"id\":\"29gCwt8wWQg7CPgG96847iD\",\"currencyName\":\"Euro\",\"currencyIcon\":\"€\",\"currencyCode\":\"EUR\",\"created_by\":null,\"updated_by\":null,\"createdAt\":\"2025-03-31T04:23:06.000Z\",\"updatedAt\":\"2025-', '0.01 seconds', '2025-03-31 10:31:10', '2025-03-31 10:31:10'),
('K5TAWEiMy4HPPOU9FMLYhUD', '/api/v1/labels/4kykUHcg5oLrhNDkfCLNYYG', 'GET api/v1/labels/4kykUHcg5oLrhNDkfCLNYYG', '{\"id\":\"4kykUHcg5oLrhNDkfCLNYYG\"}', '{}', '{}', '{\"success\":true,\"message\":\"Tags retrieved successfully\",\"data\":[{\"id\":\"0ga51ZccuIiGGEudOSNNRDJ\",\"related_id\":\"4kykUHcg5oLrhNDkfCLNYYG\",\"lableType\":\"source\",\"name\":\"Phone\",\"color\":\"#34495E\",\"client_id\":\"4kykUHcg5oLrhNDkfCLNYYG\",\"created_by\":\"system\",\"updat', '0.01 seconds', '2025-03-31 17:48:23', '2025-03-31 17:48:23'),
('K88YW1Nj825sECsWQUAc9V8', '/api/v1/sub-clients', 'GET api/v1/sub-clients', '{}', '{}', '{}', '{\"success\":false,\"message\":\"Cannot read properties of null (reading \'id\')\"}', '0.04 seconds', '2025-03-31 11:41:50', '2025-03-31 11:41:50'),
('kaGFurSrmTyoc2FtBrhonmJ', '/api/v1/proposals', 'POST api/v1/proposals', '{}', '{}', '{\"lead_title\":\"YXfrACvHnsutJstpTU5Tu24\",\"valid_till\":\"2025-03-31\",\"currency\":\"INR\",\"description\":\"CFCC\",\"items\":[{\"item\":\"HealthCare App Development\",\"quantity\":1,\"price\":1500000,\"tax_name\":\"PPT\",\"tax\":1,\"amount\":1500000,\"description\":\"\"}],\"subtotal\":\"151', '{\"success\":true,\"message\":\"Proposal created successfully\",\"data\":{\"id\":\"tfkRAQlpiRhuDXU2mm5BYpV\",\"updated_by\":null,\"lead_title\":\"YXfrACvHnsutJstpTU5Tu24\",\"valid_till\":\"2025-03-31T00:00:00.000Z\",\"currency\":\"INR\",\"description\":\"CFCC\",\"items\":[{\"item\":\"Healt', '0.03 seconds', '2025-03-31 17:23:27', '2025-03-31 17:23:27'),
('KaoERvppPnNZ1z0GY2aHgln', '/api/v1/auth', 'GET api/v1/auth', '{}', '{}', '{}', '{\"success\":true,\"message\":\"Users fetched successfully\",\"data\":[{\"conversations\":{},\"id\":\"4kykUHcg5oLrhNDkfCLNYYG\",\"employeeId\":null,\"username\":\"Silverline Systems\",\"password\":\"$2b$12$.2Ia/XUZHrA7BEsLyf6uGuo9wgP9rGamovaR/ICL6YHHBDXVI5nIy\",\"email\":\"silverli', '0.02 seconds', '2025-03-31 10:55:55', '2025-03-31 10:55:55'),
('Kb10PS37yvBXVjSFhmvjVwH', '/api/v1/sub-clients', 'GET api/v1/sub-clients', '{}', '{}', '{}', '{\"success\":false,\"message\":\"Cannot read properties of null (reading \'id\')\"}', '0.01 seconds', '2025-03-31 11:44:04', '2025-03-31 11:44:04'),
('kCYEGhZNKChqoL8yXqI6xjs', '/api/v1/labels/4kykUHcg5oLrhNDkfCLNYYG', 'GET api/v1/labels/4kykUHcg5oLrhNDkfCLNYYG', '{\"id\":\"4kykUHcg5oLrhNDkfCLNYYG\"}', '{}', '{}', '{\"success\":true,\"message\":\"Tags retrieved successfully\",\"data\":[{\"id\":\"0ga51ZccuIiGGEudOSNNRDJ\",\"related_id\":\"4kykUHcg5oLrhNDkfCLNYYG\",\"lableType\":\"source\",\"name\":\"Phone\",\"color\":\"#34495E\",\"client_id\":\"4kykUHcg5oLrhNDkfCLNYYG\",\"created_by\":\"system\",\"updat', '0.02 seconds', '2025-03-31 16:00:54', '2025-03-31 16:00:54'),
('kE99NIoF6ONqKVYAzhm4pap', '/api/v1/labels/4kykUHcg5oLrhNDkfCLNYYG', 'GET api/v1/labels/4kykUHcg5oLrhNDkfCLNYYG', '{\"id\":\"4kykUHcg5oLrhNDkfCLNYYG\"}', '{}', '{}', '{\"success\":true,\"message\":\"Tags retrieved successfully\",\"data\":[{\"id\":\"0ga51ZccuIiGGEudOSNNRDJ\",\"related_id\":\"4kykUHcg5oLrhNDkfCLNYYG\",\"lableType\":\"source\",\"name\":\"Phone\",\"color\":\"#34495E\",\"client_id\":\"4kykUHcg5oLrhNDkfCLNYYG\",\"created_by\":\"system\",\"updat', '0.01 seconds', '2025-03-31 16:47:23', '2025-03-31 16:47:23'),
('KFrlQqHRLeRpAgOHpZedzTo', '/api/v1/auth/verify-signup', 'POST api/v1/auth/verify-signup', '{}', '{}', '{\"otp\":\"631104\"}', '{\"success\":true,\"message\":\"Registration completed successfully\",\"data\":{\"success\":true,\"token\":\"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6Inl4eWNZRVN6RGhlUnljSDAwUVN3M3NjIiwicm9sZSI6InN1Yi1jbGllbnQiLCJpYXQiOjE3NDM0MDE4NTEsImV4cCI6MTc0MzQ4ODI1MX0.Gee8Ml', '3.26 seconds', '2025-03-31 11:47:35', '2025-03-31 11:47:35'),
('kh4cyI57wcsL6Pyg1sJV4YF', '/api/v1/followups/dmciOE2OiF952YsPFd0NPQi', 'GET api/v1/followups/dmciOE2OiF952YsPFd0NPQi', '{\"id\":\"dmciOE2OiF952YsPFd0NPQi\"}', '{}', '{}', '{\"success\":true,\"message\":\"Followups retrieved successfully\",\"data\":[]}', '0.01 seconds', '2025-03-31 17:48:08', '2025-03-31 17:48:08'),
('kIlxyOqp7A4aWBVyQQum1Xn', '/api/v1/leads', 'GET api/v1/leads', '{}', '{}', '{}', '{\"success\":true,\"message\":\"Lead fetched successfully\",\"data\":[{\"id\":\"31LINvHYSM5u4avuq7Wrjlh\",\"leadTitle\":\"TechPro Solutions Website Modernization\",\"leadStage\":\"BYNYLCidEQll0qKymn79W76\",\"currency\":\"INR\",\"leadValue\":850000,\"company_name\":\" TechPro Solution', '0.04 seconds', '2025-03-31 15:54:49', '2025-03-31 15:54:49'),
('kkBzp5sdhcTkP0Y3Q1elYHT', '/api/v1/subscriptions/assign', 'GET api/v1/subscriptions/assign', '{}', '{}', '{}', '{\"success\":true,\"message\":\"Assigned Plans fetched successfully\",\"data\":[{\"id\":\"PLGtptJFFV4blMJfFi8AeBR\",\"client_id\":\"4kykUHcg5oLrhNDkfCLNYYG\",\"plan_id\":\"uzptLdgqYFRoK23ORcMgQrg\",\"start_date\":\"2025-03-21T00:00:00.000Z\",\"end_date\":\"2025-04-07T18:29:59.000Z\"', '0.02 seconds', '2025-03-31 14:43:10', '2025-03-31 14:43:10'),
('kKW68geQefjr75DEXNPa5HM', '/api/v1/labels/4kykUHcg5oLrhNDkfCLNYYG', 'GET api/v1/labels/4kykUHcg5oLrhNDkfCLNYYG', '{\"id\":\"4kykUHcg5oLrhNDkfCLNYYG\"}', '{}', '{}', '{\"success\":true,\"message\":\"Tags retrieved successfully\",\"data\":[{\"id\":\"0ga51ZccuIiGGEudOSNNRDJ\",\"related_id\":\"4kykUHcg5oLrhNDkfCLNYYG\",\"lableType\":\"source\",\"name\":\"Phone\",\"color\":\"#34495E\",\"client_id\":\"4kykUHcg5oLrhNDkfCLNYYG\",\"created_by\":\"system\",\"updat', '0.03 seconds', '2025-03-31 10:28:45', '2025-03-31 10:28:45'),
('KnXhJkibhoUSFiWr9uk6Cj7', '/api/v1/currencies?', 'GET api/v1/currencies?', '{}', '{}', '{}', '{\"success\":true,\"message\":\"Currencies fetched successfully\",\"data\":[{\"id\":\"29gCwt8wWQg7CPgG96847iD\",\"currencyName\":\"Euro\",\"currencyIcon\":\"€\",\"currencyCode\":\"EUR\",\"created_by\":null,\"updated_by\":null,\"createdAt\":\"2025-03-31T04:23:06.000Z\",\"updatedAt\":\"2025-', '0.00 seconds', '2025-03-31 16:00:54', '2025-03-31 16:00:54'),
('kouml7tZ6WBxc1XeWIoHtAl', '/api/v1/labels/4kykUHcg5oLrhNDkfCLNYYG', 'GET api/v1/labels/4kykUHcg5oLrhNDkfCLNYYG', '{\"id\":\"4kykUHcg5oLrhNDkfCLNYYG\"}', '{}', '{}', '{\"success\":true,\"message\":\"Tags retrieved successfully\",\"data\":[{\"id\":\"0ga51ZccuIiGGEudOSNNRDJ\",\"related_id\":\"4kykUHcg5oLrhNDkfCLNYYG\",\"lableType\":\"source\",\"name\":\"Phone\",\"color\":\"#34495E\",\"client_id\":\"4kykUHcg5oLrhNDkfCLNYYG\",\"created_by\":\"system\",\"updat', '0.01 seconds', '2025-03-31 11:10:04', '2025-03-31 11:10:04'),
('KPlXbghAnbKlTESEEfpDjAV', '/api/v1/auth', 'GET api/v1/auth', '{}', '{}', '{}', '{\"success\":true,\"message\":\"Users fetched successfully\",\"data\":[{\"conversations\":{},\"id\":\"0aMTORQ27wG00Ht5REhq13p\",\"employeeId\":null,\"username\":\" ba.silverline\",\"password\":\"$2b$12$NT.meyBZRWfJve/VLDgQo.bwhzGz1ElPJcoihKL2lokuJpOAqHk6W\",\"email\":\"ba.silverlin', '0.01 seconds', '2025-03-31 11:31:30', '2025-03-31 11:31:30'),
('KQqMILArW1TLDMZYlmuS9fi', '/api/v1/sub-clients', 'GET api/v1/sub-clients', '{}', '{}', '{}', '{\"success\":true,\"message\":\"SubClients fetched successfully\",\"data\":[{\"conversations\":{},\"id\":\"yxycYESzDheRycH00QSw3sc\",\"employeeId\":null,\"username\":\"TechPro Solutions\",\"password\":\"$2b$12$s/h5jUhubCRhTgMo0Fyev.INqHMG7Ir5UL6kh8kdqpfuqT3fCyE3C\",\"email\":\"tech', '0.01 seconds', '2025-03-31 11:53:22', '2025-03-31 11:53:22'),
('KR9JFkJQqhO0LyimAtgcYGh', '/api/v1/countries?page=1&limit=100', 'GET api/v1/countries?page=1&limit=100', '{}', '{\"page\":1,\"limit\":100}', '{}', '{\"success\":true,\"message\":\"Countries fetched successfully\",\"data\":[{\"id\":\"0YNW00eJIaSTu6T8IZXJZ2W\",\"countryName\":\"Kuwait\",\"countryCode\":\"KW\",\"phoneCode\":\"+965\",\"created_by\":null,\"updated_by\":null,\"createdAt\":\"2025-03-31T03:52:28.000Z\",\"updatedAt\":\"2025-03', '0.08 seconds', '2025-03-31 09:22:28', '2025-03-31 09:22:28'),
('KY6gpRkPX67W126OVyVOsQc', '/api/v1/roles', 'POST api/v1/roles', '{}', '{}', '{\"role_name\":\"Project Manager\",\"permissions\":{\"dashboards-project-list\":[{\"key\":\"dashboards-project-list\",\"permissions\":[\"view\",\"create\",\"update\",\"delete\"]}],\"dashboards-sales\":[{\"key\":\"dashboards-sales\",\"permissions\":[\"view\",\"create\",\"update\",\"delete\"]}]', '{\"success\":true,\"message\":\"Role created successfully\",\"data\":{\"id\":\"pcmMgRgxCKK2LPLL2SXqjep\",\"updated_by\":null,\"role_name\":\"Project Manager\",\"permissions\":{\"dashboards-project-list\":[{\"key\":\"dashboards-project-list\",\"permissions\":[\"view\",\"create\",\"update\"', '0.01 seconds', '2025-03-31 10:59:16', '2025-03-31 10:59:16'),
('kYjNxr9JttZuwWmgiWsdrjS', '/api/v1/countries?', 'GET api/v1/countries?', '{}', '{}', '{}', '{\"success\":true,\"message\":\"Countries fetched successfully\",\"data\":[{\"id\":\"0YNW00eJIaSTu6T8IZXJZ2W\",\"countryName\":\"Kuwait\",\"countryCode\":\"KW\",\"phoneCode\":\"+965\",\"created_by\":null,\"updated_by\":null,\"createdAt\":\"2025-03-31T03:52:28.000Z\",\"updatedAt\":\"2025-03', '0.02 seconds', '2025-03-31 17:12:25', '2025-03-31 17:12:25'),
('KyWuRfHmZy9RgxryN2ZQ8FX', '/api/v1/auth/verify-signup', 'POST api/v1/auth/verify-signup', '{}', '{}', '{\"otp\":\"397357\"}', '{\"success\":true,\"message\":\"Registration completed successfully\",\"data\":{\"success\":true,\"token\":\"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6InRhd21kQmJ3RFhNcktvTXA1N2xRUEVKIiwicm9sZSI6ImNsaWVudCIsImlhdCI6MTc0MzM5MzkwNiwiZXhwIjoxNzQzNDgwMzA2fQ.CYICCnzZNao', '2.72 seconds', '2025-03-31 09:35:09', '2025-03-31 09:35:09'),
('l0wN6YSCz3fmv71qV9PIsbJ', '/api/v1/clients', 'GET api/v1/clients', '{}', '{}', '{}', '{\"success\":true,\"message\":\"Clients fetched successfully\",\"data\":[{\"conversations\":{},\"id\":\"4kykUHcg5oLrhNDkfCLNYYG\",\"employeeId\":null,\"username\":\"Silverline Systems\",\"password\":\"$2b$12$.2Ia/XUZHrA7BEsLyf6uGuo9wgP9rGamovaR/ICL6YHHBDXVI5nIy\",\"email\":\"silver', '0.02 seconds', '2025-03-31 14:41:38', '2025-03-31 14:41:38'),
('l5lqUKQ1m3yjgOrKnbFGLu3', '/api/v1/labels/4kykUHcg5oLrhNDkfCLNYYG', 'GET api/v1/labels/4kykUHcg5oLrhNDkfCLNYYG', '{\"id\":\"4kykUHcg5oLrhNDkfCLNYYG\"}', '{}', '{}', '{\"success\":true,\"message\":\"Tags retrieved successfully\",\"data\":[{\"id\":\"0ga51ZccuIiGGEudOSNNRDJ\",\"related_id\":\"4kykUHcg5oLrhNDkfCLNYYG\",\"lableType\":\"source\",\"name\":\"Phone\",\"color\":\"#34495E\",\"client_id\":\"4kykUHcg5oLrhNDkfCLNYYG\",\"created_by\":\"system\",\"updat', '0.01 seconds', '2025-03-31 16:47:23', '2025-03-31 16:47:23'),
('l5UNywc8LXZyrqACsheCvjn', '/api/v1/deals/dmciOE2OiF952YsPFd0NPQi', 'PUT api/v1/deals/dmciOE2OiF952YsPFd0NPQi', '{\"id\":\"dmciOE2OiF952YsPFd0NPQi\"}', '{}', '{\"stage\":\"kf3CdKopyyAqyES98pDDPaA\"}', '{\"success\":true,\"message\":\"Deal updated successfully\",\"data\":{\"id\":\"dmciOE2OiF952YsPFd0NPQi\",\"leadTitle\":null,\"firstName\":null,\"lastName\":null,\"email\":null,\"phone\":null,\"dealName\":\"Cloud ERP Implementation\",\"pipeline\":\"iiUsXOteVUFiCIMkgR6DObO\",\"stage\":\"kf', '0.01 seconds', '2025-03-31 17:46:16', '2025-03-31 17:46:16'),
('l7pwWQXsbCaS3Mjz3n1jdz2', '/api/v1/designations', 'GET api/v1/designations', '{}', '{}', '{}', '{\"success\":true,\"message\":\"Designation fetched successfully\",\"data\":[{\"id\":\"UUBCv7KfYd6JRjBUizsgD4o\",\"branch\":\"UH8lBWZZAkctwuRFiCz5PMB\",\"designation_name\":\"Senior Software Engineer\",\"client_id\":\"4kykUHcg5oLrhNDkfCLNYYG\",\"created_by\":\"Silverline Systems\",\"', '0.01 seconds', '2025-03-31 12:12:36', '2025-03-31 12:12:36'),
('LabfvKCxZUO5rWJqSVjQxjt', '/api/v1/clients', 'GET api/v1/clients', '{}', '{}', '{}', '{\"success\":true,\"message\":\"Clients fetched successfully\",\"data\":[{\"conversations\":{},\"id\":\"4kykUHcg5oLrhNDkfCLNYYG\",\"employeeId\":null,\"username\":\"Silverline Systems\",\"password\":\"$2b$12$.2Ia/XUZHrA7BEsLyf6uGuo9wgP9rGamovaR/ICL6YHHBDXVI5nIy\",\"email\":\"silver', '0.04 seconds', '2025-03-31 10:08:19', '2025-03-31 10:08:19'),
('lEQEMWs9qOTdExkfKPg5v9K', '/api/v1/currencies?page=1&limit=100', 'GET api/v1/currencies?page=1&limit=100', '{}', '{\"page\":1,\"limit\":100}', '{}', '{\"success\":true,\"message\":\"Currencies fetched successfully\",\"data\":[{\"id\":\"29gCwt8wWQg7CPgG96847iD\",\"currencyName\":\"Euro\",\"currencyIcon\":\"€\",\"currencyCode\":\"EUR\",\"created_by\":null,\"updated_by\":null,\"createdAt\":\"2025-03-31T04:23:06.000Z\",\"updatedAt\":\"2025-', '0.01 seconds', '2025-03-31 10:45:24', '2025-03-31 10:45:24'),
('LlKHPxKrGRwLRhmvLk7BULm', '/api/v1/sub-clients', 'GET api/v1/sub-clients', '{}', '{}', '{}', '{\"success\":true,\"message\":\"SubClients fetched successfully\",\"data\":[{\"conversations\":{},\"id\":\"9VDWw1NRr3hnVRf82reZODt\",\"employeeId\":null,\"username\":\"Quantum Innovations\",\"password\":\"$2b$12$mn0gG674rbqCn0UiYh7kuuZPDY.iZquWfgnPbgjYrwphrOOTtty86\",\"email\":\"qu', '0.01 seconds', '2025-03-31 11:55:43', '2025-03-31 11:55:43'),
('lm5Re7HwEaXQ5MOw1EKEfJ5', '/api/v1/designations', 'GET api/v1/designations', '{}', '{}', '{}', '{\"success\":true,\"message\":\"Designation fetched successfully\",\"data\":[{\"id\":\"UUBCv7KfYd6JRjBUizsgD4o\",\"branch\":\"UH8lBWZZAkctwuRFiCz5PMB\",\"designation_name\":\"Senior Software Engineer\",\"client_id\":\"4kykUHcg5oLrhNDkfCLNYYG\",\"created_by\":\"Silverline Systems\",\"', '0.01 seconds', '2025-03-31 12:18:05', '2025-03-31 12:18:05'),
('lmDAk7qacb7sV5S4wD9ncuD', '/api/v1/auth/verify-signup', 'POST api/v1/auth/verify-signup', '{}', '{}', '{\"otp\":\"132476\"}', '{\"success\":true,\"message\":\"Registration completed successfully\",\"data\":{\"success\":true,\"token\":\"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IkJvdDNHdW9QZ09IbG9LdlRQUnRjejJBIiwicm9sZSI6ImNsaWVudCIsImlhdCI6MTc0MzM5MzgzOSwiZXhwIjoxNzQzNDgwMjM5fQ._79bT2G1BLG', '2.49 seconds', '2025-03-31 09:34:02', '2025-03-31 09:34:02'),
('lNnKjE2EDMoc2PmRX4mWEmd', '/api/v1/clients', 'GET api/v1/clients', '{}', '{}', '{}', '{\"success\":true,\"message\":\"Clients fetched successfully\",\"data\":[{\"conversations\":{},\"id\":\"4kykUHcg5oLrhNDkfCLNYYG\",\"employeeId\":null,\"username\":\"Silverline Systems\",\"password\":\"$2b$12$.2Ia/XUZHrA7BEsLyf6uGuo9wgP9rGamovaR/ICL6YHHBDXVI5nIy\",\"email\":\"silver', '0.06 seconds', '2025-03-31 10:23:10', '2025-03-31 10:23:10'),
('Lo2dxPXA2QCxmJsB5hJUBA4', '/api/v1/departments', 'GET api/v1/departments', '{}', '{}', '{}', '{\"success\":true,\"message\":\"Department fetched successfully\",\"data\":[{\"id\":\"0DQCpwzdzU2mZWnGcqM91AC\",\"branch\":\"haQEJiCePwC0KeJsmUWsSZ7\",\"department_name\":\" Sales\",\"client_id\":\"4kykUHcg5oLrhNDkfCLNYYG\",\"created_by\":\"Silverline Systems\",\"updated_by\":null,\"cr', '0.01 seconds', '2025-03-31 12:28:02', '2025-03-31 12:28:02'),
('LQjBcQJOF8NnwdNOV5rbzdk', '/api/v1/countries?', 'GET api/v1/countries?', '{}', '{}', '{}', '{\"success\":true,\"message\":\"Countries fetched successfully\",\"data\":[{\"id\":\"0YNW00eJIaSTu6T8IZXJZ2W\",\"countryName\":\"Kuwait\",\"countryCode\":\"KW\",\"phoneCode\":\"+965\",\"created_by\":null,\"updated_by\":null,\"createdAt\":\"2025-03-31T03:52:28.000Z\",\"updatedAt\":\"2025-03', '0.02 seconds', '2025-03-31 14:31:27', '2025-03-31 14:31:27'),
('LtLwa6Qkmwgorx6PJuIzjW6', '/api/v1/labels/4kykUHcg5oLrhNDkfCLNYYG', 'GET api/v1/labels/4kykUHcg5oLrhNDkfCLNYYG', '{\"id\":\"4kykUHcg5oLrhNDkfCLNYYG\"}', '{}', '{}', '{\"success\":true,\"message\":\"Tags retrieved successfully\",\"data\":[{\"id\":\"0ga51ZccuIiGGEudOSNNRDJ\",\"related_id\":\"4kykUHcg5oLrhNDkfCLNYYG\",\"lableType\":\"source\",\"name\":\"Phone\",\"color\":\"#34495E\",\"client_id\":\"4kykUHcg5oLrhNDkfCLNYYG\",\"created_by\":\"system\",\"updat', '0.01 seconds', '2025-03-31 10:31:10', '2025-03-31 10:31:10');
INSERT INTO `audittrails` (`id`, `url`, `activity`, `params`, `query`, `payload`, `response`, `duration`, `createdAt`, `updatedAt`) VALUES
('LUXxuyGYvEC59BafiyPk88m', '/api/v1/auth', 'GET api/v1/auth', '{}', '{}', '{}', '{\"success\":true,\"message\":\"Users fetched successfully\",\"data\":[{\"conversations\":{},\"id\":\"0aMTORQ27wG00Ht5REhq13p\",\"employeeId\":null,\"username\":\" ba.silverline\",\"password\":\"$2b$12$NT.meyBZRWfJve/VLDgQo.bwhzGz1ElPJcoihKL2lokuJpOAqHk6W\",\"email\":\"ba.silverlin', '0.01 seconds', '2025-03-31 12:04:04', '2025-03-31 12:04:04'),
('lxaEma9VXUjwcpplvpWZyRk', '/api/v1/labels/4kykUHcg5oLrhNDkfCLNYYG', 'GET api/v1/labels/4kykUHcg5oLrhNDkfCLNYYG', '{\"id\":\"4kykUHcg5oLrhNDkfCLNYYG\"}', '{}', '{}', '{\"success\":true,\"message\":\"Tags retrieved successfully\",\"data\":[{\"id\":\"0ga51ZccuIiGGEudOSNNRDJ\",\"related_id\":\"4kykUHcg5oLrhNDkfCLNYYG\",\"lableType\":\"source\",\"name\":\"Phone\",\"color\":\"#34495E\",\"client_id\":\"4kykUHcg5oLrhNDkfCLNYYG\",\"created_by\":\"system\",\"updat', '0.01 seconds', '2025-03-31 10:31:10', '2025-03-31 10:31:10'),
('m719NjeohmFruHsplt5bIC1', '/api/v1/auth', 'GET api/v1/auth', '{}', '{}', '{}', '{\"success\":true,\"message\":\"Users fetched successfully\",\"data\":[{\"conversations\":{},\"id\":\"0aMTORQ27wG00Ht5REhq13p\",\"employeeId\":null,\"username\":\" ba.silverline\",\"password\":\"$2b$12$NT.meyBZRWfJve/VLDgQo.bwhzGz1ElPJcoihKL2lokuJpOAqHk6W\",\"email\":\"ba.silverlin', '0.06 seconds', '2025-03-31 12:32:13', '2025-03-31 12:32:13'),
('m9554He0EReG8LEM5jlixgr', '/api/v1/stages', 'GET api/v1/stages', '{}', '{}', '{}', '{\"success\":true,\"message\":\"Stages fetched successfully\",\"data\":[{\"id\":\"1j1Mfax4tYdOONQGLA23CeQ\",\"stageType\":\"deal\",\"stageName\":\"Lead Received\",\"pipeline\":\"iiUsXOteVUFiCIMkgR6DObO\",\"client_id\":\"4kykUHcg5oLrhNDkfCLNYYG\",\"created_by\":\"Silverline Systems\",\"up', '0.04 seconds', '2025-03-31 17:38:51', '2025-03-31 17:38:51'),
('MiKXzkEGxZ4XxlOQiHrsd2B', '/api/v1/auth', 'GET api/v1/auth', '{}', '{}', '{}', '{\"success\":true,\"message\":\"Users fetched successfully\",\"data\":[{\"conversations\":{},\"id\":\"0aMTORQ27wG00Ht5REhq13p\",\"employeeId\":null,\"username\":\" ba.silverline\",\"password\":\"$2b$12$NT.meyBZRWfJve/VLDgQo.bwhzGz1ElPJcoihKL2lokuJpOAqHk6W\",\"email\":\"ba.silverlin', '0.04 seconds', '2025-03-31 15:54:49', '2025-03-31 15:54:49'),
('Mjf5a6HIimQPCceXgWSp79o', '/api/v1/countries?page=1&limit=100', 'GET api/v1/countries?page=1&limit=100', '{}', '{\"page\":1,\"limit\":100}', '{}', '{\"success\":true,\"message\":\"Countries fetched successfully\",\"data\":[{\"id\":\"0YNW00eJIaSTu6T8IZXJZ2W\",\"countryName\":\"Kuwait\",\"countryCode\":\"KW\",\"phoneCode\":\"+965\",\"created_by\":null,\"updated_by\":null,\"createdAt\":\"2025-03-31T03:52:28.000Z\",\"updatedAt\":\"2025-03', '0.03 seconds', '2025-03-31 15:54:11', '2025-03-31 15:54:11'),
('mOKCp8KTQpIVCnvHea2soEo', '/api/v1/sub-clients', 'GET api/v1/sub-clients', '{}', '{}', '{}', '{\"success\":false,\"message\":\"Cannot read properties of null (reading \'id\')\"}', '0.01 seconds', '2025-03-31 10:42:08', '2025-03-31 10:42:08'),
('mq4X1LC59MRZ96qbg9deKHU', '/api/v1/projects', 'GET api/v1/projects', '{}', '{}', '{}', '{\"success\":true,\"message\":\"Projects fetched successfully\",\"data\":[]}', '0.04 seconds', '2025-03-31 10:42:03', '2025-03-31 10:42:03'),
('Mqt4GEmbs3w1vfxQklC2qRe', '/api/v1/customers', 'GET api/v1/customers', '{}', '{}', '{}', '{\"success\":true,\"message\":\"Customer fetched successfully\",\"data\":[]}', '0.01 seconds', '2025-03-31 10:52:40', '2025-03-31 10:52:40'),
('MR0gfFkOHjiGGAzvh3Xflg8', '/api/v1/currencies?', 'GET api/v1/currencies?', '{}', '{}', '{}', '{\"success\":true,\"message\":\"Currencies fetched successfully\",\"data\":[{\"id\":\"29gCwt8wWQg7CPgG96847iD\",\"currencyName\":\"Euro\",\"currencyIcon\":\"€\",\"currencyCode\":\"EUR\",\"created_by\":null,\"updated_by\":null,\"createdAt\":\"2025-03-31T04:23:06.000Z\",\"updatedAt\":\"2025-', '0.13 seconds', '2025-03-31 17:23:44', '2025-03-31 17:23:44'),
('mSK0cy1sZVYUKyjFNwNQ3v7', '/api/v1/deals', 'GET api/v1/deals', '{}', '{}', '{}', '{\"success\":true,\"message\":\"Deal fetched successfully\",\"data\":[{\"id\":\"dmciOE2OiF952YsPFd0NPQi\",\"leadTitle\":null,\"firstName\":null,\"lastName\":null,\"email\":null,\"phone\":null,\"dealName\":\"Cloud ERP Implementation\",\"pipeline\":\"iiUsXOteVUFiCIMkgR6DObO\",\"stage\":\"u', '0.01 seconds', '2025-03-31 17:46:18', '2025-03-31 17:46:18'),
('mT4tIKRBLWR6jEJ78NKpnHU', '/api/v1/clients', 'GET api/v1/clients', '{}', '{}', '{}', '{\"success\":true,\"message\":\"Clients fetched successfully\",\"data\":[{\"conversations\":{},\"id\":\"7aRxfVTXsxd31PyBz9WzEjx\",\"employeeId\":null,\"username\":\"Quantum Enterprises\",\"password\":\"$2b$12$OCduts6PI5L0YSEOVKT73uvS2zlUOaAPNMKWIxOO8tA/YpS1K.TRS\",\"email\":\"quant', '0.01 seconds', '2025-03-31 09:41:09', '2025-03-31 09:41:09'),
('mWbrzNiDmi3pFOf6dC243qU', '/api/v1/stages', 'GET api/v1/stages', '{}', '{}', '{}', '{\"success\":true,\"message\":\"Stages fetched successfully\",\"data\":[{\"id\":\"1j1Mfax4tYdOONQGLA23CeQ\",\"stageType\":\"deal\",\"stageName\":\"Lead Received\",\"pipeline\":\"iiUsXOteVUFiCIMkgR6DObO\",\"client_id\":\"4kykUHcg5oLrhNDkfCLNYYG\",\"created_by\":\"Silverline Systems\",\"up', '0.02 seconds', '2025-03-31 16:21:32', '2025-03-31 16:21:32'),
('mzNwA5r6hbSwHyNyiZRNhha', '/api/v1/deals', 'GET api/v1/deals', '{}', '{}', '{}', '{\"success\":true,\"message\":\"Deal fetched successfully\",\"data\":[{\"id\":\"dmciOE2OiF952YsPFd0NPQi\",\"leadTitle\":null,\"firstName\":null,\"lastName\":null,\"email\":null,\"phone\":null,\"dealName\":\"Cloud ERP Implementation\",\"pipeline\":\"iiUsXOteVUFiCIMkgR6DObO\",\"stage\":\"u', '0.01 seconds', '2025-03-31 17:46:20', '2025-03-31 17:46:20'),
('MZtrTv3siX5tVnWEM1z0AY4', '/api/v1/sub-clients', 'GET api/v1/sub-clients', '{}', '{}', '{}', '{\"success\":false,\"message\":\"Cannot read properties of null (reading \'id\')\"}', '0.01 seconds', '2025-03-31 10:51:52', '2025-03-31 10:51:52'),
('N0hGROQsZ2amFHuBMle3LRK', '/api/v1/roles', 'GET api/v1/roles', '{}', '{}', '{}', '{\"success\":true,\"message\":\"Roles fetched successfully\",\"data\":[{\"id\":\"03qarcBedPhsVY3A1IKMMyW\",\"role_name\":\"System Administrator\",\"permissions\":\"{\\\"dashboards-project-list\\\":[{\\\"key\\\":\\\"dashboards-project-list\\\",\\\"permissions\\\":[\\\"view\\\",\\\"create\\\",\\\"upda', '0.04 seconds', '2025-03-31 16:44:01', '2025-03-31 16:44:01'),
('n0rz4rOXQZUa7Cl1uaEMZqV', '/api/v1/projects', 'GET api/v1/projects', '{}', '{}', '{}', '{\"success\":true,\"message\":\"Projects fetched successfully\",\"data\":[]}', '0.04 seconds', '2025-03-31 11:17:49', '2025-03-31 11:17:49'),
('N704UMvMolenkNS6Y42Aqfh', '/api/v1/labels/4kykUHcg5oLrhNDkfCLNYYG', 'GET api/v1/labels/4kykUHcg5oLrhNDkfCLNYYG', '{\"id\":\"4kykUHcg5oLrhNDkfCLNYYG\"}', '{}', '{}', '{\"success\":true,\"message\":\"Tags retrieved successfully\",\"data\":[{\"id\":\"0ga51ZccuIiGGEudOSNNRDJ\",\"related_id\":\"4kykUHcg5oLrhNDkfCLNYYG\",\"lableType\":\"source\",\"name\":\"Phone\",\"color\":\"#34495E\",\"client_id\":\"4kykUHcg5oLrhNDkfCLNYYG\",\"created_by\":\"system\",\"updat', '0.13 seconds', '2025-03-31 16:57:06', '2025-03-31 16:57:06'),
('nAeJoyMai0I9UsbYFxYVfTt', '/api/v1/sub-clients', 'GET api/v1/sub-clients', '{}', '{}', '{}', '{\"success\":false,\"message\":\"Cannot read properties of null (reading \'id\')\"}', '0.01 seconds', '2025-03-31 11:10:12', '2025-03-31 11:10:12'),
('NeizswQjf4xRMYvQBZdaaDp', '/api/v1/products', 'GET api/v1/products', '{}', '{}', '{}', '{\"success\":true,\"message\":\"Product fetched successfully\",\"data\":[]}', '0.05 seconds', '2025-03-31 17:03:21', '2025-03-31 17:03:21'),
('nHA5cjdpRPCnuM3XhtA9wgN', '/api/v1/branches', 'GET api/v1/branches', '{}', '{}', '{}', '{\"success\":true,\"message\":\"Branches fetched successfully\",\"data\":[{\"id\":\"UH8lBWZZAkctwuRFiCz5PMB\",\"branchName\":\"Mumbai\",\"branchAddress\":\"Silverline Tower, Plot No. 15\\nSector 30, Vashi\\nNavi Mumbai, Maharashtra - 400705\",\"branchManager\":\"0aMTORQ27wG00Ht5R', '0.01 seconds', '2025-03-31 12:10:29', '2025-03-31 12:10:29'),
('niSDlOzI2CUv5Z0z4fN4X16', '/api/v1/labels/4kykUHcg5oLrhNDkfCLNYYG', 'GET api/v1/labels/4kykUHcg5oLrhNDkfCLNYYG', '{\"id\":\"4kykUHcg5oLrhNDkfCLNYYG\"}', '{}', '{}', '{\"success\":true,\"message\":\"Tags retrieved successfully\",\"data\":[{\"id\":\"0ga51ZccuIiGGEudOSNNRDJ\",\"related_id\":\"4kykUHcg5oLrhNDkfCLNYYG\",\"lableType\":\"source\",\"name\":\"Phone\",\"color\":\"#34495E\",\"client_id\":\"4kykUHcg5oLrhNDkfCLNYYG\",\"created_by\":\"system\",\"updat', '0.01 seconds', '2025-03-31 14:31:48', '2025-03-31 14:31:48'),
('nktsHPDPLomut6kVNqPJ8CO', '/api/v1/labels/4kykUHcg5oLrhNDkfCLNYYG', 'GET api/v1/labels/4kykUHcg5oLrhNDkfCLNYYG', '{\"id\":\"4kykUHcg5oLrhNDkfCLNYYG\"}', '{}', '{}', '{\"success\":true,\"message\":\"Tags retrieved successfully\",\"data\":[{\"id\":\"0ga51ZccuIiGGEudOSNNRDJ\",\"related_id\":\"4kykUHcg5oLrhNDkfCLNYYG\",\"lableType\":\"source\",\"name\":\"Phone\",\"color\":\"#34495E\",\"client_id\":\"4kykUHcg5oLrhNDkfCLNYYG\",\"created_by\":\"system\",\"updat', '0.01 seconds', '2025-03-31 11:41:48', '2025-03-31 11:41:48'),
('nLJHI3tStn5QWhRS8PBO2GG', '/api/v1/leads', 'POST api/v1/leads', '{}', '{}', '{\"leadTitle\":\"DataCore Analytics Cloud Migration\",\"interest_level\":\"medium\",\"currency\":\"INR\",\"leadValue\":1275000,\"source\":\"xuB1EFLnxfOC50fursRLoCz\",\"status\":\"KVF8VPuuiCxHdL5Ovn6GQJr\",\"category\":\"P4aLxD3aeJNqduJwTORAasj\",\"lead_members\":{\"lead_members\":[\"8v', '{\"success\":true,\"message\":\"Lead created successfully!\",\"data\":{\"id\":\"oJApH38EENA6wFiwH6AAP34\",\"files\":null,\"lead_score\":null,\"updated_by\":null,\"leadStage\":\"y75dLVbz4NfpZMCehFqh7VJ\",\"leadTitle\":\"DataCore Analytics Cloud Migration\",\"firstName\":\" Priya \",\"la', '0.09 seconds', '2025-03-31 14:40:53', '2025-03-31 14:40:53'),
('NOd29z3nsoMG8UKDJFTk8K2', '/api/v1/currencies?', 'GET api/v1/currencies?', '{}', '{}', '{}', '{\"success\":true,\"message\":\"Currencies fetched successfully\",\"data\":[{\"id\":\"29gCwt8wWQg7CPgG96847iD\",\"currencyName\":\"Euro\",\"currencyIcon\":\"€\",\"currencyCode\":\"EUR\",\"created_by\":null,\"updated_by\":null,\"createdAt\":\"2025-03-31T04:23:06.000Z\",\"updatedAt\":\"2025-', '0.04 seconds', '2025-03-31 14:25:30', '2025-03-31 14:25:30'),
('Nr9wcxyRbBbWEBckHswUoN3', '/api/v1/sub-clients', 'GET api/v1/sub-clients', '{}', '{}', '{}', '{\"success\":false,\"message\":\"Cannot read properties of null (reading \'id\')\"}', '0.03 seconds', '2025-03-31 10:56:31', '2025-03-31 10:56:31'),
('NRu6LxPYutttWeaPp6Ur7KM', '/api/v1/subscriptions?page=1&limit=10&search=', 'GET api/v1/subscriptions?page=1&limit=10&search=', '{}', '{}', '{}', '{\"success\":true,\"message\":\"Plans retrieved successfully\",\"data\":[{\"id\":\"uzptLdgqYFRoK23ORcMgQrg\",\"name\":\"Basic Plan\",\"currency\":\"INR\",\"price\":\"999.00\",\"duration\":\"Per Month\",\"trial_period\":\"7\",\"max_users\":\"5\",\"max_clients\":\"10\",\"max_customers\":\"50\",\"max_v', '0.02 seconds', '2025-03-31 10:12:10', '2025-03-31 10:12:10'),
('NuitqbEvr0EvC2EvpJTGsMS', '/api/v1/leads/YXfrACvHnsutJstpTU5Tu24', 'PUT api/v1/leads/YXfrACvHnsutJstpTU5Tu24', '{\"id\":\"YXfrACvHnsutJstpTU5Tu24\"}', '{}', '{\"leadStage\":\"eTzCUBr5Y232i82lxUoP9vJ\"}', '{\"success\":true,\"message\":\"Lead updated successfully!\",\"data\":{\"id\":\"YXfrACvHnsutJstpTU5Tu24\",\"leadTitle\":\"HealthCare App Development\",\"leadStage\":\"eTzCUBr5Y232i82lxUoP9vJ\",\"currency\":\"INR\",\"leadValue\":1500000,\"company_name\":\"MediTech Solutions\",\"firstNam', '0.04 seconds', '2025-03-31 16:57:10', '2025-03-31 16:57:10'),
('nUQuUEgepezBfKNG1Mvb7DK', '/api/v1/stages', 'GET api/v1/stages', '{}', '{}', '{}', '{\"success\":true,\"message\":\"Stages fetched successfully\",\"data\":[{\"id\":\"1j1Mfax4tYdOONQGLA23CeQ\",\"stageType\":\"deal\",\"stageName\":\"Lead Received\",\"pipeline\":\"iiUsXOteVUFiCIMkgR6DObO\",\"client_id\":\"4kykUHcg5oLrhNDkfCLNYYG\",\"created_by\":\"Silverline Systems\",\"up', '0.08 seconds', '2025-03-31 17:48:23', '2025-03-31 17:48:23'),
('nVdYPdyMSowHKzyu4ni6yNJ', '/api/v1/auth/verify-signup', 'POST api/v1/auth/verify-signup', '{}', '{}', '{\"otp\":\"927600\"}', '{\"success\":true,\"message\":\"Registration completed successfully\",\"data\":{\"success\":true,\"token\":\"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6InVSeE5oVTZtckk0NGZlZGw2SGlPQllNIiwicm9sZSI6ImVtcGxveWVlIiwiaWF0IjoxNzQzNDA1MDU3LCJleHAiOjE3NDM0OTE0NTd9.v6eSKwMeA', '3.40 seconds', '2025-03-31 12:41:00', '2025-03-31 12:41:00'),
('NVLJQx2DnYglUXKxelbKq1L', '/api/v1/countries?', 'GET api/v1/countries?', '{}', '{}', '{}', '{\"success\":true,\"message\":\"Countries fetched successfully\",\"data\":[{\"id\":\"0YNW00eJIaSTu6T8IZXJZ2W\",\"countryName\":\"Kuwait\",\"countryCode\":\"KW\",\"phoneCode\":\"+965\",\"created_by\":null,\"updated_by\":null,\"createdAt\":\"2025-03-31T03:52:28.000Z\",\"updatedAt\":\"2025-03', '0.07 seconds', '2025-03-31 10:31:10', '2025-03-31 10:31:10'),
('nxOWCzueX5NzuiOhreeRtf2', '/api/v1/auth/login', 'POST api/v1/auth/login', '{}', '{}', '{\"login\":\"admin.silverline\",\"password\":\"Adminsilverline@2525\"}', '{\"success\":true,\"message\":\"Login successful\",\"data\":{\"token\":\"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6ImFkbWluLnNpbHZlcmxpbmUiLCJlbWFpbCI6ImFkbWluLnNpbHZlcmxpbmVAeW9wbWFpbC5jb20iLCJwaG9uZSI6bnVsbCwiaWQiOiJ3UEhjOWNpc3FPenpwVFcwTXB6WDhwUiIsInJv', '0.37 seconds', '2025-03-31 14:41:20', '2025-03-31 14:41:20'),
('NY1xGe5SmjIOjSPmdLt05C1', '/api/v1/leads', 'GET api/v1/leads', '{}', '{}', '{}', '{\"success\":true,\"message\":\"Lead fetched successfully\",\"data\":[{\"id\":\"31LINvHYSM5u4avuq7Wrjlh\",\"leadTitle\":\"TechPro Solutions Website Modernization\",\"leadStage\":\"BYNYLCidEQll0qKymn79W76\",\"currency\":\"INR\",\"leadValue\":850000,\"company_name\":\" TechPro Solution', '0.07 seconds', '2025-03-31 16:47:23', '2025-03-31 16:47:23'),
('NYixUmajiODS1eSzYA9ga0P', '/api/v1/labels/4kykUHcg5oLrhNDkfCLNYYG', 'GET api/v1/labels/4kykUHcg5oLrhNDkfCLNYYG', '{\"id\":\"4kykUHcg5oLrhNDkfCLNYYG\"}', '{}', '{}', '{\"success\":true,\"message\":\"Tags retrieved successfully\",\"data\":[{\"id\":\"0ga51ZccuIiGGEudOSNNRDJ\",\"related_id\":\"4kykUHcg5oLrhNDkfCLNYYG\",\"lableType\":\"source\",\"name\":\"Phone\",\"color\":\"#34495E\",\"client_id\":\"4kykUHcg5oLrhNDkfCLNYYG\",\"created_by\":\"system\",\"updat', '0.02 seconds', '2025-03-31 10:49:35', '2025-03-31 10:49:35'),
('o18TmOrsgAQSityDDDYSJvF', '/api/v1/labels/4kykUHcg5oLrhNDkfCLNYYG', 'GET api/v1/labels/4kykUHcg5oLrhNDkfCLNYYG', '{\"id\":\"4kykUHcg5oLrhNDkfCLNYYG\"}', '{}', '{}', '{\"success\":true,\"message\":\"Tags retrieved successfully\",\"data\":[{\"id\":\"0ga51ZccuIiGGEudOSNNRDJ\",\"related_id\":\"4kykUHcg5oLrhNDkfCLNYYG\",\"lableType\":\"source\",\"name\":\"Phone\",\"color\":\"#34495E\",\"client_id\":\"4kykUHcg5oLrhNDkfCLNYYG\",\"created_by\":\"system\",\"updat', '0.01 seconds', '2025-03-31 10:28:45', '2025-03-31 10:28:45'),
('o1VbCA41lJamMQEgnGLciZk', '/api/v1/roles', 'GET api/v1/roles', '{}', '{}', '{}', '{\"success\":true,\"message\":\"Roles fetched successfully\",\"data\":[{\"id\":\"03qarcBedPhsVY3A1IKMMyW\",\"role_name\":\"System Administrator\",\"permissions\":\"{\\\"dashboards-project-list\\\":[{\\\"key\\\":\\\"dashboards-project-list\\\",\\\"permissions\\\":[\\\"view\\\",\\\"create\\\",\\\"upda', '0.01 seconds', '2025-03-31 16:00:54', '2025-03-31 16:00:54'),
('o304bHwNVaePyGGNRVpyEz5', '/api/v1/labels/4kykUHcg5oLrhNDkfCLNYYG', 'GET api/v1/labels/4kykUHcg5oLrhNDkfCLNYYG', '{\"id\":\"4kykUHcg5oLrhNDkfCLNYYG\"}', '{}', '{}', '{\"success\":true,\"message\":\"Tags retrieved successfully\",\"data\":[{\"id\":\"0ga51ZccuIiGGEudOSNNRDJ\",\"related_id\":\"4kykUHcg5oLrhNDkfCLNYYG\",\"lableType\":\"source\",\"name\":\"Phone\",\"color\":\"#34495E\",\"client_id\":\"4kykUHcg5oLrhNDkfCLNYYG\",\"created_by\":\"system\",\"updat', '0.01 seconds', '2025-03-31 16:00:54', '2025-03-31 16:00:54'),
('O5okWFn4h5l0RFlQsNmLXDu', '/api/v1/leads/oJApH38EENA6wFiwH6AAP34', 'GET api/v1/leads/oJApH38EENA6wFiwH6AAP34', '{\"id\":\"oJApH38EENA6wFiwH6AAP34\"}', '{}', '{}', '{\"success\":true,\"message\":\"Lead fetched successfully\",\"data\":{\"id\":\"oJApH38EENA6wFiwH6AAP34\",\"leadTitle\":\"DataCore Analytics Cloud Migration\",\"leadStage\":\"y75dLVbz4NfpZMCehFqh7VJ\",\"currency\":\"INR\",\"leadValue\":1275000,\"company_name\":\"DataCore Analytics\",\"f', '0.07 seconds', '2025-03-31 16:45:00', '2025-03-31 16:45:00'),
('o6djufEuoSGDVgbathqWkOl', '/api/v1/stages', 'GET api/v1/stages', '{}', '{}', '{}', '{\"success\":true,\"message\":\"Stages fetched successfully\",\"data\":[{\"id\":\"1j1Mfax4tYdOONQGLA23CeQ\",\"stageType\":\"deal\",\"stageName\":\"Lead Received\",\"pipeline\":\"iiUsXOteVUFiCIMkgR6DObO\",\"client_id\":\"4kykUHcg5oLrhNDkfCLNYYG\",\"created_by\":\"Silverline Systems\",\"up', '0.01 seconds', '2025-03-31 14:31:27', '2025-03-31 14:31:27'),
('obfMKKb8I5FQ05HMJHXoo5N', '/api/v1/sub-clients', 'GET api/v1/sub-clients', '{}', '{}', '{}', '{\"success\":false,\"message\":\"Cannot read properties of null (reading \'id\')\"}', '0.07 seconds', '2025-03-31 11:41:40', '2025-03-31 11:41:40'),
('ObFTU76rQj8x8Q7JHdOlpDu', '/api/v1/leads/YXfrACvHnsutJstpTU5Tu24', 'PUT api/v1/leads/YXfrACvHnsutJstpTU5Tu24', '{\"id\":\"YXfrACvHnsutJstpTU5Tu24\"}', '{}', '{\"leadStage\":\"BYNYLCidEQll0qKymn79W76\"}', '{\"success\":true,\"message\":\"Lead updated successfully!\",\"data\":{\"id\":\"YXfrACvHnsutJstpTU5Tu24\",\"leadTitle\":\"HealthCare App Development\",\"leadStage\":\"BYNYLCidEQll0qKymn79W76\",\"currency\":\"INR\",\"leadValue\":1500000,\"company_name\":\"MediTech Solutions\",\"firstNam', '0.01 seconds', '2025-03-31 17:12:32', '2025-03-31 17:12:32'),
('Obu84MgIUWjbU9HB4OfgEtJ', '/api/v1/labels/4kykUHcg5oLrhNDkfCLNYYG', 'GET api/v1/labels/4kykUHcg5oLrhNDkfCLNYYG', '{\"id\":\"4kykUHcg5oLrhNDkfCLNYYG\"}', '{}', '{}', '{\"success\":true,\"message\":\"Tags retrieved successfully\",\"data\":[{\"id\":\"0ga51ZccuIiGGEudOSNNRDJ\",\"related_id\":\"4kykUHcg5oLrhNDkfCLNYYG\",\"lableType\":\"source\",\"name\":\"Phone\",\"color\":\"#34495E\",\"client_id\":\"4kykUHcg5oLrhNDkfCLNYYG\",\"created_by\":\"system\",\"updat', '0.05 seconds', '2025-03-31 11:41:48', '2025-03-31 11:41:48'),
('OcQ3d84ShVdNXblwwGMsqLw', '/api/v1/deals', 'GET api/v1/deals', '{}', '{}', '{}', '{\"success\":true,\"message\":\"Deal fetched successfully\",\"data\":[]}', '0.06 seconds', '2025-03-31 17:38:51', '2025-03-31 17:38:51'),
('ODsgJssACelhbNtOAP3ZlHu', '/api/v1/auth/verify-signup', 'POST api/v1/auth/verify-signup', '{}', '{}', '{\"otp\":\"252108\"}', '{\"success\":true,\"message\":\"Registration completed successfully\",\"data\":{\"success\":true,\"token\":\"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6ImU1RVNnVTBLNFhGUU1XbHdsY2RsODlUIiwicm9sZSI6ImNsaWVudCIsImlhdCI6MTc0MzM5NDAxMiwiZXhwIjoxNzQzNDgwNDEyfQ.g5liV-cUlGI', '3.03 seconds', '2025-03-31 09:36:55', '2025-03-31 09:36:55'),
('oguXibNqo9fY9NgHKE0D8XZ', '/api/v1/projects', 'GET api/v1/projects', '{}', '{}', '{}', '{\"success\":true,\"message\":\"Projects fetched successfully\",\"data\":[]}', '0.04 seconds', '2025-03-31 11:41:50', '2025-03-31 11:41:50'),
('OHNhxeTybjvVPEBof9m4xWH', '/api/v1/auth/signup', 'POST api/v1/auth/signup', '{}', '{}', '{\"username\":\"tech.silverline\",\"email\":\"techsilverline@yopmail.com\",\"password\":\"Techsilverline@2525\",\"role_id\":\"SE8IBig8OMMQRI2yX7Exzhm\"}', '{\"success\":true,\"message\":\"Please verify your email to complete registration\",\"data\":{\"sessionToken\":\"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjRreWtVSGNnNW9McmhORGtmQ0xOWVlHIiwidXNlcm5hbWUiOiJ0ZWNoLnNpbHZlcmxpbmUiLCJlbWFpbCI6InRlY2hzaWx2ZXJsaW5lQHlv', '3.50 seconds', '2025-03-31 11:18:50', '2025-03-31 11:18:50'),
('OJNHv9FoPCKT4XNrUVR9IUy', '/api/v1/designations', 'POST api/v1/designations', '{}', '{}', '{\"designation_name\":\"Marketing Manager\",\"branch\":\"bjHlRDFkaJBOh3kg2EP52VH\"}', '{\"success\":true,\"message\":\"Designation created successfully\",\"data\":{\"id\":\"ZNJ9V5UAAoNO3DhdXGoYFr9\",\"updated_by\":null,\"branch\":\"bjHlRDFkaJBOh3kg2EP52VH\",\"designation_name\":\"Marketing Manager\",\"client_id\":\"4kykUHcg5oLrhNDkfCLNYYG\",\"created_by\":\"Silverline ', '0.01 seconds', '2025-03-31 12:25:14', '2025-03-31 12:25:14'),
('oKHEUlDo9LEtWbLgiSRAyZ9', '/api/v1/designations', 'GET api/v1/designations', '{}', '{}', '{}', '{\"success\":true,\"message\":\"Designation fetched successfully\",\"data\":[{\"id\":\"UUBCv7KfYd6JRjBUizsgD4o\",\"branch\":\"UH8lBWZZAkctwuRFiCz5PMB\",\"designation_name\":\"Senior Software Engineer\",\"client_id\":\"4kykUHcg5oLrhNDkfCLNYYG\",\"created_by\":\"Silverline Systems\",\"', '0.01 seconds', '2025-03-31 12:22:33', '2025-03-31 12:22:33'),
('OlWTu3iAu9P6WxEqI2YKPHF', '/api/v1/leads', 'GET api/v1/leads', '{}', '{}', '{}', '{\"success\":true,\"message\":\"Lead fetched successfully\",\"data\":[]}', '0.06 seconds', '2025-03-31 10:31:10', '2025-03-31 10:31:10'),
('om4xGFwkPyz8wAiT87poA3i', '/api/v1/sub-clients', 'GET api/v1/sub-clients', '{}', '{}', '{}', '{\"success\":false,\"message\":\"Cannot read properties of null (reading \'id\')\"}', '0.01 seconds', '2025-03-31 11:42:04', '2025-03-31 11:42:04'),
('OnRBNQFxIfBuTh1zTFjo8kZ', '/api/v1/countries?page=1&limit=100', 'GET api/v1/countries?page=1&limit=100', '{}', '{\"page\":1,\"limit\":100}', '{}', '{\"success\":true,\"message\":\"Countries fetched successfully\",\"data\":[{\"id\":\"0YNW00eJIaSTu6T8IZXJZ2W\",\"countryName\":\"Kuwait\",\"countryCode\":\"KW\",\"phoneCode\":\"+965\",\"created_by\":null,\"updated_by\":null,\"createdAt\":\"2025-03-31T03:52:28.000Z\",\"updatedAt\":\"2025-03', '0.02 seconds', '2025-03-31 14:48:21', '2025-03-31 14:48:21'),
('oRHEjys3k8nOpchlg1Hu7B0', '/api/v1/designations', 'GET api/v1/designations', '{}', '{}', '{}', '{\"success\":true,\"message\":\"Designation fetched successfully\",\"data\":[{\"id\":\"flbhBdf5hBLZTNbwhc12BY7\",\"branch\":\"UH8lBWZZAkctwuRFiCz5PMB\",\"designation_name\":\"HR Manager\",\"client_id\":\"4kykUHcg5oLrhNDkfCLNYYG\",\"created_by\":\"Silverline Systems\",\"updated_by\":nu', '0.01 seconds', '2025-03-31 12:28:33', '2025-03-31 12:28:33'),
('OSBIRUZc5MkRGon7iRcEaCK', '/api/v1/sub-clients', 'GET api/v1/sub-clients', '{}', '{}', '{}', '{\"success\":true,\"message\":\"SubClients fetched successfully\",\"data\":[{\"conversations\":{},\"id\":\"9VDWw1NRr3hnVRf82reZODt\",\"employeeId\":null,\"username\":\"Quantum Innovations\",\"password\":\"$2b$12$mn0gG674rbqCn0UiYh7kuuZPDY.iZquWfgnPbgjYrwphrOOTtty86\",\"email\":\"qu', '0.01 seconds', '2025-03-31 14:25:33', '2025-03-31 14:25:33'),
('OsYuMyQEtHLxPc0I8s6pLNe', '/api/v1/subscriptions?page=1&limit=100&search=', 'GET api/v1/subscriptions?page=1&limit=100&search=', '{}', '{}', '{}', '{\"success\":true,\"message\":\"Plans retrieved successfully\",\"data\":[{\"id\":\"uzptLdgqYFRoK23ORcMgQrg\",\"name\":\"Basic Plan\",\"currency\":\"INR\",\"price\":\"999.00\",\"duration\":\"Per Month\",\"trial_period\":\"7\",\"max_users\":\"5\",\"max_clients\":\"10\",\"max_customers\":\"50\",\"max_v', '0.03 seconds', '2025-03-31 14:48:21', '2025-03-31 14:48:21'),
('OtkwHwbY0KC9w4fcaQuMtwR', '/api/v1/auth', 'GET api/v1/auth', '{}', '{}', '{}', '{\"success\":true,\"message\":\"Users fetched successfully\",\"data\":[{\"conversations\":{},\"id\":\"4kykUHcg5oLrhNDkfCLNYYG\",\"employeeId\":null,\"username\":\"Silverline Systems\",\"password\":\"$2b$12$.2Ia/XUZHrA7BEsLyf6uGuo9wgP9rGamovaR/ICL6YHHBDXVI5nIy\",\"email\":\"silverli', '0.01 seconds', '2025-03-31 11:14:57', '2025-03-31 11:14:57'),
('oU1Wa1IC2yfZveK7mxZoPIW', '/api/v1/labels/4kykUHcg5oLrhNDkfCLNYYG', 'GET api/v1/labels/4kykUHcg5oLrhNDkfCLNYYG', '{\"id\":\"4kykUHcg5oLrhNDkfCLNYYG\"}', '{}', '{}', '{\"success\":true,\"message\":\"Tags retrieved successfully\",\"data\":[{\"id\":\"0ga51ZccuIiGGEudOSNNRDJ\",\"related_id\":\"4kykUHcg5oLrhNDkfCLNYYG\",\"lableType\":\"source\",\"name\":\"Phone\",\"color\":\"#34495E\",\"client_id\":\"4kykUHcg5oLrhNDkfCLNYYG\",\"created_by\":\"system\",\"updat', '0.01 seconds', '2025-03-31 17:12:25', '2025-03-31 17:12:25'),
('OU4ePWvYTnShBMyJIwhAtFN', '/api/v1/auth/admin-login', 'POST api/v1/auth/admin-login', '{}', '{}', '{\"email\":\"silverlinesystems@yopmail.com\"}', '{\"success\":true,\"message\":\"Login successful\",\"data\":{\"token\":\"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6IlNpbHZlcmxpbmUgU3lzdGVtcyIsImVtYWlsIjoic2lsdmVybGluZXN5c3RlbXNAeW9wbWFpbC5jb20iLCJwaG9uZSI6bnVsbCwiaWQiOiI0a3lrVUhjZzVvTHJoTkRrZkNMTllZRyIs', '0.01 seconds', '2025-03-31 10:14:53', '2025-03-31 10:14:53'),
('ov15kJpBP7FskcQo6flU0xw', '/api/v1/labels/4kykUHcg5oLrhNDkfCLNYYG', 'GET api/v1/labels/4kykUHcg5oLrhNDkfCLNYYG', '{\"id\":\"4kykUHcg5oLrhNDkfCLNYYG\"}', '{}', '{}', '{\"success\":true,\"message\":\"Tags retrieved successfully\",\"data\":[{\"id\":\"0ga51ZccuIiGGEudOSNNRDJ\",\"related_id\":\"4kykUHcg5oLrhNDkfCLNYYG\",\"lableType\":\"source\",\"name\":\"Phone\",\"color\":\"#34495E\",\"client_id\":\"4kykUHcg5oLrhNDkfCLNYYG\",\"created_by\":\"system\",\"updat', '0.01 seconds', '2025-03-31 15:54:49', '2025-03-31 15:54:49'),
('OVwRgFlPHj36uap5AmcFzrq', '/api/v1/employees', 'POST api/v1/employees', '{}', '{}', '{\"firstName\":\"Rahul \",\"lastName\":\"Sharma\",\"username\":\"rahul.sharma\",\"email\":\"rahul.sharma.silverline@yopmail.com\",\"password\":\"Rahulsharma@2525\",\"phone\":\"9876543210\",\"address\":\"123 Maple Avenue, Crystal Park\\nNear Central Mall, Sector 15\\nMumbai, Maharasht', '{\"success\":true,\"message\":\"Please verify your email to complete registration\",\"data\":{\"sessionToken\":\"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjRreWtVSGNnNW9McmhORGtmQ0xOWVlHIiwidXNlcm5hbWUiOiJyYWh1bC5zaGFybWEiLCJlbWFpbCI6InJhaHVsLnNoYXJtYS5zaWx2ZXJs', '2.94 seconds', '2025-03-31 12:40:35', '2025-03-31 12:40:35'),
('P0bXBCfplSoUXa9IlHCBq0y', '/api/v1/auth', 'GET api/v1/auth', '{}', '{}', '{}', '{\"success\":true,\"message\":\"Users fetched successfully\",\"data\":[{\"conversations\":{},\"id\":\"0aMTORQ27wG00Ht5REhq13p\",\"employeeId\":null,\"username\":\" ba.silverline\",\"password\":\"$2b$12$NT.meyBZRWfJve/VLDgQo.bwhzGz1ElPJcoihKL2lokuJpOAqHk6W\",\"email\":\"ba.silverlin', '0.00 seconds', '2025-03-31 11:57:25', '2025-03-31 11:57:25'),
('P2PwgaR4GBEKCnDURzlAhL3', '/api/v1/sub-clients', 'GET api/v1/sub-clients', '{}', '{}', '{}', '{\"success\":false,\"message\":\"Cannot read properties of null (reading \'id\')\"}', '0.01 seconds', '2025-03-31 11:41:55', '2025-03-31 11:41:55'),
('pCOprHKKDABT3MntF2UObn3', '/api/v1/roles', 'GET api/v1/roles', '{}', '{}', '{}', '{\"success\":true,\"message\":\"Roles fetched successfully\",\"data\":[{\"id\":\"03qarcBedPhsVY3A1IKMMyW\",\"role_name\":\"System Administrator\",\"permissions\":\"{\\\"dashboards-project-list\\\":[{\\\"key\\\":\\\"dashboards-project-list\\\",\\\"permissions\\\":[\\\"view\\\",\\\"create\\\",\\\"upda', '0.30 seconds', '2025-03-31 12:59:52', '2025-03-31 12:59:52'),
('PDgCFEq88a7ns3G4TzaLNJP', '/api/v1/leads?', 'GET api/v1/leads?', '{}', '{}', '{}', '{\"success\":true,\"message\":\"Lead fetched successfully\",\"data\":[{\"id\":\"31LINvHYSM5u4avuq7Wrjlh\",\"leadTitle\":\"TechPro Solutions Website Modernization\",\"leadStage\":\"eTzCUBr5Y232i82lxUoP9vJ\",\"currency\":\"INR\",\"leadValue\":850000,\"company_name\":\" TechPro Solution', '0.10 seconds', '2025-03-31 17:21:17', '2025-03-31 17:21:17'),
('pdOCLLzNGOHuScXGe8R7GkO', '/api/v1/departments', 'GET api/v1/departments', '{}', '{}', '{}', '{\"success\":true,\"message\":\"Department fetched successfully\",\"data\":[{\"id\":\"6aVUek1kX78VHjoDjhnJDAD\",\"branch\":\"UH8lBWZZAkctwuRFiCz5PMB\",\"department_name\":\"Development\",\"client_id\":\"4kykUHcg5oLrhNDkfCLNYYG\",\"created_by\":\"Silverline Systems\",\"updated_by\":nul', '0.01 seconds', '2025-03-31 12:22:22', '2025-03-31 12:22:22'),
('PGJBzyyVDR4jrw4wgXWwSQB', '/api/v1/auth', 'GET api/v1/auth', '{}', '{}', '{}', '{\"success\":true,\"message\":\"Users fetched successfully\",\"data\":[{\"conversations\":{},\"id\":\"4kykUHcg5oLrhNDkfCLNYYG\",\"employeeId\":null,\"username\":\"Silverline Systems\",\"password\":\"$2b$12$.2Ia/XUZHrA7BEsLyf6uGuo9wgP9rGamovaR/ICL6YHHBDXVI5nIy\",\"email\":\"silverli', '0.01 seconds', '2025-03-31 11:15:14', '2025-03-31 11:15:14'),
('pHm9h8qCySJvjiHli9qzbGO', '/api/v1/auth', 'GET api/v1/auth', '{}', '{}', '{}', '{\"success\":true,\"message\":\"Users fetched successfully\",\"data\":[{\"conversations\":{},\"id\":\"4kykUHcg5oLrhNDkfCLNYYG\",\"employeeId\":null,\"username\":\"Silverline Systems\",\"password\":\"$2b$12$.2Ia/XUZHrA7BEsLyf6uGuo9wgP9rGamovaR/ICL6YHHBDXVI5nIy\",\"email\":\"silverli', '0.07 seconds', '2025-03-31 10:31:10', '2025-03-31 10:31:10'),
('pHQNRKxRtRhiXt8GKGbioiP', '/api/v1/leads', 'GET api/v1/leads', '{}', '{}', '{}', '{\"success\":true,\"message\":\"Lead fetched successfully\",\"data\":[]}', '0.01 seconds', '2025-03-31 14:31:48', '2025-03-31 14:31:48'),
('PiSJOQXT6BVrbIFKGHPFvh4', '/api/v1/branches', 'GET api/v1/branches', '{}', '{}', '{}', '{\"success\":true,\"message\":\"Branches fetched successfully\",\"data\":[{\"id\":\"bjHlRDFkaJBOh3kg2EP52VH\",\"branchName\":\"Bangalore\",\"branchAddress\":\"Tech Park One, 4th Floor\\nWhitefield Main Road\\nBangalore, Karnataka - 560066\",\"branchManager\":\"wPHc9cisqOzzpTW0Mpz', '0.01 seconds', '2025-03-31 12:21:45', '2025-03-31 12:21:45'),
('PMnV5BeyqfIcTKN54T4Zjg5', '/api/v1/departments', 'GET api/v1/departments', '{}', '{}', '{}', '{\"success\":true,\"message\":\"Department fetched successfully\",\"data\":[{\"id\":\"0DQCpwzdzU2mZWnGcqM91AC\",\"branch\":\"haQEJiCePwC0KeJsmUWsSZ7\",\"department_name\":\" Sales\",\"client_id\":\"4kykUHcg5oLrhNDkfCLNYYG\",\"created_by\":\"Silverline Systems\",\"updated_by\":null,\"cr', '0.07 seconds', '2025-03-31 12:32:13', '2025-03-31 12:32:13'),
('PmQk826VJsyT9VIG4zgt2U1', '/api/v1/auth/verify-signup', 'POST api/v1/auth/verify-signup', '{}', '{}', '{\"otp\":\"030494\"}', '{\"success\":true,\"message\":\"Registration completed successfully\",\"data\":{\"success\":true,\"token\":\"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IlczTHhOVlFMQ0M3enJoeFR5VGxCbnZ6Iiwicm9sZSI6IlByb2plY3QgTWFuYWdlciIsImlhdCI6MTc0MzQwMDAyNiwiZXhwIjoxNzQzNDg2NDI2fQ', '3.19 seconds', '2025-03-31 11:17:09', '2025-03-31 11:17:09'),
('PnbnTipEDc6cVJQRiSdi9CV', '/api/v1/labels/4kykUHcg5oLrhNDkfCLNYYG', 'GET api/v1/labels/4kykUHcg5oLrhNDkfCLNYYG', '{\"id\":\"4kykUHcg5oLrhNDkfCLNYYG\"}', '{}', '{}', '{\"success\":true,\"message\":\"Tags retrieved successfully\",\"data\":[{\"id\":\"0ga51ZccuIiGGEudOSNNRDJ\",\"related_id\":\"4kykUHcg5oLrhNDkfCLNYYG\",\"lableType\":\"source\",\"name\":\"Phone\",\"color\":\"#34495E\",\"client_id\":\"4kykUHcg5oLrhNDkfCLNYYG\",\"created_by\":\"system\",\"updat', '0.01 seconds', '2025-03-31 14:25:30', '2025-03-31 14:25:30'),
('PpJJsGeMTO4nXaIEPXWpraf', '/api/v1/employees', 'GET api/v1/employees', '{}', '{}', '{}', '{\"success\":true,\"message\":\"Employees fetched successfully\",\"data\":[{\"conversations\":{},\"id\":\"8v2FNBB31ognrYtRiqdgCVu\",\"employeeId\":\"EMP#4\",\"username\":\"neha.singh\",\"password\":\"$2b$12$TwPd6LVLsRlu/sI3bD7iuu0bqeeOYz5gXsjRT4Z4YDOLID3LHjVIG\",\"email\":\"neha.sing', '0.01 seconds', '2025-03-31 12:55:45', '2025-03-31 12:55:45'),
('pv2hywNVWbZEImlZFKWiqpO', '/api/v1/auth', 'GET api/v1/auth', '{}', '{}', '{}', '{\"success\":true,\"message\":\"Users fetched successfully\",\"data\":[{\"conversations\":{},\"id\":\"0aMTORQ27wG00Ht5REhq13p\",\"employeeId\":null,\"username\":\" ba.silverline\",\"password\":\"$2b$12$NT.meyBZRWfJve/VLDgQo.bwhzGz1ElPJcoihKL2lokuJpOAqHk6W\",\"email\":\"ba.silverlin', '0.03 seconds', '2025-03-31 16:47:23', '2025-03-31 16:47:23'),
('pZuZQUJWYd8PDkZPuvd6ekD', '/api/v1/auth', 'GET api/v1/auth', '{}', '{}', '{}', '{\"success\":true,\"message\":\"Users fetched successfully\",\"data\":[{\"conversations\":{},\"id\":\"0aMTORQ27wG00Ht5REhq13p\",\"employeeId\":null,\"username\":\" ba.silverline\",\"password\":\"$2b$12$NT.meyBZRWfJve/VLDgQo.bwhzGz1ElPJcoihKL2lokuJpOAqHk6W\",\"email\":\"ba.silverlin', '0.09 seconds', '2025-03-31 12:19:34', '2025-03-31 12:19:34'),
('pZY4sTNBwVgIJfMbVzULhkE', '/api/v1/currencies?', 'GET api/v1/currencies?', '{}', '{}', '{}', '{\"success\":true,\"message\":\"Currencies fetched successfully\",\"data\":[{\"id\":\"29gCwt8wWQg7CPgG96847iD\",\"currencyName\":\"Euro\",\"currencyIcon\":\"€\",\"currencyCode\":\"EUR\",\"created_by\":null,\"updated_by\":null,\"createdAt\":\"2025-03-31T04:23:06.000Z\",\"updatedAt\":\"2025-', '0.08 seconds', '2025-03-31 16:57:06', '2025-03-31 16:57:06'),
('q8hxkhQNjWqeOQ2mCBJCSIi', '/api/v1/currencies?page=1&limit=100', 'GET api/v1/currencies?page=1&limit=100', '{}', '{\"page\":1,\"limit\":100}', '{}', '{\"success\":true,\"message\":\"Currencies fetched successfully\",\"data\":[{\"id\":\"29gCwt8wWQg7CPgG96847iD\",\"currencyName\":\"Euro\",\"currencyIcon\":\"€\",\"currencyCode\":\"EUR\",\"created_by\":null,\"updated_by\":null,\"createdAt\":\"2025-03-31T04:23:06.000Z\",\"updatedAt\":\"2025-', '0.01 seconds', '2025-03-31 12:59:52', '2025-03-31 12:59:52'),
('q8OG5XjH45fdAJqbHOWsP9h', '/api/v1/clients', 'GET api/v1/clients', '{}', '{}', '{}', '{\"success\":true,\"message\":\"Clients fetched successfully\",\"data\":[{\"conversations\":{},\"id\":\"7aRxfVTXsxd31PyBz9WzEjx\",\"employeeId\":null,\"username\":\"Quantum Enterprises\",\"password\":\"$2b$12$OCduts6PI5L0YSEOVKT73uvS2zlUOaAPNMKWIxOO8tA/YpS1K.TRS\",\"email\":\"quant', '0.01 seconds', '2025-03-31 09:36:06', '2025-03-31 09:36:06'),
('qaAgTLUWjM87VQer05J5eIc', '/api/v1/deals', 'GET api/v1/deals', '{}', '{}', '{}', '{\"success\":true,\"message\":\"Deal fetched successfully\",\"data\":[]}', '0.06 seconds', '2025-03-31 17:03:21', '2025-03-31 17:03:21'),
('qaCNbwVoUSWFk6SyaMD9KN1', '/api/v1/leads', 'GET api/v1/leads', '{}', '{}', '{}', '{\"success\":true,\"message\":\"Lead fetched successfully\",\"data\":[{\"id\":\"31LINvHYSM5u4avuq7Wrjlh\",\"leadTitle\":\"TechPro Solutions Website Modernization\",\"leadStage\":\"BYNYLCidEQll0qKymn79W76\",\"currency\":\"INR\",\"leadValue\":850000,\"company_name\":\" TechPro Solution', '0.12 seconds', '2025-03-31 17:02:27', '2025-03-31 17:02:27'),
('QBy1uoZyH7yXGIZAUcIt1ZD', '/api/v1/leads', 'POST api/v1/leads', '{}', '{}', '{\"leadTitle\":\"TechPro Solutions Website Modernization\",\"interest_level\":\"high\",\"currency\":\"INR\",\"leadValue\":850000,\"source\":\"EJhZVVxxc7GsMQtDgaXqYOB\",\"status\":\"Jq6VB9g3QDsIfBAWgA2U9b4\",\"category\":\"P4aLxD3aeJNqduJwTORAasj\",\"lead_members\":{\"lead_members\":[\"', '{\"success\":true,\"message\":\"Lead created successfully!\",\"data\":{\"id\":\"31LINvHYSM5u4avuq7Wrjlh\",\"files\":null,\"lead_score\":null,\"updated_by\":null,\"leadStage\":\"eTzCUBr5Y232i82lxUoP9vJ\",\"leadTitle\":\"TechPro Solutions Website Modernization\",\"firstName\":\"TechPro', '0.03 seconds', '2025-03-31 14:37:20', '2025-03-31 14:37:20'),
('QDgGZDq6km27YDXn1GL1mun', '/api/v1/stages', 'GET api/v1/stages', '{}', '{}', '{}', '{\"success\":true,\"message\":\"Stages fetched successfully\",\"data\":[{\"id\":\"1j1Mfax4tYdOONQGLA23CeQ\",\"stageType\":\"deal\",\"stageName\":\"Lead Received\",\"pipeline\":\"iiUsXOteVUFiCIMkgR6DObO\",\"client_id\":\"4kykUHcg5oLrhNDkfCLNYYG\",\"created_by\":\"Silverline Systems\",\"up', '0.09 seconds', '2025-03-31 10:49:35', '2025-03-31 10:49:35'),
('QDUVbmmakwk3PyBW6S5fWT9', '/api/v1/proposals?page=1&limit=10', 'GET api/v1/proposals?page=1&limit=10', '{}', '{\"page\":\"1\",\"limit\":\"10\"}', '{}', '{\"success\":true,\"message\":\"Proposal fetched successfully\",\"data\":[{\"id\":\"tfkRAQlpiRhuDXU2mm5BYpV\",\"lead_title\":\"YXfrACvHnsutJstpTU5Tu24\",\"valid_till\":\"2025-03-31T00:00:00.000Z\",\"currency\":\"INR\",\"description\":\"CFCC\",\"items\":\"[{\\\"item\\\":\\\"HealthCare App Dev', '0.04 seconds', '2025-03-31 17:23:28', '2025-03-31 17:23:28'),
('qEPHB5iWteDxtl6bHdxOUEV', '/api/v1/clients', 'POST api/v1/clients', '{}', '{}', '{\"username\":\"Evergreen Industries\",\"email\":\"evergreenindustries@yopmail.com\",\"password\":\"EvergreenIndustries@2525\"}', '{\"success\":true,\"message\":\"OTP sent to email\",\"data\":{\"sessionToken\":\"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6ImUzcVRVMGJFbWxJdll1OHY0akZtanh2IiwidXNlcm5hbWUiOiJFdmVyZ3JlZW4gSW5kdXN0cmllcyIsImVtYWlsIjoiZXZlcmdyZWVuaW5kdXN0cmllc0B5b3BtYWlsLmNvbSIsInJv', '2.78 seconds', '2025-03-31 09:36:06', '2025-03-31 09:36:06'),
('qfbfHips5yxttTsqEEyZmRb', '/api/v1/clients', 'GET api/v1/clients', '{}', '{}', '{}', '{\"success\":true,\"message\":\"Clients fetched successfully\",\"data\":[{\"conversations\":{},\"id\":\"7aRxfVTXsxd31PyBz9WzEjx\",\"employeeId\":null,\"username\":\"Quantum Enterprises\",\"password\":\"$2b$12$OCduts6PI5L0YSEOVKT73uvS2zlUOaAPNMKWIxOO8tA/YpS1K.TRS\",\"email\":\"quant', '0.02 seconds', '2025-03-31 09:35:09', '2025-03-31 09:35:09'),
('qgR9POftC1tcXnZQs2LamYR', '/api/v1/labels/4kykUHcg5oLrhNDkfCLNYYG', 'GET api/v1/labels/4kykUHcg5oLrhNDkfCLNYYG', '{\"id\":\"4kykUHcg5oLrhNDkfCLNYYG\"}', '{}', '{}', '{\"success\":true,\"message\":\"Tags retrieved successfully\",\"data\":[{\"id\":\"0ga51ZccuIiGGEudOSNNRDJ\",\"related_id\":\"4kykUHcg5oLrhNDkfCLNYYG\",\"lableType\":\"source\",\"name\":\"Phone\",\"color\":\"#34495E\",\"client_id\":\"4kykUHcg5oLrhNDkfCLNYYG\",\"created_by\":\"system\",\"updat', '0.12 seconds', '2025-03-31 10:28:44', '2025-03-31 10:28:44'),
('qL4YvRhUUIILBkS6mX8YVYB', '/api/v1/clients', 'POST api/v1/clients', '{}', '{}', '{\"username\":\"Stellar Innovations\",\"email\":\"stellarinnovations@yopmail.com\",\"password\":\"StellarInnovations@2525\"}', '{\"success\":true,\"message\":\"OTP sent to email\",\"data\":{\"sessionToken\":\"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6ImUzcVRVMGJFbWxJdll1OHY0akZtanh2IiwidXNlcm5hbWUiOiJTdGVsbGFyIElubm92YXRpb25zIiwiZW1haWwiOiJzdGVsbGFyaW5ub3ZhdGlvbnNAeW9wbWFpbC5jb20iLCJyb2xl', '2.73 seconds', '2025-03-31 09:33:42', '2025-03-31 09:33:42'),
('QLlHxw9EL44Ks76b47gbduF', '/api/v1/designations', 'GET api/v1/designations', '{}', '{}', '{}', '{\"success\":true,\"message\":\"Designation fetched successfully\",\"data\":[{\"id\":\"UUBCv7KfYd6JRjBUizsgD4o\",\"branch\":\"UH8lBWZZAkctwuRFiCz5PMB\",\"designation_name\":\"Senior Software Engineer\",\"client_id\":\"4kykUHcg5oLrhNDkfCLNYYG\",\"created_by\":\"Silverline Systems\",\"', '0.01 seconds', '2025-03-31 12:22:38', '2025-03-31 12:22:38'),
('Qmlruf2nwUrDubEn4gYVpVA', '/api/v1/subscriptions?page=1&limit=10&search=', 'GET api/v1/subscriptions?page=1&limit=10&search=', '{}', '{}', '{}', '{\"success\":true,\"message\":\"Plans retrieved successfully\",\"data\":[{\"id\":\"uzptLdgqYFRoK23ORcMgQrg\",\"name\":\"Basic Plan\",\"currency\":\"INR\",\"price\":\"999.00\",\"duration\":\"Per Month\",\"trial_period\":\"7\",\"max_users\":\"5\",\"max_clients\":\"10\",\"max_customers\":\"50\",\"max_v', '0.01 seconds', '2025-03-31 10:45:24', '2025-03-31 10:45:24'),
('QNeEA0A83G3lJ0GQe5abeeS', '/api/v1/currencies?', 'GET api/v1/currencies?', '{}', '{}', '{}', '{\"success\":true,\"message\":\"Currencies fetched successfully\",\"data\":[{\"id\":\"29gCwt8wWQg7CPgG96847iD\",\"currencyName\":\"Euro\",\"currencyIcon\":\"€\",\"currencyCode\":\"EUR\",\"created_by\":null,\"updated_by\":null,\"createdAt\":\"2025-03-31T04:23:06.000Z\",\"updatedAt\":\"2025-', '0.03 seconds', '2025-03-31 17:12:25', '2025-03-31 17:12:25'),
('qrRI6VPss1q2w5ypI0Gp125', '/api/v1/stages', 'GET api/v1/stages', '{}', '{}', '{}', '{\"success\":true,\"message\":\"Stages fetched successfully\",\"data\":[{\"id\":\"1j1Mfax4tYdOONQGLA23CeQ\",\"stageType\":\"deal\",\"stageName\":\"Lead Received\",\"pipeline\":\"iiUsXOteVUFiCIMkgR6DObO\",\"client_id\":\"4kykUHcg5oLrhNDkfCLNYYG\",\"created_by\":\"Silverline Systems\",\"up', '0.12 seconds', '2025-03-31 16:57:06', '2025-03-31 16:57:06'),
('QvYpXII7zVNhvdVaoYOeUNi', '/api/v1/leads/31LINvHYSM5u4avuq7Wrjlh', 'GET api/v1/leads/31LINvHYSM5u4avuq7Wrjlh', '{\"id\":\"31LINvHYSM5u4avuq7Wrjlh\"}', '{}', '{}', '{\"success\":true,\"message\":\"Lead fetched successfully\",\"data\":{\"id\":\"31LINvHYSM5u4avuq7Wrjlh\",\"leadTitle\":\"TechPro Solutions Website Modernization\",\"leadStage\":\"eTzCUBr5Y232i82lxUoP9vJ\",\"currency\":\"INR\",\"leadValue\":850000,\"company_name\":\" TechPro Solutions', '0.01 seconds', '2025-03-31 17:48:24', '2025-03-31 17:48:24'),
('R3nat0nOU1oP0anmX2Wy1ic', '/api/v1/taxes', 'GET api/v1/taxes', '{}', '{}', '{}', '{\"success\":true,\"message\":\"Tax fetched successfully\",\"data\":[{\"id\":\"FSq4XX9i6eb0ghsGzTZqkLW\",\"gstName\":\"PPT\",\"gstPercentage\":\"88\",\"client_id\":\"4kykUHcg5oLrhNDkfCLNYYG\",\"created_by\":\"Silverline Systems\",\"updated_by\":null,\"createdAt\":\"2025-03-31T11:52:09.00', '0.01 seconds', '2025-03-31 17:22:09', '2025-03-31 17:22:09'),
('rAo0QqZrQTS3QSOXOxy99a8', '/api/v1/labels/4kykUHcg5oLrhNDkfCLNYYG', 'GET api/v1/labels/4kykUHcg5oLrhNDkfCLNYYG', '{\"id\":\"4kykUHcg5oLrhNDkfCLNYYG\"}', '{}', '{}', '{\"success\":true,\"message\":\"Tags retrieved successfully\",\"data\":[{\"id\":\"0ga51ZccuIiGGEudOSNNRDJ\",\"related_id\":\"4kykUHcg5oLrhNDkfCLNYYG\",\"lableType\":\"source\",\"name\":\"Phone\",\"color\":\"#34495E\",\"client_id\":\"4kykUHcg5oLrhNDkfCLNYYG\",\"created_by\":\"system\",\"updat', '0.10 seconds', '2025-03-31 16:47:23', '2025-03-31 16:47:23'),
('raOJNWcQIIgFKsONB0U0YK5', '/api/v1/clients', 'GET api/v1/clients', '{}', '{}', '{}', '{\"success\":true,\"message\":\"Clients fetched successfully\",\"data\":[{\"conversations\":{},\"id\":\"7aRxfVTXsxd31PyBz9WzEjx\",\"employeeId\":null,\"username\":\"Quantum Enterprises\",\"password\":\"$2b$12$OCduts6PI5L0YSEOVKT73uvS2zlUOaAPNMKWIxOO8tA/YpS1K.TRS\",\"email\":\"quant', '0.01 seconds', '2025-03-31 09:30:56', '2025-03-31 09:30:56'),
('rdBuNxR9gLIvYzEnyigBJBg', '/api/v1/currencies?', 'GET api/v1/currencies?', '{}', '{}', '{}', '{\"success\":true,\"message\":\"Currencies fetched successfully\",\"data\":[{\"id\":\"29gCwt8wWQg7CPgG96847iD\",\"currencyName\":\"Euro\",\"currencyIcon\":\"€\",\"currencyCode\":\"EUR\",\"created_by\":null,\"updated_by\":null,\"createdAt\":\"2025-03-31T04:23:06.000Z\",\"updatedAt\":\"2025-', '0.06 seconds', '2025-03-31 11:01:16', '2025-03-31 11:01:16'),
('rdBYffGlQBVmRPFQ9XmrD2E', '/api/v1/roles', 'GET api/v1/roles', '{}', '{}', '{}', '{\"success\":true,\"message\":\"Roles fetched successfully\",\"data\":[{\"id\":\"vI5ukP3myMKhjXXeHsmq1Rj\",\"role_name\":\"client\",\"permissions\":null,\"client_id\":null,\"created_by\":\"superadmin\",\"updated_by\":null,\"createdAt\":\"2025-03-31T03:57:18.000Z\",\"updatedAt\":\"2025-03', '0.01 seconds', '2025-03-31 10:56:24', '2025-03-31 10:56:24'),
('rEmgvJBQv7SzG7TeDR5rjUa', '/api/v1/currencies?', 'GET api/v1/currencies?', '{}', '{}', '{}', '{\"success\":true,\"message\":\"Currencies fetched successfully\",\"data\":[{\"id\":\"29gCwt8wWQg7CPgG96847iD\",\"currencyName\":\"Euro\",\"currencyIcon\":\"€\",\"currencyCode\":\"EUR\",\"created_by\":null,\"updated_by\":null,\"createdAt\":\"2025-03-31T04:23:06.000Z\",\"updatedAt\":\"2025-', '0.02 seconds', '2025-03-31 17:02:27', '2025-03-31 17:02:27'),
('RGSiYrjHpAGXv3QqmMo7RQ6', '/api/v1/stages', 'GET api/v1/stages', '{}', '{}', '{}', '{\"success\":true,\"message\":\"Stages fetched successfully\",\"data\":[{\"id\":\"1j1Mfax4tYdOONQGLA23CeQ\",\"stageType\":\"deal\",\"stageName\":\"Lead Received\",\"pipeline\":\"iiUsXOteVUFiCIMkgR6DObO\",\"client_id\":\"4kykUHcg5oLrhNDkfCLNYYG\",\"created_by\":\"Silverline Systems\",\"up', '0.02 seconds', '2025-03-31 16:57:26', '2025-03-31 16:57:26'),
('RitlWi9huDbHHMeGY76xu16', '/api/v1/auth/verify-signup', 'POST api/v1/auth/verify-signup', '{}', '{}', '{\"otp\":\"772299\"}', '{\"success\":true,\"message\":\"Registration completed successfully\",\"data\":{\"success\":true,\"token\":\"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6InVCQmNQWVVwS2JoNWg3eGxqM09Jd3JFIiwicm9sZSI6InN1Yi1jbGllbnQiLCJpYXQiOjE3NDM0MDIzNzMsImV4cCI6MTc0MzQ4ODc3M30.IMZxAe', '3.31 seconds', '2025-03-31 11:56:16', '2025-03-31 11:56:16'),
('Rjz6RZqs4gOM49lJgjcwr7S', '/api/v1/currencies?limit=100', 'GET api/v1/currencies?limit=100', '{}', '{\"limit\":100}', '{}', '{\"success\":true,\"message\":\"Currencies fetched successfully\",\"data\":[{\"id\":\"29gCwt8wWQg7CPgG96847iD\",\"currencyName\":\"Euro\",\"currencyIcon\":\"€\",\"currencyCode\":\"EUR\",\"created_by\":null,\"updated_by\":null,\"createdAt\":\"2025-03-31T04:23:06.000Z\",\"updatedAt\":\"2025-', '0.10 seconds', '2025-03-31 17:21:17', '2025-03-31 17:21:17'),
('rkNKZv8DfN6ZQEjsE6DHfhF', '/api/v1/designations', 'GET api/v1/designations', '{}', '{}', '{}', '{\"success\":true,\"message\":\"Designation fetched successfully\",\"data\":[{\"id\":\"UUBCv7KfYd6JRjBUizsgD4o\",\"branch\":\"UH8lBWZZAkctwuRFiCz5PMB\",\"designation_name\":\"Senior Software Engineer\",\"client_id\":\"4kykUHcg5oLrhNDkfCLNYYG\",\"created_by\":\"Silverline Systems\",\"', '0.01 seconds', '2025-03-31 12:12:50', '2025-03-31 12:12:50'),
('rKqnQqE2N0NYXBt4bdWpHG1', '/api/v1/employees', 'GET api/v1/employees', '{}', '{}', '{}', '{\"success\":true,\"message\":\"Employees fetched successfully\",\"data\":[{\"conversations\":{},\"id\":\"8v2FNBB31ognrYtRiqdgCVu\",\"employeeId\":\"EMP#4\",\"username\":\"neha.singh\",\"password\":\"$2b$12$TwPd6LVLsRlu/sI3bD7iuu0bqeeOYz5gXsjRT4Z4YDOLID3LHjVIG\",\"email\":\"neha.sing', '0.01 seconds', '2025-03-31 12:55:25', '2025-03-31 12:55:25'),
('RmAFoCh2puf0KUjQpIWRHBs', '/api/v1/employees', 'GET api/v1/employees', '{}', '{}', '{}', '{\"success\":true,\"message\":\"Employees fetched successfully\",\"data\":[{\"conversations\":{},\"id\":\"RDyEgAxQ5cdETq1XejlCWxe\",\"employeeId\":\"EMP#2\",\"username\":\"priya.patel\",\"password\":\"$2b$12$jpkKDi16nF/hELIGR1p5UeiUMrLo1R5pzTxjiWFR40gJrOH480PSC\",\"email\":\"priya.pa', '0.01 seconds', '2025-03-31 12:48:21', '2025-03-31 12:48:21'),
('RMyqFv7PcXccvJTgIzdWMa2', '/api/v1/employees', 'GET api/v1/employees', '{}', '{}', '{}', '{\"success\":true,\"message\":\"Employees fetched successfully\",\"data\":[{\"conversations\":{},\"id\":\"8v2FNBB31ognrYtRiqdgCVu\",\"employeeId\":\"EMP#4\",\"username\":\"neha.singh\",\"password\":\"$2b$12$TwPd6LVLsRlu/sI3bD7iuu0bqeeOYz5gXsjRT4Z4YDOLID3LHjVIG\",\"email\":\"neha.sing', '0.04 seconds', '2025-03-31 14:30:48', '2025-03-31 14:30:48'),
('RP0nbQGrOCTEhX5lwwzjU9p', '/api/v1/pipelines', 'GET api/v1/pipelines', '{}', '{}', '{}', '{\"success\":true,\"message\":\"Pipelines fetched successfully\",\"data\":[{\"id\":\"iiUsXOteVUFiCIMkgR6DObO\",\"pipeline_name\":\"Marketing\",\"client_id\":\"4kykUHcg5oLrhNDkfCLNYYG\",\"created_by\":\"Silverline Systems\",\"updated_by\":null,\"createdAt\":\"2025-03-31T05:00:29.000Z\"', '0.06 seconds', '2025-03-31 17:23:43', '2025-03-31 17:23:43'),
('rqjvWt5aDUOpec3tKFOrE0j', '/api/v1/roles', 'GET api/v1/roles', '{}', '{}', '{}', '{\"success\":true,\"message\":\"Roles fetched successfully\",\"data\":[{\"id\":\"03qarcBedPhsVY3A1IKMMyW\",\"role_name\":\"System Administrator\",\"permissions\":\"{\\\"dashboards-project-list\\\":[{\\\"key\\\":\\\"dashboards-project-list\\\",\\\"permissions\\\":[\\\"view\\\",\\\"create\\\",\\\"upda', '0.01 seconds', '2025-03-31 17:48:08', '2025-03-31 17:48:08'),
('Rsz2UE4YXr3LmQ7f1Rcp5Az', '/api/v1/roles', 'POST api/v1/roles', '{}', '{}', '{\"role_name\":\"System Administrator\",\"permissions\":{\"dashboards-project-list\":[{\"key\":\"dashboards-project-list\",\"permissions\":[\"view\",\"create\",\"update\",\"delete\"]}],\"dashboards-sales\":[{\"key\":\"dashboards-sales\",\"permissions\":[\"view\",\"create\",\"update\",\"delet', '{\"success\":true,\"message\":\"Role created successfully\",\"data\":{\"id\":\"03qarcBedPhsVY3A1IKMMyW\",\"updated_by\":null,\"role_name\":\"System Administrator\",\"permissions\":{\"dashboards-project-list\":[{\"key\":\"dashboards-project-list\",\"permissions\":[\"view\",\"create\",\"up', '0.01 seconds', '2025-03-31 10:58:53', '2025-03-31 10:58:53'),
('rT3lrTCsHktHVeX5GzGz5qj', '/api/v1/leads', 'GET api/v1/leads', '{}', '{}', '{}', '{\"success\":true,\"message\":\"Lead fetched successfully\",\"data\":[{\"id\":\"31LINvHYSM5u4avuq7Wrjlh\",\"leadTitle\":\"TechPro Solutions Website Modernization\",\"leadStage\":\"eTzCUBr5Y232i82lxUoP9vJ\",\"currency\":\"INR\",\"leadValue\":850000,\"company_name\":\" TechPro Solution', '0.23 seconds', '2025-03-31 17:23:44', '2025-03-31 17:23:44'),
('rtHyC010B9ncaN0K1AOztRz', '/api/v1/currencies?', 'GET api/v1/currencies?', '{}', '{}', '{}', '{\"success\":true,\"message\":\"Currencies fetched successfully\",\"data\":[{\"id\":\"29gCwt8wWQg7CPgG96847iD\",\"currencyName\":\"Euro\",\"currencyIcon\":\"€\",\"currencyCode\":\"EUR\",\"created_by\":null,\"updated_by\":null,\"createdAt\":\"2025-03-31T04:23:06.000Z\",\"updatedAt\":\"2025-', '0.03 seconds', '2025-03-31 16:47:23', '2025-03-31 16:47:23'),
('RXscDMKWXIkuMmjCXMJRWBD', '/api/v1/labels/4kykUHcg5oLrhNDkfCLNYYG', 'GET api/v1/labels/4kykUHcg5oLrhNDkfCLNYYG', '{\"id\":\"4kykUHcg5oLrhNDkfCLNYYG\"}', '{}', '{}', '{\"success\":true,\"message\":\"Tags retrieved successfully\",\"data\":[{\"id\":\"0ga51ZccuIiGGEudOSNNRDJ\",\"related_id\":\"4kykUHcg5oLrhNDkfCLNYYG\",\"lableType\":\"source\",\"name\":\"Phone\",\"color\":\"#34495E\",\"client_id\":\"4kykUHcg5oLrhNDkfCLNYYG\",\"created_by\":\"system\",\"updat', '0.03 seconds', '2025-03-31 17:48:23', '2025-03-31 17:48:23'),
('RyaWMGz0j0bpgHpelVRyASi', '/api/v1/roles', 'GET api/v1/roles', '{}', '{}', '{}', '{\"success\":true,\"message\":\"Roles fetched successfully\",\"data\":[{\"id\":\"03qarcBedPhsVY3A1IKMMyW\",\"role_name\":\"System Administrator\",\"permissions\":\"{\\\"dashboards-project-list\\\":[{\\\"key\\\":\\\"dashboards-project-list\\\",\\\"permissions\\\":[\\\"view\\\",\\\"create\\\",\\\"upda', '0.08 seconds', '2025-03-31 14:25:30', '2025-03-31 14:25:30'),
('RyeqWt7ZKB8Gvwut7gOCEEF', '/api/v1/auth/verify-signup', 'POST api/v1/auth/verify-signup', '{}', '{}', '{\"otp\":\"416751\"}', '{\"success\":true,\"message\":\"Registration completed successfully\",\"data\":{\"success\":true,\"token\":\"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6Ik0za29mVFJKRHY0Y20yNVNaZXRYZ3JvIiwicm9sZSI6ImNsaWVudCIsImlhdCI6MTc0MzM5NDQwMiwiZXhwIjoxNzQzNDgwODAyfQ.kgemEs8s0E9', '2.67 seconds', '2025-03-31 09:43:25', '2025-03-31 09:43:25');
INSERT INTO `audittrails` (`id`, `url`, `activity`, `params`, `query`, `payload`, `response`, `duration`, `createdAt`, `updatedAt`) VALUES
('ryv8l7LMAqdM2kxDRbI2QUC', '/api/v1/auth', 'GET api/v1/auth', '{}', '{}', '{}', '{\"success\":true,\"message\":\"Users fetched successfully\",\"data\":[{\"conversations\":{},\"id\":\"0aMTORQ27wG00Ht5REhq13p\",\"employeeId\":null,\"username\":\" ba.silverline\",\"password\":\"$2b$12$NT.meyBZRWfJve/VLDgQo.bwhzGz1ElPJcoihKL2lokuJpOAqHk6W\",\"email\":\"ba.silverlin', '0.03 seconds', '2025-03-31 17:15:30', '2025-03-31 17:15:30'),
('RzpxmD2SteH4pcv1C5TZIII', '/api/v1/labels/4kykUHcg5oLrhNDkfCLNYYG', 'GET api/v1/labels/4kykUHcg5oLrhNDkfCLNYYG', '{\"id\":\"4kykUHcg5oLrhNDkfCLNYYG\"}', '{}', '{}', '{\"success\":true,\"message\":\"Tags retrieved successfully\",\"data\":[{\"id\":\"0ga51ZccuIiGGEudOSNNRDJ\",\"related_id\":\"4kykUHcg5oLrhNDkfCLNYYG\",\"lableType\":\"source\",\"name\":\"Phone\",\"color\":\"#34495E\",\"client_id\":\"4kykUHcg5oLrhNDkfCLNYYG\",\"created_by\":\"system\",\"updat', '0.01 seconds', '2025-03-31 10:31:11', '2025-03-31 10:31:11'),
('s0tW4XIxXlxVorZWw34QI4U', '/api/v1/countries?', 'GET api/v1/countries?', '{}', '{}', '{}', '{\"success\":true,\"message\":\"Countries fetched successfully\",\"data\":[{\"id\":\"0YNW00eJIaSTu6T8IZXJZ2W\",\"countryName\":\"Kuwait\",\"countryCode\":\"KW\",\"phoneCode\":\"+965\",\"created_by\":null,\"updated_by\":null,\"createdAt\":\"2025-03-31T03:52:28.000Z\",\"updatedAt\":\"2025-03', '0.05 seconds', '2025-03-31 11:10:04', '2025-03-31 11:10:04'),
('SatV7ouXDQtBoxWAnxxEkMp', '/api/v1/currencies?page=1&limit=100', 'GET api/v1/currencies?page=1&limit=100', '{}', '{\"page\":1,\"limit\":100}', '{}', '{\"success\":true,\"message\":\"Currencies fetched successfully\",\"data\":[{\"id\":\"29gCwt8wWQg7CPgG96847iD\",\"currencyName\":\"Euro\",\"currencyIcon\":\"€\",\"currencyCode\":\"EUR\",\"created_by\":null,\"updated_by\":null,\"createdAt\":\"2025-03-31T04:23:06.000Z\",\"updatedAt\":\"2025-', '0.02 seconds', '2025-03-31 10:50:09', '2025-03-31 10:50:09'),
('sCFRLMXPRGFDnYdxGLLbHxN', '/api/v1/departments', 'POST api/v1/departments', '{}', '{}', '{\"department_name\":\"Finance\",\"branch\":\"UH8lBWZZAkctwuRFiCz5PMB\"}', '{\"success\":true,\"message\":\"Department created successfully\",\"data\":{\"id\":\"SBBmsTisLcE4qEOzLvlYZv2\",\"updated_by\":null,\"branch\":\"UH8lBWZZAkctwuRFiCz5PMB\",\"department_name\":\"Finance\",\"client_id\":\"4kykUHcg5oLrhNDkfCLNYYG\",\"created_by\":\"Silverline Systems\",\"up', '0.01 seconds', '2025-03-31 12:23:15', '2025-03-31 12:23:15'),
('sH6QnelEm1CJlR2XNlAEAF4', '/api/v1/auth', 'GET api/v1/auth', '{}', '{}', '{}', '{\"success\":true,\"message\":\"Users fetched successfully\",\"data\":[{\"conversations\":{},\"id\":\"0aMTORQ27wG00Ht5REhq13p\",\"employeeId\":null,\"username\":\" ba.silverline\",\"password\":\"$2b$12$NT.meyBZRWfJve/VLDgQo.bwhzGz1ElPJcoihKL2lokuJpOAqHk6W\",\"email\":\"ba.silverlin', '0.19 seconds', '2025-03-31 12:59:52', '2025-03-31 12:59:52'),
('SJ9bDQGhDfZJHXIjQfIFiP7', '/api/v1/deals/dmciOE2OiF952YsPFd0NPQi', 'PUT api/v1/deals/dmciOE2OiF952YsPFd0NPQi', '{\"id\":\"dmciOE2OiF952YsPFd0NPQi\"}', '{}', '{\"stage\":\"TzwcX4i23otRdEITIioMMoR\"}', '{\"success\":true,\"message\":\"Deal updated successfully\",\"data\":{\"id\":\"dmciOE2OiF952YsPFd0NPQi\",\"leadTitle\":null,\"firstName\":null,\"lastName\":null,\"email\":null,\"phone\":null,\"dealName\":\"Cloud ERP Implementation\",\"pipeline\":\"iiUsXOteVUFiCIMkgR6DObO\",\"stage\":\"Tz', '0.05 seconds', '2025-03-31 17:46:17', '2025-03-31 17:46:17'),
('sKreC61w029NwUOFu2f6wsB', '/api/v1/sub-clients', 'POST api/v1/sub-clients', '{}', '{}', '{\"username\":\"DigiSmart Enterprises\",\"email\":\"digiSmart.enterprises@yopmail.com\",\"password\":\"DigiSmartEnterprises@2525\"}', '{\"success\":true,\"message\":\"Please verify your email to complete registration\",\"data\":{\"sessionToken\":\"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjRreWtVSGNnNW9McmhORGtmQ0xOWVlHIiwidXNlcm5hbWUiOiJEaWdpU21hcnQgRW50ZXJwcmlzZXMiLCJlbWFpbCI6ImRpZ2lTbWFydC5l', '3.24 seconds', '2025-03-31 11:57:08', '2025-03-31 11:57:08'),
('SlAFX3TcNak9VbeaVgcZvfd', '/api/v1/sub-clients', 'POST api/v1/sub-clients', '{}', '{}', '{\"username\":\"Quantum Innovations\",\"email\":\"quantum.innovations@yopmail.com\",\"password\":\"QuantumInnovations@2525\"}', '{\"success\":true,\"message\":\"Please verify your email to complete registration\",\"data\":{\"sessionToken\":\"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjRreWtVSGNnNW9McmhORGtmQ0xOWVlHIiwidXNlcm5hbWUiOiJRdWFudHVtIElubm92YXRpb25zIiwiZW1haWwiOiJxdWFudHVtLmlubm92', '3.74 seconds', '2025-03-31 11:53:22', '2025-03-31 11:53:22'),
('SMtLUafuxxPmGvNENtwJtHF', '/api/v1/clients', 'GET api/v1/clients', '{}', '{}', '{}', '{\"success\":true,\"message\":\"Clients fetched successfully\",\"data\":[{\"conversations\":{},\"id\":\"7aRxfVTXsxd31PyBz9WzEjx\",\"employeeId\":null,\"username\":\"Quantum Enterprises\",\"password\":\"$2b$12$OCduts6PI5L0YSEOVKT73uvS2zlUOaAPNMKWIxOO8tA/YpS1K.TRS\",\"email\":\"quant', '0.02 seconds', '2025-03-31 09:34:02', '2025-03-31 09:34:02'),
('SNCzdM7wX2UwGja1UzuRUFE', '/api/v1/leads', 'GET api/v1/leads', '{}', '{}', '{}', '{\"success\":true,\"message\":\"Lead fetched successfully\",\"data\":[{\"id\":\"31LINvHYSM5u4avuq7Wrjlh\",\"leadTitle\":\"TechPro Solutions Website Modernization\",\"leadStage\":\"BYNYLCidEQll0qKymn79W76\",\"currency\":\"INR\",\"leadValue\":850000,\"company_name\":\" TechPro Solution', '0.04 seconds', '2025-03-31 17:12:25', '2025-03-31 17:12:25'),
('sNinAujy7vN7DjI967Vk2HL', '/api/v1/countries?', 'GET api/v1/countries?', '{}', '{}', '{}', '{\"success\":true,\"message\":\"Countries fetched successfully\",\"data\":[{\"id\":\"0YNW00eJIaSTu6T8IZXJZ2W\",\"countryName\":\"Kuwait\",\"countryCode\":\"KW\",\"phoneCode\":\"+965\",\"created_by\":null,\"updated_by\":null,\"createdAt\":\"2025-03-31T03:52:28.000Z\",\"updatedAt\":\"2025-03', '0.04 seconds', '2025-03-31 16:00:54', '2025-03-31 16:00:54'),
('sO2TOklvHY9my2sVN8AAiAT', '/api/v1/subscriptions?page=1&limit=10&search=', 'GET api/v1/subscriptions?page=1&limit=10&search=', '{}', '{}', '{}', '{\"success\":true,\"message\":\"Plans retrieved successfully\",\"data\":[{\"id\":\"uzptLdgqYFRoK23ORcMgQrg\",\"name\":\"Basic Plan\",\"currency\":\"INR\",\"price\":\"999.00\",\"duration\":\"Per Month\",\"trial_period\":\"7\",\"max_users\":\"5\",\"max_clients\":\"10\",\"max_customers\":\"50\",\"max_v', '0.01 seconds', '2025-03-31 10:47:33', '2025-03-31 10:47:33'),
('sqGHirzqyM2avENjKJoy5kK', '/api/v1/auth/verify-signup', 'POST api/v1/auth/verify-signup', '{}', '{}', '{\"otp\":\"724345\"}', '{\"success\":true,\"message\":\"Registration completed successfully\",\"data\":{\"success\":true,\"token\":\"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjRreWtVSGNnNW9McmhORGtmQ0xOWVlHIiwicm9sZSI6ImNsaWVudCIsImlhdCI6MTc0MzM5NDI4MiwiZXhwIjoxNzQzNDgwNjgyfQ.QScM3OQ3UJM', '3.45 seconds', '2025-03-31 09:41:26', '2025-03-31 09:41:26'),
('SqMEbDwTpx6n6eInhbVjr8j', '/api/v1/countries?', 'GET api/v1/countries?', '{}', '{}', '{}', '{\"success\":true,\"message\":\"Countries fetched successfully\",\"data\":[{\"id\":\"0YNW00eJIaSTu6T8IZXJZ2W\",\"countryName\":\"Kuwait\",\"countryCode\":\"KW\",\"phoneCode\":\"+965\",\"created_by\":null,\"updated_by\":null,\"createdAt\":\"2025-03-31T03:52:28.000Z\",\"updatedAt\":\"2025-03', '0.10 seconds', '2025-03-31 17:02:27', '2025-03-31 17:02:27'),
('SrhAdcUqX9emdpFvXnZUL8O', '/api/v1/stages', 'GET api/v1/stages', '{}', '{}', '{}', '{\"success\":true,\"message\":\"Stages fetched successfully\",\"data\":[{\"id\":\"1j1Mfax4tYdOONQGLA23CeQ\",\"stageType\":\"deal\",\"stageName\":\"Lead Received\",\"pipeline\":\"iiUsXOteVUFiCIMkgR6DObO\",\"client_id\":\"4kykUHcg5oLrhNDkfCLNYYG\",\"created_by\":\"Silverline Systems\",\"up', '0.01 seconds', '2025-03-31 17:23:43', '2025-03-31 17:23:43'),
('srhINewYpcyWlF3tsR83BGf', '/api/v1/leads', 'GET api/v1/leads', '{}', '{}', '{}', '{\"success\":true,\"message\":\"Lead fetched successfully\",\"data\":[]}', '0.04 seconds', '2025-03-31 10:49:35', '2025-03-31 10:49:35'),
('SsueXMIW1XjDjMccggv5s4Y', '/api/v1/labels/4kykUHcg5oLrhNDkfCLNYYG', 'GET api/v1/labels/4kykUHcg5oLrhNDkfCLNYYG', '{\"id\":\"4kykUHcg5oLrhNDkfCLNYYG\"}', '{}', '{}', '{\"success\":true,\"message\":\"Tags retrieved successfully\",\"data\":[{\"id\":\"0ga51ZccuIiGGEudOSNNRDJ\",\"related_id\":\"4kykUHcg5oLrhNDkfCLNYYG\",\"lableType\":\"source\",\"name\":\"Phone\",\"color\":\"#34495E\",\"client_id\":\"4kykUHcg5oLrhNDkfCLNYYG\",\"created_by\":\"system\",\"updat', '0.01 seconds', '2025-03-31 16:57:06', '2025-03-31 16:57:06'),
('strhKXOFAwMPDi7BrVq2kYq', '/api/v1/auth/verify-signup', 'POST api/v1/auth/verify-signup', '{}', '{}', '{\"otp\":\"419692\"}', '{\"success\":true,\"message\":\"Registration completed successfully\",\"data\":{\"success\":true,\"token\":\"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6Ijh2MkZOQkIzMW9nbnJZdFJpcWRnQ1Z1Iiwicm9sZSI6ImVtcGxveWVlIiwiaWF0IjoxNzQzNDA1Nzk3LCJleHAiOjE3NDM0OTIxOTd9.Pt_57Uj6w', '2.36 seconds', '2025-03-31 12:53:20', '2025-03-31 12:53:20'),
('SUYORFy17cAX54Ph8lDLZ6E', '/api/v1/roles', 'GET api/v1/roles', '{}', '{}', '{}', '{\"success\":true,\"message\":\"Roles fetched successfully\",\"data\":[{\"id\":\"03qarcBedPhsVY3A1IKMMyW\",\"role_name\":\"System Administrator\",\"permissions\":\"{\\\"dashboards-project-list\\\":[{\\\"key\\\":\\\"dashboards-project-list\\\",\\\"permissions\\\":[\\\"view\\\",\\\"create\\\",\\\"upda', '0.05 seconds', '2025-03-31 14:31:48', '2025-03-31 14:31:48'),
('Sv1GqQ2bm8NKu2SfTYNWSW5', '/api/v1/leads/31LINvHYSM5u4avuq7Wrjlh', 'PUT api/v1/leads/31LINvHYSM5u4avuq7Wrjlh', '{\"id\":\"31LINvHYSM5u4avuq7Wrjlh\"}', '{}', '{\"leadStage\":\"icIkzFa9jKpV26cO64IJS7f\"}', '{\"success\":true,\"message\":\"Lead updated successfully!\",\"data\":{\"id\":\"31LINvHYSM5u4avuq7Wrjlh\",\"leadTitle\":\"TechPro Solutions Website Modernization\",\"leadStage\":\"icIkzFa9jKpV26cO64IJS7f\",\"currency\":\"INR\",\"leadValue\":850000,\"company_name\":\" TechPro Solution', '0.01 seconds', '2025-03-31 17:12:33', '2025-03-31 17:12:33'),
('Svcx8C1XA00s7qwFIoOQ2Df', '/api/v1/currencies?page=1&limit=100', 'GET api/v1/currencies?page=1&limit=100', '{}', '{\"page\":1,\"limit\":100}', '{}', '{\"success\":true,\"message\":\"Currencies fetched successfully\",\"data\":[{\"id\":\"29gCwt8wWQg7CPgG96847iD\",\"currencyName\":\"Euro\",\"currencyIcon\":\"€\",\"currencyCode\":\"EUR\",\"created_by\":null,\"updated_by\":null,\"createdAt\":\"2025-03-31T04:23:06.000Z\",\"updatedAt\":\"2025-', '0.01 seconds', '2025-03-31 10:23:13', '2025-03-31 10:23:13'),
('SwLhA2J1D8cjQ52Jm71dGIK', '/api/v1/clients', 'GET api/v1/clients', '{}', '{}', '{}', '{\"success\":true,\"message\":\"Clients fetched successfully\",\"data\":[{\"conversations\":{},\"id\":\"7aRxfVTXsxd31PyBz9WzEjx\",\"employeeId\":null,\"username\":\"Quantum Enterprises\",\"password\":\"$2b$12$OCduts6PI5L0YSEOVKT73uvS2zlUOaAPNMKWIxOO8tA/YpS1K.TRS\",\"email\":\"quant', '0.01 seconds', '2025-03-31 09:39:41', '2025-03-31 09:39:41'),
('syCt6sdTYJ8l8NnrsVSkNZS', '/api/v1/subscriptions?page=1&limit=10&search=', 'GET api/v1/subscriptions?page=1&limit=10&search=', '{}', '{}', '{}', '{\"success\":true,\"message\":\"Plans retrieved successfully\",\"data\":[{\"id\":\"uzptLdgqYFRoK23ORcMgQrg\",\"name\":\"Basic Plan\",\"currency\":\"INR\",\"price\":\"999.00\",\"duration\":\"Per Month\",\"trial_period\":\"7\",\"max_users\":\"5\",\"max_clients\":\"10\",\"max_customers\":\"50\",\"max_v', '0.03 seconds', '2025-03-31 10:14:31', '2025-03-31 10:14:31'),
('Sz9OqJAc4YTBzSZIB4GvKV0', '/api/v1/subscriptions?page=1&limit=100&search=', 'GET api/v1/subscriptions?page=1&limit=100&search=', '{}', '{}', '{}', '{\"success\":true,\"message\":\"Plans retrieved successfully\",\"data\":[]}', '0.04 seconds', '2025-03-31 09:46:32', '2025-03-31 09:46:32'),
('T1mQh0ss2IWky2j7GeBRkES', '/api/v1/subscriptions?page=1&limit=100&search=', 'GET api/v1/subscriptions?page=1&limit=100&search=', '{}', '{}', '{}', '{\"success\":true,\"message\":\"Plans retrieved successfully\",\"data\":[]}', '0.06 seconds', '2025-03-31 10:08:19', '2025-03-31 10:08:19'),
('t1qJSZvzLdQdOpamY8BEpo5', '/api/v1/auth', 'GET api/v1/auth', '{}', '{}', '{}', '{\"success\":true,\"message\":\"Users fetched successfully\",\"data\":[{\"conversations\":{},\"id\":\"4kykUHcg5oLrhNDkfCLNYYG\",\"employeeId\":null,\"username\":\"Silverline Systems\",\"password\":\"$2b$12$.2Ia/XUZHrA7BEsLyf6uGuo9wgP9rGamovaR/ICL6YHHBDXVI5nIy\",\"email\":\"silverli', '0.04 seconds', '2025-03-31 11:24:13', '2025-03-31 11:24:13'),
('T4E4pVNL5F7IWJQbWFcsKf9', '/api/v1/products', 'GET api/v1/products', '{}', '{}', '{}', '{\"success\":true,\"message\":\"Product fetched successfully\",\"data\":[]}', '0.02 seconds', '2025-03-31 17:15:46', '2025-03-31 17:15:46'),
('T9f2eZ9f8P1oYXX427dBATu', '/api/v1/auth', 'GET api/v1/auth', '{}', '{}', '{}', '{\"success\":true,\"message\":\"Users fetched successfully\",\"data\":[{\"conversations\":{},\"id\":\"4kykUHcg5oLrhNDkfCLNYYG\",\"employeeId\":null,\"username\":\"Silverline Systems\",\"password\":\"$2b$12$.2Ia/XUZHrA7BEsLyf6uGuo9wgP9rGamovaR/ICL6YHHBDXVI5nIy\",\"email\":\"silverli', '0.01 seconds', '2025-03-31 11:18:50', '2025-03-31 11:18:50'),
('Tb8SpUWCzWi6dUSdLsNmguD', '/api/v1/auth/login', 'POST api/v1/auth/login', '{}', '{}', '{\"login\":\"Horizon Ventures\",\"password\":\"HorizonVentures@2525\"}', '{\"success\":false,\"message\":\"No active subscription found\"}', '0.01 seconds', '2025-03-31 09:45:13', '2025-03-31 09:45:13'),
('tC8Ka5ORWBQVoe8mVL2L79I', '/api/v1/branches', 'POST api/v1/branches', '{}', '{}', '{\"branchName\":\"Pune\",\"branchManager\":\"rk7q1WH2njPnIORx6OzH49x\",\"branchAddress\":\"IT Park Plaza, Wing A\\nHinjewadi Phase III\\nPune, Maharashtra - 411057\"}', '{\"success\":true,\"message\":\"Branch created successfully\",\"data\":{\"id\":\"S99Ug8QEauke2Me7XhF29of\",\"updated_by\":null,\"branchName\":\"Pune\",\"branchAddress\":\"IT Park Plaza, Wing A\\nHinjewadi Phase III\\nPune, Maharashtra - 411057\",\"branchManager\":\"rk7q1WH2njPnIORx', '0.01 seconds', '2025-03-31 12:21:16', '2025-03-31 12:21:16'),
('TcQXkrrhyxup7Vt0d4Q1Htj', '/api/v1/labels/4kykUHcg5oLrhNDkfCLNYYG', 'GET api/v1/labels/4kykUHcg5oLrhNDkfCLNYYG', '{\"id\":\"4kykUHcg5oLrhNDkfCLNYYG\"}', '{}', '{}', '{\"success\":true,\"message\":\"Tags retrieved successfully\",\"data\":[{\"id\":\"0ga51ZccuIiGGEudOSNNRDJ\",\"related_id\":\"4kykUHcg5oLrhNDkfCLNYYG\",\"lableType\":\"source\",\"name\":\"Phone\",\"color\":\"#34495E\",\"client_id\":\"4kykUHcg5oLrhNDkfCLNYYG\",\"created_by\":\"system\",\"updat', '0.02 seconds', '2025-03-31 11:10:04', '2025-03-31 11:10:04'),
('td1On4sS45qwIeo0dgl1XkK', '/api/v1/leads', 'GET api/v1/leads', '{}', '{}', '{}', '{\"success\":true,\"message\":\"Lead fetched successfully\",\"data\":[{\"id\":\"31LINvHYSM5u4avuq7Wrjlh\",\"leadTitle\":\"TechPro Solutions Website Modernization\",\"leadStage\":\"BYNYLCidEQll0qKymn79W76\",\"currency\":\"INR\",\"leadValue\":850000,\"company_name\":\" TechPro Solution', '0.09 seconds', '2025-03-31 16:57:06', '2025-03-31 16:57:06'),
('TdfhGv51qmFw9YYnhc31CNF', '/api/v1/designations', 'GET api/v1/designations', '{}', '{}', '{}', '{\"success\":true,\"message\":\"Designation fetched successfully\",\"data\":[{\"id\":\"flbhBdf5hBLZTNbwhc12BY7\",\"branch\":\"UH8lBWZZAkctwuRFiCz5PMB\",\"designation_name\":\"HR Manager\",\"client_id\":\"4kykUHcg5oLrhNDkfCLNYYG\",\"created_by\":\"Silverline Systems\",\"updated_by\":nu', '0.01 seconds', '2025-03-31 12:27:32', '2025-03-31 12:27:32'),
('TdfSlXOA3185yDeJ8JSmNJh', '/api/v1/countries?', 'GET api/v1/countries?', '{}', '{}', '{}', '{\"success\":true,\"message\":\"Countries fetched successfully\",\"data\":[{\"id\":\"0YNW00eJIaSTu6T8IZXJZ2W\",\"countryName\":\"Kuwait\",\"countryCode\":\"KW\",\"phoneCode\":\"+965\",\"created_by\":null,\"updated_by\":null,\"createdAt\":\"2025-03-31T03:52:28.000Z\",\"updatedAt\":\"2025-03', '0.05 seconds', '2025-03-31 15:54:49', '2025-03-31 15:54:49'),
('tdrn8cZZD6qaKcnAJpZ2Rb7', '/api/v1/branches', 'GET api/v1/branches', '{}', '{}', '{}', '{\"success\":true,\"message\":\"Branches fetched successfully\",\"data\":[{\"id\":\"UH8lBWZZAkctwuRFiCz5PMB\",\"branchName\":\"Mumbai\",\"branchAddress\":\"Silverline Tower, Plot No. 15\\nSector 30, Vashi\\nNavi Mumbai, Maharashtra - 400705\",\"branchManager\":\"wPHc9cisqOzzpTW0M', '0.01 seconds', '2025-03-31 12:18:20', '2025-03-31 12:18:20'),
('tg8roovMrFXnbqIyYo5eKLS', '/api/v1/leads/31LINvHYSM5u4avuq7Wrjlh', 'GET api/v1/leads/31LINvHYSM5u4avuq7Wrjlh', '{\"id\":\"31LINvHYSM5u4avuq7Wrjlh\"}', '{}', '{}', '{\"success\":true,\"message\":\"Lead fetched successfully\",\"data\":{\"id\":\"31LINvHYSM5u4avuq7Wrjlh\",\"leadTitle\":\"TechPro Solutions Website Modernization\",\"leadStage\":\"BYNYLCidEQll0qKymn79W76\",\"currency\":\"INR\",\"leadValue\":850000,\"company_name\":\" TechPro Solutions', '0.01 seconds', '2025-03-31 16:57:26', '2025-03-31 16:57:26'),
('tgpMKNF7isfT6DXCWBGPzgE', '/api/v1/proposals?page=1&limit=10', 'GET api/v1/proposals?page=1&limit=10', '{}', '{\"page\":\"1\",\"limit\":\"10\"}', '{}', '{\"success\":true,\"message\":\"Proposal fetched successfully\",\"data\":[]}', '0.05 seconds', '2025-03-31 17:14:58', '2025-03-31 17:14:58'),
('Thn4oeeZbmp6ZLpFdnsR143', '/api/v1/taxes', 'GET api/v1/taxes', '{}', '{}', '{}', '{\"success\":true,\"message\":\"Tax fetched successfully\",\"data\":[]}', '0.04 seconds', '2025-03-31 17:14:58', '2025-03-31 17:14:58'),
('TLG2a5DonSzwWvMgNQT9poz', '/api/v1/subscriptions?page=1&limit=100&search=', 'GET api/v1/subscriptions?page=1&limit=100&search=', '{}', '{}', '{}', '{\"success\":true,\"message\":\"Plans retrieved successfully\",\"data\":[{\"id\":\"uzptLdgqYFRoK23ORcMgQrg\",\"name\":\"Basic Plan\",\"currency\":\"INR\",\"price\":\"999.00\",\"duration\":\"Per Month\",\"trial_period\":\"7\",\"max_users\":\"5\",\"max_clients\":\"10\",\"max_customers\":\"50\",\"max_v', '0.06 seconds', '2025-03-31 10:28:35', '2025-03-31 10:28:35'),
('TMcjZQlQuiWMfyOgIX8Xs4n', '/api/v1/invoices/single/dmciOE2OiF952YsPFd0NPQi', 'GET api/v1/invoices/single/dmciOE2OiF952YsPFd0NPQi', '{\"id\":\"dmciOE2OiF952YsPFd0NPQi\"}', '{}', '{}', '{\"success\":true,\"message\":\"Invoice fetched successfully\",\"data\":[]}', '0.10 seconds', '2025-03-31 18:05:19', '2025-03-31 18:05:19'),
('tmFkrP6L25X5CI2eJ3ZgBU0', '/api/v1/auth/signup', 'POST api/v1/auth/signup', '{}', '{}', '{\"username\":\"support.silverline\",\"email\":\"support.silverline@yopmail.com\",\"password\":\"Supportsilverline@2525\",\"role_id\":\"28RtGJ3pSZXAZTC5FKpuGMR\"}', '{\"success\":true,\"message\":\"Please verify your email to complete registration\",\"data\":{\"sessionToken\":\"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjRreWtVSGNnNW9McmhORGtmQ0xOWVlHIiwidXNlcm5hbWUiOiJzdXBwb3J0LnNpbHZlcmxpbmUiLCJlbWFpbCI6InN1cHBvcnQuc2lsdmVy', '2.82 seconds', '2025-03-31 11:26:39', '2025-03-31 11:26:39'),
('tOlQFzlA7EYmCEhQWHZ0xDr', '/api/v1/employees', 'GET api/v1/employees', '{}', '{}', '{}', '{\"success\":true,\"message\":\"Employees fetched successfully\",\"data\":[]}', '0.04 seconds', '2025-03-31 12:04:14', '2025-03-31 12:04:14'),
('Tos7KDyFDI2GX0yoUX15Dgv', '/api/v1/countries?page=1&limit=100', 'GET api/v1/countries?page=1&limit=100', '{}', '{\"page\":1,\"limit\":100}', '{}', '{\"success\":true,\"message\":\"Countries fetched successfully\",\"data\":[{\"id\":\"0YNW00eJIaSTu6T8IZXJZ2W\",\"countryName\":\"Kuwait\",\"countryCode\":\"KW\",\"phoneCode\":\"+965\",\"created_by\":null,\"updated_by\":null,\"createdAt\":\"2025-03-31T03:52:28.000Z\",\"updatedAt\":\"2025-03', '0.03 seconds', '2025-03-31 17:03:21', '2025-03-31 17:03:21'),
('tP2ZpxBi08LN1kvIQjqvD7t', '/api/v1/projects', 'GET api/v1/projects', '{}', '{}', '{}', '{\"success\":true,\"message\":\"Projects fetched successfully\",\"data\":[]}', '0.03 seconds', '2025-03-31 14:32:14', '2025-03-31 14:32:14'),
('TpNylOldvLs33zOsok8Kpa4', '/api/v1/employees', 'GET api/v1/employees', '{}', '{}', '{}', '{\"success\":true,\"message\":\"Employees fetched successfully\",\"data\":[{\"conversations\":{},\"id\":\"8v2FNBB31ognrYtRiqdgCVu\",\"employeeId\":\"EMP#4\",\"username\":\"neha.singh\",\"password\":\"$2b$12$TwPd6LVLsRlu/sI3bD7iuu0bqeeOYz5gXsjRT4Z4YDOLID3LHjVIG\",\"email\":\"neha.sing', '0.01 seconds', '2025-03-31 12:59:52', '2025-03-31 12:59:52'),
('trdUfID9ktgjCNhO2pzCLxC', '/api/v1/subscriptions?page=1&limit=100&search=', 'GET api/v1/subscriptions?page=1&limit=100&search=', '{}', '{}', '{}', '{\"success\":true,\"message\":\"Plans retrieved successfully\",\"data\":[{\"id\":\"uzptLdgqYFRoK23ORcMgQrg\",\"name\":\"Basic Plan\",\"currency\":\"INR\",\"price\":\"999.00\",\"duration\":\"Per Month\",\"trial_period\":\"7\",\"max_users\":\"5\",\"max_clients\":\"10\",\"max_customers\":\"50\",\"max_v', '0.08 seconds', '2025-03-31 10:23:10', '2025-03-31 10:23:10'),
('TS4gj6H0xaTETybU90FdxyK', '/api/v1/auth', 'GET api/v1/auth', '{}', '{}', '{}', '{\"success\":true,\"message\":\"Users fetched successfully\",\"data\":[{\"conversations\":{},\"id\":\"0aMTORQ27wG00Ht5REhq13p\",\"employeeId\":null,\"username\":\" ba.silverline\",\"password\":\"$2b$12$NT.meyBZRWfJve/VLDgQo.bwhzGz1ElPJcoihKL2lokuJpOAqHk6W\",\"email\":\"ba.silverlin', '0.01 seconds', '2025-03-31 11:45:35', '2025-03-31 11:45:35'),
('TSjtYLHYL1xSDYTFi1qERZL', '/api/v1/employees', 'GET api/v1/employees', '{}', '{}', '{}', '{\"success\":true,\"message\":\"Employees fetched successfully\",\"data\":[]}', '0.15 seconds', '2025-03-31 12:24:21', '2025-03-31 12:24:21'),
('TUw7heuL1ta2GvtK3Pms6c3', '/api/v1/currencies?', 'GET api/v1/currencies?', '{}', '{}', '{}', '{\"success\":true,\"message\":\"Currencies fetched successfully\",\"data\":[{\"id\":\"29gCwt8wWQg7CPgG96847iD\",\"currencyName\":\"Euro\",\"currencyIcon\":\"€\",\"currencyCode\":\"EUR\",\"created_by\":null,\"updated_by\":null,\"createdAt\":\"2025-03-31T04:23:06.000Z\",\"updatedAt\":\"2025-', '0.02 seconds', '2025-03-31 10:56:31', '2025-03-31 10:56:31'),
('tvIz2NTsdMAJ4S04gB2EyWr', '/api/v1/pipelines', 'GET api/v1/pipelines', '{}', '{}', '{}', '{\"success\":true,\"message\":\"Pipelines fetched successfully\",\"data\":[{\"id\":\"iiUsXOteVUFiCIMkgR6DObO\",\"pipeline_name\":\"Marketing\",\"client_id\":\"4kykUHcg5oLrhNDkfCLNYYG\",\"created_by\":\"Silverline Systems\",\"updated_by\":null,\"createdAt\":\"2025-03-31T05:00:29.000Z\"', '0.04 seconds', '2025-03-31 17:03:21', '2025-03-31 17:03:21'),
('TxCNVtebHXTCLNp77fbPGFv', '/api/v1/countries?page=1&limit=100', 'GET api/v1/countries?page=1&limit=100', '{}', '{\"page\":1,\"limit\":100}', '{}', '{\"success\":true,\"message\":\"Countries fetched successfully\",\"data\":[{\"id\":\"0YNW00eJIaSTu6T8IZXJZ2W\",\"countryName\":\"Kuwait\",\"countryCode\":\"KW\",\"phoneCode\":\"+965\",\"created_by\":null,\"updated_by\":null,\"createdAt\":\"2025-03-31T03:52:28.000Z\",\"updatedAt\":\"2025-03', '0.07 seconds', '2025-03-31 10:45:19', '2025-03-31 10:45:19'),
('TXO1bjC9ghq8PujbqBKEKVi', '/api/v1/pipelines', 'GET api/v1/pipelines', '{}', '{}', '{}', '{\"success\":true,\"message\":\"Pipelines fetched successfully\",\"data\":[{\"id\":\"iiUsXOteVUFiCIMkgR6DObO\",\"pipeline_name\":\"Marketing\",\"client_id\":\"4kykUHcg5oLrhNDkfCLNYYG\",\"created_by\":\"Silverline Systems\",\"updated_by\":null,\"createdAt\":\"2025-03-31T05:00:29.000Z\"', '0.01 seconds', '2025-03-31 17:48:25', '2025-03-31 17:48:25'),
('tzjMR5v8HeNwBHeEhTbqfwN', '/api/v1/auth/verify-signup', 'POST api/v1/auth/verify-signup', '{}', '{}', '{\"otp\":\"195055\"}', '{\"success\":true,\"message\":\"Registration completed successfully\",\"data\":{\"success\":true,\"token\":\"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IldlazlHSFl5cDllYkZ3empGWkh0dXZBIiwicm9sZSI6ImNsaWVudCIsImlhdCI6MTc0MzM5MzQ1MSwiZXhwIjoxNzQzNDc5ODUxfQ.VUffME8DNYv', '3.71 seconds', '2025-03-31 09:27:35', '2025-03-31 09:27:35'),
('U1HSj0fQ6vBOir4Onm9AGw9', '/api/v1/leads', 'GET api/v1/leads', '{}', '{}', '{}', '{\"success\":true,\"message\":\"Lead fetched successfully\",\"data\":[{\"id\":\"31LINvHYSM5u4avuq7Wrjlh\",\"leadTitle\":\"TechPro Solutions Website Modernization\",\"leadStage\":\"icIkzFa9jKpV26cO64IJS7f\",\"currency\":\"INR\",\"leadValue\":850000,\"company_name\":\" TechPro Solution', '0.01 seconds', '2025-03-31 17:12:33', '2025-03-31 17:12:33'),
('u4EqvFO2pKWQGcpz2vj4HEb', '/api/v1/subscriptions?page=1&limit=100&search=', 'GET api/v1/subscriptions?page=1&limit=100&search=', '{}', '{}', '{}', '{\"success\":true,\"message\":\"Plans retrieved successfully\",\"data\":[{\"id\":\"uzptLdgqYFRoK23ORcMgQrg\",\"name\":\"Basic Plan\",\"currency\":\"INR\",\"price\":\"999.00\",\"duration\":\"Per Month\",\"trial_period\":\"7\",\"max_users\":\"5\",\"max_clients\":\"10\",\"max_customers\":\"50\",\"max_v', '0.09 seconds', '2025-03-31 10:45:19', '2025-03-31 10:45:19'),
('u8ldB63GQnfk0JcZthqPar0', '/api/v1/payments/dmciOE2OiF952YsPFd0NPQi', 'GET api/v1/payments/dmciOE2OiF952YsPFd0NPQi', '{\"id\":\"dmciOE2OiF952YsPFd0NPQi\"}', '{}', '{}', '{\"success\":true,\"message\":\"Payments fetched successfully\",\"data\":[]}', '0.01 seconds', '2025-03-31 17:48:07', '2025-03-31 17:48:07'),
('Ua5tAGoRr9l3AzhH8yGk9ep', '/api/v1/designations', 'GET api/v1/designations', '{}', '{}', '{}', '{\"success\":true,\"message\":\"Designation fetched successfully\",\"data\":[{\"id\":\"LaqJYdtzPX2CHjbxPYthMrD\",\"branch\":\"UH8lBWZZAkctwuRFiCz5PMB\",\"designation_name\":\"Finance Analyst\",\"client_id\":\"4kykUHcg5oLrhNDkfCLNYYG\",\"created_by\":\"Silverline Systems\",\"updated_b', '0.01 seconds', '2025-03-31 12:26:31', '2025-03-31 12:26:31'),
('UaBliHGe9o5TH81hDPy9gOp', '/api/v1/auth/verify-signup', 'POST api/v1/auth/verify-signup', '{}', '{}', '{\"otp\":\"424760\"}', '{\"success\":true,\"message\":\"Registration completed successfully\",\"data\":{\"success\":true,\"token\":\"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjdhUnhmVlRYc3hkMzFQeUJ6OVd6RWp4Iiwicm9sZSI6ImNsaWVudCIsImlhdCI6MTc0MzM5MzY1MywiZXhwIjoxNzQzNDgwMDUzfQ.WM_tyZJt8g5', '3.33 seconds', '2025-03-31 09:30:56', '2025-03-31 09:30:56'),
('UBRxZboqQde7ryjG2vxQzMR', '/api/v1/designations', 'POST api/v1/designations', '{}', '{}', '{\"designation_name\":\"Full Stack Developer\",\"branch\":\"S99Ug8QEauke2Me7XhF29of\"}', '{\"success\":true,\"message\":\"Designation created successfully\",\"data\":{\"id\":\"rCylZ4VP6j9yVdlY4nK6nUD\",\"updated_by\":null,\"branch\":\"S99Ug8QEauke2Me7XhF29of\",\"designation_name\":\"Full Stack Developer\",\"client_id\":\"4kykUHcg5oLrhNDkfCLNYYG\",\"created_by\":\"Silverli', '0.01 seconds', '2025-03-31 12:26:31', '2025-03-31 12:26:31'),
('UDrkGAWFriIPrx6jwHG9P0c', '/api/v1/subscriptions?page=1&limit=100&search=', 'GET api/v1/subscriptions?page=1&limit=100&search=', '{}', '{}', '{}', '{\"success\":true,\"message\":\"Plans retrieved successfully\",\"data\":[{\"id\":\"uzptLdgqYFRoK23ORcMgQrg\",\"name\":\"Basic Plan\",\"currency\":\"INR\",\"price\":\"999.00\",\"duration\":\"Per Month\",\"trial_period\":\"7\",\"max_users\":\"5\",\"max_clients\":\"10\",\"max_customers\":\"50\",\"max_v', '0.04 seconds', '2025-03-31 15:54:11', '2025-03-31 15:54:11'),
('UEwSCPS6HhzdJXSHbROwaun', '/api/v1/countries?page=1&limit=100', 'GET api/v1/countries?page=1&limit=100', '{}', '{\"page\":1,\"limit\":100}', '{}', '{\"success\":true,\"message\":\"Countries fetched successfully\",\"data\":[{\"id\":\"0YNW00eJIaSTu6T8IZXJZ2W\",\"countryName\":\"Kuwait\",\"countryCode\":\"KW\",\"phoneCode\":\"+965\",\"created_by\":null,\"updated_by\":null,\"createdAt\":\"2025-03-31T03:52:28.000Z\",\"updatedAt\":\"2025-03', '0.02 seconds', '2025-03-31 14:41:38', '2025-03-31 14:41:38'),
('uhjagPoMX48h81iHBjcEzeZ', '/api/v1/deals/dmciOE2OiF952YsPFd0NPQi', 'PUT api/v1/deals/dmciOE2OiF952YsPFd0NPQi', '{\"id\":\"dmciOE2OiF952YsPFd0NPQi\"}', '{}', '{\"stage\":\"ucHxzJDG8XiUl7sMzJz0OJL\"}', '{\"success\":true,\"message\":\"Deal updated successfully\",\"data\":{\"id\":\"dmciOE2OiF952YsPFd0NPQi\",\"leadTitle\":null,\"firstName\":null,\"lastName\":null,\"email\":null,\"phone\":null,\"dealName\":\"Cloud ERP Implementation\",\"pipeline\":\"iiUsXOteVUFiCIMkgR6DObO\",\"stage\":\"uc', '0.01 seconds', '2025-03-31 17:46:18', '2025-03-31 17:46:18'),
('UhX9hC4q4HlPJMCqpn0QZcg', '/api/v1/departments', 'GET api/v1/departments', '{}', '{}', '{}', '{\"success\":true,\"message\":\"Department fetched successfully\",\"data\":[{\"id\":\"0DQCpwzdzU2mZWnGcqM91AC\",\"branch\":\"haQEJiCePwC0KeJsmUWsSZ7\",\"department_name\":\" Sales\",\"client_id\":\"4kykUHcg5oLrhNDkfCLNYYG\",\"created_by\":\"Silverline Systems\",\"updated_by\":null,\"cr', '0.01 seconds', '2025-03-31 12:27:18', '2025-03-31 12:27:18'),
('uhxi8TmYY9HoqFTcs3lRgrq', '/api/v1/employees', 'GET api/v1/employees', '{}', '{}', '{}', '{\"success\":true,\"message\":\"Employees fetched successfully\",\"data\":[{\"conversations\":{},\"id\":\"RDyEgAxQ5cdETq1XejlCWxe\",\"employeeId\":\"EMP#2\",\"username\":\"priya.patel\",\"password\":\"$2b$12$jpkKDi16nF/hELIGR1p5UeiUMrLo1R5pzTxjiWFR40gJrOH480PSC\",\"email\":\"priya.pa', '0.01 seconds', '2025-03-31 12:45:27', '2025-03-31 12:45:27'),
('UI13cS3Ye1hmoabcef5Y2A0', '/api/v1/roles', 'GET api/v1/roles', '{}', '{}', '{}', '{\"success\":true,\"message\":\"Roles fetched successfully\",\"data\":[{\"id\":\"03qarcBedPhsVY3A1IKMMyW\",\"role_name\":\"System Administrator\",\"permissions\":\"{\\\"dashboards-project-list\\\":[{\\\"key\\\":\\\"dashboards-project-list\\\",\\\"permissions\\\":[\\\"view\\\",\\\"create\\\",\\\"upda', '0.01 seconds', '2025-03-31 11:00:43', '2025-03-31 11:00:43'),
('UIRTWuLoU6wjeFgsK71eqZt', '/api/v1/sub-clients', 'POST api/v1/sub-clients', '{}', '{}', '{\"username\":\"DataCore Analytics\",\"email\":\"datacore.analytics@yopmail.com\",\"password\":\"DataCoreAnalytics@2525\"}', '{\"success\":true,\"message\":\"Please verify your email to complete registration\",\"data\":{\"sessionToken\":\"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjRreWtVSGNnNW9McmhORGtmQ0xOWVlHIiwidXNlcm5hbWUiOiJEYXRhQ29yZSBBbmFseXRpY3MiLCJlbWFpbCI6ImRhdGFjb3JlLmFuYWx5', '2.73 seconds', '2025-03-31 11:54:43', '2025-03-31 11:54:43'),
('UIwiDBf7hsY0ORWI9nzQkmd', '/api/v1/leads/YXfrACvHnsutJstpTU5Tu24', 'PUT api/v1/leads/YXfrACvHnsutJstpTU5Tu24', '{\"id\":\"YXfrACvHnsutJstpTU5Tu24\"}', '{}', '{\"leadStage\":\"icIkzFa9jKpV26cO64IJS7f\"}', '{\"success\":true,\"message\":\"Lead updated successfully!\",\"data\":{\"id\":\"YXfrACvHnsutJstpTU5Tu24\",\"leadTitle\":\"HealthCare App Development\",\"leadStage\":\"icIkzFa9jKpV26cO64IJS7f\",\"currency\":\"INR\",\"leadValue\":1500000,\"company_name\":\"MediTech Solutions\",\"firstNam', '0.01 seconds', '2025-03-31 16:57:00', '2025-03-31 16:57:00'),
('ulWLoeM3KK6w1pMmSDccmS8', '/api/v1/departments', 'POST api/v1/departments', '{}', '{}', '{\"department_name\":\"Development\",\"branch\":\"S99Ug8QEauke2Me7XhF29of\"}', '{\"success\":false,\"message\":\"Department name already exists in the same branch\"}', '0.01 seconds', '2025-03-31 12:25:57', '2025-03-31 12:25:57'),
('UM2J17tMjaYI6eKjpuocZWH', '/api/v1/subscriptions?page=1&limit=100&search=', 'GET api/v1/subscriptions?page=1&limit=100&search=', '{}', '{}', '{}', '{\"success\":true,\"message\":\"Plans retrieved successfully\",\"data\":[]}', '0.05 seconds', '2025-03-31 09:22:28', '2025-03-31 09:22:28'),
('UNvzQRYVm4x1w4yq5ZMxHhG', '/api/v1/leads/YXfrACvHnsutJstpTU5Tu24', 'PUT api/v1/leads/YXfrACvHnsutJstpTU5Tu24', '{\"id\":\"YXfrACvHnsutJstpTU5Tu24\"}', '{}', '{\"leadStage\":\"icIkzFa9jKpV26cO64IJS7f\"}', '{\"success\":true,\"message\":\"Lead updated successfully!\",\"data\":{\"id\":\"YXfrACvHnsutJstpTU5Tu24\",\"leadTitle\":\"HealthCare App Development\",\"leadStage\":\"icIkzFa9jKpV26cO64IJS7f\",\"currency\":\"INR\",\"leadValue\":1500000,\"company_name\":\"MediTech Solutions\",\"firstNam', '0.02 seconds', '2025-03-31 16:56:57', '2025-03-31 16:56:57'),
('uo4bowzBvWDH5fH4cVDoAbK', '/api/v1/deals', 'GET api/v1/deals', '{}', '{}', '{}', '{\"success\":true,\"message\":\"Deal fetched successfully\",\"data\":[]}', '0.01 seconds', '2025-03-31 17:23:43', '2025-03-31 17:23:43'),
('uOQp0wdCHYaCeM1LrA4eCWN', '/api/v1/labels/4kykUHcg5oLrhNDkfCLNYYG', 'GET api/v1/labels/4kykUHcg5oLrhNDkfCLNYYG', '{\"id\":\"4kykUHcg5oLrhNDkfCLNYYG\"}', '{}', '{}', '{\"success\":true,\"message\":\"Tags retrieved successfully\",\"data\":[{\"id\":\"0ga51ZccuIiGGEudOSNNRDJ\",\"related_id\":\"4kykUHcg5oLrhNDkfCLNYYG\",\"lableType\":\"source\",\"name\":\"Phone\",\"color\":\"#34495E\",\"client_id\":\"4kykUHcg5oLrhNDkfCLNYYG\",\"created_by\":\"system\",\"updat', '0.01 seconds', '2025-03-31 17:48:23', '2025-03-31 17:48:23'),
('upnrkFkwisSZKb329R98zIC', '/api/v1/labels/4kykUHcg5oLrhNDkfCLNYYG', 'GET api/v1/labels/4kykUHcg5oLrhNDkfCLNYYG', '{\"id\":\"4kykUHcg5oLrhNDkfCLNYYG\"}', '{}', '{}', '{\"success\":true,\"message\":\"Tags retrieved successfully\",\"data\":[{\"id\":\"0ga51ZccuIiGGEudOSNNRDJ\",\"related_id\":\"4kykUHcg5oLrhNDkfCLNYYG\",\"lableType\":\"source\",\"name\":\"Phone\",\"color\":\"#34495E\",\"client_id\":\"4kykUHcg5oLrhNDkfCLNYYG\",\"created_by\":\"system\",\"updat', '0.06 seconds', '2025-03-31 17:02:27', '2025-03-31 17:02:27'),
('URjR1ZlhhuYATD9C4M7jUwa', '/api/v1/currencies?page=1&limit=100', 'GET api/v1/currencies?page=1&limit=100', '{}', '{\"page\":1,\"limit\":100}', '{}', '{\"success\":true,\"message\":\"Currencies fetched successfully\",\"data\":[{\"id\":\"29gCwt8wWQg7CPgG96847iD\",\"currencyName\":\"Euro\",\"currencyIcon\":\"€\",\"currencyCode\":\"EUR\",\"created_by\":null,\"updated_by\":null,\"createdAt\":\"2025-03-31T04:23:06.000Z\",\"updatedAt\":\"2025-', '0.06 seconds', '2025-03-31 12:32:13', '2025-03-31 12:32:13'),
('UtXhicFRqv6eqDpiJIy6LX2', '/api/v1/stages', 'GET api/v1/stages', '{}', '{}', '{}', '{\"success\":true,\"message\":\"Stages fetched successfully\",\"data\":[{\"id\":\"1j1Mfax4tYdOONQGLA23CeQ\",\"stageType\":\"deal\",\"stageName\":\"Lead Received\",\"pipeline\":\"iiUsXOteVUFiCIMkgR6DObO\",\"client_id\":\"4kykUHcg5oLrhNDkfCLNYYG\",\"created_by\":\"Silverline Systems\",\"up', '0.01 seconds', '2025-03-31 17:48:24', '2025-03-31 17:48:24'),
('uXHLl36r72Xexl53PXfzT5h', '/api/v1/clients', 'GET api/v1/clients', '{}', '{}', '{}', '{\"success\":true,\"message\":\"Clients fetched successfully\",\"data\":[{\"conversations\":{},\"id\":\"7aRxfVTXsxd31PyBz9WzEjx\",\"employeeId\":null,\"username\":\"Quantum Enterprises\",\"password\":\"$2b$12$OCduts6PI5L0YSEOVKT73uvS2zlUOaAPNMKWIxOO8tA/YpS1K.TRS\",\"email\":\"quant', '0.01 seconds', '2025-03-31 09:32:11', '2025-03-31 09:32:11'),
('Uy7CDYVteGktQfNbHWAweev', '/api/v1/sub-clients', 'GET api/v1/sub-clients', '{}', '{}', '{}', '{\"success\":false,\"message\":\"Cannot read properties of null (reading \'id\')\"}', '0.01 seconds', '2025-03-31 11:44:14', '2025-03-31 11:44:14'),
('uyDxd3Ez8JurVDbkGroFMtm', '/api/v1/labels/4kykUHcg5oLrhNDkfCLNYYG', 'GET api/v1/labels/4kykUHcg5oLrhNDkfCLNYYG', '{\"id\":\"4kykUHcg5oLrhNDkfCLNYYG\"}', '{}', '{}', '{\"success\":true,\"message\":\"Tags retrieved successfully\",\"data\":[{\"id\":\"0ga51ZccuIiGGEudOSNNRDJ\",\"related_id\":\"4kykUHcg5oLrhNDkfCLNYYG\",\"lableType\":\"source\",\"name\":\"Phone\",\"color\":\"#34495E\",\"client_id\":\"4kykUHcg5oLrhNDkfCLNYYG\",\"created_by\":\"system\",\"updat', '0.01 seconds', '2025-03-31 14:25:30', '2025-03-31 14:25:30'),
('uZ5oYGDl9cn9KBsIENjJaBc', '/api/v1/pipelines', 'GET api/v1/pipelines', '{}', '{}', '{}', '{\"success\":true,\"message\":\"Pipelines fetched successfully\",\"data\":[{\"id\":\"iiUsXOteVUFiCIMkgR6DObO\",\"pipeline_name\":\"Marketing\",\"client_id\":\"4kykUHcg5oLrhNDkfCLNYYG\",\"created_by\":\"Silverline Systems\",\"updated_by\":null,\"createdAt\":\"2025-03-31T05:00:29.000Z\"', '0.01 seconds', '2025-03-31 14:31:34', '2025-03-31 14:31:34'),
('Uz7cP6rZVj2cMTfmLh43XR0', '/api/v1/departments', 'GET api/v1/departments', '{}', '{}', '{}', '{\"success\":true,\"message\":\"Department fetched successfully\",\"data\":[{\"id\":\"0DQCpwzdzU2mZWnGcqM91AC\",\"branch\":\"haQEJiCePwC0KeJsmUWsSZ7\",\"department_name\":\" Sales\",\"client_id\":\"4kykUHcg5oLrhNDkfCLNYYG\",\"created_by\":\"Silverline Systems\",\"updated_by\":null,\"cr', '0.01 seconds', '2025-03-31 12:29:13', '2025-03-31 12:29:13'),
('V2i3ymyTZsEHZ8zqMXePJfZ', '/api/v1/auth', 'GET api/v1/auth', '{}', '{}', '{}', '{\"success\":true,\"message\":\"Users fetched successfully\",\"data\":[{\"conversations\":{},\"id\":\"0aMTORQ27wG00Ht5REhq13p\",\"employeeId\":null,\"username\":\" ba.silverline\",\"password\":\"$2b$12$NT.meyBZRWfJve/VLDgQo.bwhzGz1ElPJcoihKL2lokuJpOAqHk6W\",\"email\":\"ba.silverlin', '0.01 seconds', '2025-03-31 16:00:54', '2025-03-31 16:00:54'),
('v7aRQDV7piiqQ7IL7dP7M86', '/api/v1/labels/4kykUHcg5oLrhNDkfCLNYYG', 'GET api/v1/labels/4kykUHcg5oLrhNDkfCLNYYG', '{\"id\":\"4kykUHcg5oLrhNDkfCLNYYG\"}', '{}', '{}', '{\"success\":true,\"message\":\"Tags retrieved successfully\",\"data\":[{\"id\":\"0ga51ZccuIiGGEudOSNNRDJ\",\"related_id\":\"4kykUHcg5oLrhNDkfCLNYYG\",\"lableType\":\"source\",\"name\":\"Phone\",\"color\":\"#34495E\",\"client_id\":\"4kykUHcg5oLrhNDkfCLNYYG\",\"created_by\":\"system\",\"updat', '0.02 seconds', '2025-03-31 17:48:23', '2025-03-31 17:48:23'),
('v8nTb4s5aoONElqQDnM0lMo', '/api/v1/clients', 'GET api/v1/clients', '{}', '{}', '{}', '{\"success\":true,\"message\":\"Clients fetched successfully\",\"data\":[{\"conversations\":{},\"id\":\"4kykUHcg5oLrhNDkfCLNYYG\",\"employeeId\":null,\"username\":\"Silverline Systems\",\"password\":\"$2b$12$.2Ia/XUZHrA7BEsLyf6uGuo9wgP9rGamovaR/ICL6YHHBDXVI5nIy\",\"email\":\"silver', '0.03 seconds', '2025-03-31 10:28:35', '2025-03-31 10:28:35'),
('vC4oPCEWFrAoD5GEelqQSVH', '/api/v1/leads', 'GET api/v1/leads', '{}', '{}', '{}', '{\"success\":true,\"message\":\"Lead fetched successfully\",\"data\":[{\"id\":\"31LINvHYSM5u4avuq7Wrjlh\",\"leadTitle\":\"TechPro Solutions Website Modernization\",\"leadStage\":\"BYNYLCidEQll0qKymn79W76\",\"currency\":\"INR\",\"leadValue\":850000,\"company_name\":\" TechPro Solution', '0.01 seconds', '2025-03-31 16:57:01', '2025-03-31 16:57:01'),
('vdU6QGoK5pJgwG2hvO4BRcq', '/api/v1/leads?', 'GET api/v1/leads?', '{}', '{}', '{}', '{\"success\":true,\"message\":\"Lead fetched successfully\",\"data\":[{\"id\":\"31LINvHYSM5u4avuq7Wrjlh\",\"leadTitle\":\"TechPro Solutions Website Modernization\",\"leadStage\":\"eTzCUBr5Y232i82lxUoP9vJ\",\"currency\":\"INR\",\"leadValue\":850000,\"company_name\":\" TechPro Solution', '0.06 seconds', '2025-03-31 17:13:43', '2025-03-31 17:13:43'),
('vfaAiIR5gS1ZIvZTsRjICvV', '/api/v1/designations', 'GET api/v1/designations', '{}', '{}', '{}', '{\"success\":true,\"message\":\"Designation fetched successfully\",\"data\":[{\"id\":\"LaqJYdtzPX2CHjbxPYthMrD\",\"branch\":\"UH8lBWZZAkctwuRFiCz5PMB\",\"designation_name\":\"Finance Analyst\",\"client_id\":\"4kykUHcg5oLrhNDkfCLNYYG\",\"created_by\":\"Silverline Systems\",\"updated_b', '0.01 seconds', '2025-03-31 12:23:26', '2025-03-31 12:23:26'),
('vfIWVvtSUN57lPEmaOfOeum', '/api/v1/leads', 'GET api/v1/leads', '{}', '{}', '{}', '{\"success\":true,\"message\":\"Lead fetched successfully\",\"data\":[]}', '0.05 seconds', '2025-03-31 10:28:44', '2025-03-31 10:28:44'),
('VJn1pIuv5EasOivITvZmJzl', '/api/v1/leads', 'GET api/v1/leads', '{}', '{}', '{}', '{\"success\":true,\"message\":\"Lead fetched successfully\",\"data\":[]}', '0.03 seconds', '2025-03-31 14:31:27', '2025-03-31 14:31:27'),
('VJv5vp7o8NjrRohJxOkLcUK', '/api/v1/departments', 'POST api/v1/departments', '{}', '{}', '{\"department_name\":\"Development\",\"branch\":\"UH8lBWZZAkctwuRFiCz5PMB\"}', '{\"success\":true,\"message\":\"Department created successfully\",\"data\":{\"id\":\"6aVUek1kX78VHjoDjhnJDAD\",\"updated_by\":null,\"branch\":\"UH8lBWZZAkctwuRFiCz5PMB\",\"department_name\":\"Development\",\"client_id\":\"4kykUHcg5oLrhNDkfCLNYYG\",\"created_by\":\"Silverline Systems\"', '0.01 seconds', '2025-03-31 12:11:00', '2025-03-31 12:11:00'),
('vl7OGiDct67dPISYijK11jU', '/api/v1/leads/31LINvHYSM5u4avuq7Wrjlh', 'PUT api/v1/leads/31LINvHYSM5u4avuq7Wrjlh', '{\"id\":\"31LINvHYSM5u4avuq7Wrjlh\"}', '{}', '{\"leadStage\":\"BYNYLCidEQll0qKymn79W76\"}', '{\"success\":true,\"message\":\"Lead updated successfully!\",\"data\":{\"id\":\"31LINvHYSM5u4avuq7Wrjlh\",\"leadTitle\":\"TechPro Solutions Website Modernization\",\"leadStage\":\"BYNYLCidEQll0qKymn79W76\",\"currency\":\"INR\",\"leadValue\":850000,\"company_name\":\" TechPro Solution', '0.01 seconds', '2025-03-31 17:12:34', '2025-03-31 17:12:34'),
('vtX9dMnYuKR8gcWEwPKeMSw', '/api/v1/taxes', 'GET api/v1/taxes', '{}', '{}', '{}', '{\"success\":true,\"message\":\"Tax fetched successfully\",\"data\":[{\"id\":\"FSq4XX9i6eb0ghsGzTZqkLW\",\"gstName\":\"PPT\",\"gstPercentage\":\"1\",\"client_id\":\"4kykUHcg5oLrhNDkfCLNYYG\",\"created_by\":\"Silverline Systems\",\"updated_by\":\"Silverline Systems\",\"createdAt\":\"2025-03', '0.04 seconds', '2025-03-31 17:22:21', '2025-03-31 17:22:21'),
('vvRfLI21Urqx3ctvUOFeL88', '/api/v1/deals', 'POST api/v1/deals', '{}', '{}', '{\"phone\":null,\"dealName\":\"Cloud ERP Implementation\",\"pipeline\":\"iiUsXOteVUFiCIMkgR6DObO\",\"status\":\"active\",\"stage\":\"1j1Mfax4tYdOONQGLA23CeQ\",\"value\":4500000,\"currency\":\"INR\",\"closedDate\":\"2025-03-31T18:30:00.000Z\",\"source\":\"0PTjfmVnNoWVG697TEecBoT\",\"produ', '{\"success\":true,\"message\":\"Deal created successfully\",\"data\":{\"id\":\"dmciOE2OiF952YsPFd0NPQi\",\"leadTitle\":null,\"firstName\":null,\"lastName\":null,\"email\":null,\"status\":\"pending\",\"label\":null,\"company_name\":null,\"address\":null,\"website\":null,\"files\":null,\"ass', '0.04 seconds', '2025-03-31 17:46:09', '2025-03-31 17:46:09'),
('vxG8doj5Bo7NmzPOYgaawtr', '/api/v1/followups/31LINvHYSM5u4avuq7Wrjlh', 'GET api/v1/followups/31LINvHYSM5u4avuq7Wrjlh', '{\"id\":\"31LINvHYSM5u4avuq7Wrjlh\"}', '{}', '{}', '{\"success\":true,\"message\":\"Followups retrieved successfully\",\"data\":[]}', '0.01 seconds', '2025-03-31 16:44:04', '2025-03-31 16:44:04'),
('VxYUFxFvVUPl6RbkxQsVnSE', '/api/v1/countries?', 'GET api/v1/countries?', '{}', '{}', '{}', '{\"success\":true,\"message\":\"Countries fetched successfully\",\"data\":[{\"id\":\"0YNW00eJIaSTu6T8IZXJZ2W\",\"countryName\":\"Kuwait\",\"countryCode\":\"KW\",\"phoneCode\":\"+965\",\"created_by\":null,\"updated_by\":null,\"createdAt\":\"2025-03-31T03:52:28.000Z\",\"updatedAt\":\"2025-03', '0.04 seconds', '2025-03-31 10:28:44', '2025-03-31 10:28:44'),
('vZUT3Jn7lISz3bNEde0aEvJ', '/api/v1/clients', 'POST api/v1/clients', '{}', '{}', '{\"username\":\"Phoenix Analytics\",\"email\":\"phoenixanalytics@yopmail.com\",\"password\":\"PhoenixAnalytics@2525\"}', '{\"success\":true,\"message\":\"OTP sent to email\",\"data\":{\"sessionToken\":\"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6ImUzcVRVMGJFbWxJdll1OHY0akZtanh2IiwidXNlcm5hbWUiOiJQaG9lbml4IEFuYWx5dGljcyIsImVtYWlsIjoicGhvZW5peGFuYWx5dGljc0B5b3BtYWlsLmNvbSIsInJvbGVfaWQi', '2.94 seconds', '2025-03-31 09:39:27', '2025-03-31 09:39:27'),
('w2XQR9nqbLCr1ekQSTdXrkD', '/api/v1/employees', 'GET api/v1/employees', '{}', '{}', '{}', '{\"success\":true,\"message\":\"Employees fetched successfully\",\"data\":[{\"conversations\":{},\"id\":\"8v2FNBB31ognrYtRiqdgCVu\",\"employeeId\":\"EMP#4\",\"username\":\"neha.singh\",\"password\":\"$2b$12$TwPd6LVLsRlu/sI3bD7iuu0bqeeOYz5gXsjRT4Z4YDOLID3LHjVIG\",\"email\":\"neha.sing', '0.01 seconds', '2025-03-31 12:53:20', '2025-03-31 12:53:20'),
('W3n03jaGIO8yROLKT5XIFlI', '/api/v1/labels/4kykUHcg5oLrhNDkfCLNYYG', 'GET api/v1/labels/4kykUHcg5oLrhNDkfCLNYYG', '{\"id\":\"4kykUHcg5oLrhNDkfCLNYYG\"}', '{}', '{}', '{\"success\":true,\"message\":\"Tags retrieved successfully\",\"data\":[{\"id\":\"0ga51ZccuIiGGEudOSNNRDJ\",\"related_id\":\"4kykUHcg5oLrhNDkfCLNYYG\",\"lableType\":\"source\",\"name\":\"Phone\",\"color\":\"#34495E\",\"client_id\":\"4kykUHcg5oLrhNDkfCLNYYG\",\"created_by\":\"system\",\"updat', '0.02 seconds', '2025-03-31 16:21:32', '2025-03-31 16:21:32'),
('w5BSK90CCL9PRHKdCf9tKmC', '/api/v1/holidays', 'GET api/v1/holidays', '{}', '{}', '{}', '{\"success\":true,\"message\":\"Holiday fetched successfully\",\"data\":[]}', '0.16 seconds', '2025-03-31 12:24:21', '2025-03-31 12:24:21'),
('w5fwnb1Fb4Z1HBN3pTvMXfV', '/api/v1/sales-invoices', 'GET api/v1/sales-invoices', '{}', '{}', '{}', '{\"success\":true,\"message\":\"Sales invoice fetched successfully\",\"data\":[]}', '0.01 seconds', '2025-03-31 10:52:41', '2025-03-31 10:52:41'),
('w8bICUv3DfoqdRlqeifBygh', '/api/v1/countries?', 'GET api/v1/countries?', '{}', '{}', '{}', '{\"success\":true,\"message\":\"Countries fetched successfully\",\"data\":[{\"id\":\"0YNW00eJIaSTu6T8IZXJZ2W\",\"countryName\":\"Kuwait\",\"countryCode\":\"KW\",\"phoneCode\":\"+965\",\"created_by\":null,\"updated_by\":null,\"createdAt\":\"2025-03-31T03:52:28.000Z\",\"updatedAt\":\"2025-03', '0.02 seconds', '2025-03-31 11:41:48', '2025-03-31 11:41:48'),
('waW9paRgDztz0tBKmchvmrf', '/api/v1/leads', 'POST api/v1/leads', '{}', '{}', '{\"leadTitle\":\"HealthCare App Development\",\"interest_level\":\"high\",\"currency\":\"INR\",\"leadValue\":1500000,\"source\":\"6qr1dAwRIXrn5ROqkBQcrqF\",\"status\":\"Jq6VB9g3QDsIfBAWgA2U9b4\",\"category\":\"P4aLxD3aeJNqduJwTORAasj\",\"lead_members\":{\"lead_members\":[\"8v2FNBB31ogn', '{\"success\":true,\"message\":\"Lead created successfully!\",\"data\":{\"id\":\"YXfrACvHnsutJstpTU5Tu24\",\"files\":null,\"lead_score\":null,\"updated_by\":null,\"leadStage\":\"icIkzFa9jKpV26cO64IJS7f\",\"leadTitle\":\"HealthCare App Development\",\"firstName\":\"Dr. Amit \",\"lastName', '0.06 seconds', '2025-03-31 16:51:41', '2025-03-31 16:51:41'),
('WDzge0pSG6CtkwF36Z963xr', '/api/v1/stages', 'GET api/v1/stages', '{}', '{}', '{}', '{\"success\":true,\"message\":\"Stages fetched successfully\",\"data\":[{\"id\":\"1j1Mfax4tYdOONQGLA23CeQ\",\"stageType\":\"deal\",\"stageName\":\"Lead Received\",\"pipeline\":\"iiUsXOteVUFiCIMkgR6DObO\",\"client_id\":\"4kykUHcg5oLrhNDkfCLNYYG\",\"created_by\":\"Silverline Systems\",\"up', '0.09 seconds', '2025-03-31 14:25:30', '2025-03-31 14:25:30'),
('wGcEmtSoNYqXG1gPOgFF55p', '/api/v1/clients', 'GET api/v1/clients', '{}', '{}', '{}', '{\"success\":true,\"message\":\"Clients fetched successfully\",\"data\":[{\"conversations\":{},\"id\":\"4kykUHcg5oLrhNDkfCLNYYG\",\"employeeId\":null,\"username\":\"Silverline Systems\",\"password\":\"$2b$12$.2Ia/XUZHrA7BEsLyf6uGuo9wgP9rGamovaR/ICL6YHHBDXVI5nIy\",\"email\":\"silver', '0.07 seconds', '2025-03-31 10:45:19', '2025-03-31 10:45:19'),
('WiaMaZ4Jg1ExudffclgXFm8', '/api/v1/auth/verify-signup', 'POST api/v1/auth/verify-signup', '{}', '{}', '{\"otp\":\"972320\"}', '{\"success\":true,\"message\":\"Registration completed successfully\",\"data\":{\"success\":true,\"token\":\"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IkFzUG9zbzF5MU9MNXVZNVVSeTU3WlB3Iiwicm9sZSI6ImNsaWVudCIsImlhdCI6MTc0MzM5MzU4NiwiZXhwIjoxNzQzNDc5OTg2fQ.FY-Kl-h-mV2', '2.51 seconds', '2025-03-31 09:29:48', '2025-03-31 09:29:48'),
('Wl7Kz6LC7ddd4hH9hCPnTrX', '/api/v1/currencies?', 'GET api/v1/currencies?', '{}', '{}', '{}', '{\"success\":true,\"message\":\"Currencies fetched successfully\",\"data\":[{\"id\":\"29gCwt8wWQg7CPgG96847iD\",\"currencyName\":\"Euro\",\"currencyIcon\":\"€\",\"currencyCode\":\"EUR\",\"created_by\":null,\"updated_by\":null,\"createdAt\":\"2025-03-31T04:23:06.000Z\",\"updatedAt\":\"2025-', '0.02 seconds', '2025-03-31 11:17:49', '2025-03-31 11:17:49'),
('wloHoOsm6xTpvgJcc825o4E', '/api/v1/auth/signup', 'POST api/v1/auth/signup', '{}', '{}', '{\"username\":\" ba.silverline\",\"email\":\"ba.silverline@yopmail.com\",\"password\":\"Basilverline@2525\",\"role_id\":\"jdWbdnTrMDss1mxhqXBUhpI\"}', '{\"success\":true,\"message\":\"Please verify your email to complete registration\",\"data\":{\"sessionToken\":\"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjRreWtVSGNnNW9McmhORGtmQ0xOWVlHIiwidXNlcm5hbWUiOiIgYmEuc2lsdmVybGluZSIsImVtYWlsIjoiYmEuc2lsdmVybGluZUB5b3Bt', '2.82 seconds', '2025-03-31 11:31:13', '2025-03-31 11:31:13'),
('wmXNai5Pngzq3mIp1OdJ2oc', '/api/v1/labels/4kykUHcg5oLrhNDkfCLNYYG', 'GET api/v1/labels/4kykUHcg5oLrhNDkfCLNYYG', '{\"id\":\"4kykUHcg5oLrhNDkfCLNYYG\"}', '{}', '{}', '{\"success\":true,\"message\":\"Tags retrieved successfully\",\"data\":[{\"id\":\"0ga51ZccuIiGGEudOSNNRDJ\",\"related_id\":\"4kykUHcg5oLrhNDkfCLNYYG\",\"lableType\":\"source\",\"name\":\"Phone\",\"color\":\"#34495E\",\"client_id\":\"4kykUHcg5oLrhNDkfCLNYYG\",\"created_by\":\"system\",\"updat', '0.04 seconds', '2025-03-31 17:38:51', '2025-03-31 17:38:51'),
('wnanH7TqKYfGbeFFr0op3pq', '/api/v1/sales-revenue', 'GET api/v1/sales-revenue', '{}', '{}', '{}', '{\"success\":true,\"message\":\"Sales revenue fetched successfully\",\"data\":[]}', '0.01 seconds', '2025-03-31 17:15:10', '2025-03-31 17:15:10'),
('wNcnMrfgqFe8WxdKliLtn6w', '/api/v1/auth/login', 'POST api/v1/auth/login', '{}', '{}', '{\"login\":\"superadmin@nexisvision.com\",\"password\":\"SuperAdmin@123\"}', '{\"success\":true,\"message\":\"Login successful\",\"data\":{\"token\":\"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6InN1cGVyYWRtaW4iLCJlbWFpbCI6InN1cGVyYWRtaW5AbmV4aXN2aXNpb24uY29tIiwicGhvbmUiOm51bGwsImlkIjoiZTNxVFUwYkVtbEl2WXU4djRqRm1qeHYiLCJyb2xlIjoiWmVp', '0.09 seconds', '2025-03-31 09:46:18', '2025-03-31 09:46:18'),
('wooKExIIk0y0dcBF83YVj4N', '/api/v1/leads', 'GET api/v1/leads', '{}', '{}', '{}', '{\"success\":true,\"message\":\"Lead fetched successfully\",\"data\":[{\"id\":\"31LINvHYSM5u4avuq7Wrjlh\",\"leadTitle\":\"TechPro Solutions Website Modernization\",\"leadStage\":\"BYNYLCidEQll0qKymn79W76\",\"currency\":\"INR\",\"leadValue\":850000,\"company_name\":\" TechPro Solution', '0.01 seconds', '2025-03-31 16:57:10', '2025-03-31 16:57:10'),
('Wp3ZIldPCEJc68qs7GoVpXw', '/api/v1/roles', 'GET api/v1/roles', '{}', '{}', '{}', '{\"success\":true,\"message\":\"Roles fetched successfully\",\"data\":[{\"id\":\"03qarcBedPhsVY3A1IKMMyW\",\"role_name\":\"System Administrator\",\"permissions\":\"{\\\"dashboards-project-list\\\":[{\\\"key\\\":\\\"dashboards-project-list\\\",\\\"permissions\\\":[\\\"view\\\",\\\"create\\\",\\\"upda', '0.01 seconds', '2025-03-31 10:59:53', '2025-03-31 10:59:53');
INSERT INTO `audittrails` (`id`, `url`, `activity`, `params`, `query`, `payload`, `response`, `duration`, `createdAt`, `updatedAt`) VALUES
('WPoY0dmvTCeH5tIgW58Wopa', '/api/v1/clients', 'POST api/v1/clients', '{}', '{}', '{\"username\":\"Silverline Systems\",\"email\":\"silverlinesystems@yopmail.com\",\"password\":\"SilverlineSystems2525\"}', '{\"success\":true,\"message\":\"OTP sent to email\",\"data\":{\"sessionToken\":\"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6ImUzcVRVMGJFbWxJdll1OHY0akZtanh2IiwidXNlcm5hbWUiOiJTaWx2ZXJsaW5lIFN5c3RlbXMiLCJlbWFpbCI6InNpbHZlcmxpbmVzeXN0ZW1zQHlvcG1haWwuY29tIiwicm9sZV9p', '3.46 seconds', '2025-03-31 09:41:09', '2025-03-31 09:41:09'),
('Wr9QenbCSBvaoy1po7fW9x8', '/api/v1/employees', 'GET api/v1/employees', '{}', '{}', '{}', '{\"success\":true,\"message\":\"Employees fetched successfully\",\"data\":[{\"conversations\":{},\"id\":\"uRxNhU6mrI44fedl6HiOBYM\",\"employeeId\":\"EMP#1\",\"username\":\"rahul.sharma\",\"password\":\"$2b$12$TQXuI3L/vn0vhGz/aZquW.mKH0e1x/.CSBj9q7nfFmkuLURsdmSPi\",\"email\":\"rahul.s', '0.01 seconds', '2025-03-31 12:45:03', '2025-03-31 12:45:03'),
('WtgkcEmgDL7nVqfa63Jwc3j', '/api/v1/auth', 'GET api/v1/auth', '{}', '{}', '{}', '{\"success\":true,\"message\":\"Users fetched successfully\",\"data\":[{\"conversations\":{},\"id\":\"4kykUHcg5oLrhNDkfCLNYYG\",\"employeeId\":null,\"username\":\"Silverline Systems\",\"password\":\"$2b$12$.2Ia/XUZHrA7BEsLyf6uGuo9wgP9rGamovaR/ICL6YHHBDXVI5nIy\",\"email\":\"silverli', '0.07 seconds', '2025-03-31 11:01:16', '2025-03-31 11:01:16'),
('wUYoKJmvH24SythLj4jX8Hk', '/api/v1/roles', 'GET api/v1/roles', '{}', '{}', '{}', '{\"success\":true,\"message\":\"Roles fetched successfully\",\"data\":[{\"id\":\"03qarcBedPhsVY3A1IKMMyW\",\"role_name\":\"System Administrator\",\"permissions\":\"{\\\"dashboards-project-list\\\":[{\\\"key\\\":\\\"dashboards-project-list\\\",\\\"permissions\\\":[\\\"view\\\",\\\"create\\\",\\\"upda', '0.10 seconds', '2025-03-31 11:21:22', '2025-03-31 11:21:22'),
('wZ0tej0t3PIQbBCJa4DxYlL', '/api/v1/labels/4kykUHcg5oLrhNDkfCLNYYG', 'GET api/v1/labels/4kykUHcg5oLrhNDkfCLNYYG', '{\"id\":\"4kykUHcg5oLrhNDkfCLNYYG\"}', '{}', '{}', '{\"success\":true,\"message\":\"Tags retrieved successfully\",\"data\":[{\"id\":\"0ga51ZccuIiGGEudOSNNRDJ\",\"related_id\":\"4kykUHcg5oLrhNDkfCLNYYG\",\"lableType\":\"source\",\"name\":\"Phone\",\"color\":\"#34495E\",\"client_id\":\"4kykUHcg5oLrhNDkfCLNYYG\",\"created_by\":\"system\",\"updat', '0.01 seconds', '2025-03-31 11:10:04', '2025-03-31 11:10:04'),
('WZT4jhMLyNUtsYK7h2NAJcZ', '/api/v1/subscriptions', 'POST api/v1/subscriptions', '{}', '{}', '{\"name\":\"Professional Plan\",\"currency\":\"INR\",\"price\":2499,\"duration\":\"Per Month\",\"trial_period\":\"14\",\"storage_limit\":\"25\",\"max_users\":\"15\",\"max_clients\":\"25\",\"max_vendors\":\"50\",\"max_customers\":\"100\",\"status\":\"active\",\"features\":{}}', '{\"success\":true,\"message\":\"Plan created successfully\",\"data\":{\"id\":\"7jkFMDlerBM0I8peB1i6QHG\",\"updated_by\":null,\"name\":\"Professional Plan\",\"currency\":\"INR\",\"price\":2499,\"duration\":\"Per Month\",\"trial_period\":\"14\",\"max_users\":\"15\",\"max_clients\":\"25\",\"max_cus', '0.03 seconds', '2025-03-31 10:46:40', '2025-03-31 10:46:40'),
('X22SV5VHJ090TgvtEQYwCQ1', '/api/v1/designations', 'POST api/v1/designations', '{}', '{}', '{\"designation_name\":\"Backend Developer\",\"branch\":\"S99Ug8QEauke2Me7XhF29of\"}', '{\"success\":true,\"message\":\"Designation created successfully\",\"data\":{\"id\":\"yXI8GkxJY3UmNlPQ7rqWdvN\",\"updated_by\":null,\"branch\":\"S99Ug8QEauke2Me7XhF29of\",\"designation_name\":\"Backend Developer\",\"client_id\":\"4kykUHcg5oLrhNDkfCLNYYG\",\"created_by\":\"Silverline ', '0.01 seconds', '2025-03-31 12:22:38', '2025-03-31 12:22:38'),
('X3WjpUXiCeEx9zqIOEpzG9B', '/api/v1/pipelines', 'GET api/v1/pipelines', '{}', '{}', '{}', '{\"success\":true,\"message\":\"Pipelines fetched successfully\",\"data\":[{\"id\":\"m6SveJxdmilrXCvOALBKRek\",\"updated_by\":null,\"pipeline_name\":\"Sales\",\"client_id\":\"4kykUHcg5oLrhNDkfCLNYYG\",\"created_by\":\"Silverline Systems\",\"updatedAt\":\"2025-03-31T05:00:29.388Z\",\"cr', '0.04 seconds', '2025-03-31 10:30:29', '2025-03-31 10:30:29'),
('X54RCz4tRCKRs2jNe8Ie54e', '/api/v1/currencies?page=1&limit=100', 'GET api/v1/currencies?page=1&limit=100', '{}', '{\"page\":1,\"limit\":100}', '{}', '{\"success\":true,\"message\":\"Currencies fetched successfully\",\"data\":[{\"id\":\"29gCwt8wWQg7CPgG96847iD\",\"currencyName\":\"Euro\",\"currencyIcon\":\"€\",\"currencyCode\":\"EUR\",\"created_by\":null,\"updated_by\":null,\"createdAt\":\"2025-03-31T04:23:06.000Z\",\"updatedAt\":\"2025-', '0.25 seconds', '2025-03-31 09:53:06', '2025-03-31 09:53:06'),
('X5NbF2AM1LrBHm7x3M7wC80', '/api/v1/subscriptions', 'POST api/v1/subscriptions', '{}', '{}', '{\"name\":\"Business Plan\",\"currency\":\"INR\",\"price\":4999,\"duration\":\"Per Month\",\"trial_period\":\"30\",\"storage_limit\":\"50\",\"max_users\":\"30\",\"max_clients\":\"50\",\"max_vendors\":\"100\",\"max_customers\":\"250\",\"status\":\"active\",\"features\":{}}', '{\"success\":true,\"message\":\"Plan created successfully\",\"data\":{\"id\":\"jvsA7iVLdbIs0mtKFXiwiMT\",\"updated_by\":null,\"name\":\"Business Plan\",\"currency\":\"INR\",\"price\":4999,\"duration\":\"Per Month\",\"trial_period\":\"30\",\"max_users\":\"30\",\"max_clients\":\"50\",\"max_custome', '0.02 seconds', '2025-03-31 10:47:33', '2025-03-31 10:47:33'),
('xcpKdk7Dhu3W9Sg7Flx3sMb', '/api/v1/taxes', 'GET api/v1/taxes', '{}', '{}', '{}', '{\"success\":true,\"message\":\"Tax fetched successfully\",\"data\":[{\"id\":\"FSq4XX9i6eb0ghsGzTZqkLW\",\"gstName\":\"PPT\",\"gstPercentage\":\"1\",\"client_id\":\"4kykUHcg5oLrhNDkfCLNYYG\",\"created_by\":\"Silverline Systems\",\"updated_by\":\"Silverline Systems\",\"createdAt\":\"2025-03', '0.03 seconds', '2025-03-31 17:48:06', '2025-03-31 17:48:06'),
('xEy3TAyD8aC8DDddJaSDyJH', '/api/v1/branches', 'POST api/v1/branches', '{}', '{}', '{\"branchName\":\"Mumbai\",\"branchManager\":\"0aMTORQ27wG00Ht5REhq13p\",\"branchAddress\":\"Silverline Tower, Plot No. 15\\nSector 30, Vashi\\nNavi Mumbai, Maharashtra - 400705\"}', '{\"success\":true,\"message\":\"Branch created successfully\",\"data\":{\"id\":\"UH8lBWZZAkctwuRFiCz5PMB\",\"updated_by\":null,\"branchName\":\"Mumbai\",\"branchAddress\":\"Silverline Tower, Plot No. 15\\nSector 30, Vashi\\nNavi Mumbai, Maharashtra - 400705\",\"branchManager\":\"0a', '0.04 seconds', '2025-03-31 12:10:29', '2025-03-31 12:10:29'),
('XIwURzqeM30rWiCh2UXyXUW', '/api/v1/subscriptions?page=1&limit=10&search=', 'GET api/v1/subscriptions?page=1&limit=10&search=', '{}', '{}', '{}', '{\"success\":true,\"message\":\"Plans retrieved successfully\",\"data\":[{\"id\":\"uzptLdgqYFRoK23ORcMgQrg\",\"name\":\"Basic Plan\",\"currency\":\"INR\",\"price\":\"999.00\",\"duration\":\"Per Month\",\"trial_period\":\"7\",\"max_users\":\"5\",\"max_clients\":\"10\",\"max_customers\":\"50\",\"max_v', '0.02 seconds', '2025-03-31 14:43:10', '2025-03-31 14:43:10'),
('xJMpEj3tdflhoqEocwWhtgm', '/api/v1/roles', 'GET api/v1/roles', '{}', '{}', '{}', '{\"success\":true,\"message\":\"Roles fetched successfully\",\"data\":[{\"id\":\"03qarcBedPhsVY3A1IKMMyW\",\"role_name\":\"System Administrator\",\"permissions\":\"{\\\"dashboards-project-list\\\":[{\\\"key\\\":\\\"dashboards-project-list\\\",\\\"permissions\\\":[\\\"view\\\",\\\"create\\\",\\\"upda', '0.03 seconds', '2025-03-31 17:02:27', '2025-03-31 17:02:27'),
('xkIaHFHycJ1BFERQEqXKGkj', '/api/v1/labels/4kykUHcg5oLrhNDkfCLNYYG', 'GET api/v1/labels/4kykUHcg5oLrhNDkfCLNYYG', '{\"id\":\"4kykUHcg5oLrhNDkfCLNYYG\"}', '{}', '{}', '{\"success\":true,\"message\":\"Tags retrieved successfully\",\"data\":[{\"id\":\"0ga51ZccuIiGGEudOSNNRDJ\",\"related_id\":\"4kykUHcg5oLrhNDkfCLNYYG\",\"lableType\":\"source\",\"name\":\"Phone\",\"color\":\"#34495E\",\"client_id\":\"4kykUHcg5oLrhNDkfCLNYYG\",\"created_by\":\"system\",\"updat', '0.02 seconds', '2025-03-31 10:28:45', '2025-03-31 10:28:45'),
('Xn69wpG2g6Ts2snXsubeNAr', '/api/v1/sub-clients', 'GET api/v1/sub-clients', '{}', '{}', '{}', '{\"success\":true,\"message\":\"SubClients fetched successfully\",\"data\":[]}', '0.01 seconds', '2025-03-31 11:47:09', '2025-03-31 11:47:09'),
('xNOnnFICMRw8n9sxZCLtLVY', '/api/v1/clients', 'GET api/v1/clients', '{}', '{}', '{}', '{\"success\":true,\"message\":\"Clients fetched successfully\",\"data\":[{\"conversations\":{},\"id\":\"7aRxfVTXsxd31PyBz9WzEjx\",\"employeeId\":null,\"username\":\"Quantum Enterprises\",\"password\":\"$2b$12$OCduts6PI5L0YSEOVKT73uvS2zlUOaAPNMKWIxOO8tA/YpS1K.TRS\",\"email\":\"quant', '0.00 seconds', '2025-03-31 09:33:31', '2025-03-31 09:33:31'),
('xoe9ZgThW0ZfnoSfvCWIQac', '/api/v1/auth', 'GET api/v1/auth', '{}', '{}', '{}', '{\"success\":true,\"message\":\"Users fetched successfully\",\"data\":[{\"conversations\":{},\"id\":\"4kykUHcg5oLrhNDkfCLNYYG\",\"employeeId\":null,\"username\":\"Silverline Systems\",\"password\":\"$2b$12$.2Ia/XUZHrA7BEsLyf6uGuo9wgP9rGamovaR/ICL6YHHBDXVI5nIy\",\"email\":\"silverli', '0.01 seconds', '2025-03-31 11:19:09', '2025-03-31 11:19:09'),
('xPsUcuj6fZJemGuVhlPxh9d', '/api/v1/designations', 'POST api/v1/designations', '{}', '{}', '{\"designation_name\":\"HR Manager\",\"branch\":\"UH8lBWZZAkctwuRFiCz5PMB\"}', '{\"success\":true,\"message\":\"Designation created successfully\",\"data\":{\"id\":\"flbhBdf5hBLZTNbwhc12BY7\",\"updated_by\":null,\"branch\":\"UH8lBWZZAkctwuRFiCz5PMB\",\"designation_name\":\"HR Manager\",\"client_id\":\"4kykUHcg5oLrhNDkfCLNYYG\",\"created_by\":\"Silverline Systems', '0.01 seconds', '2025-03-31 12:27:32', '2025-03-31 12:27:32'),
('XrGUNDXeLn51e0rNkfREfSL', '/api/v1/countries?', 'GET api/v1/countries?', '{}', '{}', '{}', '{\"success\":true,\"message\":\"Countries fetched successfully\",\"data\":[{\"id\":\"0YNW00eJIaSTu6T8IZXJZ2W\",\"countryName\":\"Kuwait\",\"countryCode\":\"KW\",\"phoneCode\":\"+965\",\"created_by\":null,\"updated_by\":null,\"createdAt\":\"2025-03-31T03:52:28.000Z\",\"updatedAt\":\"2025-03', '0.07 seconds', '2025-03-31 17:23:44', '2025-03-31 17:23:44'),
('xSN0HY7GkirEKoNRMgpxpgf', '/api/v1/sub-clients', 'GET api/v1/sub-clients', '{}', '{}', '{}', '{\"success\":true,\"message\":\"SubClients fetched successfully\",\"data\":[{\"conversations\":{},\"id\":\"9VDWw1NRr3hnVRf82reZODt\",\"employeeId\":null,\"username\":\"Quantum Innovations\",\"password\":\"$2b$12$mn0gG674rbqCn0UiYh7kuuZPDY.iZquWfgnPbgjYrwphrOOTtty86\",\"email\":\"qu', '0.01 seconds', '2025-03-31 11:56:16', '2025-03-31 11:56:16'),
('xssGkuSpN4YsjIQ5IgCuMMl', '/api/v1/deals/dmciOE2OiF952YsPFd0NPQi', 'PUT api/v1/deals/dmciOE2OiF952YsPFd0NPQi', '{\"id\":\"dmciOE2OiF952YsPFd0NPQi\"}', '{}', '{\"stage\":\"ucHxzJDG8XiUl7sMzJz0OJL\"}', '{\"success\":true,\"message\":\"Deal updated successfully\",\"data\":{\"id\":\"dmciOE2OiF952YsPFd0NPQi\",\"leadTitle\":null,\"firstName\":null,\"lastName\":null,\"email\":null,\"phone\":null,\"dealName\":\"Cloud ERP Implementation\",\"pipeline\":\"iiUsXOteVUFiCIMkgR6DObO\",\"stage\":\"uc', '0.01 seconds', '2025-03-31 17:46:30', '2025-03-31 17:46:30'),
('XujEuCewouY1wI6f8dBhRJZ', '/api/v1/departments', 'POST api/v1/departments', '{}', '{}', '{\"department_name\":\"Development\",\"branch\":\"S99Ug8QEauke2Me7XhF29of\"}', '{\"success\":true,\"message\":\"Department created successfully\",\"data\":{\"id\":\"u0ppbSW5MNff5ylkVwO3Py4\",\"updated_by\":null,\"branch\":\"S99Ug8QEauke2Me7XhF29of\",\"department_name\":\"Development\",\"client_id\":\"4kykUHcg5oLrhNDkfCLNYYG\",\"created_by\":\"Silverline Systems\"', '0.01 seconds', '2025-03-31 12:22:22', '2025-03-31 12:22:22'),
('xwAHQihY3jHezNBoPc8tmm7', '/api/v1/invoices/dmciOE2OiF952YsPFd0NPQi', 'GET api/v1/invoices/dmciOE2OiF952YsPFd0NPQi', '{\"id\":\"dmciOE2OiF952YsPFd0NPQi\"}', '{}', '{}', '{\"success\":true,\"message\":\"Invoices fetched successfully\",\"data\":[]}', '0.01 seconds', '2025-03-31 17:48:07', '2025-03-31 17:48:07'),
('XwuWgQk2vst0AwrLqfc59BF', '/api/v1/labels/4kykUHcg5oLrhNDkfCLNYYG', 'GET api/v1/labels/4kykUHcg5oLrhNDkfCLNYYG', '{\"id\":\"4kykUHcg5oLrhNDkfCLNYYG\"}', '{}', '{}', '{\"success\":true,\"message\":\"Tags retrieved successfully\",\"data\":[{\"id\":\"0ga51ZccuIiGGEudOSNNRDJ\",\"related_id\":\"4kykUHcg5oLrhNDkfCLNYYG\",\"lableType\":\"source\",\"name\":\"Phone\",\"color\":\"#34495E\",\"client_id\":\"4kykUHcg5oLrhNDkfCLNYYG\",\"created_by\":\"system\",\"updat', '0.07 seconds', '2025-03-31 11:10:04', '2025-03-31 11:10:04'),
('XXRunBNPa4r0UR1DXk2XYxC', '/api/v1/auth', 'GET api/v1/auth', '{}', '{}', '{}', '{\"success\":true,\"message\":\"Users fetched successfully\",\"data\":[{\"conversations\":{},\"id\":\"4kykUHcg5oLrhNDkfCLNYYG\",\"employeeId\":null,\"username\":\"Silverline Systems\",\"password\":\"$2b$12$.2Ia/XUZHrA7BEsLyf6uGuo9wgP9rGamovaR/ICL6YHHBDXVI5nIy\",\"email\":\"silverli', '0.01 seconds', '2025-03-31 11:26:52', '2025-03-31 11:26:52'),
('XXUDQhE4fprbdv02keBiIMS', '/api/v1/sales-creditnote', 'GET api/v1/sales-creditnote', '{}', '{}', '{}', '{\"success\":true,\"message\":\"Sales credit note fetched successfully\",\"data\":[]}', '0.07 seconds', '2025-03-31 10:52:43', '2025-03-31 10:52:43'),
('xYkmM6E2rYZX77PsIUuFi9e', '/api/v1/auth/verify-signup', 'POST api/v1/auth/verify-signup', '{}', '{}', '{\"otp\":\"099836\"}', '{\"success\":true,\"message\":\"Registration completed successfully\",\"data\":{\"success\":true,\"token\":\"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IndQSGM5Y2lzcU96enBUVzBNcHpYOHBSIiwicm9sZSI6IlN5c3RlbSBBZG1pbmlzdHJhdG9yIiwiaWF0IjoxNzQzMzk5OTEyLCJleHAiOjE3NDM0OD', '2.37 seconds', '2025-03-31 11:15:14', '2025-03-31 11:15:14'),
('XZYgLHfuqeW7gsmI36taAMb', '/api/v1/auth/verify-signup', 'POST api/v1/auth/verify-signup', '{}', '{}', '{\"otp\":\"073733\"}', '{\"success\":true,\"message\":\"Registration completed successfully\",\"data\":{\"success\":true,\"token\":\"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6ImZSNThyQmxYRlRGaTl1NjRvQzYybExyIiwicm9sZSI6IlN1cHBvcnQgU3BlY2lhbGlzdCIsImlhdCI6MTc0MzQwMDYxMCwiZXhwIjoxNzQzNDg3MD', '2.59 seconds', '2025-03-31 11:26:52', '2025-03-31 11:26:52'),
('YcWe5HXux3fEimsR0hlpeV8', '/api/v1/super-admin', 'POST api/v1/super-admin', '{}', '{}', '{\"username\":\"superadmin\",\"email\":\"superadmin@nexisvision.com\",\"password\":\"SuperAdmin@123\",\"secret_key\":\"jufhuisahfuihuihuyg6trf7676788787ggbguyguNVNVNV\"}', '{\"success\":true,\"message\":\"Super admin created successfully\",\"data\":{\"profilePic\":null,\"firstName\":null,\"lastName\":null,\"phone\":null,\"created_by\":null,\"updated_by\":null,\"id\":\"e3qTU0bEmlIvYu8v4jFmjxv\",\"username\":\"superadmin\",\"email\":\"superadmin@nexisvision', '0.13 seconds', '2025-03-31 09:21:03', '2025-03-31 09:21:03'),
('yG5HrQEKwcZPbYmZXwdaLuO', '/api/v1/departments', 'POST api/v1/departments', '{}', '{}', '{\"department_name\":\"Development\",\"branch\":\"UH8lBWZZAkctwuRFiCz5PMB\"}', '{\"success\":false,\"message\":\"Department name already exists in the same branch\"}', '0.01 seconds', '2025-03-31 12:11:13', '2025-03-31 12:11:13'),
('YGMi70MlAoWsCPDqAWuOZhJ', '/api/v1/currencies?page=1&limit=100', 'GET api/v1/currencies?page=1&limit=100', '{}', '{\"page\":1,\"limit\":100}', '{}', '{\"success\":true,\"message\":\"Currencies fetched successfully\",\"data\":[{\"id\":\"29gCwt8wWQg7CPgG96847iD\",\"currencyName\":\"Euro\",\"currencyIcon\":\"€\",\"currencyCode\":\"EUR\",\"created_by\":null,\"updated_by\":null,\"createdAt\":\"2025-03-31T04:23:06.000Z\",\"updatedAt\":\"2025-', '0.03 seconds', '2025-03-31 17:03:21', '2025-03-31 17:03:21'),
('yH05elHCXVkXtbUKMO9J2Fq', '/api/v1/sub-clients', 'GET api/v1/sub-clients', '{}', '{}', '{}', '{\"success\":true,\"message\":\"SubClients fetched successfully\",\"data\":[{\"conversations\":{},\"id\":\"9VDWw1NRr3hnVRf82reZODt\",\"employeeId\":null,\"username\":\"Quantum Innovations\",\"password\":\"$2b$12$mn0gG674rbqCn0UiYh7kuuZPDY.iZquWfgnPbgjYrwphrOOTtty86\",\"email\":\"qu', '0.01 seconds', '2025-03-31 11:57:22', '2025-03-31 11:57:22'),
('Yh5Z7C4o4azxmRtGBY8OyqQ', '/api/v1/clients', 'GET api/v1/clients', '{}', '{}', '{}', '{\"success\":true,\"message\":\"Clients fetched successfully\",\"data\":[{\"conversations\":{},\"id\":\"AsPoso1y1OL5uY5URy57ZPw\",\"employeeId\":null,\"username\":\"GreenLeaf Solutions\",\"password\":\"$2b$12$jdkUAwOHEDU4Li1jNErGY.aJ/pFQwK8d9.7d8diQpXEj06F83taGG\",\"email\":\"green', '0.01 seconds', '2025-03-31 09:29:48', '2025-03-31 09:29:48'),
('YhDbROC6yko4RNSfL0KMeT0', '/api/v1/stages', 'GET api/v1/stages', '{}', '{}', '{}', '{\"success\":true,\"message\":\"Stages fetched successfully\",\"data\":[{\"id\":\"1j1Mfax4tYdOONQGLA23CeQ\",\"stageType\":\"deal\",\"stageName\":\"Lead Received\",\"pipeline\":\"iiUsXOteVUFiCIMkgR6DObO\",\"client_id\":\"4kykUHcg5oLrhNDkfCLNYYG\",\"created_by\":\"Silverline Systems\",\"up', '0.25 seconds', '2025-03-31 11:41:48', '2025-03-31 11:41:48'),
('YKtNJOTnHS2VuUVk01KdFOT', '/api/v1/employees', 'POST api/v1/employees', '{}', '{}', '{\"firstName\":\"Amit \",\"lastName\":\"Kumar\",\"username\":\"amit.kumar\",\"email\":\"amit.kumar.silverline@yopmail.com\",\"password\":\"Amitkumar@2525\",\"phone\":\"7654321098\",\"address\":\"Royal Meadows\\nPlot No. 78, Palm Street\\nJubilee Hills, Road No. 5\\nHyderabad, Telangan', '{\"success\":true,\"message\":\"Please verify your email to complete registration\",\"data\":{\"sessionToken\":\"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjRreWtVSGNnNW9McmhORGtmQ0xOWVlHIiwidXNlcm5hbWUiOiJhbWl0Lmt1bWFyIiwiZW1haWwiOiJhbWl0Lmt1bWFyLnNpbHZlcmxpbmVA', '2.90 seconds', '2025-03-31 12:48:21', '2025-03-31 12:48:21'),
('YLLVGt8xB0QCo9IdFcSTbvT', '/api/v1/auth/verify-signup', 'POST api/v1/auth/verify-signup', '{}', '{}', '{\"otp\":\"935674\"}', '{\"success\":true,\"message\":\"Registration completed successfully\",\"data\":{\"success\":true,\"token\":\"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6InJrN3ExV0gybmpQbklPUng2T3pINDl4Iiwicm9sZSI6IlRlY2huaWNhbCBMZWFkIiwiaWF0IjoxNzQzNDAwMTQ2LCJleHAiOjE3NDM0ODY1NDZ9.w', '2.41 seconds', '2025-03-31 11:19:09', '2025-03-31 11:19:09'),
('yma5r0iJtIekOaTZROo9wgK', '/api/v1/clients', 'GET api/v1/clients', '{}', '{}', '{}', '{\"success\":true,\"message\":\"Clients fetched successfully\",\"data\":[{\"conversations\":{},\"id\":\"4kykUHcg5oLrhNDkfCLNYYG\",\"employeeId\":null,\"username\":\"Silverline Systems\",\"password\":\"$2b$12$.2Ia/XUZHrA7BEsLyf6uGuo9wgP9rGamovaR/ICL6YHHBDXVI5nIy\",\"email\":\"silver', '0.01 seconds', '2025-03-31 09:43:25', '2025-03-31 09:43:25'),
('yNa5Nv4upYK2icRFUQIlqnW', '/api/v1/leads/YXfrACvHnsutJstpTU5Tu24', 'PUT api/v1/leads/YXfrACvHnsutJstpTU5Tu24', '{\"id\":\"YXfrACvHnsutJstpTU5Tu24\"}', '{}', '{\"leadStage\":\"icIkzFa9jKpV26cO64IJS7f\"}', '{\"success\":true,\"message\":\"Lead updated successfully!\",\"data\":{\"id\":\"YXfrACvHnsutJstpTU5Tu24\",\"leadTitle\":\"HealthCare App Development\",\"leadStage\":\"icIkzFa9jKpV26cO64IJS7f\",\"currency\":\"INR\",\"leadValue\":1500000,\"company_name\":\"MediTech Solutions\",\"firstNam', '0.01 seconds', '2025-03-31 16:57:11', '2025-03-31 16:57:11'),
('ynJGWJgbUvUikzhCvfxzzGV', '/api/v1/pipelines', 'GET api/v1/pipelines', '{}', '{}', '{}', '{\"success\":true,\"message\":\"Pipelines fetched successfully\",\"data\":[{\"id\":\"iiUsXOteVUFiCIMkgR6DObO\",\"pipeline_name\":\"Marketing\",\"client_id\":\"4kykUHcg5oLrhNDkfCLNYYG\",\"created_by\":\"Silverline Systems\",\"updated_by\":null,\"createdAt\":\"2025-03-31T05:00:29.000Z\"', '0.04 seconds', '2025-03-31 10:50:09', '2025-03-31 10:50:09'),
('ynK82iA8KI4nxaBIJuaHkvY', '/api/v1/leads/YlSczjJh8OpXkCVEZYpMIs9', 'PUT api/v1/leads/YlSczjJh8OpXkCVEZYpMIs9', '{\"id\":\"YlSczjJh8OpXkCVEZYpMIs9\"}', '{}', '{\"leadStage\":\"icIkzFa9jKpV26cO64IJS7f\"}', '{\"success\":true,\"message\":\"Lead updated successfully!\",\"data\":{\"id\":\"YlSczjJh8OpXkCVEZYpMIs9\",\"leadTitle\":\"Global Retail IT Infrastructure\",\"leadStage\":\"icIkzFa9jKpV26cO64IJS7f\",\"currency\":\"INR\",\"leadValue\":2500000,\"company_name\":\"Global Retail Corp\",\"fir', '0.01 seconds', '2025-03-31 16:57:12', '2025-03-31 16:57:12'),
('ynPicI9DBo4UMM1TStv6yqy', '/api/v1/clients', 'POST api/v1/clients', '{}', '{}', '{\"username\":\"TechVision Dynamics\",\"email\":\"techVisiondynamics@yopmail.com\",\"password\":\"TechVisionDynamics@2525\"}', '{\"success\":true,\"message\":\"OTP sent to email\",\"data\":{\"sessionToken\":\"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6ImUzcVRVMGJFbWxJdll1OHY0akZtanh2IiwidXNlcm5hbWUiOiJUZWNoVmlzaW9uIER5bmFtaWNzIiwiZW1haWwiOiJ0ZWNoVmlzaW9uZHluYW1pY3NAeW9wbWFpbC5jb20iLCJyb2xl', '4.39 seconds', '2025-03-31 09:27:22', '2025-03-31 09:27:22'),
('yq5lRDYx1eO7Ov5GDlZdc96', '/api/v1/auth/signup', 'POST api/v1/auth/signup', '{}', '{}', '{\"username\":\"admin.silverline\",\"email\":\"admin.silverline@yopmail.com\",\"password\":\"Adminsilverline@2525\",\"role_id\":\"03qarcBedPhsVY3A1IKMMyW\"}', '{\"success\":true,\"message\":\"Please verify your email to complete registration\",\"data\":{\"sessionToken\":\"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjRreWtVSGNnNW9McmhORGtmQ0xOWVlHIiwidXNlcm5hbWUiOiJhZG1pbi5zaWx2ZXJsaW5lIiwiZW1haWwiOiJhZG1pbi5zaWx2ZXJsaW5l', '3.49 seconds', '2025-03-31 11:14:57', '2025-03-31 11:14:57'),
('YqeBpxhe1hH13tK3lJI7GnY', '/api/v1/designations', 'POST api/v1/designations', '{}', '{}', '{\"designation_name\":\"UI/UX Designer\",\"branch\":\"bjHlRDFkaJBOh3kg2EP52VH\"}', '{\"success\":true,\"message\":\"Designation created successfully\",\"data\":{\"id\":\"K3jNwVDdbFPaIah2U3nBh9B\",\"updated_by\":null,\"branch\":\"bjHlRDFkaJBOh3kg2EP52VH\",\"designation_name\":\"UI/UX Designer\",\"client_id\":\"4kykUHcg5oLrhNDkfCLNYYG\",\"created_by\":\"Silverline Sys', '0.01 seconds', '2025-03-31 12:29:47', '2025-03-31 12:29:47'),
('yr2bnnRSxi9YN1AWB86BZiR', '/api/v1/stages', 'GET api/v1/stages', '{}', '{}', '{}', '{\"success\":true,\"message\":\"Stages fetched successfully\",\"data\":[{\"id\":\"1j1Mfax4tYdOONQGLA23CeQ\",\"stageType\":\"deal\",\"stageName\":\"Lead Received\",\"pipeline\":\"iiUsXOteVUFiCIMkgR6DObO\",\"client_id\":\"4kykUHcg5oLrhNDkfCLNYYG\",\"created_by\":\"Silverline Systems\",\"up', '0.01 seconds', '2025-03-31 16:00:54', '2025-03-31 16:00:54'),
('yr8GeqiTISH2bGp2TRQ0M0G', '/api/v1/labels/4kykUHcg5oLrhNDkfCLNYYG', 'GET api/v1/labels/4kykUHcg5oLrhNDkfCLNYYG', '{\"id\":\"4kykUHcg5oLrhNDkfCLNYYG\"}', '{}', '{}', '{\"success\":true,\"message\":\"Tags retrieved successfully\",\"data\":[{\"id\":\"0ga51ZccuIiGGEudOSNNRDJ\",\"related_id\":\"4kykUHcg5oLrhNDkfCLNYYG\",\"lableType\":\"source\",\"name\":\"Phone\",\"color\":\"#34495E\",\"client_id\":\"4kykUHcg5oLrhNDkfCLNYYG\",\"created_by\":\"system\",\"updat', '0.04 seconds', '2025-03-31 15:54:49', '2025-03-31 15:54:49'),
('yRJ0YahJAArwitiP40DPY5p', '/api/v1/taxes', 'GET api/v1/taxes', '{}', '{}', '{}', '{\"success\":true,\"message\":\"Tax fetched successfully\",\"data\":[]}', '0.05 seconds', '2025-03-31 17:16:06', '2025-03-31 17:16:06'),
('YsSM3Pwxq5Otbx2OMLcIFYo', '/api/v1/labels/4kykUHcg5oLrhNDkfCLNYYG', 'GET api/v1/labels/4kykUHcg5oLrhNDkfCLNYYG', '{\"id\":\"4kykUHcg5oLrhNDkfCLNYYG\"}', '{}', '{}', '{\"success\":true,\"message\":\"Tags retrieved successfully\",\"data\":[{\"id\":\"0ga51ZccuIiGGEudOSNNRDJ\",\"related_id\":\"4kykUHcg5oLrhNDkfCLNYYG\",\"lableType\":\"source\",\"name\":\"Phone\",\"color\":\"#34495E\",\"client_id\":\"4kykUHcg5oLrhNDkfCLNYYG\",\"created_by\":\"system\",\"updat', '0.01 seconds', '2025-03-31 14:31:48', '2025-03-31 14:31:48'),
('yVAeAkSwmo9aIMgNiFZtbvp', '/api/v1/labels/4kykUHcg5oLrhNDkfCLNYYG', 'GET api/v1/labels/4kykUHcg5oLrhNDkfCLNYYG', '{\"id\":\"4kykUHcg5oLrhNDkfCLNYYG\"}', '{}', '{}', '{\"success\":true,\"message\":\"Tags retrieved successfully\",\"data\":[{\"id\":\"0ga51ZccuIiGGEudOSNNRDJ\",\"related_id\":\"4kykUHcg5oLrhNDkfCLNYYG\",\"lableType\":\"source\",\"name\":\"Phone\",\"color\":\"#34495E\",\"client_id\":\"4kykUHcg5oLrhNDkfCLNYYG\",\"created_by\":\"system\",\"updat', '0.01 seconds', '2025-03-31 14:31:27', '2025-03-31 14:31:27'),
('ywj0rsDuEqEqZtxOPGrozQa', '/api/v1/leads', 'GET api/v1/leads', '{}', '{}', '{}', '{\"success\":true,\"message\":\"Lead fetched successfully\",\"data\":[{\"id\":\"31LINvHYSM5u4avuq7Wrjlh\",\"leadTitle\":\"TechPro Solutions Website Modernization\",\"leadStage\":\"BYNYLCidEQll0qKymn79W76\",\"currency\":\"INR\",\"leadValue\":850000,\"company_name\":\" TechPro Solution', '0.01 seconds', '2025-03-31 17:12:32', '2025-03-31 17:12:32'),
('z3gXdoh0acJfEDxJejACltw', '/api/v1/auth/verify-signup', 'POST api/v1/auth/verify-signup', '{}', '{}', '{\"otp\":\"394540\"}', '{\"success\":true,\"message\":\"Registration completed successfully\",\"data\":{\"success\":true,\"token\":\"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IlJEeUVnQXhRNWNkRVRxMVhlamxDV3hlIiwicm9sZSI6ImVtcGxveWVlIiwiaWF0IjoxNzQzNDA1MzI1LCJleHAiOjE3NDM0OTE3MjV9.IIfQLFw-O', '2.46 seconds', '2025-03-31 12:45:27', '2025-03-31 12:45:27'),
('Z4W1rLM7b6hNQQCuWowOx7r', '/api/v1/branches', 'POST api/v1/branches', '{}', '{}', '{\"branchName\":\"Bangalore\",\"branchManager\":\"wPHc9cisqOzzpTW0MpzX8pR\",\"branchAddress\":\"Tech Park One, 4th Floor\\nWhitefield Main Road\\nBangalore, Karnataka - 560066\"}', '{\"success\":true,\"message\":\"Branch created successfully\",\"data\":{\"id\":\"bjHlRDFkaJBOh3kg2EP52VH\",\"updated_by\":null,\"branchName\":\"Bangalore\",\"branchAddress\":\"Tech Park One, 4th Floor\\nWhitefield Main Road\\nBangalore, Karnataka - 560066\",\"branchManager\":\"wPHc', '0.01 seconds', '2025-03-31 12:20:04', '2025-03-31 12:20:04'),
('Z5war5l2whuWMpA9mbvkB7I', '/api/v1/employees', 'GET api/v1/employees', '{}', '{}', '{}', '{\"success\":true,\"message\":\"Employees fetched successfully\",\"data\":[]}', '0.01 seconds', '2025-03-31 12:40:35', '2025-03-31 12:40:35'),
('z7gCKqtF4wYh5rwrlkT6oQt', '/api/v1/departments', 'GET api/v1/departments', '{}', '{}', '{}', '{\"success\":true,\"message\":\"Department fetched successfully\",\"data\":[{\"id\":\"6aVUek1kX78VHjoDjhnJDAD\",\"branch\":\"UH8lBWZZAkctwuRFiCz5PMB\",\"department_name\":\"Development\",\"client_id\":\"4kykUHcg5oLrhNDkfCLNYYG\",\"created_by\":\"Silverline Systems\",\"updated_by\":nul', '0.01 seconds', '2025-03-31 12:11:00', '2025-03-31 12:11:00'),
('Z94k4WTImkkPbdzDS2koVQH', '/api/v1/departments', 'GET api/v1/departments', '{}', '{}', '{}', '{\"success\":true,\"message\":\"Department fetched successfully\",\"data\":[{\"id\":\"0DQCpwzdzU2mZWnGcqM91AC\",\"branch\":\"haQEJiCePwC0KeJsmUWsSZ7\",\"department_name\":\" Sales\",\"client_id\":\"4kykUHcg5oLrhNDkfCLNYYG\",\"created_by\":\"Silverline Systems\",\"updated_by\":null,\"cr', '0.01 seconds', '2025-03-31 12:24:55', '2025-03-31 12:24:55'),
('zAkPgjKVwOLYkAaQXW6PGpR', '/api/v1/subscriptions?page=1&limit=10&search=', 'GET api/v1/subscriptions?page=1&limit=10&search=', '{}', '{}', '{}', '{\"success\":true,\"message\":\"Plans retrieved successfully\",\"data\":[{\"id\":\"uzptLdgqYFRoK23ORcMgQrg\",\"name\":\"Basic Plan\",\"currency\":\"INR\",\"price\":\"999.00\",\"duration\":\"Per Month\",\"trial_period\":\"7\",\"max_users\":\"5\",\"max_clients\":\"10\",\"max_customers\":\"50\",\"max_v', '0.02 seconds', '2025-03-31 10:23:13', '2025-03-31 10:23:13'),
('zM2P76Hd6qj7qdvMr3lGfM6', '/api/v1/proposals?page=1&limit=10', 'GET api/v1/proposals?page=1&limit=10', '{}', '{\"page\":\"1\",\"limit\":\"10\"}', '{}', '{\"success\":true,\"message\":\"Proposal fetched successfully\",\"data\":[]}', '0.05 seconds', '2025-03-31 17:16:06', '2025-03-31 17:16:06'),
('zM7mpTPv2SrmK1puCUeN5J7', '/api/v1/labels/4kykUHcg5oLrhNDkfCLNYYG', 'GET api/v1/labels/4kykUHcg5oLrhNDkfCLNYYG', '{\"id\":\"4kykUHcg5oLrhNDkfCLNYYG\"}', '{}', '{}', '{\"success\":true,\"message\":\"Tags retrieved successfully\",\"data\":[{\"id\":\"0ga51ZccuIiGGEudOSNNRDJ\",\"related_id\":\"4kykUHcg5oLrhNDkfCLNYYG\",\"lableType\":\"source\",\"name\":\"Phone\",\"color\":\"#34495E\",\"client_id\":\"4kykUHcg5oLrhNDkfCLNYYG\",\"created_by\":\"system\",\"updat', '0.01 seconds', '2025-03-31 14:31:37', '2025-03-31 14:31:37'),
('zNKbAHBS9E1B41NXHCWcQip', '/api/v1/clients', 'GET api/v1/clients', '{}', '{}', '{}', '{\"success\":true,\"message\":\"Clients fetched successfully\",\"data\":[{\"conversations\":{},\"id\":\"4kykUHcg5oLrhNDkfCLNYYG\",\"employeeId\":null,\"username\":\"Silverline Systems\",\"password\":\"$2b$12$.2Ia/XUZHrA7BEsLyf6uGuo9wgP9rGamovaR/ICL6YHHBDXVI5nIy\",\"email\":\"silver', '0.03 seconds', '2025-03-31 09:46:32', '2025-03-31 09:46:32'),
('zp15WRk3eVfhF6tw9Px2Vw7', '/api/v1/leads', 'GET api/v1/leads', '{}', '{}', '{}', '{\"success\":true,\"message\":\"Lead fetched successfully\",\"data\":[{\"id\":\"31LINvHYSM5u4avuq7Wrjlh\",\"leadTitle\":\"TechPro Solutions Website Modernization\",\"leadStage\":\"eTzCUBr5Y232i82lxUoP9vJ\",\"currency\":\"INR\",\"leadValue\":850000,\"company_name\":\" TechPro Solution', '0.11 seconds', '2025-03-31 14:37:20', '2025-03-31 14:37:20'),
('zQGTvCtAuninpxhUB9KNk5p', '/api/v1/labels/4kykUHcg5oLrhNDkfCLNYYG', 'GET api/v1/labels/4kykUHcg5oLrhNDkfCLNYYG', '{\"id\":\"4kykUHcg5oLrhNDkfCLNYYG\"}', '{}', '{}', '{\"success\":true,\"message\":\"Tags retrieved successfully\",\"data\":[{\"id\":\"0ga51ZccuIiGGEudOSNNRDJ\",\"related_id\":\"4kykUHcg5oLrhNDkfCLNYYG\",\"lableType\":\"source\",\"name\":\"Phone\",\"color\":\"#34495E\",\"client_id\":\"4kykUHcg5oLrhNDkfCLNYYG\",\"created_by\":\"system\",\"updat', '0.01 seconds', '2025-03-31 10:31:11', '2025-03-31 10:31:11'),
('zqP6fO44yxhrFJC2NXsMvIn', '/api/v1/roles', 'GET api/v1/roles', '{}', '{}', '{}', '{\"success\":true,\"message\":\"Roles fetched successfully\",\"data\":[{\"id\":\"03qarcBedPhsVY3A1IKMMyW\",\"role_name\":\"System Administrator\",\"permissions\":\"{\\\"dashboards-project-list\\\":[{\\\"key\\\":\\\"dashboards-project-list\\\",\\\"permissions\\\":[\\\"view\\\",\\\"create\\\",\\\"upda', '0.07 seconds', '2025-03-31 15:54:49', '2025-03-31 15:54:49'),
('zsWHnPJIQi6MoiMvmfId2gT', '/api/v1/auth/admin-login', 'POST api/v1/auth/admin-login', '{}', '{}', '{\"email\":\"silverlinesystems@yopmail.com\"}', '{\"success\":true,\"message\":\"Login successful\",\"data\":{\"token\":\"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6IlNpbHZlcmxpbmUgU3lzdGVtcyIsImVtYWlsIjoic2lsdmVybGluZXN5c3RlbXNAeW9wbWFpbC5jb20iLCJwaG9uZSI6bnVsbCwiaWQiOiI0a3lrVUhjZzVvTHJoTkRrZkNMTllZRyIs', '0.01 seconds', '2025-03-31 10:12:35', '2025-03-31 10:12:35'),
('zSYX1ETwfYL0Km6NozwBx9j', '/api/v1/branches', 'GET api/v1/branches', '{}', '{}', '{}', '{\"success\":true,\"message\":\"Branches fetched successfully\",\"data\":[{\"id\":\"bjHlRDFkaJBOh3kg2EP52VH\",\"branchName\":\"Bangalore\",\"branchAddress\":\"Tech Park One, 4th Floor\\nWhitefield Main Road\\nBangalore, Karnataka - 560066\",\"branchManager\":\"wPHc9cisqOzzpTW0Mpz', '0.01 seconds', '2025-03-31 12:21:16', '2025-03-31 12:21:16'),
('ZtBVfZCeuRYGsLMm2M60pVa', '/api/v1/products', 'GET api/v1/products', '{}', '{}', '{}', '{\"success\":true,\"message\":\"Product fetched successfully\",\"data\":[]}', '0.06 seconds', '2025-03-31 10:50:09', '2025-03-31 10:50:09'),
('zVLlNWQKBHR0MKwhAtzZIle', '/api/v1/designations', 'GET api/v1/designations', '{}', '{}', '{}', '{\"success\":true,\"message\":\"Designation fetched successfully\",\"data\":[{\"id\":\"flbhBdf5hBLZTNbwhc12BY7\",\"branch\":\"UH8lBWZZAkctwuRFiCz5PMB\",\"designation_name\":\"HR Manager\",\"client_id\":\"4kykUHcg5oLrhNDkfCLNYYG\",\"created_by\":\"Silverline Systems\",\"updated_by\":nu', '0.07 seconds', '2025-03-31 12:32:13', '2025-03-31 12:32:13'),
('zxaAZ1ncZsiuDLDCmhdizxz', '/api/v1/leads', 'GET api/v1/leads', '{}', '{}', '{}', '{\"success\":true,\"message\":\"Lead fetched successfully\",\"data\":[]}', '0.08 seconds', '2025-03-31 11:10:04', '2025-03-31 11:10:04'),
('ZY6dmPnI2EpLmjVavxn2XkT', '/api/v1/branches', 'GET api/v1/branches', '{}', '{}', '{}', '{\"success\":true,\"message\":\"Branches fetched successfully\",\"data\":[{\"id\":\"UH8lBWZZAkctwuRFiCz5PMB\",\"branchName\":\"Mumbai\",\"branchAddress\":\"Silverline Tower, Plot No. 15\\nSector 30, Vashi\\nNavi Mumbai, Maharashtra - 400705\",\"branchManager\":\"0aMTORQ27wG00Ht5R', '0.01 seconds', '2025-03-31 12:17:47', '2025-03-31 12:17:47'),
('Zyg6iHpn4ybLLXV936elPpP', '/api/v1/auth', 'GET api/v1/auth', '{}', '{}', '{}', '{\"success\":true,\"message\":\"Users fetched successfully\",\"data\":[{\"conversations\":{},\"id\":\"0aMTORQ27wG00Ht5REhq13p\",\"employeeId\":null,\"username\":\" ba.silverline\",\"password\":\"$2b$12$NT.meyBZRWfJve/VLDgQo.bwhzGz1ElPJcoihKL2lokuJpOAqHk6W\",\"email\":\"ba.silverlin', '0.06 seconds', '2025-03-31 18:05:12', '2025-03-31 18:05:12');

-- --------------------------------------------------------

--
-- Table structure for table `awards`
--

CREATE TABLE `awards` (
  `id` varchar(255) NOT NULL,
  `employee` varchar(255) NOT NULL,
  `awardType` varchar(255) NOT NULL,
  `date` datetime NOT NULL,
  `gift` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `created_by` varchar(255) DEFAULT NULL,
  `updated_by` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `awardtypes`
--

CREATE TABLE `awardtypes` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_by` varchar(255) DEFAULT NULL,
  `updated_by` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `billdebitnotes`
--

CREATE TABLE `billdebitnotes` (
  `id` varchar(255) NOT NULL,
  `bill` varchar(255) NOT NULL,
  `date` datetime NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `client_id` varchar(255) DEFAULT NULL,
  `created_by` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `bills`
--

CREATE TABLE `bills` (
  `id` varchar(255) NOT NULL,
  `related_id` varchar(255) NOT NULL,
  `billNumber` varchar(255) DEFAULT NULL,
  `vendor` varchar(255) NOT NULL,
  `billDate` datetime NOT NULL,
  `discription` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`discription`)),
  `items` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`items`)),
  `status` varchar(255) NOT NULL,
  `updated_total` int(11) DEFAULT NULL,
  `bill_status` varchar(255) DEFAULT NULL,
  `discount` int(11) NOT NULL,
  `tax` int(11) NOT NULL,
  `total` int(11) NOT NULL,
  `note` varchar(255) DEFAULT NULL,
  `client_id` varchar(255) DEFAULT NULL,
  `craeted_by` varchar(255) DEFAULT NULL,
  `updated_by` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `bills`
--

INSERT INTO `bills` (`id`, `related_id`, `billNumber`, `vendor`, `billDate`, `discription`, `items`, `status`, `updated_total`, `bill_status`, `discount`, `tax`, `total`, `note`, `client_id`, `craeted_by`, `updated_by`, `createdAt`, `updatedAt`) VALUES
('j0Yyz6b1zsJFTTOMeclna9m', 'PLGtptJFFV4blMJfFi8AeBR', 'BILL#1', '4kykUHcg5oLrhNDkfCLNYYG', '2025-03-31 10:13:55', '\"pls pay bill\"', '0', 'paid', NULL, NULL, 0, 0, 999, 'Thank you for subscribing to our service', '4kykUHcg5oLrhNDkfCLNYYG', NULL, NULL, '2025-03-31 10:13:55', '2025-03-31 10:13:55');

-- --------------------------------------------------------

--
-- Table structure for table `bill_payments`
--

CREATE TABLE `bill_payments` (
  `id` varchar(255) NOT NULL,
  `bill` varchar(255) NOT NULL,
  `account` varchar(255) NOT NULL,
  `amount` float NOT NULL,
  `date` datetime NOT NULL,
  `reference` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `client_id` varchar(255) DEFAULT NULL,
  `created_by` varchar(255) DEFAULT NULL,
  `updated_by` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `branches`
--

CREATE TABLE `branches` (
  `id` varchar(255) NOT NULL,
  `branchName` varchar(255) NOT NULL,
  `branchAddress` varchar(255) NOT NULL,
  `branchManager` varchar(255) NOT NULL,
  `client_id` varchar(255) DEFAULT NULL,
  `created_by` varchar(255) DEFAULT NULL,
  `updated_by` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `branches`
--

INSERT INTO `branches` (`id`, `branchName`, `branchAddress`, `branchManager`, `client_id`, `created_by`, `updated_by`, `createdAt`, `updatedAt`) VALUES
('bjHlRDFkaJBOh3kg2EP52VH', 'Bangalore', 'Tech Park One, 4th Floor\nWhitefield Main Road\nBangalore, Karnataka - 560066', 'wPHc9cisqOzzpTW0MpzX8pR', '4kykUHcg5oLrhNDkfCLNYYG', 'Silverline Systems', NULL, '2025-03-31 12:20:04', '2025-03-31 12:20:04'),
('haQEJiCePwC0KeJsmUWsSZ7', 'Delhi ', 'Cyber Hub, Tower B, 3rd Floor\nSector 18, Gurugram\nDelhi NCR, Haryana - 122002', 'W3LxNVQLCC7zrhxTyTlBnvz', '4kykUHcg5oLrhNDkfCLNYYG', 'Silverline Systems', NULL, '2025-03-31 12:20:50', '2025-03-31 12:20:50'),
('NwHBv2Lg2D3w5gZgx5o3sy9', 'Hyderabad', 'Cyber Gateway, Block 2\nHITEC City, Madhapur\nHyderabad, Telangana - 500081', 'wPHc9cisqOzzpTW0MpzX8pR', '4kykUHcg5oLrhNDkfCLNYYG', 'Silverline Systems', NULL, '2025-03-31 12:21:45', '2025-03-31 12:21:45'),
('S99Ug8QEauke2Me7XhF29of', 'Pune', 'IT Park Plaza, Wing A\nHinjewadi Phase III\nPune, Maharashtra - 411057', 'rk7q1WH2njPnIORx6OzH49x', '4kykUHcg5oLrhNDkfCLNYYG', 'Silverline Systems', NULL, '2025-03-31 12:21:16', '2025-03-31 12:21:16'),
('UH8lBWZZAkctwuRFiCz5PMB', 'Mumbai', 'Silverline Tower, Plot No. 15\nSector 30, Vashi\nNavi Mumbai, Maharashtra - 400705', 'wPHc9cisqOzzpTW0MpzX8pR', '4kykUHcg5oLrhNDkfCLNYYG', 'Silverline Systems', 'Silverline Systems', '2025-03-31 12:10:29', '2025-03-31 12:18:20');

-- --------------------------------------------------------

--
-- Table structure for table `calendars`
--

CREATE TABLE `calendars` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `startDate` datetime NOT NULL,
  `endDate` datetime NOT NULL,
  `color` varchar(255) NOT NULL,
  `client_id` varchar(255) NOT NULL,
  `created_by` varchar(255) DEFAULT NULL,
  `updated_by` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `clientsubscriptions`
--

CREATE TABLE `clientsubscriptions` (
  `id` varchar(255) NOT NULL,
  `client_id` varchar(255) NOT NULL,
  `plan_id` varchar(255) DEFAULT NULL,
  `start_date` datetime NOT NULL,
  `end_date` datetime DEFAULT NULL,
  `start_time` time NOT NULL,
  `end_time` time DEFAULT NULL,
  `status` enum('active','trial','expired','inactive') DEFAULT 'trial',
  `current_storage_used` int(11) DEFAULT 0,
  `current_users_count` int(11) DEFAULT 0,
  `current_clients_count` int(11) DEFAULT 0,
  `current_vendors_count` int(11) DEFAULT 0,
  `current_customers_count` int(11) DEFAULT 0,
  `payment_status` enum('paid','unpaid') DEFAULT 'unpaid',
  `last_payment_date` datetime DEFAULT NULL,
  `created_by` varchar(255) DEFAULT NULL,
  `updated_by` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `clientsubscriptions`
--

INSERT INTO `clientsubscriptions` (`id`, `client_id`, `plan_id`, `start_date`, `end_date`, `start_time`, `end_time`, `status`, `current_storage_used`, `current_users_count`, `current_clients_count`, `current_vendors_count`, `current_customers_count`, `payment_status`, `last_payment_date`, `created_by`, `updated_by`, `createdAt`, `updatedAt`) VALUES
('PLGtptJFFV4blMJfFi8AeBR', '4kykUHcg5oLrhNDkfCLNYYG', 'uzptLdgqYFRoK23ORcMgQrg', '2025-03-21 05:30:00', '2025-04-07 23:59:59', '00:00:00', '23:59:59', 'active', 0, 0, 0, 0, 0, 'paid', NULL, 'superadmin', NULL, '2025-03-31 10:13:55', '2025-03-31 10:13:55');

-- --------------------------------------------------------

--
-- Table structure for table `commissions`
--

CREATE TABLE `commissions` (
  `id` varchar(255) NOT NULL,
  `employeeId` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `currency` varchar(255) NOT NULL,
  `amount` int(11) NOT NULL,
  `client_id` varchar(255) NOT NULL,
  `created_by` varchar(255) DEFAULT NULL,
  `updated_by` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `competencies`
--

CREATE TABLE `competencies` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `created_by` varchar(255) DEFAULT NULL,
  `updated_by` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `contracts`
--

CREATE TABLE `contracts` (
  `id` varchar(255) NOT NULL,
  `contract_number` varchar(255) DEFAULT NULL,
  `subject` varchar(255) NOT NULL,
  `client` varchar(255) NOT NULL,
  `project` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `value` int(11) NOT NULL,
  `startDate` datetime NOT NULL,
  `endDate` datetime NOT NULL,
  `description` text DEFAULT NULL,
  `currency` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `city` varchar(255) NOT NULL,
  `state` varchar(255) NOT NULL,
  `country` varchar(255) NOT NULL,
  `zipcode` int(11) NOT NULL,
  `address` varchar(255) NOT NULL,
  `notes` varchar(255) NOT NULL,
  `client_id` varchar(255) NOT NULL,
  `created_by` varchar(255) DEFAULT NULL,
  `updated_by` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `countries`
--

CREATE TABLE `countries` (
  `id` varchar(255) NOT NULL,
  `countryName` varchar(255) NOT NULL,
  `countryCode` varchar(255) NOT NULL,
  `phoneCode` varchar(255) NOT NULL,
  `created_by` varchar(255) DEFAULT NULL,
  `updated_by` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `countries`
--

INSERT INTO `countries` (`id`, `countryName`, `countryCode`, `phoneCode`, `created_by`, `updated_by`, `createdAt`, `updatedAt`) VALUES
('0YNW00eJIaSTu6T8IZXJZ2W', 'Kuwait', 'KW', '+965', NULL, NULL, '2025-03-31 09:22:28', '2025-03-31 09:22:28'),
('5c0M7TOSJpKeHOoLVquu8tl', 'United States', 'US', '+1', NULL, NULL, '2025-03-31 09:22:28', '2025-03-31 09:22:28'),
('7etpMZ1rIYGJyIfwboQkjTA', 'Brazil', 'BR', '+55', NULL, NULL, '2025-03-31 09:22:28', '2025-03-31 09:22:28'),
('8VOrz6Z7QQSsQxoUlggSA9s', 'United Arab Emirates', 'AE', '+971', NULL, NULL, '2025-03-31 09:22:28', '2025-03-31 09:22:28'),
('94AEqDnnPHJr5mVpZ0YDiGQ', 'India', 'IN', '+91', NULL, NULL, '2025-03-31 09:22:28', '2025-03-31 09:22:28'),
('A9kBIwdqm91RcaW1VBVNCTt', 'Saudi Arabia', 'SA', '+966', NULL, NULL, '2025-03-31 09:22:28', '2025-03-31 09:22:28'),
('abZx4IABaE58ras5Kqsyq15', 'Mexico', 'MX', '+52', NULL, NULL, '2025-03-31 09:22:28', '2025-03-31 09:22:28'),
('hmhlbCtroExNA97i0ZqhZht', 'South Korea', 'KR', '+82', NULL, NULL, '2025-03-31 09:22:28', '2025-03-31 09:22:28'),
('k4ZE6m9sKno8SUTGJcbBmEr', 'Russia', 'RU', '+7', NULL, NULL, '2025-03-31 09:22:28', '2025-03-31 09:22:28'),
('nHGFr7m7RUwc0g03MFuy2v8', 'Australia', 'AU', '+61', NULL, NULL, '2025-03-31 09:22:28', '2025-03-31 09:22:28'),
('nOyr8h0QR7ov9rEw93OvhAx', 'United Kingdom', 'GB', '+44', NULL, NULL, '2025-03-31 09:22:28', '2025-03-31 09:22:28'),
('o09fUgALCTQWAGE1Fciobe7', 'Oman', 'OM', '+968', NULL, NULL, '2025-03-31 09:22:28', '2025-03-31 09:22:28'),
('pLgtsgYKz4mktOEs6wcfwD8', 'Germany', 'DE', '+49', NULL, NULL, '2025-03-31 09:22:28', '2025-03-31 09:22:28'),
('RnAoMqnir6mO5RHZIia3zWR', 'France', 'FR', '+33', NULL, NULL, '2025-03-31 09:22:28', '2025-03-31 09:22:28'),
('sAnCiBflu2ETUuktDbZhmyj', 'Japan', 'JP', '+81', NULL, NULL, '2025-03-31 09:22:28', '2025-03-31 09:22:28'),
('t5chn0LxDvOpgIudlr36yPA', 'Singapore', 'SG', '+65', NULL, NULL, '2025-03-31 09:22:28', '2025-03-31 09:22:28'),
('U46AhTCVAXT9Cf7jXcUe6NQ', 'Bahrain', 'BH', '+973', NULL, NULL, '2025-03-31 09:22:28', '2025-03-31 09:22:28'),
('W1cGoTiHtNEIl78qv9oLLqg', 'Qatar', 'QA', '+974', NULL, NULL, '2025-03-31 09:22:28', '2025-03-31 09:22:28'),
('x6rGvnU34X4HSmBvBlCJP8A', 'China', 'CN', '+86', NULL, NULL, '2025-03-31 09:22:28', '2025-03-31 09:22:28');

-- --------------------------------------------------------

--
-- Table structure for table `currencies`
--

CREATE TABLE `currencies` (
  `id` varchar(255) NOT NULL,
  `currencyName` varchar(255) NOT NULL,
  `currencyIcon` varchar(255) NOT NULL,
  `currencyCode` varchar(255) NOT NULL,
  `created_by` varchar(255) DEFAULT NULL,
  `updated_by` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `currencies`
--

INSERT INTO `currencies` (`id`, `currencyName`, `currencyIcon`, `currencyCode`, `created_by`, `updated_by`, `createdAt`, `updatedAt`) VALUES
('29gCwt8wWQg7CPgG96847iD', 'Euro', '€', 'EUR', NULL, NULL, '2025-03-31 09:53:06', '2025-03-31 09:53:06'),
('6bbT8jbkTjrzUE1qFMI53kd', 'Qatari Riyal', 'ر.ق', 'QAR', NULL, NULL, '2025-03-31 09:53:06', '2025-03-31 09:53:06'),
('9oI5wsDdZjmpMMX215uKGxi', 'Bahraini Dinar', 'د.ب', 'BHD', NULL, NULL, '2025-03-31 09:53:06', '2025-03-31 09:53:06'),
('ADxgemzprQrhHMWEZZCcd2l', 'Kuwaiti Dinar', 'د.ك', 'KWD', NULL, NULL, '2025-03-31 09:53:06', '2025-03-31 09:53:06'),
('aK1Oyv2hxGPlY4wgDCYop5Q', 'Swiss Franc', 'Fr', 'CHF', NULL, NULL, '2025-03-31 09:53:06', '2025-03-31 09:53:06'),
('cIFLWheTIznJ0lkPCp7ImLt', 'Japanese Yen', '¥', 'JPY', NULL, NULL, '2025-03-31 09:53:06', '2025-03-31 09:53:06'),
('drmf8sVyPrHwhtwvM9Zn6FZ', 'Saudi Riyal', 'ر.س', 'SAR', NULL, NULL, '2025-03-31 09:53:06', '2025-03-31 09:53:06'),
('FuUDGWt8oIkTV3KWjVevHgL', 'Russian Ruble', '₽', 'RUB', NULL, NULL, '2025-03-31 09:53:06', '2025-03-31 09:53:06'),
('Hs6wc0e6qRWnZcVsxTFihgk', 'Norwegian Krone', 'kr', 'NOK', NULL, NULL, '2025-03-31 09:53:06', '2025-03-31 09:53:06'),
('IahuSQsEjSVue5CXBXlQJoO', 'Swedish Krona', 'kr', 'SEK', NULL, NULL, '2025-03-31 09:53:06', '2025-03-31 09:53:06'),
('itjplSyEGkyHtKfD1PEU4il', 'Chinese Yuan', '¥', 'CNY', NULL, NULL, '2025-03-31 09:53:06', '2025-03-31 09:53:06'),
('IYOXAXfj1wJ3niT1dOwH658', 'British Pound', '£', 'GBP', NULL, NULL, '2025-03-31 09:53:06', '2025-03-31 09:53:06'),
('kDE66HNDAj2HLjnGYdjIxnL', 'Australian Dollar', 'A$', 'AUD', NULL, NULL, '2025-03-31 09:53:06', '2025-03-31 09:53:06'),
('kgsJ3p4jxULy5kPWrF8BkTC', 'South African Rand', 'R', 'ZAR', NULL, NULL, '2025-03-31 09:53:06', '2025-03-31 09:53:06'),
('lUSReJof3ppsaKlfYpQc87s', 'New Zealand Dollar', '$', 'NZD', NULL, NULL, '2025-03-31 09:53:06', '2025-03-31 09:53:06'),
('maaAmXZQklchnAJeO3KyNcs', 'UAE Dirham', 'د.إ', 'AED', NULL, NULL, '2025-03-31 09:53:06', '2025-03-31 09:53:06'),
('nkip2Ot3B2Uzvr4p6z5AhX9', 'Brazilian Real', 'R$', 'BRL', NULL, NULL, '2025-03-31 09:53:06', '2025-03-31 09:53:06'),
('ntSpOtJ2QckU64OT1Bjf44O', 'Singapore Dollar', 'S$', 'SGD', NULL, NULL, '2025-03-31 09:53:06', '2025-03-31 09:53:06'),
('ovuaNNZc0bQe8XvQCBos1JQ', 'Omani Rial', 'ر.ع.', 'OMR', NULL, NULL, '2025-03-31 09:53:06', '2025-03-31 09:53:06'),
('ppccHmazr4PrKSkjs9Q8E9k', 'Hong Kong Dollar', '$', 'HKD', NULL, NULL, '2025-03-31 09:53:06', '2025-03-31 09:53:06'),
('qxPVbyfAo5CHhf7lDEIxUP2', 'Mexican Peso', '$', 'MXN', NULL, NULL, '2025-03-31 09:53:06', '2025-03-31 09:53:06'),
('RQuPN6TPCTZ3P2wm7VvL0aY', 'Indian Rupee', '₹', 'INR', NULL, NULL, '2025-03-31 09:53:06', '2025-03-31 09:53:06'),
('TVFIVccG0uT31Yq5PCIkVCy', 'Danish Krone', 'kr', 'DKK', NULL, NULL, '2025-03-31 09:53:06', '2025-03-31 09:53:06'),
('UZgkTql5T3tZPlhljJC4dg7', 'US Dollar', '$', 'USD', NULL, NULL, '2025-03-31 09:53:06', '2025-03-31 09:53:06'),
('vQElIMR9UiZ6CdXgHl2qAQx', 'Canadian Dollar', 'C$', 'CAD', NULL, NULL, '2025-03-31 09:53:06', '2025-03-31 09:53:06'),
('wKbG56cI5SC1tV9EMFZ2oDA', 'Turkish Lira', '₺', 'TRY', NULL, NULL, '2025-03-31 09:53:06', '2025-03-31 09:53:06'),
('yHcjtHiyePJH3Rw8ds1MvE0', 'South Korean Won', '₩', 'KRW', NULL, NULL, '2025-03-31 09:53:06', '2025-03-31 09:53:06');

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `id` varchar(255) NOT NULL,
  `related_id` varchar(255) NOT NULL,
  `customerNumber` varchar(255) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `contact` varchar(255) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `tax_number` varchar(255) DEFAULT NULL,
  `alternate_number` varchar(255) DEFAULT NULL,
  `billing_address` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`billing_address`)),
  `shipping_address` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`shipping_address`)),
  `client_id` varchar(255) NOT NULL,
  `created_by` varchar(255) DEFAULT NULL,
  `updated_by` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `deals`
--

CREATE TABLE `deals` (
  `id` varchar(255) NOT NULL,
  `leadTitle` varchar(255) DEFAULT NULL,
  `firstName` varchar(255) DEFAULT NULL,
  `lastName` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `dealName` varchar(255) NOT NULL,
  `pipeline` varchar(255) DEFAULT NULL,
  `stage` varchar(255) DEFAULT NULL,
  `status` enum('won','lost','pending') DEFAULT 'pending',
  `label` varchar(255) DEFAULT NULL,
  `value` float DEFAULT NULL,
  `currency` varchar(255) DEFAULT NULL,
  `closedDate` datetime DEFAULT NULL,
  `company_name` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `website` varchar(255) DEFAULT NULL,
  `products` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`products`)),
  `files` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`files`)),
  `assigned_to` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`assigned_to`)),
  `source` varchar(255) DEFAULT NULL,
  `project` varchar(255) DEFAULT NULL,
  `client_id` varchar(255) NOT NULL,
  `created_by` varchar(255) DEFAULT NULL,
  `updated_by` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `deals`
--

INSERT INTO `deals` (`id`, `leadTitle`, `firstName`, `lastName`, `email`, `phone`, `dealName`, `pipeline`, `stage`, `status`, `label`, `value`, `currency`, `closedDate`, `company_name`, `address`, `website`, `products`, `files`, `assigned_to`, `source`, `project`, `client_id`, `created_by`, `updated_by`, `createdAt`, `updatedAt`) VALUES
('dmciOE2OiF952YsPFd0NPQi', NULL, NULL, NULL, NULL, NULL, 'Cloud ERP Implementation', 'iiUsXOteVUFiCIMkgR6DObO', 'ucHxzJDG8XiUl7sMzJz0OJL', 'pending', NULL, 4500000, 'INR', '2025-04-01 00:00:00', NULL, NULL, NULL, '{\"products\":[]}', NULL, NULL, '0PTjfmVnNoWVG697TEecBoT', NULL, '4kykUHcg5oLrhNDkfCLNYYG', 'Silverline Systems', 'Silverline Systems', '2025-03-31 17:46:09', '2025-03-31 17:46:18');

-- --------------------------------------------------------

--
-- Table structure for table `deductionoptions`
--

CREATE TABLE `deductionoptions` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `client_id` varchar(255) NOT NULL,
  `created_by` varchar(255) DEFAULT NULL,
  `updated_by` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `deductions`
--

CREATE TABLE `deductions` (
  `id` varchar(255) NOT NULL,
  `employeeId` varchar(255) NOT NULL,
  `deductionOption` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `currency` varchar(255) NOT NULL,
  `amount` int(11) NOT NULL,
  `client_id` varchar(255) NOT NULL,
  `created_by` varchar(255) DEFAULT NULL,
  `updated_by` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `departments`
--

CREATE TABLE `departments` (
  `id` varchar(255) NOT NULL,
  `branch` varchar(255) NOT NULL,
  `department_name` varchar(255) NOT NULL,
  `client_id` varchar(255) NOT NULL,
  `created_by` varchar(255) DEFAULT NULL,
  `updated_by` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `departments`
--

INSERT INTO `departments` (`id`, `branch`, `department_name`, `client_id`, `created_by`, `updated_by`, `createdAt`, `updatedAt`) VALUES
('0DQCpwzdzU2mZWnGcqM91AC', 'haQEJiCePwC0KeJsmUWsSZ7', ' Sales', '4kykUHcg5oLrhNDkfCLNYYG', 'Silverline Systems', NULL, '2025-03-31 12:23:56', '2025-03-31 12:23:56'),
('6aVUek1kX78VHjoDjhnJDAD', 'UH8lBWZZAkctwuRFiCz5PMB', 'Development', '4kykUHcg5oLrhNDkfCLNYYG', 'Silverline Systems', NULL, '2025-03-31 12:11:00', '2025-03-31 12:11:00'),
('8Yhv5i8Eu5y3rn3kJLY8VWC', 'UH8lBWZZAkctwuRFiCz5PMB', 'HR', '4kykUHcg5oLrhNDkfCLNYYG', 'Silverline Systems', NULL, '2025-03-31 12:27:18', '2025-03-31 12:27:18'),
('mXwMtsZBDZktY3YRkoRvAvi', 'haQEJiCePwC0KeJsmUWsSZ7', 'QA', '4kykUHcg5oLrhNDkfCLNYYG', 'Silverline Systems', NULL, '2025-03-31 12:28:02', '2025-03-31 12:28:02'),
('pUzEV1Givmo50CcSeJCyz5V', 'bjHlRDFkaJBOh3kg2EP52VH', 'Marketing', '4kykUHcg5oLrhNDkfCLNYYG', 'Silverline Systems', NULL, '2025-03-31 12:24:54', '2025-03-31 12:24:54'),
('SBBmsTisLcE4qEOzLvlYZv2', 'UH8lBWZZAkctwuRFiCz5PMB', 'Finance', '4kykUHcg5oLrhNDkfCLNYYG', 'Silverline Systems', NULL, '2025-03-31 12:23:15', '2025-03-31 12:23:15'),
('u0ppbSW5MNff5ylkVwO3Py4', 'S99Ug8QEauke2Me7XhF29of', 'Development', '4kykUHcg5oLrhNDkfCLNYYG', 'Silverline Systems', NULL, '2025-03-31 12:22:22', '2025-03-31 12:22:22'),
('WpZ22PfzjzV1wJkWa5vjaRv', 'bjHlRDFkaJBOh3kg2EP52VH', ' Design', '4kykUHcg5oLrhNDkfCLNYYG', 'Silverline Systems', NULL, '2025-03-31 12:29:13', '2025-03-31 12:29:13');

-- --------------------------------------------------------

--
-- Table structure for table `designations`
--

CREATE TABLE `designations` (
  `id` varchar(255) NOT NULL,
  `branch` varchar(255) NOT NULL,
  `designation_name` varchar(255) NOT NULL,
  `client_id` varchar(255) NOT NULL,
  `created_by` varchar(255) DEFAULT NULL,
  `updated_by` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `designations`
--

INSERT INTO `designations` (`id`, `branch`, `designation_name`, `client_id`, `created_by`, `updated_by`, `createdAt`, `updatedAt`) VALUES
('flbhBdf5hBLZTNbwhc12BY7', 'UH8lBWZZAkctwuRFiCz5PMB', 'HR Manager', '4kykUHcg5oLrhNDkfCLNYYG', 'Silverline Systems', NULL, '2025-03-31 12:27:32', '2025-03-31 12:27:32'),
('K3jNwVDdbFPaIah2U3nBh9B', 'bjHlRDFkaJBOh3kg2EP52VH', 'UI/UX Designer', '4kykUHcg5oLrhNDkfCLNYYG', 'Silverline Systems', NULL, '2025-03-31 12:29:47', '2025-03-31 12:29:47'),
('LaqJYdtzPX2CHjbxPYthMrD', 'UH8lBWZZAkctwuRFiCz5PMB', 'Finance Analyst', '4kykUHcg5oLrhNDkfCLNYYG', 'Silverline Systems', NULL, '2025-03-31 12:23:26', '2025-03-31 12:23:26'),
('rCylZ4VP6j9yVdlY4nK6nUD', 'S99Ug8QEauke2Me7XhF29of', 'Full Stack Developer', '4kykUHcg5oLrhNDkfCLNYYG', 'Silverline Systems', NULL, '2025-03-31 12:26:31', '2025-03-31 12:26:31'),
('UUBCv7KfYd6JRjBUizsgD4o', 'UH8lBWZZAkctwuRFiCz5PMB', 'Senior Software Engineer', '4kykUHcg5oLrhNDkfCLNYYG', 'Silverline Systems', NULL, '2025-03-31 12:12:36', '2025-03-31 12:12:36'),
('X2KYPor0OTGDRcP4b0h9nE5', 'haQEJiCePwC0KeJsmUWsSZ7', 'Test Lead', '4kykUHcg5oLrhNDkfCLNYYG', 'Silverline Systems', NULL, '2025-03-31 12:28:33', '2025-03-31 12:28:33'),
('yXI8GkxJY3UmNlPQ7rqWdvN', 'S99Ug8QEauke2Me7XhF29of', 'Backend Developer', '4kykUHcg5oLrhNDkfCLNYYG', 'Silverline Systems', NULL, '2025-03-31 12:22:38', '2025-03-31 12:22:38'),
('ZNJ9V5UAAoNO3DhdXGoYFr9', 'bjHlRDFkaJBOh3kg2EP52VH', 'Marketing Manager', '4kykUHcg5oLrhNDkfCLNYYG', 'Silverline Systems', NULL, '2025-03-31 12:25:14', '2025-03-31 12:25:14'),
('ZUxdUD2SYQiKojDORUPrULQ', 'haQEJiCePwC0KeJsmUWsSZ7', 'Sales Executive', '4kykUHcg5oLrhNDkfCLNYYG', 'Silverline Systems', NULL, '2025-03-31 12:24:30', '2025-03-31 12:24:30');

-- --------------------------------------------------------

--
-- Table structure for table `documents`
--

CREATE TABLE `documents` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `role` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `file` varchar(255) DEFAULT NULL,
  `client_id` varchar(255) NOT NULL,
  `created_by` varchar(255) DEFAULT NULL,
  `updated_by` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `documenttypes`
--

CREATE TABLE `documenttypes` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `isRequired` tinyint(1) NOT NULL,
  `client_id` varchar(255) NOT NULL,
  `created_by` varchar(255) DEFAULT NULL,
  `updated_by` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `emails`
--

CREATE TABLE `emails` (
  `id` varchar(255) NOT NULL,
  `from` varchar(255) NOT NULL,
  `to` varchar(255) NOT NULL,
  `subject` varchar(255) NOT NULL,
  `html` text DEFAULT NULL,
  `isRead` tinyint(1) NOT NULL DEFAULT 0,
  `created_by` varchar(255) DEFAULT NULL,
  `updated_by` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `emails`
--

INSERT INTO `emails` (`id`, `from`, `to`, `subject`, `html`, `isRead`, `created_by`, `updated_by`, `createdAt`, `updatedAt`) VALUES
('1bmWvxs3sLlFW8TWZD2f1Uk', 'codedatayash0@gmail.com', 'silverlinesystems@yopmail.com', 'Verify Your Email', '\n<!DOCTYPE html>\n<html>\n<head>\n    <link href=\"https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600&display=swap\" rel=\"stylesheet\">\n    <style>\n        * {\n            font-family: \'Poppins\', sans-serif !important;\n        }\n        .email-container {\n            max-width: 600px;\n            margin: 0 auto;\n            color: #2c3e50;\n            background-color: #f8f9fa;\n            border-radius: 12px;\n            overflow: hidden;\n            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);\n        }\n        .header {\n            padding: 40px 20px;\n            text-align: center;\n            background: #ffffff;\n        }\n        .logo {\n            width: 200px;\n            height: auto;\n            margin: 0 auto;\n            display: block;\n            filter: drop-shadow(0 2px 4px rgba(0, 0, 0, 0.2));\n        }\n        .content {\n            padding: 40px;\n            background-color: #ffffff;\n            border-radius: 12px 12px 0 0;\n            margin-top: -20px;\n        }\n        .title {\n            color: #744bcb;\n            font-size: 24px;\n            font-weight: bold;\n            margin-bottom: 20px;\n            text-align: center;\n        }\n        .button-container {\n            text-align: center;\n            margin: 20px 0;\n        }\n        .button {\n            display: inline-block;\n            padding: 14px 28px;\n            background: #744bcb !important;\n            color: #ffffff !important;\n            text-decoration: none !important;\n            border-radius: 8px;\n            font-weight: bold;\n            text-align: center;\n            width: 200px;\n        }\n        .footer {\n            text-align: center;\n            padding: 30px;\n            background-color: #f8f9fa;\n            color: #666;\n            font-size: 14px;\n            border-top: 1px solid #eee;\n        }\n        .social-links {\n            margin: 20px 0;\n        }\n        .social-link {\n            margin: 0 10px;\n            color: #744bcb;\n            text-decoration: none;\n        }\n    </style>\n</head>\n<body>\n    <div class=\"email-container\">\n        <div class=\"content\">\n            \n        <div class=\"title\">Verify Your Email</div>\n        <p>Hello Silverline Systems!</p>\n        <p>Welcome to CRM! Please verify your email with this OTP:</p>\n        <div style=\"text-align: center; margin: 30px 0;\">\n            <span style=\"font-size: 32px; font-weight: bold; color: #744bcb; letter-spacing: 5px; padding: 10px 20px; background: #f8f9fa; border-radius: 8px;\">724345</span>\n        </div>\n        <p style=\"text-align: center; color: #666;\">This OTP will expire in 5 minutes.</p>\n    \n        </div>\n        <div class=\"footer\">\n            <div class=\"social-links\">\n                <a href=\"#\" class=\"social-link\">Facebook</a>\n                <a href=\"#\" class=\"social-link\">Twitter</a>\n                <a href=\"#\" class=\"social-link\">Instagram</a>\n            </div>\n            <p> 2025 CRM. All rights reserved.</p>\n        </div>\n    </div>\n</body>\n</html>\n', 0, 'codedatayash0@gmail.com', 'codedatayash0@gmail.com', '2025-03-31 09:41:09', '2025-03-31 09:41:09'),
('1hfuRoh38DeSBrq0DhIwxNL', 'codedatayash0@gmail.com', 'amit.kumar.silverline@yopmail.com', 'Welcome to CRM!', '\n<!DOCTYPE html>\n<html>\n<head>\n    <link href=\"https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600&display=swap\" rel=\"stylesheet\">\n    <style>\n        * {\n            font-family: \'Poppins\', sans-serif !important;\n        }\n        .email-container {\n            max-width: 600px;\n            margin: 0 auto;\n            color: #2c3e50;\n            background-color: #f8f9fa;\n            border-radius: 12px;\n            overflow: hidden;\n            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);\n        }\n        .header {\n            padding: 40px 20px;\n            text-align: center;\n            background: #ffffff;\n        }\n        .logo {\n            width: 200px;\n            height: auto;\n            margin: 0 auto;\n            display: block;\n            filter: drop-shadow(0 2px 4px rgba(0, 0, 0, 0.2));\n        }\n        .content {\n            padding: 40px;\n            background-color: #ffffff;\n            border-radius: 12px 12px 0 0;\n            margin-top: -20px;\n        }\n        .title {\n            color: #744bcb;\n            font-size: 24px;\n            font-weight: bold;\n            margin-bottom: 20px;\n            text-align: center;\n        }\n        .button-container {\n            text-align: center;\n            margin: 20px 0;\n        }\n        .button {\n            display: inline-block;\n            padding: 14px 28px;\n            background: #744bcb !important;\n            color: #ffffff !important;\n            text-decoration: none !important;\n            border-radius: 8px;\n            font-weight: bold;\n            text-align: center;\n            width: 200px;\n        }\n        .footer {\n            text-align: center;\n            padding: 30px;\n            background-color: #f8f9fa;\n            color: #666;\n            font-size: 14px;\n            border-top: 1px solid #eee;\n        }\n        .social-links {\n            margin: 20px 0;\n        }\n        .social-link {\n            margin: 0 10px;\n            color: #744bcb;\n            text-decoration: none;\n        }\n    </style>\n</head>\n<body>\n    <div class=\"email-container\">\n        <div class=\"content\">\n            \n        <div class=\"title\">Welcome to CRM, amit.kumar! 🎉</div>\n        <p>Thank you for joining our CRM management platform. We\'re excited to help you organize and manage your Company\'s information effectively.</p>\n        <div style=\"background-color: #f8f9fa; padding: 20px; border-radius: 8px; margin: 20px 0;\">\n            <div style=\"margin: 12px 0;\">✨ Manage your Company\'s information easily</div>\n            <div style=\"margin: 12px 0;\">🔒 Securely share information with your team</div>\n        </div>\n        <div class=\"button-container\">\n            <a href=\"http://localhost:5173/login\" class=\"button\">Get Started</a>\n        </div>\n    \n        </div>\n        <div class=\"footer\">\n            <div class=\"social-links\">\n                <a href=\"#\" class=\"social-link\">Facebook</a>\n                <a href=\"#\" class=\"social-link\">Twitter</a>\n                <a href=\"#\" class=\"social-link\">Instagram</a>\n            </div>\n            <p> 2025 CRM. All rights reserved.</p>\n        </div>\n    </div>\n</body>\n</html>\n', 0, 'codedatayash0@gmail.com', 'codedatayash0@gmail.com', '2025-03-31 12:48:52', '2025-03-31 12:48:52'),
('1wxXyfBQ0H4A8rXUMLcEyb5', 'codedatayash0@gmail.com', 'techpro.solutions@yopmail.com', 'Verify Your Email', '\n<!DOCTYPE html>\n<html>\n<head>\n    <link href=\"https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600&display=swap\" rel=\"stylesheet\">\n    <style>\n        * {\n            font-family: \'Poppins\', sans-serif !important;\n        }\n        .email-container {\n            max-width: 600px;\n            margin: 0 auto;\n            color: #2c3e50;\n            background-color: #f8f9fa;\n            border-radius: 12px;\n            overflow: hidden;\n            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);\n        }\n        .header {\n            padding: 40px 20px;\n            text-align: center;\n            background: #ffffff;\n        }\n        .logo {\n            width: 200px;\n            height: auto;\n            margin: 0 auto;\n            display: block;\n            filter: drop-shadow(0 2px 4px rgba(0, 0, 0, 0.2));\n        }\n        .content {\n            padding: 40px;\n            background-color: #ffffff;\n            border-radius: 12px 12px 0 0;\n            margin-top: -20px;\n        }\n        .title {\n            color: #744bcb;\n            font-size: 24px;\n            font-weight: bold;\n            margin-bottom: 20px;\n            text-align: center;\n        }\n        .button-container {\n            text-align: center;\n            margin: 20px 0;\n        }\n        .button {\n            display: inline-block;\n            padding: 14px 28px;\n            background: #744bcb !important;\n            color: #ffffff !important;\n            text-decoration: none !important;\n            border-radius: 8px;\n            font-weight: bold;\n            text-align: center;\n            width: 200px;\n        }\n        .footer {\n            text-align: center;\n            padding: 30px;\n            background-color: #f8f9fa;\n            color: #666;\n            font-size: 14px;\n            border-top: 1px solid #eee;\n        }\n        .social-links {\n            margin: 20px 0;\n        }\n        .social-link {\n            margin: 0 10px;\n            color: #744bcb;\n            text-decoration: none;\n        }\n    </style>\n</head>\n<body>\n    <div class=\"email-container\">\n        <div class=\"content\">\n            \n        <div class=\"title\">Verify Your Email</div>\n        <p>Hello TechPro Solutions!</p>\n        <p>Welcome to CRM! Please verify your email with this OTP:</p>\n        <div style=\"text-align: center; margin: 30px 0;\">\n            <span style=\"font-size: 32px; font-weight: bold; color: #744bcb; letter-spacing: 5px; padding: 10px 20px; background: #f8f9fa; border-radius: 8px;\">631104</span>\n        </div>\n        <p style=\"text-align: center; color: #666;\">This OTP will expire in 5 minutes.</p>\n    \n        </div>\n        <div class=\"footer\">\n            <div class=\"social-links\">\n                <a href=\"#\" class=\"social-link\">Facebook</a>\n                <a href=\"#\" class=\"social-link\">Twitter</a>\n                <a href=\"#\" class=\"social-link\">Instagram</a>\n            </div>\n            <p> 2025 CRM. All rights reserved.</p>\n        </div>\n    </div>\n</body>\n</html>\n', 0, 'codedatayash0@gmail.com', 'codedatayash0@gmail.com', '2025-03-31 11:47:09', '2025-03-31 11:47:09'),
('2B97VCLYSYxFsSE019Ft7dr', 'codedatayash0@gmail.com', 'neha.singh.silverline@yopmail.com', 'Welcome to CRM!', '\n<!DOCTYPE html>\n<html>\n<head>\n    <link href=\"https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600&display=swap\" rel=\"stylesheet\">\n    <style>\n        * {\n            font-family: \'Poppins\', sans-serif !important;\n        }\n        .email-container {\n            max-width: 600px;\n            margin: 0 auto;\n            color: #2c3e50;\n            background-color: #f8f9fa;\n            border-radius: 12px;\n            overflow: hidden;\n            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);\n        }\n        .header {\n            padding: 40px 20px;\n            text-align: center;\n            background: #ffffff;\n        }\n        .logo {\n            width: 200px;\n            height: auto;\n            margin: 0 auto;\n            display: block;\n            filter: drop-shadow(0 2px 4px rgba(0, 0, 0, 0.2));\n        }\n        .content {\n            padding: 40px;\n            background-color: #ffffff;\n            border-radius: 12px 12px 0 0;\n            margin-top: -20px;\n        }\n        .title {\n            color: #744bcb;\n            font-size: 24px;\n            font-weight: bold;\n            margin-bottom: 20px;\n            text-align: center;\n        }\n        .button-container {\n            text-align: center;\n            margin: 20px 0;\n        }\n        .button {\n            display: inline-block;\n            padding: 14px 28px;\n            background: #744bcb !important;\n            color: #ffffff !important;\n            text-decoration: none !important;\n            border-radius: 8px;\n            font-weight: bold;\n            text-align: center;\n            width: 200px;\n        }\n        .footer {\n            text-align: center;\n            padding: 30px;\n            background-color: #f8f9fa;\n            color: #666;\n            font-size: 14px;\n            border-top: 1px solid #eee;\n        }\n        .social-links {\n            margin: 20px 0;\n        }\n        .social-link {\n            margin: 0 10px;\n            color: #744bcb;\n            text-decoration: none;\n        }\n    </style>\n</head>\n<body>\n    <div class=\"email-container\">\n        <div class=\"content\">\n            \n        <div class=\"title\">Welcome to CRM, neha.singh! 🎉</div>\n        <p>Thank you for joining our CRM management platform. We\'re excited to help you organize and manage your Company\'s information effectively.</p>\n        <div style=\"background-color: #f8f9fa; padding: 20px; border-radius: 8px; margin: 20px 0;\">\n            <div style=\"margin: 12px 0;\">✨ Manage your Company\'s information easily</div>\n            <div style=\"margin: 12px 0;\">🔒 Securely share information with your team</div>\n        </div>\n        <div class=\"button-container\">\n            <a href=\"http://localhost:5173/login\" class=\"button\">Get Started</a>\n        </div>\n    \n        </div>\n        <div class=\"footer\">\n            <div class=\"social-links\">\n                <a href=\"#\" class=\"social-link\">Facebook</a>\n                <a href=\"#\" class=\"social-link\">Twitter</a>\n                <a href=\"#\" class=\"social-link\">Instagram</a>\n            </div>\n            <p> 2025 CRM. All rights reserved.</p>\n        </div>\n    </div>\n</body>\n</html>\n', 0, 'codedatayash0@gmail.com', 'codedatayash0@gmail.com', '2025-03-31 12:53:20', '2025-03-31 12:53:20'),
('4W0mlcU6fg7wcPw9ccrxOxx', 'codedatayash0@gmail.com', 'evergreenindustries@yopmail.com', 'Welcome to CRM!', '\n<!DOCTYPE html>\n<html>\n<head>\n    <link href=\"https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600&display=swap\" rel=\"stylesheet\">\n    <style>\n        * {\n            font-family: \'Poppins\', sans-serif !important;\n        }\n        .email-container {\n            max-width: 600px;\n            margin: 0 auto;\n            color: #2c3e50;\n            background-color: #f8f9fa;\n            border-radius: 12px;\n            overflow: hidden;\n            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);\n        }\n        .header {\n            padding: 40px 20px;\n            text-align: center;\n            background: #ffffff;\n        }\n        .logo {\n            width: 200px;\n            height: auto;\n            margin: 0 auto;\n            display: block;\n            filter: drop-shadow(0 2px 4px rgba(0, 0, 0, 0.2));\n        }\n        .content {\n            padding: 40px;\n            background-color: #ffffff;\n            border-radius: 12px 12px 0 0;\n            margin-top: -20px;\n        }\n        .title {\n            color: #744bcb;\n            font-size: 24px;\n            font-weight: bold;\n            margin-bottom: 20px;\n            text-align: center;\n        }\n        .button-container {\n            text-align: center;\n            margin: 20px 0;\n        }\n        .button {\n            display: inline-block;\n            padding: 14px 28px;\n            background: #744bcb !important;\n            color: #ffffff !important;\n            text-decoration: none !important;\n            border-radius: 8px;\n            font-weight: bold;\n            text-align: center;\n            width: 200px;\n        }\n        .footer {\n            text-align: center;\n            padding: 30px;\n            background-color: #f8f9fa;\n            color: #666;\n            font-size: 14px;\n            border-top: 1px solid #eee;\n        }\n        .social-links {\n            margin: 20px 0;\n        }\n        .social-link {\n            margin: 0 10px;\n            color: #744bcb;\n            text-decoration: none;\n        }\n    </style>\n</head>\n<body>\n    <div class=\"email-container\">\n        <div class=\"content\">\n            \n        <div class=\"title\">Welcome to CRM, Evergreen Industries! 🎉</div>\n        <p>Thank you for joining our CRM management platform. We\'re excited to help you organize and manage your Company\'s information effectively.</p>\n        <div style=\"background-color: #f8f9fa; padding: 20px; border-radius: 8px; margin: 20px 0;\">\n            <div style=\"margin: 12px 0;\">✨ Manage your Company\'s information easily</div>\n            <div style=\"margin: 12px 0;\">🔒 Securely share information with your team</div>\n        </div>\n        <div class=\"button-container\">\n            <a href=\"http://localhost:5173/login\" class=\"button\">Get Started</a>\n        </div>\n    \n        </div>\n        <div class=\"footer\">\n            <div class=\"social-links\">\n                <a href=\"#\" class=\"social-link\">Facebook</a>\n                <a href=\"#\" class=\"social-link\">Twitter</a>\n                <a href=\"#\" class=\"social-link\">Instagram</a>\n            </div>\n            <p> 2025 CRM. All rights reserved.</p>\n        </div>\n    </div>\n</body>\n</html>\n', 0, 'codedatayash0@gmail.com', 'codedatayash0@gmail.com', '2025-03-31 09:36:55', '2025-03-31 09:36:55'),
('5Rj2iOwVNrNnJu89ClKZya8', 'codedatayash0@gmail.com', 'priya.patel.silverline@yopmail.com', 'Welcome to CRM!', '\n<!DOCTYPE html>\n<html>\n<head>\n    <link href=\"https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600&display=swap\" rel=\"stylesheet\">\n    <style>\n        * {\n            font-family: \'Poppins\', sans-serif !important;\n        }\n        .email-container {\n            max-width: 600px;\n            margin: 0 auto;\n            color: #2c3e50;\n            background-color: #f8f9fa;\n            border-radius: 12px;\n            overflow: hidden;\n            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);\n        }\n        .header {\n            padding: 40px 20px;\n            text-align: center;\n            background: #ffffff;\n        }\n        .logo {\n            width: 200px;\n            height: auto;\n            margin: 0 auto;\n            display: block;\n            filter: drop-shadow(0 2px 4px rgba(0, 0, 0, 0.2));\n        }\n        .content {\n            padding: 40px;\n            background-color: #ffffff;\n            border-radius: 12px 12px 0 0;\n            margin-top: -20px;\n        }\n        .title {\n            color: #744bcb;\n            font-size: 24px;\n            font-weight: bold;\n            margin-bottom: 20px;\n            text-align: center;\n        }\n        .button-container {\n            text-align: center;\n            margin: 20px 0;\n        }\n        .button {\n            display: inline-block;\n            padding: 14px 28px;\n            background: #744bcb !important;\n            color: #ffffff !important;\n            text-decoration: none !important;\n            border-radius: 8px;\n            font-weight: bold;\n            text-align: center;\n            width: 200px;\n        }\n        .footer {\n            text-align: center;\n            padding: 30px;\n            background-color: #f8f9fa;\n            color: #666;\n            font-size: 14px;\n            border-top: 1px solid #eee;\n        }\n        .social-links {\n            margin: 20px 0;\n        }\n        .social-link {\n            margin: 0 10px;\n            color: #744bcb;\n            text-decoration: none;\n        }\n    </style>\n</head>\n<body>\n    <div class=\"email-container\">\n        <div class=\"content\">\n            \n        <div class=\"title\">Welcome to CRM, priya.patel! 🎉</div>\n        <p>Thank you for joining our CRM management platform. We\'re excited to help you organize and manage your Company\'s information effectively.</p>\n        <div style=\"background-color: #f8f9fa; padding: 20px; border-radius: 8px; margin: 20px 0;\">\n            <div style=\"margin: 12px 0;\">✨ Manage your Company\'s information easily</div>\n            <div style=\"margin: 12px 0;\">🔒 Securely share information with your team</div>\n        </div>\n        <div class=\"button-container\">\n            <a href=\"http://localhost:5173/login\" class=\"button\">Get Started</a>\n        </div>\n    \n        </div>\n        <div class=\"footer\">\n            <div class=\"social-links\">\n                <a href=\"#\" class=\"social-link\">Facebook</a>\n                <a href=\"#\" class=\"social-link\">Twitter</a>\n                <a href=\"#\" class=\"social-link\">Instagram</a>\n            </div>\n            <p> 2025 CRM. All rights reserved.</p>\n        </div>\n    </div>\n</body>\n</html>\n', 0, 'codedatayash0@gmail.com', 'codedatayash0@gmail.com', '2025-03-31 12:45:27', '2025-03-31 12:45:27'),
('6wEqv6wglCbaM35Ixp1O5A1', 'codedatayash0@gmail.com', 'apexglobaltrading@yopmail.com', 'Welcome to CRM!', '\n<!DOCTYPE html>\n<html>\n<head>\n    <link href=\"https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600&display=swap\" rel=\"stylesheet\">\n    <style>\n        * {\n            font-family: \'Poppins\', sans-serif !important;\n        }\n        .email-container {\n            max-width: 600px;\n            margin: 0 auto;\n            color: #2c3e50;\n            background-color: #f8f9fa;\n            border-radius: 12px;\n            overflow: hidden;\n            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);\n        }\n        .header {\n            padding: 40px 20px;\n            text-align: center;\n            background: #ffffff;\n        }\n        .logo {\n            width: 200px;\n            height: auto;\n            margin: 0 auto;\n            display: block;\n            filter: drop-shadow(0 2px 4px rgba(0, 0, 0, 0.2));\n        }\n        .content {\n            padding: 40px;\n            background-color: #ffffff;\n            border-radius: 12px 12px 0 0;\n            margin-top: -20px;\n        }\n        .title {\n            color: #744bcb;\n            font-size: 24px;\n            font-weight: bold;\n            margin-bottom: 20px;\n            text-align: center;\n        }\n        .button-container {\n            text-align: center;\n            margin: 20px 0;\n        }\n        .button {\n            display: inline-block;\n            padding: 14px 28px;\n            background: #744bcb !important;\n            color: #ffffff !important;\n            text-decoration: none !important;\n            border-radius: 8px;\n            font-weight: bold;\n            text-align: center;\n            width: 200px;\n        }\n        .footer {\n            text-align: center;\n            padding: 30px;\n            background-color: #f8f9fa;\n            color: #666;\n            font-size: 14px;\n            border-top: 1px solid #eee;\n        }\n        .social-links {\n            margin: 20px 0;\n        }\n        .social-link {\n            margin: 0 10px;\n            color: #744bcb;\n            text-decoration: none;\n        }\n    </style>\n</head>\n<body>\n    <div class=\"email-container\">\n        <div class=\"content\">\n            \n        <div class=\"title\">Welcome to CRM, Apex Global Trading! 🎉</div>\n        <p>Thank you for joining our CRM management platform. We\'re excited to help you organize and manage your Company\'s information effectively.</p>\n        <div style=\"background-color: #f8f9fa; padding: 20px; border-radius: 8px; margin: 20px 0;\">\n            <div style=\"margin: 12px 0;\">✨ Manage your Company\'s information easily</div>\n            <div style=\"margin: 12px 0;\">🔒 Securely share information with your team</div>\n        </div>\n        <div class=\"button-container\">\n            <a href=\"http://localhost:5173/login\" class=\"button\">Get Started</a>\n        </div>\n    \n        </div>\n        <div class=\"footer\">\n            <div class=\"social-links\">\n                <a href=\"#\" class=\"social-link\">Facebook</a>\n                <a href=\"#\" class=\"social-link\">Twitter</a>\n                <a href=\"#\" class=\"social-link\">Instagram</a>\n            </div>\n            <p> 2025 CRM. All rights reserved.</p>\n        </div>\n    </div>\n</body>\n</html>\n', 0, 'codedatayash0@gmail.com', 'codedatayash0@gmail.com', '2025-03-31 09:35:09', '2025-03-31 09:35:09'),
('85rWngRagF5TdXvVlVXsfnA', 'codedatayash0@gmail.com', 'datacore.analytics@yopmail.com', 'Verify Your Email', '\n<!DOCTYPE html>\n<html>\n<head>\n    <link href=\"https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600&display=swap\" rel=\"stylesheet\">\n    <style>\n        * {\n            font-family: \'Poppins\', sans-serif !important;\n        }\n        .email-container {\n            max-width: 600px;\n            margin: 0 auto;\n            color: #2c3e50;\n            background-color: #f8f9fa;\n            border-radius: 12px;\n            overflow: hidden;\n            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);\n        }\n        .header {\n            padding: 40px 20px;\n            text-align: center;\n            background: #ffffff;\n        }\n        .logo {\n            width: 200px;\n            height: auto;\n            margin: 0 auto;\n            display: block;\n            filter: drop-shadow(0 2px 4px rgba(0, 0, 0, 0.2));\n        }\n        .content {\n            padding: 40px;\n            background-color: #ffffff;\n            border-radius: 12px 12px 0 0;\n            margin-top: -20px;\n        }\n        .title {\n            color: #744bcb;\n            font-size: 24px;\n            font-weight: bold;\n            margin-bottom: 20px;\n            text-align: center;\n        }\n        .button-container {\n            text-align: center;\n            margin: 20px 0;\n        }\n        .button {\n            display: inline-block;\n            padding: 14px 28px;\n            background: #744bcb !important;\n            color: #ffffff !important;\n            text-decoration: none !important;\n            border-radius: 8px;\n            font-weight: bold;\n            text-align: center;\n            width: 200px;\n        }\n        .footer {\n            text-align: center;\n            padding: 30px;\n            background-color: #f8f9fa;\n            color: #666;\n            font-size: 14px;\n            border-top: 1px solid #eee;\n        }\n        .social-links {\n            margin: 20px 0;\n        }\n        .social-link {\n            margin: 0 10px;\n            color: #744bcb;\n            text-decoration: none;\n        }\n    </style>\n</head>\n<body>\n    <div class=\"email-container\">\n        <div class=\"content\">\n            \n        <div class=\"title\">Verify Your Email</div>\n        <p>Hello DataCore Analytics!</p>\n        <p>Welcome to CRM! Please verify your email with this OTP:</p>\n        <div style=\"text-align: center; margin: 30px 0;\">\n            <span style=\"font-size: 32px; font-weight: bold; color: #744bcb; letter-spacing: 5px; padding: 10px 20px; background: #f8f9fa; border-radius: 8px;\">663054</span>\n        </div>\n        <p style=\"text-align: center; color: #666;\">This OTP will expire in 5 minutes.</p>\n    \n        </div>\n        <div class=\"footer\">\n            <div class=\"social-links\">\n                <a href=\"#\" class=\"social-link\">Facebook</a>\n                <a href=\"#\" class=\"social-link\">Twitter</a>\n                <a href=\"#\" class=\"social-link\">Instagram</a>\n            </div>\n            <p> 2025 CRM. All rights reserved.</p>\n        </div>\n    </div>\n</body>\n</html>\n', 0, 'codedatayash0@gmail.com', 'codedatayash0@gmail.com', '2025-03-31 11:54:43', '2025-03-31 11:54:43'),
('9VHpNYMdw5ImzLX3eZXquTW', 'codedatayash0@gmail.com', 'ba.silverline@yopmail.com', 'Welcome to CRM!', '\n<!DOCTYPE html>\n<html>\n<head>\n    <link href=\"https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600&display=swap\" rel=\"stylesheet\">\n    <style>\n        * {\n            font-family: \'Poppins\', sans-serif !important;\n        }\n        .email-container {\n            max-width: 600px;\n            margin: 0 auto;\n            color: #2c3e50;\n            background-color: #f8f9fa;\n            border-radius: 12px;\n            overflow: hidden;\n            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);\n        }\n        .header {\n            padding: 40px 20px;\n            text-align: center;\n            background: #ffffff;\n        }\n        .logo {\n            width: 200px;\n            height: auto;\n            margin: 0 auto;\n            display: block;\n            filter: drop-shadow(0 2px 4px rgba(0, 0, 0, 0.2));\n        }\n        .content {\n            padding: 40px;\n            background-color: #ffffff;\n            border-radius: 12px 12px 0 0;\n            margin-top: -20px;\n        }\n        .title {\n            color: #744bcb;\n            font-size: 24px;\n            font-weight: bold;\n            margin-bottom: 20px;\n            text-align: center;\n        }\n        .button-container {\n            text-align: center;\n            margin: 20px 0;\n        }\n        .button {\n            display: inline-block;\n            padding: 14px 28px;\n            background: #744bcb !important;\n            color: #ffffff !important;\n            text-decoration: none !important;\n            border-radius: 8px;\n            font-weight: bold;\n            text-align: center;\n            width: 200px;\n        }\n        .footer {\n            text-align: center;\n            padding: 30px;\n            background-color: #f8f9fa;\n            color: #666;\n            font-size: 14px;\n            border-top: 1px solid #eee;\n        }\n        .social-links {\n            margin: 20px 0;\n        }\n        .social-link {\n            margin: 0 10px;\n            color: #744bcb;\n            text-decoration: none;\n        }\n    </style>\n</head>\n<body>\n    <div class=\"email-container\">\n        <div class=\"content\">\n            \n        <div class=\"title\">Welcome to CRM,  ba.silverline! 🎉</div>\n        <p>Thank you for joining our CRM management platform. We\'re excited to help you organize and manage your Company\'s information effectively.</p>\n        <div style=\"background-color: #f8f9fa; padding: 20px; border-radius: 8px; margin: 20px 0;\">\n            <div style=\"margin: 12px 0;\">✨ Manage your Company\'s information easily</div>\n            <div style=\"margin: 12px 0;\">🔒 Securely share information with your team</div>\n        </div>\n        <div class=\"button-container\">\n            <a href=\"http://localhost:5173/login\" class=\"button\">Get Started</a>\n        </div>\n    \n        </div>\n        <div class=\"footer\">\n            <div class=\"social-links\">\n                <a href=\"#\" class=\"social-link\">Facebook</a>\n                <a href=\"#\" class=\"social-link\">Twitter</a>\n                <a href=\"#\" class=\"social-link\">Instagram</a>\n            </div>\n            <p> 2025 CRM. All rights reserved.</p>\n        </div>\n    </div>\n</body>\n</html>\n', 0, 'codedatayash0@gmail.com', 'codedatayash0@gmail.com', '2025-03-31 11:31:30', '2025-03-31 11:31:30'),
('9zkSV9tEQJ3XVrom4FSLUJM', 'codedatayash0@gmail.com', 'quantum.innovations@yopmail.com', 'Welcome to CRM!', '\n<!DOCTYPE html>\n<html>\n<head>\n    <link href=\"https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600&display=swap\" rel=\"stylesheet\">\n    <style>\n        * {\n            font-family: \'Poppins\', sans-serif !important;\n        }\n        .email-container {\n            max-width: 600px;\n            margin: 0 auto;\n            color: #2c3e50;\n            background-color: #f8f9fa;\n            border-radius: 12px;\n            overflow: hidden;\n            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);\n        }\n        .header {\n            padding: 40px 20px;\n            text-align: center;\n            background: #ffffff;\n        }\n        .logo {\n            width: 200px;\n            height: auto;\n            margin: 0 auto;\n            display: block;\n            filter: drop-shadow(0 2px 4px rgba(0, 0, 0, 0.2));\n        }\n        .content {\n            padding: 40px;\n            background-color: #ffffff;\n            border-radius: 12px 12px 0 0;\n            margin-top: -20px;\n        }\n        .title {\n            color: #744bcb;\n            font-size: 24px;\n            font-weight: bold;\n            margin-bottom: 20px;\n            text-align: center;\n        }\n        .button-container {\n            text-align: center;\n            margin: 20px 0;\n        }\n        .button {\n            display: inline-block;\n            padding: 14px 28px;\n            background: #744bcb !important;\n            color: #ffffff !important;\n            text-decoration: none !important;\n            border-radius: 8px;\n            font-weight: bold;\n            text-align: center;\n            width: 200px;\n        }\n        .footer {\n            text-align: center;\n            padding: 30px;\n            background-color: #f8f9fa;\n            color: #666;\n            font-size: 14px;\n            border-top: 1px solid #eee;\n        }\n        .social-links {\n            margin: 20px 0;\n        }\n        .social-link {\n            margin: 0 10px;\n            color: #744bcb;\n            text-decoration: none;\n        }\n    </style>\n</head>\n<body>\n    <div class=\"email-container\">\n        <div class=\"content\">\n            \n        <div class=\"title\">Welcome to CRM, Quantum Innovations! 🎉</div>\n        <p>Thank you for joining our CRM management platform. We\'re excited to help you organize and manage your Company\'s information effectively.</p>\n        <div style=\"background-color: #f8f9fa; padding: 20px; border-radius: 8px; margin: 20px 0;\">\n            <div style=\"margin: 12px 0;\">✨ Manage your Company\'s information easily</div>\n            <div style=\"margin: 12px 0;\">🔒 Securely share information with your team</div>\n        </div>\n        <div class=\"button-container\">\n            <a href=\"http://localhost:5173/login\" class=\"button\">Get Started</a>\n        </div>\n    \n        </div>\n        <div class=\"footer\">\n            <div class=\"social-links\">\n                <a href=\"#\" class=\"social-link\">Facebook</a>\n                <a href=\"#\" class=\"social-link\">Twitter</a>\n                <a href=\"#\" class=\"social-link\">Instagram</a>\n            </div>\n            <p> 2025 CRM. All rights reserved.</p>\n        </div>\n    </div>\n</body>\n</html>\n', 0, 'codedatayash0@gmail.com', 'codedatayash0@gmail.com', '2025-03-31 11:53:40', '2025-03-31 11:53:40'),
('AMhbWk6PrttVA79k8QDzT7S', 'codedatayash0@gmail.com', 'horizonventures@yopmail.com', 'Welcome to CRM!', '\n<!DOCTYPE html>\n<html>\n<head>\n    <link href=\"https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600&display=swap\" rel=\"stylesheet\">\n    <style>\n        * {\n            font-family: \'Poppins\', sans-serif !important;\n        }\n        .email-container {\n            max-width: 600px;\n            margin: 0 auto;\n            color: #2c3e50;\n            background-color: #f8f9fa;\n            border-radius: 12px;\n            overflow: hidden;\n            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);\n        }\n        .header {\n            padding: 40px 20px;\n            text-align: center;\n            background: #ffffff;\n        }\n        .logo {\n            width: 200px;\n            height: auto;\n            margin: 0 auto;\n            display: block;\n            filter: drop-shadow(0 2px 4px rgba(0, 0, 0, 0.2));\n        }\n        .content {\n            padding: 40px;\n            background-color: #ffffff;\n            border-radius: 12px 12px 0 0;\n            margin-top: -20px;\n        }\n        .title {\n            color: #744bcb;\n            font-size: 24px;\n            font-weight: bold;\n            margin-bottom: 20px;\n            text-align: center;\n        }\n        .button-container {\n            text-align: center;\n            margin: 20px 0;\n        }\n        .button {\n            display: inline-block;\n            padding: 14px 28px;\n            background: #744bcb !important;\n            color: #ffffff !important;\n            text-decoration: none !important;\n            border-radius: 8px;\n            font-weight: bold;\n            text-align: center;\n            width: 200px;\n        }\n        .footer {\n            text-align: center;\n            padding: 30px;\n            background-color: #f8f9fa;\n            color: #666;\n            font-size: 14px;\n            border-top: 1px solid #eee;\n        }\n        .social-links {\n            margin: 20px 0;\n        }\n        .social-link {\n            margin: 0 10px;\n            color: #744bcb;\n            text-decoration: none;\n        }\n    </style>\n</head>\n<body>\n    <div class=\"email-container\">\n        <div class=\"content\">\n            \n        <div class=\"title\">Welcome to CRM, Horizon Ventures! 🎉</div>\n        <p>Thank you for joining our CRM management platform. We\'re excited to help you organize and manage your Company\'s information effectively.</p>\n        <div style=\"background-color: #f8f9fa; padding: 20px; border-radius: 8px; margin: 20px 0;\">\n            <div style=\"margin: 12px 0;\">✨ Manage your Company\'s information easily</div>\n            <div style=\"margin: 12px 0;\">🔒 Securely share information with your team</div>\n        </div>\n        <div class=\"button-container\">\n            <a href=\"http://localhost:5173/login\" class=\"button\">Get Started</a>\n        </div>\n    \n        </div>\n        <div class=\"footer\">\n            <div class=\"social-links\">\n                <a href=\"#\" class=\"social-link\">Facebook</a>\n                <a href=\"#\" class=\"social-link\">Twitter</a>\n                <a href=\"#\" class=\"social-link\">Instagram</a>\n            </div>\n            <p> 2025 CRM. All rights reserved.</p>\n        </div>\n    </div>\n</body>\n</html>\n', 0, 'codedatayash0@gmail.com', 'codedatayash0@gmail.com', '2025-03-31 09:43:25', '2025-03-31 09:43:25'),
('asEvKIKrEBP3pFdISVzX2WV', 'codedatayash0@gmail.com', 'rahul.sharma.silverline@yopmail.com', 'Verify Your Email', '\n<!DOCTYPE html>\n<html>\n<head>\n    <link href=\"https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600&display=swap\" rel=\"stylesheet\">\n    <style>\n        * {\n            font-family: \'Poppins\', sans-serif !important;\n        }\n        .email-container {\n            max-width: 600px;\n            margin: 0 auto;\n            color: #2c3e50;\n            background-color: #f8f9fa;\n            border-radius: 12px;\n            overflow: hidden;\n            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);\n        }\n        .header {\n            padding: 40px 20px;\n            text-align: center;\n            background: #ffffff;\n        }\n        .logo {\n            width: 200px;\n            height: auto;\n            margin: 0 auto;\n            display: block;\n            filter: drop-shadow(0 2px 4px rgba(0, 0, 0, 0.2));\n        }\n        .content {\n            padding: 40px;\n            background-color: #ffffff;\n            border-radius: 12px 12px 0 0;\n            margin-top: -20px;\n        }\n        .title {\n            color: #744bcb;\n            font-size: 24px;\n            font-weight: bold;\n            margin-bottom: 20px;\n            text-align: center;\n        }\n        .button-container {\n            text-align: center;\n            margin: 20px 0;\n        }\n        .button {\n            display: inline-block;\n            padding: 14px 28px;\n            background: #744bcb !important;\n            color: #ffffff !important;\n            text-decoration: none !important;\n            border-radius: 8px;\n            font-weight: bold;\n            text-align: center;\n            width: 200px;\n        }\n        .footer {\n            text-align: center;\n            padding: 30px;\n            background-color: #f8f9fa;\n            color: #666;\n            font-size: 14px;\n            border-top: 1px solid #eee;\n        }\n        .social-links {\n            margin: 20px 0;\n        }\n        .social-link {\n            margin: 0 10px;\n            color: #744bcb;\n            text-decoration: none;\n        }\n    </style>\n</head>\n<body>\n    <div class=\"email-container\">\n        <div class=\"content\">\n            \n        <div class=\"title\">Verify Your Email</div>\n        <p>Hello rahul.sharma!</p>\n        <p>Welcome to CRM! Please verify your email with this OTP:</p>\n        <div style=\"text-align: center; margin: 30px 0;\">\n            <span style=\"font-size: 32px; font-weight: bold; color: #744bcb; letter-spacing: 5px; padding: 10px 20px; background: #f8f9fa; border-radius: 8px;\">927600</span>\n        </div>\n        <p style=\"text-align: center; color: #666;\">This OTP will expire in 5 minutes.</p>\n    \n        </div>\n        <div class=\"footer\">\n            <div class=\"social-links\">\n                <a href=\"#\" class=\"social-link\">Facebook</a>\n                <a href=\"#\" class=\"social-link\">Twitter</a>\n                <a href=\"#\" class=\"social-link\">Instagram</a>\n            </div>\n            <p> 2025 CRM. All rights reserved.</p>\n        </div>\n    </div>\n</body>\n</html>\n', 0, 'codedatayash0@gmail.com', 'codedatayash0@gmail.com', '2025-03-31 12:40:35', '2025-03-31 12:40:35'),
('b77xyyK6zsdoKFcKUr6liqJ', 'codedatayash0@gmail.com', 'techsilverline@yopmail.com', 'Welcome to CRM!', '\n<!DOCTYPE html>\n<html>\n<head>\n    <link href=\"https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600&display=swap\" rel=\"stylesheet\">\n    <style>\n        * {\n            font-family: \'Poppins\', sans-serif !important;\n        }\n        .email-container {\n            max-width: 600px;\n            margin: 0 auto;\n            color: #2c3e50;\n            background-color: #f8f9fa;\n            border-radius: 12px;\n            overflow: hidden;\n            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);\n        }\n        .header {\n            padding: 40px 20px;\n            text-align: center;\n            background: #ffffff;\n        }\n        .logo {\n            width: 200px;\n            height: auto;\n            margin: 0 auto;\n            display: block;\n            filter: drop-shadow(0 2px 4px rgba(0, 0, 0, 0.2));\n        }\n        .content {\n            padding: 40px;\n            background-color: #ffffff;\n            border-radius: 12px 12px 0 0;\n            margin-top: -20px;\n        }\n        .title {\n            color: #744bcb;\n            font-size: 24px;\n            font-weight: bold;\n            margin-bottom: 20px;\n            text-align: center;\n        }\n        .button-container {\n            text-align: center;\n            margin: 20px 0;\n        }\n        .button {\n            display: inline-block;\n            padding: 14px 28px;\n            background: #744bcb !important;\n            color: #ffffff !important;\n            text-decoration: none !important;\n            border-radius: 8px;\n            font-weight: bold;\n            text-align: center;\n            width: 200px;\n        }\n        .footer {\n            text-align: center;\n            padding: 30px;\n            background-color: #f8f9fa;\n            color: #666;\n            font-size: 14px;\n            border-top: 1px solid #eee;\n        }\n        .social-links {\n            margin: 20px 0;\n        }\n        .social-link {\n            margin: 0 10px;\n            color: #744bcb;\n            text-decoration: none;\n        }\n    </style>\n</head>\n<body>\n    <div class=\"email-container\">\n        <div class=\"content\">\n            \n        <div class=\"title\">Welcome to CRM, tech.silverline! 🎉</div>\n        <p>Thank you for joining our CRM management platform. We\'re excited to help you organize and manage your Company\'s information effectively.</p>\n        <div style=\"background-color: #f8f9fa; padding: 20px; border-radius: 8px; margin: 20px 0;\">\n            <div style=\"margin: 12px 0;\">✨ Manage your Company\'s information easily</div>\n            <div style=\"margin: 12px 0;\">🔒 Securely share information with your team</div>\n        </div>\n        <div class=\"button-container\">\n            <a href=\"http://localhost:5173/login\" class=\"button\">Get Started</a>\n        </div>\n    \n        </div>\n        <div class=\"footer\">\n            <div class=\"social-links\">\n                <a href=\"#\" class=\"social-link\">Facebook</a>\n                <a href=\"#\" class=\"social-link\">Twitter</a>\n                <a href=\"#\" class=\"social-link\">Instagram</a>\n            </div>\n            <p> 2025 CRM. All rights reserved.</p>\n        </div>\n    </div>\n</body>\n</html>\n', 0, 'codedatayash0@gmail.com', 'codedatayash0@gmail.com', '2025-03-31 11:19:09', '2025-03-31 11:19:09'),
('BbdwhirxTZwpsd3HLUcAwCY', 'codedatayash0@gmail.com', 'quantumeenterprises@yopmail.com', 'Verify Your Email', '\n<!DOCTYPE html>\n<html>\n<head>\n    <link href=\"https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600&display=swap\" rel=\"stylesheet\">\n    <style>\n        * {\n            font-family: \'Poppins\', sans-serif !important;\n        }\n        .email-container {\n            max-width: 600px;\n            margin: 0 auto;\n            color: #2c3e50;\n            background-color: #f8f9fa;\n            border-radius: 12px;\n            overflow: hidden;\n            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);\n        }\n        .header {\n            padding: 40px 20px;\n            text-align: center;\n            background: #ffffff;\n        }\n        .logo {\n            width: 200px;\n            height: auto;\n            margin: 0 auto;\n            display: block;\n            filter: drop-shadow(0 2px 4px rgba(0, 0, 0, 0.2));\n        }\n        .content {\n            padding: 40px;\n            background-color: #ffffff;\n            border-radius: 12px 12px 0 0;\n            margin-top: -20px;\n        }\n        .title {\n            color: #744bcb;\n            font-size: 24px;\n            font-weight: bold;\n            margin-bottom: 20px;\n            text-align: center;\n        }\n        .button-container {\n            text-align: center;\n            margin: 20px 0;\n        }\n        .button {\n            display: inline-block;\n            padding: 14px 28px;\n            background: #744bcb !important;\n            color: #ffffff !important;\n            text-decoration: none !important;\n            border-radius: 8px;\n            font-weight: bold;\n            text-align: center;\n            width: 200px;\n        }\n        .footer {\n            text-align: center;\n            padding: 30px;\n            background-color: #f8f9fa;\n            color: #666;\n            font-size: 14px;\n            border-top: 1px solid #eee;\n        }\n        .social-links {\n            margin: 20px 0;\n        }\n        .social-link {\n            margin: 0 10px;\n            color: #744bcb;\n            text-decoration: none;\n        }\n    </style>\n</head>\n<body>\n    <div class=\"email-container\">\n        <div class=\"content\">\n            \n        <div class=\"title\">Verify Your Email</div>\n        <p>Hello Quantum Enterprises!</p>\n        <p>Welcome to CRM! Please verify your email with this OTP:</p>\n        <div style=\"text-align: center; margin: 30px 0;\">\n            <span style=\"font-size: 32px; font-weight: bold; color: #744bcb; letter-spacing: 5px; padding: 10px 20px; background: #f8f9fa; border-radius: 8px;\">424760</span>\n        </div>\n        <p style=\"text-align: center; color: #666;\">This OTP will expire in 5 minutes.</p>\n    \n        </div>\n        <div class=\"footer\">\n            <div class=\"social-links\">\n                <a href=\"#\" class=\"social-link\">Facebook</a>\n                <a href=\"#\" class=\"social-link\">Twitter</a>\n                <a href=\"#\" class=\"social-link\">Instagram</a>\n            </div>\n            <p> 2025 CRM. All rights reserved.</p>\n        </div>\n    </div>\n</body>\n</html>\n', 0, 'codedatayash0@gmail.com', 'codedatayash0@gmail.com', '2025-03-31 09:30:36', '2025-03-31 09:30:36');
INSERT INTO `emails` (`id`, `from`, `to`, `subject`, `html`, `isRead`, `created_by`, `updated_by`, `createdAt`, `updatedAt`) VALUES
('c07SpjwcHHfMBFyXliQzICu', 'codedatayash0@gmail.com', 'pm.silverline@yopmail.com', 'Welcome to CRM!', '\n<!DOCTYPE html>\n<html>\n<head>\n    <link href=\"https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600&display=swap\" rel=\"stylesheet\">\n    <style>\n        * {\n            font-family: \'Poppins\', sans-serif !important;\n        }\n        .email-container {\n            max-width: 600px;\n            margin: 0 auto;\n            color: #2c3e50;\n            background-color: #f8f9fa;\n            border-radius: 12px;\n            overflow: hidden;\n            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);\n        }\n        .header {\n            padding: 40px 20px;\n            text-align: center;\n            background: #ffffff;\n        }\n        .logo {\n            width: 200px;\n            height: auto;\n            margin: 0 auto;\n            display: block;\n            filter: drop-shadow(0 2px 4px rgba(0, 0, 0, 0.2));\n        }\n        .content {\n            padding: 40px;\n            background-color: #ffffff;\n            border-radius: 12px 12px 0 0;\n            margin-top: -20px;\n        }\n        .title {\n            color: #744bcb;\n            font-size: 24px;\n            font-weight: bold;\n            margin-bottom: 20px;\n            text-align: center;\n        }\n        .button-container {\n            text-align: center;\n            margin: 20px 0;\n        }\n        .button {\n            display: inline-block;\n            padding: 14px 28px;\n            background: #744bcb !important;\n            color: #ffffff !important;\n            text-decoration: none !important;\n            border-radius: 8px;\n            font-weight: bold;\n            text-align: center;\n            width: 200px;\n        }\n        .footer {\n            text-align: center;\n            padding: 30px;\n            background-color: #f8f9fa;\n            color: #666;\n            font-size: 14px;\n            border-top: 1px solid #eee;\n        }\n        .social-links {\n            margin: 20px 0;\n        }\n        .social-link {\n            margin: 0 10px;\n            color: #744bcb;\n            text-decoration: none;\n        }\n    </style>\n</head>\n<body>\n    <div class=\"email-container\">\n        <div class=\"content\">\n            \n        <div class=\"title\">Welcome to CRM, pm.silverline! 🎉</div>\n        <p>Thank you for joining our CRM management platform. We\'re excited to help you organize and manage your Company\'s information effectively.</p>\n        <div style=\"background-color: #f8f9fa; padding: 20px; border-radius: 8px; margin: 20px 0;\">\n            <div style=\"margin: 12px 0;\">✨ Manage your Company\'s information easily</div>\n            <div style=\"margin: 12px 0;\">🔒 Securely share information with your team</div>\n        </div>\n        <div class=\"button-container\">\n            <a href=\"http://localhost:5173/login\" class=\"button\">Get Started</a>\n        </div>\n    \n        </div>\n        <div class=\"footer\">\n            <div class=\"social-links\">\n                <a href=\"#\" class=\"social-link\">Facebook</a>\n                <a href=\"#\" class=\"social-link\">Twitter</a>\n                <a href=\"#\" class=\"social-link\">Instagram</a>\n            </div>\n            <p> 2025 CRM. All rights reserved.</p>\n        </div>\n    </div>\n</body>\n</html>\n', 0, 'codedatayash0@gmail.com', 'codedatayash0@gmail.com', '2025-03-31 11:17:09', '2025-03-31 11:17:09'),
('cZfCTTcHmzEgUjFMnqGrhXw', 'codedatayash0@gmail.com', 'admin.silverline@yopmail.com', 'Welcome to CRM!', '\n<!DOCTYPE html>\n<html>\n<head>\n    <link href=\"https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600&display=swap\" rel=\"stylesheet\">\n    <style>\n        * {\n            font-family: \'Poppins\', sans-serif !important;\n        }\n        .email-container {\n            max-width: 600px;\n            margin: 0 auto;\n            color: #2c3e50;\n            background-color: #f8f9fa;\n            border-radius: 12px;\n            overflow: hidden;\n            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);\n        }\n        .header {\n            padding: 40px 20px;\n            text-align: center;\n            background: #ffffff;\n        }\n        .logo {\n            width: 200px;\n            height: auto;\n            margin: 0 auto;\n            display: block;\n            filter: drop-shadow(0 2px 4px rgba(0, 0, 0, 0.2));\n        }\n        .content {\n            padding: 40px;\n            background-color: #ffffff;\n            border-radius: 12px 12px 0 0;\n            margin-top: -20px;\n        }\n        .title {\n            color: #744bcb;\n            font-size: 24px;\n            font-weight: bold;\n            margin-bottom: 20px;\n            text-align: center;\n        }\n        .button-container {\n            text-align: center;\n            margin: 20px 0;\n        }\n        .button {\n            display: inline-block;\n            padding: 14px 28px;\n            background: #744bcb !important;\n            color: #ffffff !important;\n            text-decoration: none !important;\n            border-radius: 8px;\n            font-weight: bold;\n            text-align: center;\n            width: 200px;\n        }\n        .footer {\n            text-align: center;\n            padding: 30px;\n            background-color: #f8f9fa;\n            color: #666;\n            font-size: 14px;\n            border-top: 1px solid #eee;\n        }\n        .social-links {\n            margin: 20px 0;\n        }\n        .social-link {\n            margin: 0 10px;\n            color: #744bcb;\n            text-decoration: none;\n        }\n    </style>\n</head>\n<body>\n    <div class=\"email-container\">\n        <div class=\"content\">\n            \n        <div class=\"title\">Welcome to CRM, admin.silverline! 🎉</div>\n        <p>Thank you for joining our CRM management platform. We\'re excited to help you organize and manage your Company\'s information effectively.</p>\n        <div style=\"background-color: #f8f9fa; padding: 20px; border-radius: 8px; margin: 20px 0;\">\n            <div style=\"margin: 12px 0;\">✨ Manage your Company\'s information easily</div>\n            <div style=\"margin: 12px 0;\">🔒 Securely share information with your team</div>\n        </div>\n        <div class=\"button-container\">\n            <a href=\"http://localhost:5173/login\" class=\"button\">Get Started</a>\n        </div>\n    \n        </div>\n        <div class=\"footer\">\n            <div class=\"social-links\">\n                <a href=\"#\" class=\"social-link\">Facebook</a>\n                <a href=\"#\" class=\"social-link\">Twitter</a>\n                <a href=\"#\" class=\"social-link\">Instagram</a>\n            </div>\n            <p> 2025 CRM. All rights reserved.</p>\n        </div>\n    </div>\n</body>\n</html>\n', 0, 'codedatayash0@gmail.com', 'codedatayash0@gmail.com', '2025-03-31 11:15:14', '2025-03-31 11:15:14'),
('D0l9sXJcmn0B904hBWhAMsg', 'codedatayash0@gmail.com', 'techpro.solutions@yopmail.com', 'Welcome to CRM!', '\n<!DOCTYPE html>\n<html>\n<head>\n    <link href=\"https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600&display=swap\" rel=\"stylesheet\">\n    <style>\n        * {\n            font-family: \'Poppins\', sans-serif !important;\n        }\n        .email-container {\n            max-width: 600px;\n            margin: 0 auto;\n            color: #2c3e50;\n            background-color: #f8f9fa;\n            border-radius: 12px;\n            overflow: hidden;\n            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);\n        }\n        .header {\n            padding: 40px 20px;\n            text-align: center;\n            background: #ffffff;\n        }\n        .logo {\n            width: 200px;\n            height: auto;\n            margin: 0 auto;\n            display: block;\n            filter: drop-shadow(0 2px 4px rgba(0, 0, 0, 0.2));\n        }\n        .content {\n            padding: 40px;\n            background-color: #ffffff;\n            border-radius: 12px 12px 0 0;\n            margin-top: -20px;\n        }\n        .title {\n            color: #744bcb;\n            font-size: 24px;\n            font-weight: bold;\n            margin-bottom: 20px;\n            text-align: center;\n        }\n        .button-container {\n            text-align: center;\n            margin: 20px 0;\n        }\n        .button {\n            display: inline-block;\n            padding: 14px 28px;\n            background: #744bcb !important;\n            color: #ffffff !important;\n            text-decoration: none !important;\n            border-radius: 8px;\n            font-weight: bold;\n            text-align: center;\n            width: 200px;\n        }\n        .footer {\n            text-align: center;\n            padding: 30px;\n            background-color: #f8f9fa;\n            color: #666;\n            font-size: 14px;\n            border-top: 1px solid #eee;\n        }\n        .social-links {\n            margin: 20px 0;\n        }\n        .social-link {\n            margin: 0 10px;\n            color: #744bcb;\n            text-decoration: none;\n        }\n    </style>\n</head>\n<body>\n    <div class=\"email-container\">\n        <div class=\"content\">\n            \n        <div class=\"title\">Welcome to CRM, TechPro Solutions! 🎉</div>\n        <p>Thank you for joining our CRM management platform. We\'re excited to help you organize and manage your Company\'s information effectively.</p>\n        <div style=\"background-color: #f8f9fa; padding: 20px; border-radius: 8px; margin: 20px 0;\">\n            <div style=\"margin: 12px 0;\">✨ Manage your Company\'s information easily</div>\n            <div style=\"margin: 12px 0;\">🔒 Securely share information with your team</div>\n        </div>\n        <div class=\"button-container\">\n            <a href=\"http://localhost:5173/login\" class=\"button\">Get Started</a>\n        </div>\n    \n        </div>\n        <div class=\"footer\">\n            <div class=\"social-links\">\n                <a href=\"#\" class=\"social-link\">Facebook</a>\n                <a href=\"#\" class=\"social-link\">Twitter</a>\n                <a href=\"#\" class=\"social-link\">Instagram</a>\n            </div>\n            <p> 2025 CRM. All rights reserved.</p>\n        </div>\n    </div>\n</body>\n</html>\n', 0, 'codedatayash0@gmail.com', 'codedatayash0@gmail.com', '2025-03-31 11:47:35', '2025-03-31 11:47:35'),
('dB1SOICsSE5Xaje6EIq7wrE', 'codedatayash0@gmail.com', 'quantum.innovations@yopmail.com', 'Verify Your Email', '\n<!DOCTYPE html>\n<html>\n<head>\n    <link href=\"https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600&display=swap\" rel=\"stylesheet\">\n    <style>\n        * {\n            font-family: \'Poppins\', sans-serif !important;\n        }\n        .email-container {\n            max-width: 600px;\n            margin: 0 auto;\n            color: #2c3e50;\n            background-color: #f8f9fa;\n            border-radius: 12px;\n            overflow: hidden;\n            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);\n        }\n        .header {\n            padding: 40px 20px;\n            text-align: center;\n            background: #ffffff;\n        }\n        .logo {\n            width: 200px;\n            height: auto;\n            margin: 0 auto;\n            display: block;\n            filter: drop-shadow(0 2px 4px rgba(0, 0, 0, 0.2));\n        }\n        .content {\n            padding: 40px;\n            background-color: #ffffff;\n            border-radius: 12px 12px 0 0;\n            margin-top: -20px;\n        }\n        .title {\n            color: #744bcb;\n            font-size: 24px;\n            font-weight: bold;\n            margin-bottom: 20px;\n            text-align: center;\n        }\n        .button-container {\n            text-align: center;\n            margin: 20px 0;\n        }\n        .button {\n            display: inline-block;\n            padding: 14px 28px;\n            background: #744bcb !important;\n            color: #ffffff !important;\n            text-decoration: none !important;\n            border-radius: 8px;\n            font-weight: bold;\n            text-align: center;\n            width: 200px;\n        }\n        .footer {\n            text-align: center;\n            padding: 30px;\n            background-color: #f8f9fa;\n            color: #666;\n            font-size: 14px;\n            border-top: 1px solid #eee;\n        }\n        .social-links {\n            margin: 20px 0;\n        }\n        .social-link {\n            margin: 0 10px;\n            color: #744bcb;\n            text-decoration: none;\n        }\n    </style>\n</head>\n<body>\n    <div class=\"email-container\">\n        <div class=\"content\">\n            \n        <div class=\"title\">Verify Your Email</div>\n        <p>Hello Quantum Innovations!</p>\n        <p>Welcome to CRM! Please verify your email with this OTP:</p>\n        <div style=\"text-align: center; margin: 30px 0;\">\n            <span style=\"font-size: 32px; font-weight: bold; color: #744bcb; letter-spacing: 5px; padding: 10px 20px; background: #f8f9fa; border-radius: 8px;\">528588</span>\n        </div>\n        <p style=\"text-align: center; color: #666;\">This OTP will expire in 5 minutes.</p>\n    \n        </div>\n        <div class=\"footer\">\n            <div class=\"social-links\">\n                <a href=\"#\" class=\"social-link\">Facebook</a>\n                <a href=\"#\" class=\"social-link\">Twitter</a>\n                <a href=\"#\" class=\"social-link\">Instagram</a>\n            </div>\n            <p> 2025 CRM. All rights reserved.</p>\n        </div>\n    </div>\n</body>\n</html>\n', 0, 'codedatayash0@gmail.com', 'codedatayash0@gmail.com', '2025-03-31 11:53:22', '2025-03-31 11:53:22'),
('dfziMO78WRXNrGdYZUumn8Y', 'codedatayash0@gmail.com', 'admin.silverline@yopmail.com', 'Verify Your Email', '\n<!DOCTYPE html>\n<html>\n<head>\n    <link href=\"https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600&display=swap\" rel=\"stylesheet\">\n    <style>\n        * {\n            font-family: \'Poppins\', sans-serif !important;\n        }\n        .email-container {\n            max-width: 600px;\n            margin: 0 auto;\n            color: #2c3e50;\n            background-color: #f8f9fa;\n            border-radius: 12px;\n            overflow: hidden;\n            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);\n        }\n        .header {\n            padding: 40px 20px;\n            text-align: center;\n            background: #ffffff;\n        }\n        .logo {\n            width: 200px;\n            height: auto;\n            margin: 0 auto;\n            display: block;\n            filter: drop-shadow(0 2px 4px rgba(0, 0, 0, 0.2));\n        }\n        .content {\n            padding: 40px;\n            background-color: #ffffff;\n            border-radius: 12px 12px 0 0;\n            margin-top: -20px;\n        }\n        .title {\n            color: #744bcb;\n            font-size: 24px;\n            font-weight: bold;\n            margin-bottom: 20px;\n            text-align: center;\n        }\n        .button-container {\n            text-align: center;\n            margin: 20px 0;\n        }\n        .button {\n            display: inline-block;\n            padding: 14px 28px;\n            background: #744bcb !important;\n            color: #ffffff !important;\n            text-decoration: none !important;\n            border-radius: 8px;\n            font-weight: bold;\n            text-align: center;\n            width: 200px;\n        }\n        .footer {\n            text-align: center;\n            padding: 30px;\n            background-color: #f8f9fa;\n            color: #666;\n            font-size: 14px;\n            border-top: 1px solid #eee;\n        }\n        .social-links {\n            margin: 20px 0;\n        }\n        .social-link {\n            margin: 0 10px;\n            color: #744bcb;\n            text-decoration: none;\n        }\n    </style>\n</head>\n<body>\n    <div class=\"email-container\">\n        <div class=\"content\">\n            \n        <div class=\"title\">Verify Your Email</div>\n        <p>Hello admin.silverline!</p>\n        <p>Welcome to CRM! Please verify your email with this OTP:</p>\n        <div style=\"text-align: center; margin: 30px 0;\">\n            <span style=\"font-size: 32px; font-weight: bold; color: #744bcb; letter-spacing: 5px; padding: 10px 20px; background: #f8f9fa; border-radius: 8px;\">099836</span>\n        </div>\n        <p style=\"text-align: center; color: #666;\">This OTP will expire in 5 minutes.</p>\n    \n        </div>\n        <div class=\"footer\">\n            <div class=\"social-links\">\n                <a href=\"#\" class=\"social-link\">Facebook</a>\n                <a href=\"#\" class=\"social-link\">Twitter</a>\n                <a href=\"#\" class=\"social-link\">Instagram</a>\n            </div>\n            <p> 2025 CRM. All rights reserved.</p>\n        </div>\n    </div>\n</body>\n</html>\n', 0, 'codedatayash0@gmail.com', 'codedatayash0@gmail.com', '2025-03-31 11:14:57', '2025-03-31 11:14:57'),
('DgPorMPlrOMKgSVaWk3lCRR', 'codedatayash0@gmail.com', 'support.silverline@yopmail.com', 'Verify Your Email', '\n<!DOCTYPE html>\n<html>\n<head>\n    <link href=\"https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600&display=swap\" rel=\"stylesheet\">\n    <style>\n        * {\n            font-family: \'Poppins\', sans-serif !important;\n        }\n        .email-container {\n            max-width: 600px;\n            margin: 0 auto;\n            color: #2c3e50;\n            background-color: #f8f9fa;\n            border-radius: 12px;\n            overflow: hidden;\n            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);\n        }\n        .header {\n            padding: 40px 20px;\n            text-align: center;\n            background: #ffffff;\n        }\n        .logo {\n            width: 200px;\n            height: auto;\n            margin: 0 auto;\n            display: block;\n            filter: drop-shadow(0 2px 4px rgba(0, 0, 0, 0.2));\n        }\n        .content {\n            padding: 40px;\n            background-color: #ffffff;\n            border-radius: 12px 12px 0 0;\n            margin-top: -20px;\n        }\n        .title {\n            color: #744bcb;\n            font-size: 24px;\n            font-weight: bold;\n            margin-bottom: 20px;\n            text-align: center;\n        }\n        .button-container {\n            text-align: center;\n            margin: 20px 0;\n        }\n        .button {\n            display: inline-block;\n            padding: 14px 28px;\n            background: #744bcb !important;\n            color: #ffffff !important;\n            text-decoration: none !important;\n            border-radius: 8px;\n            font-weight: bold;\n            text-align: center;\n            width: 200px;\n        }\n        .footer {\n            text-align: center;\n            padding: 30px;\n            background-color: #f8f9fa;\n            color: #666;\n            font-size: 14px;\n            border-top: 1px solid #eee;\n        }\n        .social-links {\n            margin: 20px 0;\n        }\n        .social-link {\n            margin: 0 10px;\n            color: #744bcb;\n            text-decoration: none;\n        }\n    </style>\n</head>\n<body>\n    <div class=\"email-container\">\n        <div class=\"content\">\n            \n        <div class=\"title\">Verify Your Email</div>\n        <p>Hello support.silverline!</p>\n        <p>Welcome to CRM! Please verify your email with this OTP:</p>\n        <div style=\"text-align: center; margin: 30px 0;\">\n            <span style=\"font-size: 32px; font-weight: bold; color: #744bcb; letter-spacing: 5px; padding: 10px 20px; background: #f8f9fa; border-radius: 8px;\">073733</span>\n        </div>\n        <p style=\"text-align: center; color: #666;\">This OTP will expire in 5 minutes.</p>\n    \n        </div>\n        <div class=\"footer\">\n            <div class=\"social-links\">\n                <a href=\"#\" class=\"social-link\">Facebook</a>\n                <a href=\"#\" class=\"social-link\">Twitter</a>\n                <a href=\"#\" class=\"social-link\">Instagram</a>\n            </div>\n            <p> 2025 CRM. All rights reserved.</p>\n        </div>\n    </div>\n</body>\n</html>\n', 0, 'codedatayash0@gmail.com', 'codedatayash0@gmail.com', '2025-03-31 11:26:39', '2025-03-31 11:26:39'),
('EBFeVOAGMV2h4QZIV9r2qTV', 'codedatayash0@gmail.com', 'techVisiondynamics@yopmail.com', 'Verify Your Email', '\n<!DOCTYPE html>\n<html>\n<head>\n    <link href=\"https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600&display=swap\" rel=\"stylesheet\">\n    <style>\n        * {\n            font-family: \'Poppins\', sans-serif !important;\n        }\n        .email-container {\n            max-width: 600px;\n            margin: 0 auto;\n            color: #2c3e50;\n            background-color: #f8f9fa;\n            border-radius: 12px;\n            overflow: hidden;\n            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);\n        }\n        .header {\n            padding: 40px 20px;\n            text-align: center;\n            background: #ffffff;\n        }\n        .logo {\n            width: 200px;\n            height: auto;\n            margin: 0 auto;\n            display: block;\n            filter: drop-shadow(0 2px 4px rgba(0, 0, 0, 0.2));\n        }\n        .content {\n            padding: 40px;\n            background-color: #ffffff;\n            border-radius: 12px 12px 0 0;\n            margin-top: -20px;\n        }\n        .title {\n            color: #744bcb;\n            font-size: 24px;\n            font-weight: bold;\n            margin-bottom: 20px;\n            text-align: center;\n        }\n        .button-container {\n            text-align: center;\n            margin: 20px 0;\n        }\n        .button {\n            display: inline-block;\n            padding: 14px 28px;\n            background: #744bcb !important;\n            color: #ffffff !important;\n            text-decoration: none !important;\n            border-radius: 8px;\n            font-weight: bold;\n            text-align: center;\n            width: 200px;\n        }\n        .footer {\n            text-align: center;\n            padding: 30px;\n            background-color: #f8f9fa;\n            color: #666;\n            font-size: 14px;\n            border-top: 1px solid #eee;\n        }\n        .social-links {\n            margin: 20px 0;\n        }\n        .social-link {\n            margin: 0 10px;\n            color: #744bcb;\n            text-decoration: none;\n        }\n    </style>\n</head>\n<body>\n    <div class=\"email-container\">\n        <div class=\"content\">\n            \n        <div class=\"title\">Verify Your Email</div>\n        <p>Hello TechVision Dynamics!</p>\n        <p>Welcome to CRM! Please verify your email with this OTP:</p>\n        <div style=\"text-align: center; margin: 30px 0;\">\n            <span style=\"font-size: 32px; font-weight: bold; color: #744bcb; letter-spacing: 5px; padding: 10px 20px; background: #f8f9fa; border-radius: 8px;\">195055</span>\n        </div>\n        <p style=\"text-align: center; color: #666;\">This OTP will expire in 5 minutes.</p>\n    \n        </div>\n        <div class=\"footer\">\n            <div class=\"social-links\">\n                <a href=\"#\" class=\"social-link\">Facebook</a>\n                <a href=\"#\" class=\"social-link\">Twitter</a>\n                <a href=\"#\" class=\"social-link\">Instagram</a>\n            </div>\n            <p> 2025 CRM. All rights reserved.</p>\n        </div>\n    </div>\n</body>\n</html>\n', 0, 'codedatayash0@gmail.com', 'codedatayash0@gmail.com', '2025-03-31 09:27:22', '2025-03-31 09:27:22'),
('EHOGJXjhp5ypVtVDnDo90v9', 'codedatayash0@gmail.com', 'digiSmart.enterprises@yopmail.com', 'Welcome to CRM!', '\n<!DOCTYPE html>\n<html>\n<head>\n    <link href=\"https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600&display=swap\" rel=\"stylesheet\">\n    <style>\n        * {\n            font-family: \'Poppins\', sans-serif !important;\n        }\n        .email-container {\n            max-width: 600px;\n            margin: 0 auto;\n            color: #2c3e50;\n            background-color: #f8f9fa;\n            border-radius: 12px;\n            overflow: hidden;\n            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);\n        }\n        .header {\n            padding: 40px 20px;\n            text-align: center;\n            background: #ffffff;\n        }\n        .logo {\n            width: 200px;\n            height: auto;\n            margin: 0 auto;\n            display: block;\n            filter: drop-shadow(0 2px 4px rgba(0, 0, 0, 0.2));\n        }\n        .content {\n            padding: 40px;\n            background-color: #ffffff;\n            border-radius: 12px 12px 0 0;\n            margin-top: -20px;\n        }\n        .title {\n            color: #744bcb;\n            font-size: 24px;\n            font-weight: bold;\n            margin-bottom: 20px;\n            text-align: center;\n        }\n        .button-container {\n            text-align: center;\n            margin: 20px 0;\n        }\n        .button {\n            display: inline-block;\n            padding: 14px 28px;\n            background: #744bcb !important;\n            color: #ffffff !important;\n            text-decoration: none !important;\n            border-radius: 8px;\n            font-weight: bold;\n            text-align: center;\n            width: 200px;\n        }\n        .footer {\n            text-align: center;\n            padding: 30px;\n            background-color: #f8f9fa;\n            color: #666;\n            font-size: 14px;\n            border-top: 1px solid #eee;\n        }\n        .social-links {\n            margin: 20px 0;\n        }\n        .social-link {\n            margin: 0 10px;\n            color: #744bcb;\n            text-decoration: none;\n        }\n    </style>\n</head>\n<body>\n    <div class=\"email-container\">\n        <div class=\"content\">\n            \n        <div class=\"title\">Welcome to CRM, DigiSmart Enterprises! 🎉</div>\n        <p>Thank you for joining our CRM management platform. We\'re excited to help you organize and manage your Company\'s information effectively.</p>\n        <div style=\"background-color: #f8f9fa; padding: 20px; border-radius: 8px; margin: 20px 0;\">\n            <div style=\"margin: 12px 0;\">✨ Manage your Company\'s information easily</div>\n            <div style=\"margin: 12px 0;\">🔒 Securely share information with your team</div>\n        </div>\n        <div class=\"button-container\">\n            <a href=\"http://localhost:5173/login\" class=\"button\">Get Started</a>\n        </div>\n    \n        </div>\n        <div class=\"footer\">\n            <div class=\"social-links\">\n                <a href=\"#\" class=\"social-link\">Facebook</a>\n                <a href=\"#\" class=\"social-link\">Twitter</a>\n                <a href=\"#\" class=\"social-link\">Instagram</a>\n            </div>\n            <p> 2025 CRM. All rights reserved.</p>\n        </div>\n    </div>\n</body>\n</html>\n', 0, 'codedatayash0@gmail.com', 'codedatayash0@gmail.com', '2025-03-31 11:57:22', '2025-03-31 11:57:22'),
('ElAZJa1yRRpGZnMtqN74d4C', 'codedatayash0@gmail.com', 'techVisiondynamics@yopmail.com', 'Welcome to CRM!', '\n<!DOCTYPE html>\n<html>\n<head>\n    <link href=\"https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600&display=swap\" rel=\"stylesheet\">\n    <style>\n        * {\n            font-family: \'Poppins\', sans-serif !important;\n        }\n        .email-container {\n            max-width: 600px;\n            margin: 0 auto;\n            color: #2c3e50;\n            background-color: #f8f9fa;\n            border-radius: 12px;\n            overflow: hidden;\n            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);\n        }\n        .header {\n            padding: 40px 20px;\n            text-align: center;\n            background: #ffffff;\n        }\n        .logo {\n            width: 200px;\n            height: auto;\n            margin: 0 auto;\n            display: block;\n            filter: drop-shadow(0 2px 4px rgba(0, 0, 0, 0.2));\n        }\n        .content {\n            padding: 40px;\n            background-color: #ffffff;\n            border-radius: 12px 12px 0 0;\n            margin-top: -20px;\n        }\n        .title {\n            color: #744bcb;\n            font-size: 24px;\n            font-weight: bold;\n            margin-bottom: 20px;\n            text-align: center;\n        }\n        .button-container {\n            text-align: center;\n            margin: 20px 0;\n        }\n        .button {\n            display: inline-block;\n            padding: 14px 28px;\n            background: #744bcb !important;\n            color: #ffffff !important;\n            text-decoration: none !important;\n            border-radius: 8px;\n            font-weight: bold;\n            text-align: center;\n            width: 200px;\n        }\n        .footer {\n            text-align: center;\n            padding: 30px;\n            background-color: #f8f9fa;\n            color: #666;\n            font-size: 14px;\n            border-top: 1px solid #eee;\n        }\n        .social-links {\n            margin: 20px 0;\n        }\n        .social-link {\n            margin: 0 10px;\n            color: #744bcb;\n            text-decoration: none;\n        }\n    </style>\n</head>\n<body>\n    <div class=\"email-container\">\n        <div class=\"content\">\n            \n        <div class=\"title\">Welcome to CRM, TechVision Dynamics! 🎉</div>\n        <p>Thank you for joining our CRM management platform. We\'re excited to help you organize and manage your Company\'s information effectively.</p>\n        <div style=\"background-color: #f8f9fa; padding: 20px; border-radius: 8px; margin: 20px 0;\">\n            <div style=\"margin: 12px 0;\">✨ Manage your Company\'s information easily</div>\n            <div style=\"margin: 12px 0;\">🔒 Securely share information with your team</div>\n        </div>\n        <div class=\"button-container\">\n            <a href=\"http://localhost:5173/login\" class=\"button\">Get Started</a>\n        </div>\n    \n        </div>\n        <div class=\"footer\">\n            <div class=\"social-links\">\n                <a href=\"#\" class=\"social-link\">Facebook</a>\n                <a href=\"#\" class=\"social-link\">Twitter</a>\n                <a href=\"#\" class=\"social-link\">Instagram</a>\n            </div>\n            <p> 2025 CRM. All rights reserved.</p>\n        </div>\n    </div>\n</body>\n</html>\n', 0, 'codedatayash0@gmail.com', 'codedatayash0@gmail.com', '2025-03-31 09:27:35', '2025-03-31 09:27:35'),
('fnRgQ5XE1AevA7PG5tG6iuo', 'codedatayash0@gmail.com', 'techsilverline@yopmail.com', 'Verify Your Email', '\n<!DOCTYPE html>\n<html>\n<head>\n    <link href=\"https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600&display=swap\" rel=\"stylesheet\">\n    <style>\n        * {\n            font-family: \'Poppins\', sans-serif !important;\n        }\n        .email-container {\n            max-width: 600px;\n            margin: 0 auto;\n            color: #2c3e50;\n            background-color: #f8f9fa;\n            border-radius: 12px;\n            overflow: hidden;\n            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);\n        }\n        .header {\n            padding: 40px 20px;\n            text-align: center;\n            background: #ffffff;\n        }\n        .logo {\n            width: 200px;\n            height: auto;\n            margin: 0 auto;\n            display: block;\n            filter: drop-shadow(0 2px 4px rgba(0, 0, 0, 0.2));\n        }\n        .content {\n            padding: 40px;\n            background-color: #ffffff;\n            border-radius: 12px 12px 0 0;\n            margin-top: -20px;\n        }\n        .title {\n            color: #744bcb;\n            font-size: 24px;\n            font-weight: bold;\n            margin-bottom: 20px;\n            text-align: center;\n        }\n        .button-container {\n            text-align: center;\n            margin: 20px 0;\n        }\n        .button {\n            display: inline-block;\n            padding: 14px 28px;\n            background: #744bcb !important;\n            color: #ffffff !important;\n            text-decoration: none !important;\n            border-radius: 8px;\n            font-weight: bold;\n            text-align: center;\n            width: 200px;\n        }\n        .footer {\n            text-align: center;\n            padding: 30px;\n            background-color: #f8f9fa;\n            color: #666;\n            font-size: 14px;\n            border-top: 1px solid #eee;\n        }\n        .social-links {\n            margin: 20px 0;\n        }\n        .social-link {\n            margin: 0 10px;\n            color: #744bcb;\n            text-decoration: none;\n        }\n    </style>\n</head>\n<body>\n    <div class=\"email-container\">\n        <div class=\"content\">\n            \n        <div class=\"title\">Verify Your Email</div>\n        <p>Hello tech.silverline!</p>\n        <p>Welcome to CRM! Please verify your email with this OTP:</p>\n        <div style=\"text-align: center; margin: 30px 0;\">\n            <span style=\"font-size: 32px; font-weight: bold; color: #744bcb; letter-spacing: 5px; padding: 10px 20px; background: #f8f9fa; border-radius: 8px;\">935674</span>\n        </div>\n        <p style=\"text-align: center; color: #666;\">This OTP will expire in 5 minutes.</p>\n    \n        </div>\n        <div class=\"footer\">\n            <div class=\"social-links\">\n                <a href=\"#\" class=\"social-link\">Facebook</a>\n                <a href=\"#\" class=\"social-link\">Twitter</a>\n                <a href=\"#\" class=\"social-link\">Instagram</a>\n            </div>\n            <p> 2025 CRM. All rights reserved.</p>\n        </div>\n    </div>\n</body>\n</html>\n', 0, 'codedatayash0@gmail.com', 'codedatayash0@gmail.com', '2025-03-31 11:18:50', '2025-03-31 11:18:50'),
('gcQzUYMHzadjavC09I60jsv', 'codedatayash0@gmail.com', 'sneha.gupta.silverline@yopmail.com', 'Verify Your Email', '\n<!DOCTYPE html>\n<html>\n<head>\n    <link href=\"https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600&display=swap\" rel=\"stylesheet\">\n    <style>\n        * {\n            font-family: \'Poppins\', sans-serif !important;\n        }\n        .email-container {\n            max-width: 600px;\n            margin: 0 auto;\n            color: #2c3e50;\n            background-color: #f8f9fa;\n            border-radius: 12px;\n            overflow: hidden;\n            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);\n        }\n        .header {\n            padding: 40px 20px;\n            text-align: center;\n            background: #ffffff;\n        }\n        .logo {\n            width: 200px;\n            height: auto;\n            margin: 0 auto;\n            display: block;\n            filter: drop-shadow(0 2px 4px rgba(0, 0, 0, 0.2));\n        }\n        .content {\n            padding: 40px;\n            background-color: #ffffff;\n            border-radius: 12px 12px 0 0;\n            margin-top: -20px;\n        }\n        .title {\n            color: #744bcb;\n            font-size: 24px;\n            font-weight: bold;\n            margin-bottom: 20px;\n            text-align: center;\n        }\n        .button-container {\n            text-align: center;\n            margin: 20px 0;\n        }\n        .button {\n            display: inline-block;\n            padding: 14px 28px;\n            background: #744bcb !important;\n            color: #ffffff !important;\n            text-decoration: none !important;\n            border-radius: 8px;\n            font-weight: bold;\n            text-align: center;\n            width: 200px;\n        }\n        .footer {\n            text-align: center;\n            padding: 30px;\n            background-color: #f8f9fa;\n            color: #666;\n            font-size: 14px;\n            border-top: 1px solid #eee;\n        }\n        .social-links {\n            margin: 20px 0;\n        }\n        .social-link {\n            margin: 0 10px;\n            color: #744bcb;\n            text-decoration: none;\n        }\n    </style>\n</head>\n<body>\n    <div class=\"email-container\">\n        <div class=\"content\">\n            \n        <div class=\"title\">Verify Your Email</div>\n        <p>Hello  sneha.gupta!</p>\n        <p>Welcome to CRM! Please verify your email with this OTP:</p>\n        <div style=\"text-align: center; margin: 30px 0;\">\n            <span style=\"font-size: 32px; font-weight: bold; color: #744bcb; letter-spacing: 5px; padding: 10px 20px; background: #f8f9fa; border-radius: 8px;\">149172</span>\n        </div>\n        <p style=\"text-align: center; color: #666;\">This OTP will expire in 5 minutes.</p>\n    \n        </div>\n        <div class=\"footer\">\n            <div class=\"social-links\">\n                <a href=\"#\" class=\"social-link\">Facebook</a>\n                <a href=\"#\" class=\"social-link\">Twitter</a>\n                <a href=\"#\" class=\"social-link\">Instagram</a>\n            </div>\n            <p> 2025 CRM. All rights reserved.</p>\n        </div>\n    </div>\n</body>\n</html>\n', 0, 'codedatayash0@gmail.com', 'codedatayash0@gmail.com', '2025-03-31 12:55:25', '2025-03-31 12:55:25'),
('GR1HTazUDGf4aFxCuDjloaf', 'codedatayash0@gmail.com', 'evergreenindustries@yopmail.com', 'Verify Your Email', '\n<!DOCTYPE html>\n<html>\n<head>\n    <link href=\"https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600&display=swap\" rel=\"stylesheet\">\n    <style>\n        * {\n            font-family: \'Poppins\', sans-serif !important;\n        }\n        .email-container {\n            max-width: 600px;\n            margin: 0 auto;\n            color: #2c3e50;\n            background-color: #f8f9fa;\n            border-radius: 12px;\n            overflow: hidden;\n            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);\n        }\n        .header {\n            padding: 40px 20px;\n            text-align: center;\n            background: #ffffff;\n        }\n        .logo {\n            width: 200px;\n            height: auto;\n            margin: 0 auto;\n            display: block;\n            filter: drop-shadow(0 2px 4px rgba(0, 0, 0, 0.2));\n        }\n        .content {\n            padding: 40px;\n            background-color: #ffffff;\n            border-radius: 12px 12px 0 0;\n            margin-top: -20px;\n        }\n        .title {\n            color: #744bcb;\n            font-size: 24px;\n            font-weight: bold;\n            margin-bottom: 20px;\n            text-align: center;\n        }\n        .button-container {\n            text-align: center;\n            margin: 20px 0;\n        }\n        .button {\n            display: inline-block;\n            padding: 14px 28px;\n            background: #744bcb !important;\n            color: #ffffff !important;\n            text-decoration: none !important;\n            border-radius: 8px;\n            font-weight: bold;\n            text-align: center;\n            width: 200px;\n        }\n        .footer {\n            text-align: center;\n            padding: 30px;\n            background-color: #f8f9fa;\n            color: #666;\n            font-size: 14px;\n            border-top: 1px solid #eee;\n        }\n        .social-links {\n            margin: 20px 0;\n        }\n        .social-link {\n            margin: 0 10px;\n            color: #744bcb;\n            text-decoration: none;\n        }\n    </style>\n</head>\n<body>\n    <div class=\"email-container\">\n        <div class=\"content\">\n            \n        <div class=\"title\">Verify Your Email</div>\n        <p>Hello Evergreen Industries!</p>\n        <p>Welcome to CRM! Please verify your email with this OTP:</p>\n        <div style=\"text-align: center; margin: 30px 0;\">\n            <span style=\"font-size: 32px; font-weight: bold; color: #744bcb; letter-spacing: 5px; padding: 10px 20px; background: #f8f9fa; border-radius: 8px;\">252108</span>\n        </div>\n        <p style=\"text-align: center; color: #666;\">This OTP will expire in 5 minutes.</p>\n    \n        </div>\n        <div class=\"footer\">\n            <div class=\"social-links\">\n                <a href=\"#\" class=\"social-link\">Facebook</a>\n                <a href=\"#\" class=\"social-link\">Twitter</a>\n                <a href=\"#\" class=\"social-link\">Instagram</a>\n            </div>\n            <p> 2025 CRM. All rights reserved.</p>\n        </div>\n    </div>\n</body>\n</html>\n', 0, 'codedatayash0@gmail.com', 'codedatayash0@gmail.com', '2025-03-31 09:36:06', '2025-03-31 09:36:06'),
('hucO2BYSQtncjYqJ73WRaRk', 'codedatayash0@gmail.com', 'phoenixanalytics@yopmail.com', 'Welcome to CRM!', '\n<!DOCTYPE html>\n<html>\n<head>\n    <link href=\"https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600&display=swap\" rel=\"stylesheet\">\n    <style>\n        * {\n            font-family: \'Poppins\', sans-serif !important;\n        }\n        .email-container {\n            max-width: 600px;\n            margin: 0 auto;\n            color: #2c3e50;\n            background-color: #f8f9fa;\n            border-radius: 12px;\n            overflow: hidden;\n            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);\n        }\n        .header {\n            padding: 40px 20px;\n            text-align: center;\n            background: #ffffff;\n        }\n        .logo {\n            width: 200px;\n            height: auto;\n            margin: 0 auto;\n            display: block;\n            filter: drop-shadow(0 2px 4px rgba(0, 0, 0, 0.2));\n        }\n        .content {\n            padding: 40px;\n            background-color: #ffffff;\n            border-radius: 12px 12px 0 0;\n            margin-top: -20px;\n        }\n        .title {\n            color: #744bcb;\n            font-size: 24px;\n            font-weight: bold;\n            margin-bottom: 20px;\n            text-align: center;\n        }\n        .button-container {\n            text-align: center;\n            margin: 20px 0;\n        }\n        .button {\n            display: inline-block;\n            padding: 14px 28px;\n            background: #744bcb !important;\n            color: #ffffff !important;\n            text-decoration: none !important;\n            border-radius: 8px;\n            font-weight: bold;\n            text-align: center;\n            width: 200px;\n        }\n        .footer {\n            text-align: center;\n            padding: 30px;\n            background-color: #f8f9fa;\n            color: #666;\n            font-size: 14px;\n            border-top: 1px solid #eee;\n        }\n        .social-links {\n            margin: 20px 0;\n        }\n        .social-link {\n            margin: 0 10px;\n            color: #744bcb;\n            text-decoration: none;\n        }\n    </style>\n</head>\n<body>\n    <div class=\"email-container\">\n        <div class=\"content\">\n            \n        <div class=\"title\">Welcome to CRM, Phoenix Analytics! 🎉</div>\n        <p>Thank you for joining our CRM management platform. We\'re excited to help you organize and manage your Company\'s information effectively.</p>\n        <div style=\"background-color: #f8f9fa; padding: 20px; border-radius: 8px; margin: 20px 0;\">\n            <div style=\"margin: 12px 0;\">✨ Manage your Company\'s information easily</div>\n            <div style=\"margin: 12px 0;\">🔒 Securely share information with your team</div>\n        </div>\n        <div class=\"button-container\">\n            <a href=\"http://localhost:5173/login\" class=\"button\">Get Started</a>\n        </div>\n    \n        </div>\n        <div class=\"footer\">\n            <div class=\"social-links\">\n                <a href=\"#\" class=\"social-link\">Facebook</a>\n                <a href=\"#\" class=\"social-link\">Twitter</a>\n                <a href=\"#\" class=\"social-link\">Instagram</a>\n            </div>\n            <p> 2025 CRM. All rights reserved.</p>\n        </div>\n    </div>\n</body>\n</html>\n', 0, 'codedatayash0@gmail.com', 'codedatayash0@gmail.com', '2025-03-31 09:39:41', '2025-03-31 09:39:41'),
('i1FnPZS9ZL0bLOUf9xpGoct', 'codedatayash0@gmail.com', 'greenleafsolutions@yopmail.com', 'Verify Your Email', '\n<!DOCTYPE html>\n<html>\n<head>\n    <link href=\"https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600&display=swap\" rel=\"stylesheet\">\n    <style>\n        * {\n            font-family: \'Poppins\', sans-serif !important;\n        }\n        .email-container {\n            max-width: 600px;\n            margin: 0 auto;\n            color: #2c3e50;\n            background-color: #f8f9fa;\n            border-radius: 12px;\n            overflow: hidden;\n            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);\n        }\n        .header {\n            padding: 40px 20px;\n            text-align: center;\n            background: #ffffff;\n        }\n        .logo {\n            width: 200px;\n            height: auto;\n            margin: 0 auto;\n            display: block;\n            filter: drop-shadow(0 2px 4px rgba(0, 0, 0, 0.2));\n        }\n        .content {\n            padding: 40px;\n            background-color: #ffffff;\n            border-radius: 12px 12px 0 0;\n            margin-top: -20px;\n        }\n        .title {\n            color: #744bcb;\n            font-size: 24px;\n            font-weight: bold;\n            margin-bottom: 20px;\n            text-align: center;\n        }\n        .button-container {\n            text-align: center;\n            margin: 20px 0;\n        }\n        .button {\n            display: inline-block;\n            padding: 14px 28px;\n            background: #744bcb !important;\n            color: #ffffff !important;\n            text-decoration: none !important;\n            border-radius: 8px;\n            font-weight: bold;\n            text-align: center;\n            width: 200px;\n        }\n        .footer {\n            text-align: center;\n            padding: 30px;\n            background-color: #f8f9fa;\n            color: #666;\n            font-size: 14px;\n            border-top: 1px solid #eee;\n        }\n        .social-links {\n            margin: 20px 0;\n        }\n        .social-link {\n            margin: 0 10px;\n            color: #744bcb;\n            text-decoration: none;\n        }\n    </style>\n</head>\n<body>\n    <div class=\"email-container\">\n        <div class=\"content\">\n            \n        <div class=\"title\">Verify Your Email</div>\n        <p>Hello GreenLeaf Solutions!</p>\n        <p>Welcome to CRM! Please verify your email with this OTP:</p>\n        <div style=\"text-align: center; margin: 30px 0;\">\n            <span style=\"font-size: 32px; font-weight: bold; color: #744bcb; letter-spacing: 5px; padding: 10px 20px; background: #f8f9fa; border-radius: 8px;\">972320</span>\n        </div>\n        <p style=\"text-align: center; color: #666;\">This OTP will expire in 5 minutes.</p>\n    \n        </div>\n        <div class=\"footer\">\n            <div class=\"social-links\">\n                <a href=\"#\" class=\"social-link\">Facebook</a>\n                <a href=\"#\" class=\"social-link\">Twitter</a>\n                <a href=\"#\" class=\"social-link\">Instagram</a>\n            </div>\n            <p> 2025 CRM. All rights reserved.</p>\n        </div>\n    </div>\n</body>\n</html>\n', 0, 'codedatayash0@gmail.com', 'codedatayash0@gmail.com', '2025-03-31 09:29:08', '2025-03-31 09:29:08');
INSERT INTO `emails` (`id`, `from`, `to`, `subject`, `html`, `isRead`, `created_by`, `updated_by`, `createdAt`, `updatedAt`) VALUES
('IQUmR0LHA0h7LC5vDAGJmed', 'codedatayash0@gmail.com', 'bluewaveconsulting@yopmail.com', 'Welcome to CRM!', '\n<!DOCTYPE html>\n<html>\n<head>\n    <link href=\"https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600&display=swap\" rel=\"stylesheet\">\n    <style>\n        * {\n            font-family: \'Poppins\', sans-serif !important;\n        }\n        .email-container {\n            max-width: 600px;\n            margin: 0 auto;\n            color: #2c3e50;\n            background-color: #f8f9fa;\n            border-radius: 12px;\n            overflow: hidden;\n            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);\n        }\n        .header {\n            padding: 40px 20px;\n            text-align: center;\n            background: #ffffff;\n        }\n        .logo {\n            width: 200px;\n            height: auto;\n            margin: 0 auto;\n            display: block;\n            filter: drop-shadow(0 2px 4px rgba(0, 0, 0, 0.2));\n        }\n        .content {\n            padding: 40px;\n            background-color: #ffffff;\n            border-radius: 12px 12px 0 0;\n            margin-top: -20px;\n        }\n        .title {\n            color: #744bcb;\n            font-size: 24px;\n            font-weight: bold;\n            margin-bottom: 20px;\n            text-align: center;\n        }\n        .button-container {\n            text-align: center;\n            margin: 20px 0;\n        }\n        .button {\n            display: inline-block;\n            padding: 14px 28px;\n            background: #744bcb !important;\n            color: #ffffff !important;\n            text-decoration: none !important;\n            border-radius: 8px;\n            font-weight: bold;\n            text-align: center;\n            width: 200px;\n        }\n        .footer {\n            text-align: center;\n            padding: 30px;\n            background-color: #f8f9fa;\n            color: #666;\n            font-size: 14px;\n            border-top: 1px solid #eee;\n        }\n        .social-links {\n            margin: 20px 0;\n        }\n        .social-link {\n            margin: 0 10px;\n            color: #744bcb;\n            text-decoration: none;\n        }\n    </style>\n</head>\n<body>\n    <div class=\"email-container\">\n        <div class=\"content\">\n            \n        <div class=\"title\">Welcome to CRM, BlueWave Consulting! 🎉</div>\n        <p>Thank you for joining our CRM management platform. We\'re excited to help you organize and manage your Company\'s information effectively.</p>\n        <div style=\"background-color: #f8f9fa; padding: 20px; border-radius: 8px; margin: 20px 0;\">\n            <div style=\"margin: 12px 0;\">✨ Manage your Company\'s information easily</div>\n            <div style=\"margin: 12px 0;\">🔒 Securely share information with your team</div>\n        </div>\n        <div class=\"button-container\">\n            <a href=\"http://localhost:5173/login\" class=\"button\">Get Started</a>\n        </div>\n    \n        </div>\n        <div class=\"footer\">\n            <div class=\"social-links\">\n                <a href=\"#\" class=\"social-link\">Facebook</a>\n                <a href=\"#\" class=\"social-link\">Twitter</a>\n                <a href=\"#\" class=\"social-link\">Instagram</a>\n            </div>\n            <p> 2025 CRM. All rights reserved.</p>\n        </div>\n    </div>\n</body>\n</html>\n', 0, 'codedatayash0@gmail.com', 'codedatayash0@gmail.com', '2025-03-31 09:32:34', '2025-03-31 09:32:34'),
('J5R5wA3yoAjYFSSxTivz77w', 'codedatayash0@gmail.com', 'cloudBridge.technologies@yopmail.com', 'Verify Your Email', '\n<!DOCTYPE html>\n<html>\n<head>\n    <link href=\"https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600&display=swap\" rel=\"stylesheet\">\n    <style>\n        * {\n            font-family: \'Poppins\', sans-serif !important;\n        }\n        .email-container {\n            max-width: 600px;\n            margin: 0 auto;\n            color: #2c3e50;\n            background-color: #f8f9fa;\n            border-radius: 12px;\n            overflow: hidden;\n            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);\n        }\n        .header {\n            padding: 40px 20px;\n            text-align: center;\n            background: #ffffff;\n        }\n        .logo {\n            width: 200px;\n            height: auto;\n            margin: 0 auto;\n            display: block;\n            filter: drop-shadow(0 2px 4px rgba(0, 0, 0, 0.2));\n        }\n        .content {\n            padding: 40px;\n            background-color: #ffffff;\n            border-radius: 12px 12px 0 0;\n            margin-top: -20px;\n        }\n        .title {\n            color: #744bcb;\n            font-size: 24px;\n            font-weight: bold;\n            margin-bottom: 20px;\n            text-align: center;\n        }\n        .button-container {\n            text-align: center;\n            margin: 20px 0;\n        }\n        .button {\n            display: inline-block;\n            padding: 14px 28px;\n            background: #744bcb !important;\n            color: #ffffff !important;\n            text-decoration: none !important;\n            border-radius: 8px;\n            font-weight: bold;\n            text-align: center;\n            width: 200px;\n        }\n        .footer {\n            text-align: center;\n            padding: 30px;\n            background-color: #f8f9fa;\n            color: #666;\n            font-size: 14px;\n            border-top: 1px solid #eee;\n        }\n        .social-links {\n            margin: 20px 0;\n        }\n        .social-link {\n            margin: 0 10px;\n            color: #744bcb;\n            text-decoration: none;\n        }\n    </style>\n</head>\n<body>\n    <div class=\"email-container\">\n        <div class=\"content\">\n            \n        <div class=\"title\">Verify Your Email</div>\n        <p>Hello CloudBridge Technologies!</p>\n        <p>Welcome to CRM! Please verify your email with this OTP:</p>\n        <div style=\"text-align: center; margin: 30px 0;\">\n            <span style=\"font-size: 32px; font-weight: bold; color: #744bcb; letter-spacing: 5px; padding: 10px 20px; background: #f8f9fa; border-radius: 8px;\">772299</span>\n        </div>\n        <p style=\"text-align: center; color: #666;\">This OTP will expire in 5 minutes.</p>\n    \n        </div>\n        <div class=\"footer\">\n            <div class=\"social-links\">\n                <a href=\"#\" class=\"social-link\">Facebook</a>\n                <a href=\"#\" class=\"social-link\">Twitter</a>\n                <a href=\"#\" class=\"social-link\">Instagram</a>\n            </div>\n            <p> 2025 CRM. All rights reserved.</p>\n        </div>\n    </div>\n</body>\n</html>\n', 0, 'codedatayash0@gmail.com', 'codedatayash0@gmail.com', '2025-03-31 11:55:43', '2025-03-31 11:55:43'),
('JlEZWww2jR8jUDZftx47KBe', 'codedatayash0@gmail.com', 'apexglobaltrading@yopmail.com', 'Verify Your Email', '\n<!DOCTYPE html>\n<html>\n<head>\n    <link href=\"https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600&display=swap\" rel=\"stylesheet\">\n    <style>\n        * {\n            font-family: \'Poppins\', sans-serif !important;\n        }\n        .email-container {\n            max-width: 600px;\n            margin: 0 auto;\n            color: #2c3e50;\n            background-color: #f8f9fa;\n            border-radius: 12px;\n            overflow: hidden;\n            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);\n        }\n        .header {\n            padding: 40px 20px;\n            text-align: center;\n            background: #ffffff;\n        }\n        .logo {\n            width: 200px;\n            height: auto;\n            margin: 0 auto;\n            display: block;\n            filter: drop-shadow(0 2px 4px rgba(0, 0, 0, 0.2));\n        }\n        .content {\n            padding: 40px;\n            background-color: #ffffff;\n            border-radius: 12px 12px 0 0;\n            margin-top: -20px;\n        }\n        .title {\n            color: #744bcb;\n            font-size: 24px;\n            font-weight: bold;\n            margin-bottom: 20px;\n            text-align: center;\n        }\n        .button-container {\n            text-align: center;\n            margin: 20px 0;\n        }\n        .button {\n            display: inline-block;\n            padding: 14px 28px;\n            background: #744bcb !important;\n            color: #ffffff !important;\n            text-decoration: none !important;\n            border-radius: 8px;\n            font-weight: bold;\n            text-align: center;\n            width: 200px;\n        }\n        .footer {\n            text-align: center;\n            padding: 30px;\n            background-color: #f8f9fa;\n            color: #666;\n            font-size: 14px;\n            border-top: 1px solid #eee;\n        }\n        .social-links {\n            margin: 20px 0;\n        }\n        .social-link {\n            margin: 0 10px;\n            color: #744bcb;\n            text-decoration: none;\n        }\n    </style>\n</head>\n<body>\n    <div class=\"email-container\">\n        <div class=\"content\">\n            \n        <div class=\"title\">Verify Your Email</div>\n        <p>Hello Apex Global Trading!</p>\n        <p>Welcome to CRM! Please verify your email with this OTP:</p>\n        <div style=\"text-align: center; margin: 30px 0;\">\n            <span style=\"font-size: 32px; font-weight: bold; color: #744bcb; letter-spacing: 5px; padding: 10px 20px; background: #f8f9fa; border-radius: 8px;\">397357</span>\n        </div>\n        <p style=\"text-align: center; color: #666;\">This OTP will expire in 5 minutes.</p>\n    \n        </div>\n        <div class=\"footer\">\n            <div class=\"social-links\">\n                <a href=\"#\" class=\"social-link\">Facebook</a>\n                <a href=\"#\" class=\"social-link\">Twitter</a>\n                <a href=\"#\" class=\"social-link\">Instagram</a>\n            </div>\n            <p> 2025 CRM. All rights reserved.</p>\n        </div>\n    </div>\n</body>\n</html>\n', 0, 'codedatayash0@gmail.com', 'codedatayash0@gmail.com', '2025-03-31 09:34:44', '2025-03-31 09:34:44'),
('kq3TgUCzFdEi1RQpRnlVHON', 'codedatayash0@gmail.com', 'pm.silverline@yopmail.com', 'Verify Your Email', '\n<!DOCTYPE html>\n<html>\n<head>\n    <link href=\"https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600&display=swap\" rel=\"stylesheet\">\n    <style>\n        * {\n            font-family: \'Poppins\', sans-serif !important;\n        }\n        .email-container {\n            max-width: 600px;\n            margin: 0 auto;\n            color: #2c3e50;\n            background-color: #f8f9fa;\n            border-radius: 12px;\n            overflow: hidden;\n            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);\n        }\n        .header {\n            padding: 40px 20px;\n            text-align: center;\n            background: #ffffff;\n        }\n        .logo {\n            width: 200px;\n            height: auto;\n            margin: 0 auto;\n            display: block;\n            filter: drop-shadow(0 2px 4px rgba(0, 0, 0, 0.2));\n        }\n        .content {\n            padding: 40px;\n            background-color: #ffffff;\n            border-radius: 12px 12px 0 0;\n            margin-top: -20px;\n        }\n        .title {\n            color: #744bcb;\n            font-size: 24px;\n            font-weight: bold;\n            margin-bottom: 20px;\n            text-align: center;\n        }\n        .button-container {\n            text-align: center;\n            margin: 20px 0;\n        }\n        .button {\n            display: inline-block;\n            padding: 14px 28px;\n            background: #744bcb !important;\n            color: #ffffff !important;\n            text-decoration: none !important;\n            border-radius: 8px;\n            font-weight: bold;\n            text-align: center;\n            width: 200px;\n        }\n        .footer {\n            text-align: center;\n            padding: 30px;\n            background-color: #f8f9fa;\n            color: #666;\n            font-size: 14px;\n            border-top: 1px solid #eee;\n        }\n        .social-links {\n            margin: 20px 0;\n        }\n        .social-link {\n            margin: 0 10px;\n            color: #744bcb;\n            text-decoration: none;\n        }\n    </style>\n</head>\n<body>\n    <div class=\"email-container\">\n        <div class=\"content\">\n            \n        <div class=\"title\">Verify Your Email</div>\n        <p>Hello pm.silverline!</p>\n        <p>Welcome to CRM! Please verify your email with this OTP:</p>\n        <div style=\"text-align: center; margin: 30px 0;\">\n            <span style=\"font-size: 32px; font-weight: bold; color: #744bcb; letter-spacing: 5px; padding: 10px 20px; background: #f8f9fa; border-radius: 8px;\">030494</span>\n        </div>\n        <p style=\"text-align: center; color: #666;\">This OTP will expire in 5 minutes.</p>\n    \n        </div>\n        <div class=\"footer\">\n            <div class=\"social-links\">\n                <a href=\"#\" class=\"social-link\">Facebook</a>\n                <a href=\"#\" class=\"social-link\">Twitter</a>\n                <a href=\"#\" class=\"social-link\">Instagram</a>\n            </div>\n            <p> 2025 CRM. All rights reserved.</p>\n        </div>\n    </div>\n</body>\n</html>\n', 0, 'codedatayash0@gmail.com', 'codedatayash0@gmail.com', '2025-03-31 11:16:47', '2025-03-31 11:16:47'),
('kwFQXEYWaFEtaPUBdyDrBCG', 'codedatayash0@gmail.com', 'horizonventures@yopmail.com', 'Verify Your Email', '\n<!DOCTYPE html>\n<html>\n<head>\n    <link href=\"https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600&display=swap\" rel=\"stylesheet\">\n    <style>\n        * {\n            font-family: \'Poppins\', sans-serif !important;\n        }\n        .email-container {\n            max-width: 600px;\n            margin: 0 auto;\n            color: #2c3e50;\n            background-color: #f8f9fa;\n            border-radius: 12px;\n            overflow: hidden;\n            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);\n        }\n        .header {\n            padding: 40px 20px;\n            text-align: center;\n            background: #ffffff;\n        }\n        .logo {\n            width: 200px;\n            height: auto;\n            margin: 0 auto;\n            display: block;\n            filter: drop-shadow(0 2px 4px rgba(0, 0, 0, 0.2));\n        }\n        .content {\n            padding: 40px;\n            background-color: #ffffff;\n            border-radius: 12px 12px 0 0;\n            margin-top: -20px;\n        }\n        .title {\n            color: #744bcb;\n            font-size: 24px;\n            font-weight: bold;\n            margin-bottom: 20px;\n            text-align: center;\n        }\n        .button-container {\n            text-align: center;\n            margin: 20px 0;\n        }\n        .button {\n            display: inline-block;\n            padding: 14px 28px;\n            background: #744bcb !important;\n            color: #ffffff !important;\n            text-decoration: none !important;\n            border-radius: 8px;\n            font-weight: bold;\n            text-align: center;\n            width: 200px;\n        }\n        .footer {\n            text-align: center;\n            padding: 30px;\n            background-color: #f8f9fa;\n            color: #666;\n            font-size: 14px;\n            border-top: 1px solid #eee;\n        }\n        .social-links {\n            margin: 20px 0;\n        }\n        .social-link {\n            margin: 0 10px;\n            color: #744bcb;\n            text-decoration: none;\n        }\n    </style>\n</head>\n<body>\n    <div class=\"email-container\">\n        <div class=\"content\">\n            \n        <div class=\"title\">Verify Your Email</div>\n        <p>Hello Horizon Ventures!</p>\n        <p>Welcome to CRM! Please verify your email with this OTP:</p>\n        <div style=\"text-align: center; margin: 30px 0;\">\n            <span style=\"font-size: 32px; font-weight: bold; color: #744bcb; letter-spacing: 5px; padding: 10px 20px; background: #f8f9fa; border-radius: 8px;\">416751</span>\n        </div>\n        <p style=\"text-align: center; color: #666;\">This OTP will expire in 5 minutes.</p>\n    \n        </div>\n        <div class=\"footer\">\n            <div class=\"social-links\">\n                <a href=\"#\" class=\"social-link\">Facebook</a>\n                <a href=\"#\" class=\"social-link\">Twitter</a>\n                <a href=\"#\" class=\"social-link\">Instagram</a>\n            </div>\n            <p> 2025 CRM. All rights reserved.</p>\n        </div>\n    </div>\n</body>\n</html>\n', 0, 'codedatayash0@gmail.com', 'codedatayash0@gmail.com', '2025-03-31 09:43:10', '2025-03-31 09:43:10'),
('MLvL54P9g2LvSBz9z1YKhPx', 'codedatayash0@gmail.com', 'bluewaveconsulting@yopmail.com', 'Verify Your Email', '\n<!DOCTYPE html>\n<html>\n<head>\n    <link href=\"https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600&display=swap\" rel=\"stylesheet\">\n    <style>\n        * {\n            font-family: \'Poppins\', sans-serif !important;\n        }\n        .email-container {\n            max-width: 600px;\n            margin: 0 auto;\n            color: #2c3e50;\n            background-color: #f8f9fa;\n            border-radius: 12px;\n            overflow: hidden;\n            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);\n        }\n        .header {\n            padding: 40px 20px;\n            text-align: center;\n            background: #ffffff;\n        }\n        .logo {\n            width: 200px;\n            height: auto;\n            margin: 0 auto;\n            display: block;\n            filter: drop-shadow(0 2px 4px rgba(0, 0, 0, 0.2));\n        }\n        .content {\n            padding: 40px;\n            background-color: #ffffff;\n            border-radius: 12px 12px 0 0;\n            margin-top: -20px;\n        }\n        .title {\n            color: #744bcb;\n            font-size: 24px;\n            font-weight: bold;\n            margin-bottom: 20px;\n            text-align: center;\n        }\n        .button-container {\n            text-align: center;\n            margin: 20px 0;\n        }\n        .button {\n            display: inline-block;\n            padding: 14px 28px;\n            background: #744bcb !important;\n            color: #ffffff !important;\n            text-decoration: none !important;\n            border-radius: 8px;\n            font-weight: bold;\n            text-align: center;\n            width: 200px;\n        }\n        .footer {\n            text-align: center;\n            padding: 30px;\n            background-color: #f8f9fa;\n            color: #666;\n            font-size: 14px;\n            border-top: 1px solid #eee;\n        }\n        .social-links {\n            margin: 20px 0;\n        }\n        .social-link {\n            margin: 0 10px;\n            color: #744bcb;\n            text-decoration: none;\n        }\n    </style>\n</head>\n<body>\n    <div class=\"email-container\">\n        <div class=\"content\">\n            \n        <div class=\"title\">Verify Your Email</div>\n        <p>Hello BlueWave Consulting!</p>\n        <p>Welcome to CRM! Please verify your email with this OTP:</p>\n        <div style=\"text-align: center; margin: 30px 0;\">\n            <span style=\"font-size: 32px; font-weight: bold; color: #744bcb; letter-spacing: 5px; padding: 10px 20px; background: #f8f9fa; border-radius: 8px;\">493671</span>\n        </div>\n        <p style=\"text-align: center; color: #666;\">This OTP will expire in 5 minutes.</p>\n    \n        </div>\n        <div class=\"footer\">\n            <div class=\"social-links\">\n                <a href=\"#\" class=\"social-link\">Facebook</a>\n                <a href=\"#\" class=\"social-link\">Twitter</a>\n                <a href=\"#\" class=\"social-link\">Instagram</a>\n            </div>\n            <p> 2025 CRM. All rights reserved.</p>\n        </div>\n    </div>\n</body>\n</html>\n', 0, 'codedatayash0@gmail.com', 'codedatayash0@gmail.com', '2025-03-31 09:32:11', '2025-03-31 09:32:11'),
('ngz10s7d7ER8sRk8dNGnYNk', 'codedatayash0@gmail.com', 'neha.singh.silverline@yopmail.com', 'Verify Your Email', '\n<!DOCTYPE html>\n<html>\n<head>\n    <link href=\"https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600&display=swap\" rel=\"stylesheet\">\n    <style>\n        * {\n            font-family: \'Poppins\', sans-serif !important;\n        }\n        .email-container {\n            max-width: 600px;\n            margin: 0 auto;\n            color: #2c3e50;\n            background-color: #f8f9fa;\n            border-radius: 12px;\n            overflow: hidden;\n            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);\n        }\n        .header {\n            padding: 40px 20px;\n            text-align: center;\n            background: #ffffff;\n        }\n        .logo {\n            width: 200px;\n            height: auto;\n            margin: 0 auto;\n            display: block;\n            filter: drop-shadow(0 2px 4px rgba(0, 0, 0, 0.2));\n        }\n        .content {\n            padding: 40px;\n            background-color: #ffffff;\n            border-radius: 12px 12px 0 0;\n            margin-top: -20px;\n        }\n        .title {\n            color: #744bcb;\n            font-size: 24px;\n            font-weight: bold;\n            margin-bottom: 20px;\n            text-align: center;\n        }\n        .button-container {\n            text-align: center;\n            margin: 20px 0;\n        }\n        .button {\n            display: inline-block;\n            padding: 14px 28px;\n            background: #744bcb !important;\n            color: #ffffff !important;\n            text-decoration: none !important;\n            border-radius: 8px;\n            font-weight: bold;\n            text-align: center;\n            width: 200px;\n        }\n        .footer {\n            text-align: center;\n            padding: 30px;\n            background-color: #f8f9fa;\n            color: #666;\n            font-size: 14px;\n            border-top: 1px solid #eee;\n        }\n        .social-links {\n            margin: 20px 0;\n        }\n        .social-link {\n            margin: 0 10px;\n            color: #744bcb;\n            text-decoration: none;\n        }\n    </style>\n</head>\n<body>\n    <div class=\"email-container\">\n        <div class=\"content\">\n            \n        <div class=\"title\">Verify Your Email</div>\n        <p>Hello neha.singh!</p>\n        <p>Welcome to CRM! Please verify your email with this OTP:</p>\n        <div style=\"text-align: center; margin: 30px 0;\">\n            <span style=\"font-size: 32px; font-weight: bold; color: #744bcb; letter-spacing: 5px; padding: 10px 20px; background: #f8f9fa; border-radius: 8px;\">419692</span>\n        </div>\n        <p style=\"text-align: center; color: #666;\">This OTP will expire in 5 minutes.</p>\n    \n        </div>\n        <div class=\"footer\">\n            <div class=\"social-links\">\n                <a href=\"#\" class=\"social-link\">Facebook</a>\n                <a href=\"#\" class=\"social-link\">Twitter</a>\n                <a href=\"#\" class=\"social-link\">Instagram</a>\n            </div>\n            <p> 2025 CRM. All rights reserved.</p>\n        </div>\n    </div>\n</body>\n</html>\n', 0, 'codedatayash0@gmail.com', 'codedatayash0@gmail.com', '2025-03-31 12:52:50', '2025-03-31 12:52:50'),
('NLoHgOvCpJTFnCVCUD6Ng9u', 'codedatayash0@gmail.com', 'stellarinnovations@yopmail.com', 'Verify Your Email', '\n<!DOCTYPE html>\n<html>\n<head>\n    <link href=\"https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600&display=swap\" rel=\"stylesheet\">\n    <style>\n        * {\n            font-family: \'Poppins\', sans-serif !important;\n        }\n        .email-container {\n            max-width: 600px;\n            margin: 0 auto;\n            color: #2c3e50;\n            background-color: #f8f9fa;\n            border-radius: 12px;\n            overflow: hidden;\n            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);\n        }\n        .header {\n            padding: 40px 20px;\n            text-align: center;\n            background: #ffffff;\n        }\n        .logo {\n            width: 200px;\n            height: auto;\n            margin: 0 auto;\n            display: block;\n            filter: drop-shadow(0 2px 4px rgba(0, 0, 0, 0.2));\n        }\n        .content {\n            padding: 40px;\n            background-color: #ffffff;\n            border-radius: 12px 12px 0 0;\n            margin-top: -20px;\n        }\n        .title {\n            color: #744bcb;\n            font-size: 24px;\n            font-weight: bold;\n            margin-bottom: 20px;\n            text-align: center;\n        }\n        .button-container {\n            text-align: center;\n            margin: 20px 0;\n        }\n        .button {\n            display: inline-block;\n            padding: 14px 28px;\n            background: #744bcb !important;\n            color: #ffffff !important;\n            text-decoration: none !important;\n            border-radius: 8px;\n            font-weight: bold;\n            text-align: center;\n            width: 200px;\n        }\n        .footer {\n            text-align: center;\n            padding: 30px;\n            background-color: #f8f9fa;\n            color: #666;\n            font-size: 14px;\n            border-top: 1px solid #eee;\n        }\n        .social-links {\n            margin: 20px 0;\n        }\n        .social-link {\n            margin: 0 10px;\n            color: #744bcb;\n            text-decoration: none;\n        }\n    </style>\n</head>\n<body>\n    <div class=\"email-container\">\n        <div class=\"content\">\n            \n        <div class=\"title\">Verify Your Email</div>\n        <p>Hello Stellar Innovations!</p>\n        <p>Welcome to CRM! Please verify your email with this OTP:</p>\n        <div style=\"text-align: center; margin: 30px 0;\">\n            <span style=\"font-size: 32px; font-weight: bold; color: #744bcb; letter-spacing: 5px; padding: 10px 20px; background: #f8f9fa; border-radius: 8px;\">132476</span>\n        </div>\n        <p style=\"text-align: center; color: #666;\">This OTP will expire in 5 minutes.</p>\n    \n        </div>\n        <div class=\"footer\">\n            <div class=\"social-links\">\n                <a href=\"#\" class=\"social-link\">Facebook</a>\n                <a href=\"#\" class=\"social-link\">Twitter</a>\n                <a href=\"#\" class=\"social-link\">Instagram</a>\n            </div>\n            <p> 2025 CRM. All rights reserved.</p>\n        </div>\n    </div>\n</body>\n</html>\n', 0, 'codedatayash0@gmail.com', 'codedatayash0@gmail.com', '2025-03-31 09:33:42', '2025-03-31 09:33:42'),
('o0drYYrlrkmwq2z5GrR8bgA', 'codedatayash0@gmail.com', 'greenleafsolutions@yopmail.com', 'Welcome to CRM!', '\n<!DOCTYPE html>\n<html>\n<head>\n    <link href=\"https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600&display=swap\" rel=\"stylesheet\">\n    <style>\n        * {\n            font-family: \'Poppins\', sans-serif !important;\n        }\n        .email-container {\n            max-width: 600px;\n            margin: 0 auto;\n            color: #2c3e50;\n            background-color: #f8f9fa;\n            border-radius: 12px;\n            overflow: hidden;\n            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);\n        }\n        .header {\n            padding: 40px 20px;\n            text-align: center;\n            background: #ffffff;\n        }\n        .logo {\n            width: 200px;\n            height: auto;\n            margin: 0 auto;\n            display: block;\n            filter: drop-shadow(0 2px 4px rgba(0, 0, 0, 0.2));\n        }\n        .content {\n            padding: 40px;\n            background-color: #ffffff;\n            border-radius: 12px 12px 0 0;\n            margin-top: -20px;\n        }\n        .title {\n            color: #744bcb;\n            font-size: 24px;\n            font-weight: bold;\n            margin-bottom: 20px;\n            text-align: center;\n        }\n        .button-container {\n            text-align: center;\n            margin: 20px 0;\n        }\n        .button {\n            display: inline-block;\n            padding: 14px 28px;\n            background: #744bcb !important;\n            color: #ffffff !important;\n            text-decoration: none !important;\n            border-radius: 8px;\n            font-weight: bold;\n            text-align: center;\n            width: 200px;\n        }\n        .footer {\n            text-align: center;\n            padding: 30px;\n            background-color: #f8f9fa;\n            color: #666;\n            font-size: 14px;\n            border-top: 1px solid #eee;\n        }\n        .social-links {\n            margin: 20px 0;\n        }\n        .social-link {\n            margin: 0 10px;\n            color: #744bcb;\n            text-decoration: none;\n        }\n    </style>\n</head>\n<body>\n    <div class=\"email-container\">\n        <div class=\"content\">\n            \n        <div class=\"title\">Welcome to CRM, GreenLeaf Solutions! 🎉</div>\n        <p>Thank you for joining our CRM management platform. We\'re excited to help you organize and manage your Company\'s information effectively.</p>\n        <div style=\"background-color: #f8f9fa; padding: 20px; border-radius: 8px; margin: 20px 0;\">\n            <div style=\"margin: 12px 0;\">✨ Manage your Company\'s information easily</div>\n            <div style=\"margin: 12px 0;\">🔒 Securely share information with your team</div>\n        </div>\n        <div class=\"button-container\">\n            <a href=\"http://localhost:5173/login\" class=\"button\">Get Started</a>\n        </div>\n    \n        </div>\n        <div class=\"footer\">\n            <div class=\"social-links\">\n                <a href=\"#\" class=\"social-link\">Facebook</a>\n                <a href=\"#\" class=\"social-link\">Twitter</a>\n                <a href=\"#\" class=\"social-link\">Instagram</a>\n            </div>\n            <p> 2025 CRM. All rights reserved.</p>\n        </div>\n    </div>\n</body>\n</html>\n', 0, 'codedatayash0@gmail.com', 'codedatayash0@gmail.com', '2025-03-31 09:29:48', '2025-03-31 09:29:48'),
('oKkICSBTxulrRZnvzhJVxGK', 'codedatayash0@gmail.com', 'stellarinnovations@yopmail.com', 'Welcome to CRM!', '\n<!DOCTYPE html>\n<html>\n<head>\n    <link href=\"https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600&display=swap\" rel=\"stylesheet\">\n    <style>\n        * {\n            font-family: \'Poppins\', sans-serif !important;\n        }\n        .email-container {\n            max-width: 600px;\n            margin: 0 auto;\n            color: #2c3e50;\n            background-color: #f8f9fa;\n            border-radius: 12px;\n            overflow: hidden;\n            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);\n        }\n        .header {\n            padding: 40px 20px;\n            text-align: center;\n            background: #ffffff;\n        }\n        .logo {\n            width: 200px;\n            height: auto;\n            margin: 0 auto;\n            display: block;\n            filter: drop-shadow(0 2px 4px rgba(0, 0, 0, 0.2));\n        }\n        .content {\n            padding: 40px;\n            background-color: #ffffff;\n            border-radius: 12px 12px 0 0;\n            margin-top: -20px;\n        }\n        .title {\n            color: #744bcb;\n            font-size: 24px;\n            font-weight: bold;\n            margin-bottom: 20px;\n            text-align: center;\n        }\n        .button-container {\n            text-align: center;\n            margin: 20px 0;\n        }\n        .button {\n            display: inline-block;\n            padding: 14px 28px;\n            background: #744bcb !important;\n            color: #ffffff !important;\n            text-decoration: none !important;\n            border-radius: 8px;\n            font-weight: bold;\n            text-align: center;\n            width: 200px;\n        }\n        .footer {\n            text-align: center;\n            padding: 30px;\n            background-color: #f8f9fa;\n            color: #666;\n            font-size: 14px;\n            border-top: 1px solid #eee;\n        }\n        .social-links {\n            margin: 20px 0;\n        }\n        .social-link {\n            margin: 0 10px;\n            color: #744bcb;\n            text-decoration: none;\n        }\n    </style>\n</head>\n<body>\n    <div class=\"email-container\">\n        <div class=\"content\">\n            \n        <div class=\"title\">Welcome to CRM, Stellar Innovations! 🎉</div>\n        <p>Thank you for joining our CRM management platform. We\'re excited to help you organize and manage your Company\'s information effectively.</p>\n        <div style=\"background-color: #f8f9fa; padding: 20px; border-radius: 8px; margin: 20px 0;\">\n            <div style=\"margin: 12px 0;\">✨ Manage your Company\'s information easily</div>\n            <div style=\"margin: 12px 0;\">🔒 Securely share information with your team</div>\n        </div>\n        <div class=\"button-container\">\n            <a href=\"http://localhost:5173/login\" class=\"button\">Get Started</a>\n        </div>\n    \n        </div>\n        <div class=\"footer\">\n            <div class=\"social-links\">\n                <a href=\"#\" class=\"social-link\">Facebook</a>\n                <a href=\"#\" class=\"social-link\">Twitter</a>\n                <a href=\"#\" class=\"social-link\">Instagram</a>\n            </div>\n            <p> 2025 CRM. All rights reserved.</p>\n        </div>\n    </div>\n</body>\n</html>\n', 0, 'codedatayash0@gmail.com', 'codedatayash0@gmail.com', '2025-03-31 09:34:02', '2025-03-31 09:34:02'),
('p2rN2RYnE2bk4cW0Avzw8QC', 'codedatayash0@gmail.com', 'ba.silverline@yopmail.com', 'Verify Your Email', '\n<!DOCTYPE html>\n<html>\n<head>\n    <link href=\"https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600&display=swap\" rel=\"stylesheet\">\n    <style>\n        * {\n            font-family: \'Poppins\', sans-serif !important;\n        }\n        .email-container {\n            max-width: 600px;\n            margin: 0 auto;\n            color: #2c3e50;\n            background-color: #f8f9fa;\n            border-radius: 12px;\n            overflow: hidden;\n            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);\n        }\n        .header {\n            padding: 40px 20px;\n            text-align: center;\n            background: #ffffff;\n        }\n        .logo {\n            width: 200px;\n            height: auto;\n            margin: 0 auto;\n            display: block;\n            filter: drop-shadow(0 2px 4px rgba(0, 0, 0, 0.2));\n        }\n        .content {\n            padding: 40px;\n            background-color: #ffffff;\n            border-radius: 12px 12px 0 0;\n            margin-top: -20px;\n        }\n        .title {\n            color: #744bcb;\n            font-size: 24px;\n            font-weight: bold;\n            margin-bottom: 20px;\n            text-align: center;\n        }\n        .button-container {\n            text-align: center;\n            margin: 20px 0;\n        }\n        .button {\n            display: inline-block;\n            padding: 14px 28px;\n            background: #744bcb !important;\n            color: #ffffff !important;\n            text-decoration: none !important;\n            border-radius: 8px;\n            font-weight: bold;\n            text-align: center;\n            width: 200px;\n        }\n        .footer {\n            text-align: center;\n            padding: 30px;\n            background-color: #f8f9fa;\n            color: #666;\n            font-size: 14px;\n            border-top: 1px solid #eee;\n        }\n        .social-links {\n            margin: 20px 0;\n        }\n        .social-link {\n            margin: 0 10px;\n            color: #744bcb;\n            text-decoration: none;\n        }\n    </style>\n</head>\n<body>\n    <div class=\"email-container\">\n        <div class=\"content\">\n            \n        <div class=\"title\">Verify Your Email</div>\n        <p>Hello  ba.silverline!</p>\n        <p>Welcome to CRM! Please verify your email with this OTP:</p>\n        <div style=\"text-align: center; margin: 30px 0;\">\n            <span style=\"font-size: 32px; font-weight: bold; color: #744bcb; letter-spacing: 5px; padding: 10px 20px; background: #f8f9fa; border-radius: 8px;\">395496</span>\n        </div>\n        <p style=\"text-align: center; color: #666;\">This OTP will expire in 5 minutes.</p>\n    \n        </div>\n        <div class=\"footer\">\n            <div class=\"social-links\">\n                <a href=\"#\" class=\"social-link\">Facebook</a>\n                <a href=\"#\" class=\"social-link\">Twitter</a>\n                <a href=\"#\" class=\"social-link\">Instagram</a>\n            </div>\n            <p> 2025 CRM. All rights reserved.</p>\n        </div>\n    </div>\n</body>\n</html>\n', 0, 'codedatayash0@gmail.com', 'codedatayash0@gmail.com', '2025-03-31 11:31:13', '2025-03-31 11:31:13'),
('pOC4PViG66RpG13N65jY5QA', 'codedatayash0@gmail.com', 'silverlinesystems@yopmail.com', 'Welcome to CRM!', '\n<!DOCTYPE html>\n<html>\n<head>\n    <link href=\"https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600&display=swap\" rel=\"stylesheet\">\n    <style>\n        * {\n            font-family: \'Poppins\', sans-serif !important;\n        }\n        .email-container {\n            max-width: 600px;\n            margin: 0 auto;\n            color: #2c3e50;\n            background-color: #f8f9fa;\n            border-radius: 12px;\n            overflow: hidden;\n            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);\n        }\n        .header {\n            padding: 40px 20px;\n            text-align: center;\n            background: #ffffff;\n        }\n        .logo {\n            width: 200px;\n            height: auto;\n            margin: 0 auto;\n            display: block;\n            filter: drop-shadow(0 2px 4px rgba(0, 0, 0, 0.2));\n        }\n        .content {\n            padding: 40px;\n            background-color: #ffffff;\n            border-radius: 12px 12px 0 0;\n            margin-top: -20px;\n        }\n        .title {\n            color: #744bcb;\n            font-size: 24px;\n            font-weight: bold;\n            margin-bottom: 20px;\n            text-align: center;\n        }\n        .button-container {\n            text-align: center;\n            margin: 20px 0;\n        }\n        .button {\n            display: inline-block;\n            padding: 14px 28px;\n            background: #744bcb !important;\n            color: #ffffff !important;\n            text-decoration: none !important;\n            border-radius: 8px;\n            font-weight: bold;\n            text-align: center;\n            width: 200px;\n        }\n        .footer {\n            text-align: center;\n            padding: 30px;\n            background-color: #f8f9fa;\n            color: #666;\n            font-size: 14px;\n            border-top: 1px solid #eee;\n        }\n        .social-links {\n            margin: 20px 0;\n        }\n        .social-link {\n            margin: 0 10px;\n            color: #744bcb;\n            text-decoration: none;\n        }\n    </style>\n</head>\n<body>\n    <div class=\"email-container\">\n        <div class=\"content\">\n            \n        <div class=\"title\">Welcome to CRM, Silverline Systems! 🎉</div>\n        <p>Thank you for joining our CRM management platform. We\'re excited to help you organize and manage your Company\'s information effectively.</p>\n        <div style=\"background-color: #f8f9fa; padding: 20px; border-radius: 8px; margin: 20px 0;\">\n            <div style=\"margin: 12px 0;\">✨ Manage your Company\'s information easily</div>\n            <div style=\"margin: 12px 0;\">🔒 Securely share information with your team</div>\n        </div>\n        <div class=\"button-container\">\n            <a href=\"http://localhost:5173/login\" class=\"button\">Get Started</a>\n        </div>\n    \n        </div>\n        <div class=\"footer\">\n            <div class=\"social-links\">\n                <a href=\"#\" class=\"social-link\">Facebook</a>\n                <a href=\"#\" class=\"social-link\">Twitter</a>\n                <a href=\"#\" class=\"social-link\">Instagram</a>\n            </div>\n            <p> 2025 CRM. All rights reserved.</p>\n        </div>\n    </div>\n</body>\n</html>\n', 0, 'codedatayash0@gmail.com', 'codedatayash0@gmail.com', '2025-03-31 09:41:26', '2025-03-31 09:41:26'),
('Q2a1oKqs4tgkNVSo5WF5sRj', 'codedatayash0@gmail.com', 'phoenixanalytics@yopmail.com', 'Verify Your Email', '\n<!DOCTYPE html>\n<html>\n<head>\n    <link href=\"https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600&display=swap\" rel=\"stylesheet\">\n    <style>\n        * {\n            font-family: \'Poppins\', sans-serif !important;\n        }\n        .email-container {\n            max-width: 600px;\n            margin: 0 auto;\n            color: #2c3e50;\n            background-color: #f8f9fa;\n            border-radius: 12px;\n            overflow: hidden;\n            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);\n        }\n        .header {\n            padding: 40px 20px;\n            text-align: center;\n            background: #ffffff;\n        }\n        .logo {\n            width: 200px;\n            height: auto;\n            margin: 0 auto;\n            display: block;\n            filter: drop-shadow(0 2px 4px rgba(0, 0, 0, 0.2));\n        }\n        .content {\n            padding: 40px;\n            background-color: #ffffff;\n            border-radius: 12px 12px 0 0;\n            margin-top: -20px;\n        }\n        .title {\n            color: #744bcb;\n            font-size: 24px;\n            font-weight: bold;\n            margin-bottom: 20px;\n            text-align: center;\n        }\n        .button-container {\n            text-align: center;\n            margin: 20px 0;\n        }\n        .button {\n            display: inline-block;\n            padding: 14px 28px;\n            background: #744bcb !important;\n            color: #ffffff !important;\n            text-decoration: none !important;\n            border-radius: 8px;\n            font-weight: bold;\n            text-align: center;\n            width: 200px;\n        }\n        .footer {\n            text-align: center;\n            padding: 30px;\n            background-color: #f8f9fa;\n            color: #666;\n            font-size: 14px;\n            border-top: 1px solid #eee;\n        }\n        .social-links {\n            margin: 20px 0;\n        }\n        .social-link {\n            margin: 0 10px;\n            color: #744bcb;\n            text-decoration: none;\n        }\n    </style>\n</head>\n<body>\n    <div class=\"email-container\">\n        <div class=\"content\">\n            \n        <div class=\"title\">Verify Your Email</div>\n        <p>Hello Phoenix Analytics!</p>\n        <p>Welcome to CRM! Please verify your email with this OTP:</p>\n        <div style=\"text-align: center; margin: 30px 0;\">\n            <span style=\"font-size: 32px; font-weight: bold; color: #744bcb; letter-spacing: 5px; padding: 10px 20px; background: #f8f9fa; border-radius: 8px;\">966614</span>\n        </div>\n        <p style=\"text-align: center; color: #666;\">This OTP will expire in 5 minutes.</p>\n    \n        </div>\n        <div class=\"footer\">\n            <div class=\"social-links\">\n                <a href=\"#\" class=\"social-link\">Facebook</a>\n                <a href=\"#\" class=\"social-link\">Twitter</a>\n                <a href=\"#\" class=\"social-link\">Instagram</a>\n            </div>\n            <p> 2025 CRM. All rights reserved.</p>\n        </div>\n    </div>\n</body>\n</html>\n', 0, 'codedatayash0@gmail.com', 'codedatayash0@gmail.com', '2025-03-31 09:39:27', '2025-03-31 09:39:27'),
('qKDGURcKqJ0VxJKKBpvvBoz', 'codedatayash0@gmail.com', 'priya.patel.silverline@yopmail.com', 'Verify Your Email', '\n<!DOCTYPE html>\n<html>\n<head>\n    <link href=\"https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600&display=swap\" rel=\"stylesheet\">\n    <style>\n        * {\n            font-family: \'Poppins\', sans-serif !important;\n        }\n        .email-container {\n            max-width: 600px;\n            margin: 0 auto;\n            color: #2c3e50;\n            background-color: #f8f9fa;\n            border-radius: 12px;\n            overflow: hidden;\n            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);\n        }\n        .header {\n            padding: 40px 20px;\n            text-align: center;\n            background: #ffffff;\n        }\n        .logo {\n            width: 200px;\n            height: auto;\n            margin: 0 auto;\n            display: block;\n            filter: drop-shadow(0 2px 4px rgba(0, 0, 0, 0.2));\n        }\n        .content {\n            padding: 40px;\n            background-color: #ffffff;\n            border-radius: 12px 12px 0 0;\n            margin-top: -20px;\n        }\n        .title {\n            color: #744bcb;\n            font-size: 24px;\n            font-weight: bold;\n            margin-bottom: 20px;\n            text-align: center;\n        }\n        .button-container {\n            text-align: center;\n            margin: 20px 0;\n        }\n        .button {\n            display: inline-block;\n            padding: 14px 28px;\n            background: #744bcb !important;\n            color: #ffffff !important;\n            text-decoration: none !important;\n            border-radius: 8px;\n            font-weight: bold;\n            text-align: center;\n            width: 200px;\n        }\n        .footer {\n            text-align: center;\n            padding: 30px;\n            background-color: #f8f9fa;\n            color: #666;\n            font-size: 14px;\n            border-top: 1px solid #eee;\n        }\n        .social-links {\n            margin: 20px 0;\n        }\n        .social-link {\n            margin: 0 10px;\n            color: #744bcb;\n            text-decoration: none;\n        }\n    </style>\n</head>\n<body>\n    <div class=\"email-container\">\n        <div class=\"content\">\n            \n        <div class=\"title\">Verify Your Email</div>\n        <p>Hello priya.patel!</p>\n        <p>Welcome to CRM! Please verify your email with this OTP:</p>\n        <div style=\"text-align: center; margin: 30px 0;\">\n            <span style=\"font-size: 32px; font-weight: bold; color: #744bcb; letter-spacing: 5px; padding: 10px 20px; background: #f8f9fa; border-radius: 8px;\">394540</span>\n        </div>\n        <p style=\"text-align: center; color: #666;\">This OTP will expire in 5 minutes.</p>\n    \n        </div>\n        <div class=\"footer\">\n            <div class=\"social-links\">\n                <a href=\"#\" class=\"social-link\">Facebook</a>\n                <a href=\"#\" class=\"social-link\">Twitter</a>\n                <a href=\"#\" class=\"social-link\">Instagram</a>\n            </div>\n            <p> 2025 CRM. All rights reserved.</p>\n        </div>\n    </div>\n</body>\n</html>\n', 0, 'codedatayash0@gmail.com', 'codedatayash0@gmail.com', '2025-03-31 12:45:02', '2025-03-31 12:45:02');
INSERT INTO `emails` (`id`, `from`, `to`, `subject`, `html`, `isRead`, `created_by`, `updated_by`, `createdAt`, `updatedAt`) VALUES
('RFRbPjkuMaFpqjknxL86u9r', 'codedatayash0@gmail.com', 'silverlinesystems@yopmail.com', 'Plan Buy Confirmation', '\n<!DOCTYPE html>\n<html>\n<head>\n    <link href=\"https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600&display=swap\" rel=\"stylesheet\">\n    <style>\n        * {\n            font-family: \'Poppins\', sans-serif !important;\n        }\n        .email-container {\n            max-width: 600px;\n            margin: 0 auto;\n            color: #2c3e50;\n            background-color: #f8f9fa;\n            border-radius: 12px;\n            overflow: hidden;\n            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);\n        }\n        .header {\n            padding: 40px 20px;\n            text-align: center;\n            background: #ffffff;\n        }\n        .logo {\n            width: 200px;\n            height: auto;\n            margin: 0 auto;\n            display: block;\n            filter: drop-shadow(0 2px 4px rgba(0, 0, 0, 0.2));\n        }\n        .content {\n            padding: 40px;\n            background-color: #ffffff;\n            border-radius: 12px 12px 0 0;\n            margin-top: -20px;\n        }\n        .title {\n            color: #744bcb;\n            font-size: 24px;\n            font-weight: bold;\n            margin-bottom: 20px;\n            text-align: center;\n        }\n        .button-container {\n            text-align: center;\n            margin: 20px 0;\n        }\n        .button {\n            display: inline-block;\n            padding: 14px 28px;\n            background: #744bcb !important;\n            color: #ffffff !important;\n            text-decoration: none !important;\n            border-radius: 8px;\n            font-weight: bold;\n            text-align: center;\n            width: 200px;\n        }\n        .footer {\n            text-align: center;\n            padding: 30px;\n            background-color: #f8f9fa;\n            color: #666;\n            font-size: 14px;\n            border-top: 1px solid #eee;\n        }\n        .social-links {\n            margin: 20px 0;\n        }\n        .social-link {\n            margin: 0 10px;\n            color: #744bcb;\n            text-decoration: none;\n        }\n    </style>\n</head>\n<body>\n    <div class=\"email-container\">\n        <div class=\"content\">\n            \n        <div class=\"title\">Plan Buy Confirmation</div>\n        <p>Hello Silverline Systems!</p>\n        <p>Congratulations! You have successfully purchased the \"Basic Plan\" plan.</p>\n        <p>Here are the details of your plan:</p>\n        <ul style=\"list-style: none; margin: 20px 0; padding: 0;\">\n            <li style=\"margin-bottom: 10px;\">• Plan Name: Basic Plan</li>\n            <li style=\"margin-bottom: 10px;\">• Plan Duration: Per Month</li>\n            <li style=\"margin-bottom: 10px;\">• Plan Trial Period: 7</li>\n            <li style=\"margin-bottom: 10px;\">• Plan Price: 999.00</li>\n            <li style=\"margin-bottom: 10px;\">• Number of Users: 5</li>\n            <li style=\"margin-bottom: 10px;\">• Number of Clients: 10</li>\n            <li style=\"margin-bottom: 10px;\">• Storage Limit: 10</li>\n        </ul>\n        <div style=\"text-align: center; margin: 30px 0;\">\n            <a href=\"http://localhost:5354/api/v1/bills/download/j0Yyz6b1zsJFTTOMeclna9m\" \n               style=\"background-color: #4CAF50; \n                      color: white; \n                      padding: 12px 24px; \n                      text-decoration: none; \n                      border-radius: 4px;\n                      display: inline-block;\">\n                Download Invoice\n            </a>\n        </div>\n        <p style=\"text-align: center; color: #666;\">If you have any questions or need any help, please don\'t hesitate to contact us.</p>\n    \n        </div>\n        <div class=\"footer\">\n            <div class=\"social-links\">\n                <a href=\"#\" class=\"social-link\">Facebook</a>\n                <a href=\"#\" class=\"social-link\">Twitter</a>\n                <a href=\"#\" class=\"social-link\">Instagram</a>\n            </div>\n            <p> 2025 CRM. All rights reserved.</p>\n        </div>\n    </div>\n</body>\n</html>\n', 0, 'codedatayash0@gmail.com', 'codedatayash0@gmail.com', '2025-03-31 10:13:59', '2025-03-31 10:13:59'),
('THkEWwf20fmLwOfSnPCRCF0', 'codedatayash0@gmail.com', 'sneha.gupta.silverline@yopmail.com', 'Welcome to CRM!', '\n<!DOCTYPE html>\n<html>\n<head>\n    <link href=\"https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600&display=swap\" rel=\"stylesheet\">\n    <style>\n        * {\n            font-family: \'Poppins\', sans-serif !important;\n        }\n        .email-container {\n            max-width: 600px;\n            margin: 0 auto;\n            color: #2c3e50;\n            background-color: #f8f9fa;\n            border-radius: 12px;\n            overflow: hidden;\n            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);\n        }\n        .header {\n            padding: 40px 20px;\n            text-align: center;\n            background: #ffffff;\n        }\n        .logo {\n            width: 200px;\n            height: auto;\n            margin: 0 auto;\n            display: block;\n            filter: drop-shadow(0 2px 4px rgba(0, 0, 0, 0.2));\n        }\n        .content {\n            padding: 40px;\n            background-color: #ffffff;\n            border-radius: 12px 12px 0 0;\n            margin-top: -20px;\n        }\n        .title {\n            color: #744bcb;\n            font-size: 24px;\n            font-weight: bold;\n            margin-bottom: 20px;\n            text-align: center;\n        }\n        .button-container {\n            text-align: center;\n            margin: 20px 0;\n        }\n        .button {\n            display: inline-block;\n            padding: 14px 28px;\n            background: #744bcb !important;\n            color: #ffffff !important;\n            text-decoration: none !important;\n            border-radius: 8px;\n            font-weight: bold;\n            text-align: center;\n            width: 200px;\n        }\n        .footer {\n            text-align: center;\n            padding: 30px;\n            background-color: #f8f9fa;\n            color: #666;\n            font-size: 14px;\n            border-top: 1px solid #eee;\n        }\n        .social-links {\n            margin: 20px 0;\n        }\n        .social-link {\n            margin: 0 10px;\n            color: #744bcb;\n            text-decoration: none;\n        }\n    </style>\n</head>\n<body>\n    <div class=\"email-container\">\n        <div class=\"content\">\n            \n        <div class=\"title\">Welcome to CRM,  sneha.gupta! 🎉</div>\n        <p>Thank you for joining our CRM management platform. We\'re excited to help you organize and manage your Company\'s information effectively.</p>\n        <div style=\"background-color: #f8f9fa; padding: 20px; border-radius: 8px; margin: 20px 0;\">\n            <div style=\"margin: 12px 0;\">✨ Manage your Company\'s information easily</div>\n            <div style=\"margin: 12px 0;\">🔒 Securely share information with your team</div>\n        </div>\n        <div class=\"button-container\">\n            <a href=\"http://localhost:5173/login\" class=\"button\">Get Started</a>\n        </div>\n    \n        </div>\n        <div class=\"footer\">\n            <div class=\"social-links\">\n                <a href=\"#\" class=\"social-link\">Facebook</a>\n                <a href=\"#\" class=\"social-link\">Twitter</a>\n                <a href=\"#\" class=\"social-link\">Instagram</a>\n            </div>\n            <p> 2025 CRM. All rights reserved.</p>\n        </div>\n    </div>\n</body>\n</html>\n', 0, 'codedatayash0@gmail.com', 'codedatayash0@gmail.com', '2025-03-31 12:55:45', '2025-03-31 12:55:45'),
('UVc4BIJBOfe9b8iOcoQVRFL', 'codedatayash0@gmail.com', 'digiSmart.enterprises@yopmail.com', 'Verify Your Email', '\n<!DOCTYPE html>\n<html>\n<head>\n    <link href=\"https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600&display=swap\" rel=\"stylesheet\">\n    <style>\n        * {\n            font-family: \'Poppins\', sans-serif !important;\n        }\n        .email-container {\n            max-width: 600px;\n            margin: 0 auto;\n            color: #2c3e50;\n            background-color: #f8f9fa;\n            border-radius: 12px;\n            overflow: hidden;\n            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);\n        }\n        .header {\n            padding: 40px 20px;\n            text-align: center;\n            background: #ffffff;\n        }\n        .logo {\n            width: 200px;\n            height: auto;\n            margin: 0 auto;\n            display: block;\n            filter: drop-shadow(0 2px 4px rgba(0, 0, 0, 0.2));\n        }\n        .content {\n            padding: 40px;\n            background-color: #ffffff;\n            border-radius: 12px 12px 0 0;\n            margin-top: -20px;\n        }\n        .title {\n            color: #744bcb;\n            font-size: 24px;\n            font-weight: bold;\n            margin-bottom: 20px;\n            text-align: center;\n        }\n        .button-container {\n            text-align: center;\n            margin: 20px 0;\n        }\n        .button {\n            display: inline-block;\n            padding: 14px 28px;\n            background: #744bcb !important;\n            color: #ffffff !important;\n            text-decoration: none !important;\n            border-radius: 8px;\n            font-weight: bold;\n            text-align: center;\n            width: 200px;\n        }\n        .footer {\n            text-align: center;\n            padding: 30px;\n            background-color: #f8f9fa;\n            color: #666;\n            font-size: 14px;\n            border-top: 1px solid #eee;\n        }\n        .social-links {\n            margin: 20px 0;\n        }\n        .social-link {\n            margin: 0 10px;\n            color: #744bcb;\n            text-decoration: none;\n        }\n    </style>\n</head>\n<body>\n    <div class=\"email-container\">\n        <div class=\"content\">\n            \n        <div class=\"title\">Verify Your Email</div>\n        <p>Hello DigiSmart Enterprises!</p>\n        <p>Welcome to CRM! Please verify your email with this OTP:</p>\n        <div style=\"text-align: center; margin: 30px 0;\">\n            <span style=\"font-size: 32px; font-weight: bold; color: #744bcb; letter-spacing: 5px; padding: 10px 20px; background: #f8f9fa; border-radius: 8px;\">160265</span>\n        </div>\n        <p style=\"text-align: center; color: #666;\">This OTP will expire in 5 minutes.</p>\n    \n        </div>\n        <div class=\"footer\">\n            <div class=\"social-links\">\n                <a href=\"#\" class=\"social-link\">Facebook</a>\n                <a href=\"#\" class=\"social-link\">Twitter</a>\n                <a href=\"#\" class=\"social-link\">Instagram</a>\n            </div>\n            <p> 2025 CRM. All rights reserved.</p>\n        </div>\n    </div>\n</body>\n</html>\n', 0, 'codedatayash0@gmail.com', 'codedatayash0@gmail.com', '2025-03-31 11:57:08', '2025-03-31 11:57:08'),
('vXDkxj3zcf0mDIP4udAhqRo', 'codedatayash0@gmail.com', 'cloudBridge.technologies@yopmail.com', 'Welcome to CRM!', '\n<!DOCTYPE html>\n<html>\n<head>\n    <link href=\"https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600&display=swap\" rel=\"stylesheet\">\n    <style>\n        * {\n            font-family: \'Poppins\', sans-serif !important;\n        }\n        .email-container {\n            max-width: 600px;\n            margin: 0 auto;\n            color: #2c3e50;\n            background-color: #f8f9fa;\n            border-radius: 12px;\n            overflow: hidden;\n            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);\n        }\n        .header {\n            padding: 40px 20px;\n            text-align: center;\n            background: #ffffff;\n        }\n        .logo {\n            width: 200px;\n            height: auto;\n            margin: 0 auto;\n            display: block;\n            filter: drop-shadow(0 2px 4px rgba(0, 0, 0, 0.2));\n        }\n        .content {\n            padding: 40px;\n            background-color: #ffffff;\n            border-radius: 12px 12px 0 0;\n            margin-top: -20px;\n        }\n        .title {\n            color: #744bcb;\n            font-size: 24px;\n            font-weight: bold;\n            margin-bottom: 20px;\n            text-align: center;\n        }\n        .button-container {\n            text-align: center;\n            margin: 20px 0;\n        }\n        .button {\n            display: inline-block;\n            padding: 14px 28px;\n            background: #744bcb !important;\n            color: #ffffff !important;\n            text-decoration: none !important;\n            border-radius: 8px;\n            font-weight: bold;\n            text-align: center;\n            width: 200px;\n        }\n        .footer {\n            text-align: center;\n            padding: 30px;\n            background-color: #f8f9fa;\n            color: #666;\n            font-size: 14px;\n            border-top: 1px solid #eee;\n        }\n        .social-links {\n            margin: 20px 0;\n        }\n        .social-link {\n            margin: 0 10px;\n            color: #744bcb;\n            text-decoration: none;\n        }\n    </style>\n</head>\n<body>\n    <div class=\"email-container\">\n        <div class=\"content\">\n            \n        <div class=\"title\">Welcome to CRM, CloudBridge Technologies! 🎉</div>\n        <p>Thank you for joining our CRM management platform. We\'re excited to help you organize and manage your Company\'s information effectively.</p>\n        <div style=\"background-color: #f8f9fa; padding: 20px; border-radius: 8px; margin: 20px 0;\">\n            <div style=\"margin: 12px 0;\">✨ Manage your Company\'s information easily</div>\n            <div style=\"margin: 12px 0;\">🔒 Securely share information with your team</div>\n        </div>\n        <div class=\"button-container\">\n            <a href=\"http://localhost:5173/login\" class=\"button\">Get Started</a>\n        </div>\n    \n        </div>\n        <div class=\"footer\">\n            <div class=\"social-links\">\n                <a href=\"#\" class=\"social-link\">Facebook</a>\n                <a href=\"#\" class=\"social-link\">Twitter</a>\n                <a href=\"#\" class=\"social-link\">Instagram</a>\n            </div>\n            <p> 2025 CRM. All rights reserved.</p>\n        </div>\n    </div>\n</body>\n</html>\n', 0, 'codedatayash0@gmail.com', 'codedatayash0@gmail.com', '2025-03-31 11:56:16', '2025-03-31 11:56:16'),
('vXyh8dlkhh9eX8XVCxYXp55', 'codedatayash0@gmail.com', 'quantumeenterprises@yopmail.com', 'Welcome to CRM!', '\n<!DOCTYPE html>\n<html>\n<head>\n    <link href=\"https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600&display=swap\" rel=\"stylesheet\">\n    <style>\n        * {\n            font-family: \'Poppins\', sans-serif !important;\n        }\n        .email-container {\n            max-width: 600px;\n            margin: 0 auto;\n            color: #2c3e50;\n            background-color: #f8f9fa;\n            border-radius: 12px;\n            overflow: hidden;\n            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);\n        }\n        .header {\n            padding: 40px 20px;\n            text-align: center;\n            background: #ffffff;\n        }\n        .logo {\n            width: 200px;\n            height: auto;\n            margin: 0 auto;\n            display: block;\n            filter: drop-shadow(0 2px 4px rgba(0, 0, 0, 0.2));\n        }\n        .content {\n            padding: 40px;\n            background-color: #ffffff;\n            border-radius: 12px 12px 0 0;\n            margin-top: -20px;\n        }\n        .title {\n            color: #744bcb;\n            font-size: 24px;\n            font-weight: bold;\n            margin-bottom: 20px;\n            text-align: center;\n        }\n        .button-container {\n            text-align: center;\n            margin: 20px 0;\n        }\n        .button {\n            display: inline-block;\n            padding: 14px 28px;\n            background: #744bcb !important;\n            color: #ffffff !important;\n            text-decoration: none !important;\n            border-radius: 8px;\n            font-weight: bold;\n            text-align: center;\n            width: 200px;\n        }\n        .footer {\n            text-align: center;\n            padding: 30px;\n            background-color: #f8f9fa;\n            color: #666;\n            font-size: 14px;\n            border-top: 1px solid #eee;\n        }\n        .social-links {\n            margin: 20px 0;\n        }\n        .social-link {\n            margin: 0 10px;\n            color: #744bcb;\n            text-decoration: none;\n        }\n    </style>\n</head>\n<body>\n    <div class=\"email-container\">\n        <div class=\"content\">\n            \n        <div class=\"title\">Welcome to CRM, Quantum Enterprises! 🎉</div>\n        <p>Thank you for joining our CRM management platform. We\'re excited to help you organize and manage your Company\'s information effectively.</p>\n        <div style=\"background-color: #f8f9fa; padding: 20px; border-radius: 8px; margin: 20px 0;\">\n            <div style=\"margin: 12px 0;\">✨ Manage your Company\'s information easily</div>\n            <div style=\"margin: 12px 0;\">🔒 Securely share information with your team</div>\n        </div>\n        <div class=\"button-container\">\n            <a href=\"http://localhost:5173/login\" class=\"button\">Get Started</a>\n        </div>\n    \n        </div>\n        <div class=\"footer\">\n            <div class=\"social-links\">\n                <a href=\"#\" class=\"social-link\">Facebook</a>\n                <a href=\"#\" class=\"social-link\">Twitter</a>\n                <a href=\"#\" class=\"social-link\">Instagram</a>\n            </div>\n            <p> 2025 CRM. All rights reserved.</p>\n        </div>\n    </div>\n</body>\n</html>\n', 0, 'codedatayash0@gmail.com', 'codedatayash0@gmail.com', '2025-03-31 09:30:56', '2025-03-31 09:30:56'),
('ylsQjKi1THfEuCHKDJvQ0vk', 'codedatayash0@gmail.com', 'rahul.sharma.silverline@yopmail.com', 'Welcome to CRM!', '\n<!DOCTYPE html>\n<html>\n<head>\n    <link href=\"https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600&display=swap\" rel=\"stylesheet\">\n    <style>\n        * {\n            font-family: \'Poppins\', sans-serif !important;\n        }\n        .email-container {\n            max-width: 600px;\n            margin: 0 auto;\n            color: #2c3e50;\n            background-color: #f8f9fa;\n            border-radius: 12px;\n            overflow: hidden;\n            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);\n        }\n        .header {\n            padding: 40px 20px;\n            text-align: center;\n            background: #ffffff;\n        }\n        .logo {\n            width: 200px;\n            height: auto;\n            margin: 0 auto;\n            display: block;\n            filter: drop-shadow(0 2px 4px rgba(0, 0, 0, 0.2));\n        }\n        .content {\n            padding: 40px;\n            background-color: #ffffff;\n            border-radius: 12px 12px 0 0;\n            margin-top: -20px;\n        }\n        .title {\n            color: #744bcb;\n            font-size: 24px;\n            font-weight: bold;\n            margin-bottom: 20px;\n            text-align: center;\n        }\n        .button-container {\n            text-align: center;\n            margin: 20px 0;\n        }\n        .button {\n            display: inline-block;\n            padding: 14px 28px;\n            background: #744bcb !important;\n            color: #ffffff !important;\n            text-decoration: none !important;\n            border-radius: 8px;\n            font-weight: bold;\n            text-align: center;\n            width: 200px;\n        }\n        .footer {\n            text-align: center;\n            padding: 30px;\n            background-color: #f8f9fa;\n            color: #666;\n            font-size: 14px;\n            border-top: 1px solid #eee;\n        }\n        .social-links {\n            margin: 20px 0;\n        }\n        .social-link {\n            margin: 0 10px;\n            color: #744bcb;\n            text-decoration: none;\n        }\n    </style>\n</head>\n<body>\n    <div class=\"email-container\">\n        <div class=\"content\">\n            \n        <div class=\"title\">Welcome to CRM, rahul.sharma! 🎉</div>\n        <p>Thank you for joining our CRM management platform. We\'re excited to help you organize and manage your Company\'s information effectively.</p>\n        <div style=\"background-color: #f8f9fa; padding: 20px; border-radius: 8px; margin: 20px 0;\">\n            <div style=\"margin: 12px 0;\">✨ Manage your Company\'s information easily</div>\n            <div style=\"margin: 12px 0;\">🔒 Securely share information with your team</div>\n        </div>\n        <div class=\"button-container\">\n            <a href=\"http://localhost:5173/login\" class=\"button\">Get Started</a>\n        </div>\n    \n        </div>\n        <div class=\"footer\">\n            <div class=\"social-links\">\n                <a href=\"#\" class=\"social-link\">Facebook</a>\n                <a href=\"#\" class=\"social-link\">Twitter</a>\n                <a href=\"#\" class=\"social-link\">Instagram</a>\n            </div>\n            <p> 2025 CRM. All rights reserved.</p>\n        </div>\n    </div>\n</body>\n</html>\n', 0, 'codedatayash0@gmail.com', 'codedatayash0@gmail.com', '2025-03-31 12:41:00', '2025-03-31 12:41:00'),
('YuQTh1GFHyA0ACk01CEVxIK', 'codedatayash0@gmail.com', 'datacore.analytics@yopmail.com', 'Welcome to CRM!', '\n<!DOCTYPE html>\n<html>\n<head>\n    <link href=\"https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600&display=swap\" rel=\"stylesheet\">\n    <style>\n        * {\n            font-family: \'Poppins\', sans-serif !important;\n        }\n        .email-container {\n            max-width: 600px;\n            margin: 0 auto;\n            color: #2c3e50;\n            background-color: #f8f9fa;\n            border-radius: 12px;\n            overflow: hidden;\n            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);\n        }\n        .header {\n            padding: 40px 20px;\n            text-align: center;\n            background: #ffffff;\n        }\n        .logo {\n            width: 200px;\n            height: auto;\n            margin: 0 auto;\n            display: block;\n            filter: drop-shadow(0 2px 4px rgba(0, 0, 0, 0.2));\n        }\n        .content {\n            padding: 40px;\n            background-color: #ffffff;\n            border-radius: 12px 12px 0 0;\n            margin-top: -20px;\n        }\n        .title {\n            color: #744bcb;\n            font-size: 24px;\n            font-weight: bold;\n            margin-bottom: 20px;\n            text-align: center;\n        }\n        .button-container {\n            text-align: center;\n            margin: 20px 0;\n        }\n        .button {\n            display: inline-block;\n            padding: 14px 28px;\n            background: #744bcb !important;\n            color: #ffffff !important;\n            text-decoration: none !important;\n            border-radius: 8px;\n            font-weight: bold;\n            text-align: center;\n            width: 200px;\n        }\n        .footer {\n            text-align: center;\n            padding: 30px;\n            background-color: #f8f9fa;\n            color: #666;\n            font-size: 14px;\n            border-top: 1px solid #eee;\n        }\n        .social-links {\n            margin: 20px 0;\n        }\n        .social-link {\n            margin: 0 10px;\n            color: #744bcb;\n            text-decoration: none;\n        }\n    </style>\n</head>\n<body>\n    <div class=\"email-container\">\n        <div class=\"content\">\n            \n        <div class=\"title\">Welcome to CRM, DataCore Analytics! 🎉</div>\n        <p>Thank you for joining our CRM management platform. We\'re excited to help you organize and manage your Company\'s information effectively.</p>\n        <div style=\"background-color: #f8f9fa; padding: 20px; border-radius: 8px; margin: 20px 0;\">\n            <div style=\"margin: 12px 0;\">✨ Manage your Company\'s information easily</div>\n            <div style=\"margin: 12px 0;\">🔒 Securely share information with your team</div>\n        </div>\n        <div class=\"button-container\">\n            <a href=\"http://localhost:5173/login\" class=\"button\">Get Started</a>\n        </div>\n    \n        </div>\n        <div class=\"footer\">\n            <div class=\"social-links\">\n                <a href=\"#\" class=\"social-link\">Facebook</a>\n                <a href=\"#\" class=\"social-link\">Twitter</a>\n                <a href=\"#\" class=\"social-link\">Instagram</a>\n            </div>\n            <p> 2025 CRM. All rights reserved.</p>\n        </div>\n    </div>\n</body>\n</html>\n', 0, 'codedatayash0@gmail.com', 'codedatayash0@gmail.com', '2025-03-31 11:54:57', '2025-03-31 11:54:57'),
('zgHN6h1sDwxngdl3K0YwNkw', 'codedatayash0@gmail.com', 'amit.kumar.silverline@yopmail.com', 'Verify Your Email', '\n<!DOCTYPE html>\n<html>\n<head>\n    <link href=\"https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600&display=swap\" rel=\"stylesheet\">\n    <style>\n        * {\n            font-family: \'Poppins\', sans-serif !important;\n        }\n        .email-container {\n            max-width: 600px;\n            margin: 0 auto;\n            color: #2c3e50;\n            background-color: #f8f9fa;\n            border-radius: 12px;\n            overflow: hidden;\n            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);\n        }\n        .header {\n            padding: 40px 20px;\n            text-align: center;\n            background: #ffffff;\n        }\n        .logo {\n            width: 200px;\n            height: auto;\n            margin: 0 auto;\n            display: block;\n            filter: drop-shadow(0 2px 4px rgba(0, 0, 0, 0.2));\n        }\n        .content {\n            padding: 40px;\n            background-color: #ffffff;\n            border-radius: 12px 12px 0 0;\n            margin-top: -20px;\n        }\n        .title {\n            color: #744bcb;\n            font-size: 24px;\n            font-weight: bold;\n            margin-bottom: 20px;\n            text-align: center;\n        }\n        .button-container {\n            text-align: center;\n            margin: 20px 0;\n        }\n        .button {\n            display: inline-block;\n            padding: 14px 28px;\n            background: #744bcb !important;\n            color: #ffffff !important;\n            text-decoration: none !important;\n            border-radius: 8px;\n            font-weight: bold;\n            text-align: center;\n            width: 200px;\n        }\n        .footer {\n            text-align: center;\n            padding: 30px;\n            background-color: #f8f9fa;\n            color: #666;\n            font-size: 14px;\n            border-top: 1px solid #eee;\n        }\n        .social-links {\n            margin: 20px 0;\n        }\n        .social-link {\n            margin: 0 10px;\n            color: #744bcb;\n            text-decoration: none;\n        }\n    </style>\n</head>\n<body>\n    <div class=\"email-container\">\n        <div class=\"content\">\n            \n        <div class=\"title\">Verify Your Email</div>\n        <p>Hello amit.kumar!</p>\n        <p>Welcome to CRM! Please verify your email with this OTP:</p>\n        <div style=\"text-align: center; margin: 30px 0;\">\n            <span style=\"font-size: 32px; font-weight: bold; color: #744bcb; letter-spacing: 5px; padding: 10px 20px; background: #f8f9fa; border-radius: 8px;\">786923</span>\n        </div>\n        <p style=\"text-align: center; color: #666;\">This OTP will expire in 5 minutes.</p>\n    \n        </div>\n        <div class=\"footer\">\n            <div class=\"social-links\">\n                <a href=\"#\" class=\"social-link\">Facebook</a>\n                <a href=\"#\" class=\"social-link\">Twitter</a>\n                <a href=\"#\" class=\"social-link\">Instagram</a>\n            </div>\n            <p> 2025 CRM. All rights reserved.</p>\n        </div>\n    </div>\n</body>\n</html>\n', 0, 'codedatayash0@gmail.com', 'codedatayash0@gmail.com', '2025-03-31 12:48:21', '2025-03-31 12:48:21'),
('zRHY6hB7sDfue9rkU8zHCl9', 'codedatayash0@gmail.com', 'support.silverline@yopmail.com', 'Welcome to CRM!', '\n<!DOCTYPE html>\n<html>\n<head>\n    <link href=\"https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600&display=swap\" rel=\"stylesheet\">\n    <style>\n        * {\n            font-family: \'Poppins\', sans-serif !important;\n        }\n        .email-container {\n            max-width: 600px;\n            margin: 0 auto;\n            color: #2c3e50;\n            background-color: #f8f9fa;\n            border-radius: 12px;\n            overflow: hidden;\n            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);\n        }\n        .header {\n            padding: 40px 20px;\n            text-align: center;\n            background: #ffffff;\n        }\n        .logo {\n            width: 200px;\n            height: auto;\n            margin: 0 auto;\n            display: block;\n            filter: drop-shadow(0 2px 4px rgba(0, 0, 0, 0.2));\n        }\n        .content {\n            padding: 40px;\n            background-color: #ffffff;\n            border-radius: 12px 12px 0 0;\n            margin-top: -20px;\n        }\n        .title {\n            color: #744bcb;\n            font-size: 24px;\n            font-weight: bold;\n            margin-bottom: 20px;\n            text-align: center;\n        }\n        .button-container {\n            text-align: center;\n            margin: 20px 0;\n        }\n        .button {\n            display: inline-block;\n            padding: 14px 28px;\n            background: #744bcb !important;\n            color: #ffffff !important;\n            text-decoration: none !important;\n            border-radius: 8px;\n            font-weight: bold;\n            text-align: center;\n            width: 200px;\n        }\n        .footer {\n            text-align: center;\n            padding: 30px;\n            background-color: #f8f9fa;\n            color: #666;\n            font-size: 14px;\n            border-top: 1px solid #eee;\n        }\n        .social-links {\n            margin: 20px 0;\n        }\n        .social-link {\n            margin: 0 10px;\n            color: #744bcb;\n            text-decoration: none;\n        }\n    </style>\n</head>\n<body>\n    <div class=\"email-container\">\n        <div class=\"content\">\n            \n        <div class=\"title\">Welcome to CRM, support.silverline! 🎉</div>\n        <p>Thank you for joining our CRM management platform. We\'re excited to help you organize and manage your Company\'s information effectively.</p>\n        <div style=\"background-color: #f8f9fa; padding: 20px; border-radius: 8px; margin: 20px 0;\">\n            <div style=\"margin: 12px 0;\">✨ Manage your Company\'s information easily</div>\n            <div style=\"margin: 12px 0;\">🔒 Securely share information with your team</div>\n        </div>\n        <div class=\"button-container\">\n            <a href=\"http://localhost:5173/login\" class=\"button\">Get Started</a>\n        </div>\n    \n        </div>\n        <div class=\"footer\">\n            <div class=\"social-links\">\n                <a href=\"#\" class=\"social-link\">Facebook</a>\n                <a href=\"#\" class=\"social-link\">Twitter</a>\n                <a href=\"#\" class=\"social-link\">Instagram</a>\n            </div>\n            <p> 2025 CRM. All rights reserved.</p>\n        </div>\n    </div>\n</body>\n</html>\n', 0, 'codedatayash0@gmail.com', 'codedatayash0@gmail.com', '2025-03-31 11:26:52', '2025-03-31 11:26:52');

-- --------------------------------------------------------

--
-- Table structure for table `esignatures`
--

CREATE TABLE `esignatures` (
  `id` varchar(255) NOT NULL,
  `esignature_name` varchar(255) NOT NULL,
  `e_signatures` varchar(255) NOT NULL,
  `related_id` varchar(255) NOT NULL,
  `client_id` varchar(255) NOT NULL,
  `created_by` varchar(255) DEFAULT NULL,
  `updated_by` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `expenses`
--

CREATE TABLE `expenses` (
  `id` varchar(255) NOT NULL,
  `related_id` varchar(255) NOT NULL,
  `item` varchar(255) NOT NULL,
  `currency` varchar(255) NOT NULL,
  `price` float NOT NULL,
  `purchase_date` datetime NOT NULL,
  `project` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `bill` varchar(255) DEFAULT NULL,
  `client_id` varchar(255) NOT NULL,
  `created_by` varchar(255) DEFAULT NULL,
  `updated_by` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `features`
--

CREATE TABLE `features` (
  `id` varchar(255) NOT NULL,
  `featureName` varchar(255) NOT NULL,
  `client_id` varchar(255) NOT NULL,
  `created_by` varchar(255) DEFAULT NULL,
  `updated_by` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `followups`
--

CREATE TABLE `followups` (
  `id` varchar(255) NOT NULL,
  `related_id` varchar(255) NOT NULL,
  `followup_by` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `date` datetime NOT NULL,
  `time` time NOT NULL,
  `status` varchar(255) NOT NULL DEFAULT 'pending',
  `description` varchar(255) DEFAULT NULL,
  `client_id` varchar(255) NOT NULL,
  `created_by` varchar(255) DEFAULT NULL,
  `updated_by` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `goaltypes`
--

CREATE TABLE `goaltypes` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `client_id` varchar(255) NOT NULL,
  `created_by` varchar(255) DEFAULT NULL,
  `updated_by` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `goal_trackings`
--

CREATE TABLE `goal_trackings` (
  `id` varchar(255) NOT NULL,
  `branch` varchar(255) NOT NULL,
  `goalType` varchar(255) NOT NULL,
  `startDate` datetime NOT NULL,
  `endDate` datetime NOT NULL,
  `status` varchar(255) NOT NULL,
  `target_achievement` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `rating` varchar(255) NOT NULL,
  `progress` varchar(255) DEFAULT NULL,
  `client_id` varchar(255) NOT NULL,
  `created_by` varchar(255) DEFAULT NULL,
  `updated_by` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `holidays`
--

CREATE TABLE `holidays` (
  `id` varchar(255) NOT NULL,
  `holiday_name` varchar(255) NOT NULL,
  `leave_type` varchar(255) NOT NULL,
  `start_date` datetime NOT NULL,
  `end_date` datetime NOT NULL,
  `client_id` varchar(255) NOT NULL,
  `created_by` varchar(255) DEFAULT NULL,
  `updated_by` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `indicators`
--

CREATE TABLE `indicators` (
  `id` varchar(255) NOT NULL,
  `branch` varchar(255) NOT NULL,
  `department` varchar(255) NOT NULL,
  `designation` varchar(255) NOT NULL,
  `businessProcess` int(11) NOT NULL,
  `oralCommunication` int(11) NOT NULL,
  `leadership` int(11) NOT NULL,
  `projectManagement` int(11) NOT NULL,
  `allocatingResources` int(11) NOT NULL,
  `overallRating` int(11) NOT NULL,
  `client_id` varchar(255) NOT NULL,
  `created_by` varchar(255) DEFAULT NULL,
  `updated_by` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `inquiries`
--

CREATE TABLE `inquiries` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `subject` varchar(255) NOT NULL,
  `message` varchar(255) NOT NULL,
  `client_id` varchar(255) NOT NULL,
  `created_by` varchar(255) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `interview_schedules`
--

CREATE TABLE `interview_schedules` (
  `id` varchar(255) NOT NULL,
  `job` varchar(255) NOT NULL,
  `candidate` varchar(255) NOT NULL,
  `interviewer` varchar(255) NOT NULL,
  `round` varchar(255) NOT NULL,
  `interviewType` varchar(255) NOT NULL,
  `startOn` datetime NOT NULL,
  `startTime` time NOT NULL,
  `commentForInterviewer` varchar(255) DEFAULT NULL,
  `commentForCandidate` varchar(255) DEFAULT NULL,
  `client_id` varchar(255) NOT NULL,
  `created_by` varchar(255) DEFAULT NULL,
  `updated_by` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `invoices`
--

CREATE TABLE `invoices` (
  `id` varchar(255) NOT NULL,
  `invoiceNumber` varchar(255) DEFAULT NULL,
  `customer` varchar(255) NOT NULL,
  `subtotal` int(11) NOT NULL,
  `total_discount` int(11) DEFAULT NULL,
  `related_id` varchar(255) NOT NULL,
  `issueDate` datetime NOT NULL,
  `status` varchar(255) DEFAULT NULL,
  `dueDate` datetime NOT NULL,
  `currency` varchar(255) NOT NULL,
  `project` varchar(255) DEFAULT NULL,
  `client` varchar(255) DEFAULT NULL,
  `items` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`items`)),
  `discount` int(11) DEFAULT NULL,
  `tax` int(11) DEFAULT NULL,
  `total` int(11) NOT NULL,
  `client_id` varchar(255) NOT NULL,
  `created_by` varchar(255) DEFAULT NULL,
  `updated_by` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jobcategories`
--

CREATE TABLE `jobcategories` (
  `id` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `client_id` varchar(255) NOT NULL,
  `created_by` varchar(255) DEFAULT NULL,
  `updated_by` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jobonboardings`
--

CREATE TABLE `jobonboardings` (
  `id` varchar(255) NOT NULL,
  `Interviewer` varchar(255) DEFAULT NULL,
  `JoiningDate` varchar(255) NOT NULL,
  `DaysOfWeek` varchar(255) DEFAULT NULL,
  `Salary` varchar(255) DEFAULT NULL,
  `SalaryType` varchar(255) NOT NULL,
  `SalaryDuration` varchar(255) DEFAULT NULL,
  `JobType` varchar(255) NOT NULL,
  `Status` varchar(255) DEFAULT NULL,
  `client_id` varchar(255) NOT NULL,
  `created_by` varchar(255) DEFAULT NULL,
  `updated_by` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `category` varchar(255) NOT NULL,
  `skills` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`skills`)),
  `location` varchar(255) NOT NULL,
  `interviewRounds` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`interviewRounds`)),
  `startDate` datetime NOT NULL,
  `endDate` datetime NOT NULL,
  `totalOpenings` int(11) DEFAULT NULL,
  `status` varchar(255) NOT NULL,
  `recruiter` varchar(255) NOT NULL,
  `jobType` varchar(255) DEFAULT NULL,
  `workExperience` varchar(255) DEFAULT NULL,
  `currency` varchar(255) NOT NULL,
  `expectedSalary` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `client_id` varchar(255) NOT NULL,
  `created_by` varchar(255) DEFAULT NULL,
  `updated_by` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jobstages`
--

CREATE TABLE `jobstages` (
  `id` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `client_id` varchar(255) NOT NULL,
  `created_by` varchar(255) DEFAULT NULL,
  `updated_by` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_applications`
--

CREATE TABLE `job_applications` (
  `id` varchar(255) NOT NULL,
  `job` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `cv_path` varchar(255) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `location` varchar(255) NOT NULL,
  `total_experience` varchar(255) NOT NULL,
  `current_location` varchar(255) NOT NULL,
  `notice_period` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL,
  `applied_source` varchar(255) NOT NULL,
  `cover_letter` varchar(255) NOT NULL,
  `client_id` varchar(255) NOT NULL,
  `created_by` varchar(255) DEFAULT NULL,
  `updated_by` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `leads`
--

CREATE TABLE `leads` (
  `id` varchar(255) NOT NULL,
  `leadTitle` varchar(255) NOT NULL,
  `leadStage` varchar(255) DEFAULT NULL,
  `currency` varchar(255) NOT NULL,
  `leadValue` int(11) NOT NULL,
  `company_name` varchar(255) DEFAULT NULL,
  `firstName` varchar(255) DEFAULT NULL,
  `lastName` varchar(255) DEFAULT NULL,
  `phoneCode` varchar(255) DEFAULT NULL,
  `telephone` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `lead_members` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`lead_members`)),
  `source` varchar(255) DEFAULT NULL,
  `category` varchar(255) DEFAULT NULL,
  `files` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`files`)),
  `status` varchar(255) NOT NULL DEFAULT 'new',
  `interest_level` enum('high','medium','low') DEFAULT NULL,
  `lead_score` int(11) DEFAULT NULL COMMENT 'Lead score as a percentage value (1-100%)',
  `client_id` varchar(255) NOT NULL,
  `created_by` varchar(255) DEFAULT NULL,
  `updated_by` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `leads`
--

INSERT INTO `leads` (`id`, `leadTitle`, `leadStage`, `currency`, `leadValue`, `company_name`, `firstName`, `lastName`, `phoneCode`, `telephone`, `email`, `address`, `lead_members`, `source`, `category`, `files`, `status`, `interest_level`, `lead_score`, `client_id`, `created_by`, `updated_by`, `createdAt`, `updatedAt`) VALUES
('31LINvHYSM5u4avuq7Wrjlh', 'TechPro Solutions Website Modernization', 'eTzCUBr5Y232i82lxUoP9vJ', 'INR', 850000, ' TechPro Solutions', 'TechPro', ' Solutions', '91', '+91 9876543210', 'rajesh@techpro.com', ' Tech Park, Whitefield, Bangalore', '{\"lead_members\":[\"8v2FNBB31ognrYtRiqdgCVu\",\"W3LxNVQLCC7zrhxTyTlBnvz\",\"ydriIPjLyAPT1OGipF5IHsY\"]}', 'EJhZVVxxc7GsMQtDgaXqYOB', 'P4aLxD3aeJNqduJwTORAasj', NULL, 'Jq6VB9g3QDsIfBAWgA2U9b4', 'high', NULL, '4kykUHcg5oLrhNDkfCLNYYG', 'Silverline Systems', 'Silverline Systems', '2025-03-31 14:37:20', '2025-03-31 17:12:35'),
('oJApH38EENA6wFiwH6AAP34', 'DataCore Analytics Cloud Migration', 'y75dLVbz4NfpZMCehFqh7VJ', 'INR', 1275000, 'DataCore Analytics', ' Priya ', 'Sharma', '91', '+91 8765432109', 'priya@datacore.com', 'Cyber City, Gurugram', '{\"lead_members\":[\"8v2FNBB31ognrYtRiqdgCVu\",\"uRxNhU6mrI44fedl6HiOBYM\"]}', 'xuB1EFLnxfOC50fursRLoCz', 'P4aLxD3aeJNqduJwTORAasj', NULL, 'KVF8VPuuiCxHdL5Ovn6GQJr', 'medium', NULL, '4kykUHcg5oLrhNDkfCLNYYG', 'Silverline Systems', NULL, '2025-03-31 14:40:53', '2025-03-31 14:40:53'),
('YlSczjJh8OpXkCVEZYpMIs9', 'Global Retail IT Infrastructure', 'icIkzFa9jKpV26cO64IJS7f', 'INR', 2500000, 'Global Retail Corp', 'Sarah ', 'Chen', '91', '+91 6543210987', 'sarah@globalretail.com', 'MG Road, Pune', '{\"lead_members\":[\"qOaIRiAfmmGcldnDcUAd51J\",\"fR58rBlXFTFi9u64oC62lLr\",\"8v2FNBB31ognrYtRiqdgCVu\",\"0aMTORQ27wG00Ht5REhq13p\"]}', '4pWxPgYS3TRJhWLFX3z630b', 'Koxnx1YhcOOCJznFmwVgMY3', NULL, 'Kg4y1cj6ItKMqBNKpQoYk0g', 'low', NULL, '4kykUHcg5oLrhNDkfCLNYYG', 'Silverline Systems', 'Silverline Systems', '2025-03-31 16:56:37', '2025-03-31 16:57:12'),
('YXfrACvHnsutJstpTU5Tu24', 'HealthCare App Development', 'BYNYLCidEQll0qKymn79W76', 'INR', 1500000, 'MediTech Solutions', 'Dr. Amit ', 'Patel', '91', '+91 7654321098', 'amit@meditech.com', 'Bandra Kurla Complex, Mumbai', '{\"lead_members\":[\"8v2FNBB31ognrYtRiqdgCVu\",\"uRxNhU6mrI44fedl6HiOBYM\",\"ydriIPjLyAPT1OGipF5IHsY\"]}', '6qr1dAwRIXrn5ROqkBQcrqF', 'P4aLxD3aeJNqduJwTORAasj', NULL, 'Jq6VB9g3QDsIfBAWgA2U9b4', 'high', NULL, '4kykUHcg5oLrhNDkfCLNYYG', 'Silverline Systems', 'Silverline Systems', '2025-03-31 16:51:41', '2025-03-31 17:12:32');

-- --------------------------------------------------------

--
-- Table structure for table `leaves`
--

CREATE TABLE `leaves` (
  `id` varchar(255) NOT NULL,
  `employeeId` varchar(255) NOT NULL,
  `startDate` datetime NOT NULL,
  `endDate` datetime NOT NULL,
  `leaveType` enum('sick','casual','annual','other') NOT NULL,
  `reason` text NOT NULL,
  `status` enum('pending','approved','rejected') DEFAULT 'pending',
  `remarks` varchar(255) DEFAULT NULL,
  `isHalfDay` tinyint(1) NOT NULL DEFAULT 0,
  `client_id` varchar(255) NOT NULL,
  `created_by` varchar(255) DEFAULT NULL,
  `updated_by` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `leavetypes`
--

CREATE TABLE `leavetypes` (
  `id` varchar(255) NOT NULL,
  `leaveType` varchar(255) NOT NULL,
  `daysPerYear` int(11) NOT NULL,
  `client_id` varchar(255) NOT NULL,
  `created_by` varchar(255) DEFAULT NULL,
  `updated_by` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `loanoptions`
--

CREATE TABLE `loanoptions` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `client_id` varchar(255) NOT NULL,
  `created_by` varchar(255) DEFAULT NULL,
  `updated_by` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `loans`
--

CREATE TABLE `loans` (
  `id` varchar(255) NOT NULL,
  `employeeId` varchar(255) NOT NULL,
  `loanOption` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `currency` varchar(255) NOT NULL,
  `amount` int(11) NOT NULL,
  `reason` varchar(255) NOT NULL,
  `client_id` varchar(255) NOT NULL,
  `created_by` varchar(255) DEFAULT NULL,
  `updated_by` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `meetings`
--

CREATE TABLE `meetings` (
  `id` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `department` varchar(255) NOT NULL,
  `employee` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`employee`)),
  `date` datetime NOT NULL,
  `startTime` time NOT NULL,
  `endTime` time DEFAULT NULL,
  `meetingLink` varchar(255) DEFAULT NULL,
  `client` varchar(255) DEFAULT NULL,
  `status` enum('scheduled','completed','cancelled') DEFAULT 'scheduled',
  `client_id` varchar(255) NOT NULL,
  `created_by` varchar(255) DEFAULT NULL,
  `updated_by` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `id` varchar(255) NOT NULL,
  `chooseMember` varchar(255) NOT NULL,
  `message` varchar(255) NOT NULL,
  `file` varchar(255) DEFAULT NULL,
  `isRead` tinyint(1) NOT NULL DEFAULT 0,
  `client_id` varchar(255) NOT NULL,
  `created_by` varchar(255) DEFAULT NULL,
  `updated_by` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `milestones`
--

CREATE TABLE `milestones` (
  `id` varchar(255) NOT NULL,
  `related_id` varchar(255) DEFAULT NULL,
  `milestone_title` varchar(255) DEFAULT NULL,
  `milestone_status` varchar(255) DEFAULT NULL,
  `milestone_cost` varchar(255) DEFAULT NULL,
  `milestone_summary` varchar(255) DEFAULT NULL,
  `milestone_start_date` datetime DEFAULT NULL,
  `add_cost_to_project_budget` varchar(255) DEFAULT '0',
  `milestone_end_date` datetime DEFAULT NULL,
  `client_id` varchar(255) NOT NULL,
  `created_by` varchar(255) DEFAULT NULL,
  `updated_by` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `notes`
--

CREATE TABLE `notes` (
  `id` varchar(255) NOT NULL,
  `related_id` varchar(255) NOT NULL,
  `note_title` varchar(255) NOT NULL,
  `notetype` varchar(255) DEFAULT NULL,
  `employees` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`employees`)),
  `description` varchar(255) DEFAULT NULL,
  `client_id` varchar(255) NOT NULL,
  `created_by` varchar(255) DEFAULT NULL,
  `updated_by` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` varchar(255) NOT NULL,
  `related_id` varchar(255) NOT NULL,
  `users` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`users`)),
  `title` varchar(255) NOT NULL,
  `message` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `from` varchar(255) NOT NULL,
  `notification_type` enum('normal','reminder') NOT NULL DEFAULT 'normal',
  `client_id` varchar(255) NOT NULL,
  `created_by` varchar(255) DEFAULT NULL,
  `updated_by` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`id`, `related_id`, `users`, `title`, `message`, `description`, `from`, `notification_type`, `client_id`, `created_by`, `updated_by`, `createdAt`, `updatedAt`) VALUES
('JE77ZMl5gsSOsUbkpmZ8Kw8', 'e3qTU0bEmlIvYu8v4jFmjxv', '[]', 'New Plan', 'A new plan is available,tap to view', 'Plan Name: Basic Plan', 'e3qTU0bEmlIvYu8v4jFmjxv', 'normal', 'e3qTU0bEmlIvYu8v4jFmjxv', 'superadmin', NULL, '2025-03-31 10:12:10', '2025-03-31 10:12:10'),
('o3fmx8AaFh030UR9QJDWVsB', 'e3qTU0bEmlIvYu8v4jFmjxv', '[\"4kykUHcg5oLrhNDkfCLNYYG\"]', 'New Plan', 'A new plan is available,tap to view', 'Plan Name: Professional Plan', 'e3qTU0bEmlIvYu8v4jFmjxv', 'normal', 'e3qTU0bEmlIvYu8v4jFmjxv', 'superadmin', NULL, '2025-03-31 10:46:40', '2025-03-31 10:46:40'),
('r3sLw0vIPFr6SnlhsSEoslt', 'e3qTU0bEmlIvYu8v4jFmjxv', '[\"4kykUHcg5oLrhNDkfCLNYYG\"]', 'New Plan', 'A new plan is available,tap to view', 'Plan Name: Business Plan', 'e3qTU0bEmlIvYu8v4jFmjxv', 'normal', 'e3qTU0bEmlIvYu8v4jFmjxv', 'superadmin', NULL, '2025-03-31 10:47:33', '2025-03-31 10:47:33');

-- --------------------------------------------------------

--
-- Table structure for table `offerletters`
--

CREATE TABLE `offerletters` (
  `id` varchar(255) NOT NULL,
  `job` varchar(255) NOT NULL,
  `job_applicant` varchar(255) NOT NULL,
  `offer_expiry` datetime NOT NULL,
  `expected_joining_date` datetime NOT NULL,
  `salary` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `file` varchar(255) DEFAULT NULL,
  `status` varchar(255) NOT NULL DEFAULT 'pending',
  `client_id` varchar(255) NOT NULL,
  `created_by` varchar(255) DEFAULT NULL,
  `updated_by` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` varchar(255) NOT NULL,
  `related_id` varchar(255) NOT NULL,
  `orderNumber` varchar(255) DEFAULT NULL,
  `client` varchar(255) NOT NULL,
  `billing_address` varchar(255) NOT NULL,
  `shipping_address` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`shipping_address`)),
  `project` varchar(255) NOT NULL,
  `genratedBy` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL,
  `items` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`items`)),
  `discount` int(11) DEFAULT NULL,
  `tax` int(11) DEFAULT NULL,
  `total` int(11) NOT NULL,
  `client_Note` varchar(255) DEFAULT NULL,
  `client_id` varchar(255) NOT NULL,
  `created_by` varchar(255) DEFAULT NULL,
  `updated_by` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `otherpayments`
--

CREATE TABLE `otherpayments` (
  `id` varchar(255) NOT NULL,
  `employeeId` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `currency` varchar(255) NOT NULL,
  `amount` int(11) NOT NULL,
  `client_id` varchar(255) NOT NULL,
  `created_by` varchar(255) DEFAULT NULL,
  `updated_by` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `overtimes`
--

CREATE TABLE `overtimes` (
  `id` varchar(255) NOT NULL,
  `employeeId` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `days` varchar(255) NOT NULL,
  `Hours` varchar(255) NOT NULL,
  `rate` varchar(255) NOT NULL,
  `client_id` varchar(255) NOT NULL,
  `created_by` varchar(255) DEFAULT NULL,
  `updated_by` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `id` varchar(255) NOT NULL,
  `related_id` varchar(255) NOT NULL,
  `project_name` varchar(255) DEFAULT NULL,
  `invoice` varchar(255) DEFAULT NULL,
  `expense` varchar(255) DEFAULT NULL,
  `estimate` varchar(255) DEFAULT NULL,
  `paidOn` datetime NOT NULL,
  `amount` varchar(255) NOT NULL,
  `currency` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL DEFAULT 'pending',
  `transactionId` varchar(255) NOT NULL,
  `paymentMethod` varchar(255) NOT NULL,
  `receipt` varchar(255) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `client_id` varchar(255) NOT NULL,
  `created_by` varchar(255) DEFAULT NULL,
  `updated_by` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `paysliptypes`
--

CREATE TABLE `paysliptypes` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `client_id` varchar(255) NOT NULL,
  `created_by` varchar(255) DEFAULT NULL,
  `updated_by` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `performancetypes`
--

CREATE TABLE `performancetypes` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `client_id` varchar(255) NOT NULL,
  `created_by` varchar(255) DEFAULT NULL,
  `updated_by` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` varchar(255) NOT NULL,
  `permissions` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`permissions`)),
  `client_id` varchar(255) NOT NULL,
  `created_by` varchar(255) DEFAULT NULL,
  `updated_by` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pipelines`
--

CREATE TABLE `pipelines` (
  `id` varchar(255) NOT NULL,
  `pipeline_name` varchar(255) NOT NULL,
  `client_id` varchar(255) NOT NULL,
  `created_by` varchar(255) DEFAULT NULL,
  `updated_by` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pipelines`
--

INSERT INTO `pipelines` (`id`, `pipeline_name`, `client_id`, `created_by`, `updated_by`, `createdAt`, `updatedAt`) VALUES
('iiUsXOteVUFiCIMkgR6DObO', 'Marketing', '4kykUHcg5oLrhNDkfCLNYYG', 'Silverline Systems', NULL, '2025-03-31 10:30:29', '2025-03-31 10:30:29'),
('m6SveJxdmilrXCvOALBKRek', 'Sales', '4kykUHcg5oLrhNDkfCLNYYG', 'Silverline Systems', NULL, '2025-03-31 10:30:29', '2025-03-31 10:30:29');

-- --------------------------------------------------------

--
-- Table structure for table `policies`
--

CREATE TABLE `policies` (
  `id` varchar(255) NOT NULL,
  `branch` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `file` varchar(255) DEFAULT NULL,
  `created_by` varchar(255) DEFAULT NULL,
  `updated_by` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` varchar(255) NOT NULL,
  `related_id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `price` int(11) NOT NULL,
  `category` varchar(255) NOT NULL,
  `sku` varchar(255) DEFAULT NULL,
  `tax` varchar(255) DEFAULT NULL,
  `hsn_sac` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `client_id` varchar(255) NOT NULL,
  `created_by` varchar(255) DEFAULT NULL,
  `updated_by` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `projectreports`
--

CREATE TABLE `projectreports` (
  `id` varchar(255) NOT NULL,
  `project` varchar(255) NOT NULL,
  `startdate` datetime NOT NULL,
  `enddate` datetime NOT NULL,
  `projectMembers` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`projectMembers`)),
  `completion` varchar(255) NOT NULL,
  `status` enum('in-progress','on-hold','completed','cancelled') NOT NULL,
  `client_id` varchar(255) NOT NULL,
  `created_by` varchar(255) DEFAULT NULL,
  `updated_by` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `projects`
--

CREATE TABLE `projects` (
  `id` varchar(255) NOT NULL,
  `project_name` varchar(255) DEFAULT NULL,
  `startDate` datetime NOT NULL,
  `endDate` datetime NOT NULL,
  `project_members` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`project_members`)),
  `project_category` varchar(255) DEFAULT NULL,
  `project_description` text DEFAULT NULL,
  `client` varchar(255) DEFAULT NULL,
  `currency` varchar(255) DEFAULT NULL,
  `budget` int(11) NOT NULL,
  `estimatedmonths` varchar(255) DEFAULT NULL,
  `estimatedhours` int(11) DEFAULT NULL,
  `files` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`files`)),
  `tag` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `client_id` varchar(255) DEFAULT NULL,
  `created_by` varchar(255) DEFAULT NULL,
  `updated_by` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `proposals`
--

CREATE TABLE `proposals` (
  `id` varchar(255) NOT NULL,
  `lead_title` varchar(255) NOT NULL,
  `valid_till` datetime NOT NULL,
  `currency` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `items` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`items`)),
  `discount` float NOT NULL,
  `tax` float NOT NULL,
  `total` float NOT NULL,
  `subtotal` float NOT NULL,
  `client_id` varchar(255) NOT NULL,
  `created_by` varchar(255) DEFAULT NULL,
  `updated_by` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `proposals`
--

INSERT INTO `proposals` (`id`, `lead_title`, `valid_till`, `currency`, `description`, `items`, `discount`, `tax`, `total`, `subtotal`, `client_id`, `created_by`, `updated_by`, `createdAt`, `updatedAt`) VALUES
('tfkRAQlpiRhuDXU2mm5BYpV', 'YXfrACvHnsutJstpTU5Tu24', '2025-03-31 05:30:00', 'INR', 'CFCC', '[{\"item\":\"HealthCare App Development\",\"quantity\":1,\"price\":1500000,\"tax_name\":\"PPT\",\"tax\":1,\"amount\":1500000,\"description\":\"\"}]', 0, 15000, 1515000, 1515000, '4kykUHcg5oLrhNDkfCLNYYG', 'Silverline Systems', NULL, '2025-03-31 17:23:27', '2025-03-31 17:23:27');

-- --------------------------------------------------------

--
-- Table structure for table `quotations`
--

CREATE TABLE `quotations` (
  `id` varchar(255) NOT NULL,
  `quotationNumber` varchar(255) DEFAULT NULL,
  `related_id` varchar(255) NOT NULL,
  `valid_till` datetime NOT NULL,
  `currency` varchar(255) NOT NULL,
  `lead` varchar(255) DEFAULT NULL,
  `client` varchar(255) DEFAULT NULL,
  `items` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`items`)),
  `discount` int(11) DEFAULT NULL,
  `tax` int(11) DEFAULT NULL,
  `total` int(11) NOT NULL,
  `client_id` varchar(255) NOT NULL,
  `created_by` varchar(255) DEFAULT NULL,
  `updated_by` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `reminders`
--

CREATE TABLE `reminders` (
  `id` varchar(255) NOT NULL,
  `start_date` datetime NOT NULL,
  `users` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`users`)),
  `description` varchar(255) NOT NULL,
  `client_id` varchar(255) NOT NULL,
  `created_by` varchar(255) DEFAULT NULL,
  `updated_by` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` varchar(255) NOT NULL,
  `role_name` varchar(255) NOT NULL,
  `permissions` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`permissions`)),
  `client_id` varchar(255) DEFAULT NULL,
  `created_by` varchar(255) DEFAULT NULL,
  `updated_by` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `role_name`, `permissions`, `client_id`, `created_by`, `updated_by`, `createdAt`, `updatedAt`) VALUES
('03qarcBedPhsVY3A1IKMMyW', 'System Administrator', '{\"dashboards-project-list\":[{\"key\":\"dashboards-project-list\",\"permissions\":[\"view\",\"create\",\"update\",\"delete\"]}],\"dashboards-sales\":[{\"key\":\"dashboards-sales\",\"permissions\":[\"view\",\"create\",\"update\",\"delete\"]}],\"dashboards-lead\":[{\"key\":\"dashboards-lead\",\"permissions\":[\"view\",\"create\",\"update\",\"delete\"]}],\"dashboards-deal\":[{\"key\":\"dashboards-deal\",\"permissions\":[\"view\",\"create\",\"update\",\"delete\"]}],\"dashboards-proposal\":[{\"key\":\"dashboards-proposal\",\"permissions\":[\"view\",\"create\",\"update\",\"delete\"]}],\"dashboards-task\":[{\"key\":\"dashboards-task\",\"permissions\":[\"view\",\"create\",\"update\",\"delete\"]}],\"dashboards-TaskCalendar\":[{\"key\":\"dashboards-TaskCalendar\",\"permissions\":[\"view\",\"create\",\"update\",\"delete\"]}],\"dashboards-systemsetup\":[{\"key\":\"dashboards-systemsetup\",\"permissions\":[\"view\",\"create\",\"update\",\"delete\"]}],\"extra-users-list\":[{\"key\":\"extra-users-list\",\"permissions\":[\"view\",\"create\",\"update\",\"delete\"]}],\"extra-users-client-list\":[{\"key\":\"extra-users-client-list\",\"permissions\":[\"view\",\"create\",\"update\",\"delete\"]}],\"dashboards-mail\":[{\"key\":\"dashboards-mail\",\"permissions\":[\"view\",\"create\",\"update\",\"delete\"]}],\"dashboards-chat\":[{\"key\":\"dashboards-chat\",\"permissions\":[\"view\",\"create\",\"update\",\"delete\"]}],\"dashboards-calendar\":[{\"key\":\"dashboards-calendar\",\"permissions\":[\"view\",\"create\",\"update\",\"delete\"]}],\"extra-hrm-employee\":[{\"key\":\"extra-hrm-employee\",\"permissions\":[\"view\",\"create\",\"update\",\"delete\"]}],\"extra-hrm-payroll\":[{\"key\":\"extra-hrm-payroll\",\"permissions\":[\"view\",\"create\",\"update\",\"delete\"]}],\"extra-hrm-performance-indicator\":[{\"key\":\"extra-hrm-performance-indicator\",\"permissions\":[\"view\",\"create\",\"update\",\"delete\"]}],\"extra-hrm-role\":[{\"key\":\"extra-hrm-role\",\"permissions\":[\"view\",\"create\",\"update\",\"delete\"]}],\"extra-hrm-branch\":[{\"key\":\"extra-hrm-branch\",\"permissions\":[\"view\",\"create\",\"update\",\"delete\"]}],\"extra-hrm-designation\":[{\"key\":\"extra-hrm-designation\",\"permissions\":[\"view\",\"create\",\"update\",\"delete\"]}],\"extra-hrm-department\":[{\"key\":\"extra-hrm-department\",\"permissions\":[\"view\",\"create\",\"update\",\"delete\"]}],\"extra-hrm-attendance-attendancelist\":[{\"key\":\"extra-hrm-attendance-attendancelist\",\"permissions\":[\"view\",\"create\",\"update\",\"delete\"]}],\"extra-hrm-leave-leavelist\":[{\"key\":\"extra-hrm-leave-leavelist\",\"permissions\":[\"view\",\"create\",\"update\",\"delete\"]}],\"extra-hrm-meeting\":[{\"key\":\"extra-hrm-meeting\",\"permissions\":[\"view\",\"create\",\"update\",\"delete\"]}],\"extra-hrm-announcement\":[{\"key\":\"extra-hrm-announcement\",\"permissions\":[\"view\",\"create\",\"update\",\"delete\"]}],\"extra-hrm-jobs-joblist\":[{\"key\":\"extra-hrm-jobs-joblist\",\"permissions\":[\"view\",\"create\",\"update\",\"delete\"]}],\"extra-hrm-document\":[{\"key\":\"extra-hrm-document\",\"permissions\":[\"view\",\"create\",\"update\",\"delete\"]}],\"extra-hrm-trainingSetup\":[{\"key\":\"extra-hrm-trainingSetup\",\"permissions\":[\"view\",\"create\",\"update\",\"delete\"]}],\"extra-hrm-jobs-jobcandidate\":[{\"key\":\"extra-hrm-jobs-jobcandidate\",\"permissions\":[\"view\",\"create\",\"update\",\"delete\"]}],\"extra-hrm-jobs-jobonbording\":[{\"key\":\"extra-hrm-jobs-jobonbording\",\"permissions\":[\"view\",\"create\",\"update\",\"delete\"]}],\"extra-hrm-jobs-jobapplication\":[{\"key\":\"extra-hrm-jobs-jobapplication\",\"permissions\":[\"view\",\"create\",\"update\",\"delete\"]}],\"extra-hrm-jobs-jobofferletter\":[{\"key\":\"extra-hrm-jobs-jobofferletter\",\"permissions\":[\"view\",\"create\",\"update\",\"delete\"]}],\"extra-hrm-jobs-interview\":[{\"key\":\"extra-hrm-jobs-interview\",\"permissions\":[\"view\",\"create\",\"update\",\"delete\"]}]}', '4kykUHcg5oLrhNDkfCLNYYG', 'Silverline Systems', NULL, '2025-03-31 10:58:53', '2025-03-31 10:58:53'),
('28RtGJ3pSZXAZTC5FKpuGMR', 'Support Specialist', '{\"dashboards-mail\":[{\"key\":\"dashboards-mail\",\"permissions\":[\"view\",\"create\",\"update\",\"delete\"]}],\"dashboards-chat\":[{\"key\":\"dashboards-chat\",\"permissions\":[\"view\",\"create\",\"update\",\"delete\"]}],\"dashboards-calendar\":[{\"key\":\"dashboards-calendar\",\"permissions\":[\"view\",\"create\",\"update\",\"delete\"]}],\"extra-hrm-designation\":[{\"key\":\"extra-hrm-designation\",\"permissions\":[\"view\",\"create\",\"update\",\"delete\"]}],\"extra-hrm-department\":[{\"key\":\"extra-hrm-department\",\"permissions\":[\"view\",\"create\",\"update\",\"delete\"]}],\"extra-hrm-meeting\":[{\"key\":\"extra-hrm-meeting\",\"permissions\":[\"view\",\"create\",\"update\",\"delete\"]}]}', '4kykUHcg5oLrhNDkfCLNYYG', 'Silverline Systems', NULL, '2025-03-31 11:00:43', '2025-03-31 11:00:43'),
('hQG7DPggtFQUMhEUdJjADL3', 'sub-client', '{\"dashboards-project-list\":[{\"key\":\"dashboards-project-list\",\"permissions\":[\"view\"]}]}', '4kykUHcg5oLrhNDkfCLNYYG', 'Silverline Systems', 'Silverline Systems', '2025-03-31 11:47:07', '2025-03-31 12:31:56'),
('jdWbdnTrMDss1mxhqXBUhpI', 'Business Analyst', '{\"dashboards-mail\":[{\"key\":\"dashboards-mail\",\"permissions\":[\"view\",\"create\",\"update\",\"delete\"]}],\"dashboards-chat\":[{\"key\":\"dashboards-chat\",\"permissions\":[\"view\",\"create\",\"update\",\"delete\"]}],\"dashboards-calendar\":[{\"key\":\"dashboards-calendar\",\"permissions\":[\"view\",\"create\",\"update\",\"delete\"]}],\"extra-hrm-jobs-joblist\":[{\"key\":\"extra-hrm-jobs-joblist\",\"permissions\":[\"view\",\"create\",\"update\",\"delete\"]}],\"extra-hrm-jobs-jobcandidate\":[{\"key\":\"extra-hrm-jobs-jobcandidate\",\"permissions\":[\"view\",\"create\",\"update\",\"delete\"]}],\"extra-hrm-jobs-jobonbording\":[{\"key\":\"extra-hrm-jobs-jobonbording\",\"permissions\":[\"view\",\"create\",\"update\",\"delete\"]}],\"extra-hrm-jobs-jobapplication\":[{\"key\":\"extra-hrm-jobs-jobapplication\",\"permissions\":[\"view\",\"create\",\"update\",\"delete\"]}],\"extra-hrm-jobs-jobofferletter\":[{\"key\":\"extra-hrm-jobs-jobofferletter\",\"permissions\":[\"view\",\"create\",\"update\",\"delete\"]}],\"extra-hrm-jobs-interview\":[{\"key\":\"extra-hrm-jobs-interview\",\"permissions\":[\"view\",\"create\",\"update\",\"delete\"]}]}', '4kykUHcg5oLrhNDkfCLNYYG', 'Silverline Systems', NULL, '2025-03-31 11:00:14', '2025-03-31 11:00:14'),
('pcmMgRgxCKK2LPLL2SXqjep', 'Project Manager', '{\"dashboards-project-list\":[{\"key\":\"dashboards-project-list\",\"permissions\":[\"view\",\"create\",\"update\",\"delete\"]}],\"dashboards-sales\":[{\"key\":\"dashboards-sales\",\"permissions\":[\"view\",\"create\",\"update\",\"delete\"]}],\"dashboards-lead\":[{\"key\":\"dashboards-lead\",\"permissions\":[\"view\",\"create\",\"update\",\"delete\"]}],\"dashboards-deal\":[{\"key\":\"dashboards-deal\",\"permissions\":[\"view\",\"create\",\"update\",\"delete\"]}],\"dashboards-proposal\":[{\"key\":\"dashboards-proposal\",\"permissions\":[\"view\",\"create\",\"update\",\"delete\"]}],\"dashboards-task\":[{\"key\":\"dashboards-task\",\"permissions\":[\"view\",\"create\",\"update\",\"delete\"]}],\"dashboards-TaskCalendar\":[{\"key\":\"dashboards-TaskCalendar\",\"permissions\":[\"view\",\"create\",\"update\",\"delete\"]}],\"dashboards-systemsetup\":[{\"key\":\"dashboards-systemsetup\",\"permissions\":[\"view\",\"create\",\"update\",\"delete\"]}],\"extra-hrm-employee\":[{\"key\":\"extra-hrm-employee\",\"permissions\":[\"view\",\"create\",\"update\",\"delete\"]}],\"extra-hrm-payroll\":[{\"key\":\"extra-hrm-payroll\",\"permissions\":[\"view\",\"create\",\"update\",\"delete\"]}],\"extra-hrm-performance-indicator\":[{\"key\":\"extra-hrm-performance-indicator\",\"permissions\":[\"view\",\"create\",\"update\",\"delete\"]}],\"extra-hrm-role\":[{\"key\":\"extra-hrm-role\",\"permissions\":[\"view\",\"create\",\"update\",\"delete\"]}],\"extra-hrm-branch\":[{\"key\":\"extra-hrm-branch\",\"permissions\":[\"view\",\"create\",\"update\",\"delete\"]}],\"extra-hrm-designation\":[{\"key\":\"extra-hrm-designation\",\"permissions\":[\"view\",\"create\",\"update\",\"delete\"]}],\"extra-hrm-department\":[{\"key\":\"extra-hrm-department\",\"permissions\":[\"view\",\"create\",\"update\",\"delete\"]}],\"extra-hrm-attendance-attendancelist\":[{\"key\":\"extra-hrm-attendance-attendancelist\",\"permissions\":[\"view\",\"create\",\"update\",\"delete\"]}],\"extra-hrm-leave-leavelist\":[{\"key\":\"extra-hrm-leave-leavelist\",\"permissions\":[\"view\",\"create\",\"update\",\"delete\"]}],\"extra-hrm-meeting\":[{\"key\":\"extra-hrm-meeting\",\"permissions\":[\"view\",\"create\",\"update\",\"delete\"]}],\"extra-hrm-announcement\":[{\"key\":\"extra-hrm-announcement\",\"permissions\":[\"view\",\"create\",\"update\",\"delete\"]}],\"extra-hrm-jobs-joblist\":[{\"key\":\"extra-hrm-jobs-joblist\",\"permissions\":[\"view\",\"create\",\"update\",\"delete\"]}],\"extra-hrm-document\":[{\"key\":\"extra-hrm-document\",\"permissions\":[\"view\",\"create\",\"update\",\"delete\"]}],\"extra-hrm-trainingSetup\":[{\"key\":\"extra-hrm-trainingSetup\",\"permissions\":[\"view\",\"create\",\"update\",\"delete\"]}],\"dashboards-mail\":[{\"key\":\"dashboards-mail\",\"permissions\":[\"view\",\"create\",\"update\",\"delete\"]}],\"dashboards-chat\":[{\"key\":\"dashboards-chat\",\"permissions\":[\"view\",\"create\",\"update\",\"delete\"]}],\"dashboards-calendar\":[{\"key\":\"dashboards-calendar\",\"permissions\":[\"view\",\"create\",\"update\",\"delete\"]}]}', '4kykUHcg5oLrhNDkfCLNYYG', 'Silverline Systems', NULL, '2025-03-31 10:59:16', '2025-03-31 10:59:16'),
('SE8IBig8OMMQRI2yX7Exzhm', 'Technical Lead', '{\"dashboards-sales\":[{\"key\":\"dashboards-sales\",\"permissions\":[\"view\",\"create\",\"update\",\"delete\"]}],\"dashboards-lead\":[{\"key\":\"dashboards-lead\",\"permissions\":[\"view\",\"create\",\"update\",\"delete\"]}],\"dashboards-deal\":[{\"key\":\"dashboards-deal\",\"permissions\":[\"view\",\"create\",\"update\",\"delete\"]}],\"dashboards-systemsetup\":[{\"key\":\"dashboards-systemsetup\",\"permissions\":[\"view\",\"create\",\"update\",\"delete\"]}],\"extra-hrm-employee\":[{\"key\":\"extra-hrm-employee\",\"permissions\":[\"view\",\"create\",\"update\",\"delete\"]}],\"extra-hrm-trainingSetup\":[{\"key\":\"extra-hrm-trainingSetup\",\"permissions\":[\"view\",\"create\",\"update\",\"delete\"]}]}', '4kykUHcg5oLrhNDkfCLNYYG', 'Silverline Systems', NULL, '2025-03-31 10:59:52', '2025-03-31 10:59:52'),
('vI5ukP3myMKhjXXeHsmq1Rj', 'client', NULL, NULL, 'superadmin', NULL, '2025-03-31 09:27:18', '2025-03-31 09:27:18'),
('xqmOVHGdkwfQR93yXHRQg0c', 'employee', NULL, '4kykUHcg5oLrhNDkfCLNYYG', 'Silverline Systems', NULL, '2025-03-31 12:40:32', '2025-03-31 12:40:32'),
('ZeizasNdwwvSP1gpQjdGzy9', 'super-admin', NULL, NULL, NULL, NULL, '2025-03-31 09:21:03', '2025-03-31 09:21:03');

-- --------------------------------------------------------

--
-- Table structure for table `salaries`
--

CREATE TABLE `salaries` (
  `id` varchar(255) NOT NULL,
  `employeeId` varchar(255) NOT NULL,
  `payslipType` varchar(255) NOT NULL,
  `currency` varchar(255) NOT NULL,
  `salary` varchar(255) NOT NULL,
  `netSalary` int(11) NOT NULL,
  `status` enum('paid','unpaid') NOT NULL DEFAULT 'unpaid',
  `paymentDate` datetime DEFAULT NULL,
  `bankAccount` varchar(255) NOT NULL,
  `client_id` varchar(255) NOT NULL,
  `created_by` varchar(255) DEFAULT NULL,
  `updated_by` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sales_creditnotes`
--

CREATE TABLE `sales_creditnotes` (
  `id` varchar(255) NOT NULL,
  `related_id` varchar(255) NOT NULL,
  `invoice` varchar(255) NOT NULL,
  `currency` varchar(255) DEFAULT NULL,
  `amount` varchar(255) NOT NULL,
  `date` datetime DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `attachment` varchar(255) DEFAULT NULL,
  `client_id` varchar(255) NOT NULL,
  `created_by` varchar(255) DEFAULT NULL,
  `updated_by` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sales_invoices`
--

CREATE TABLE `sales_invoices` (
  `id` varchar(255) NOT NULL,
  `salesInvoiceNumber` varchar(255) DEFAULT NULL,
  `related_id` varchar(255) NOT NULL,
  `customer` varchar(255) NOT NULL,
  `issueDate` datetime NOT NULL,
  `dueDate` datetime NOT NULL,
  `category` varchar(255) DEFAULT NULL,
  `items` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`items`)),
  `discount` int(11) DEFAULT NULL,
  `tax` int(11) DEFAULT NULL,
  `total` int(11) NOT NULL,
  `client_id` varchar(255) NOT NULL,
  `created_by` varchar(255) DEFAULT NULL,
  `updated_by` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sales_quotations`
--

CREATE TABLE `sales_quotations` (
  `id` varchar(255) NOT NULL,
  `salesQuotationNumber` varchar(255) DEFAULT NULL,
  `related_id` varchar(255) NOT NULL,
  `customer` varchar(255) NOT NULL,
  `issueDate` datetime NOT NULL,
  `category` varchar(255) NOT NULL,
  `items` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`items`)),
  `discount` int(11) DEFAULT NULL,
  `tax` int(11) DEFAULT NULL,
  `total` int(11) NOT NULL,
  `client_id` varchar(255) NOT NULL,
  `created_by` varchar(255) DEFAULT NULL,
  `updated_by` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sales_revenues`
--

CREATE TABLE `sales_revenues` (
  `id` varchar(255) NOT NULL,
  `related_id` varchar(255) NOT NULL,
  `date` datetime NOT NULL,
  `currency` varchar(255) DEFAULT NULL,
  `amount` int(11) NOT NULL,
  `account` varchar(255) NOT NULL,
  `customer` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `category` varchar(255) NOT NULL,
  `client_id` varchar(255) NOT NULL,
  `created_by` varchar(255) DEFAULT NULL,
  `updated_by` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` varchar(255) NOT NULL,
  `companyName` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `companylogo` varchar(255) NOT NULL,
  `favicon` varchar(255) NOT NULL,
  `termsandconditions` text NOT NULL,
  `client_id` varchar(255) NOT NULL,
  `created_by` varchar(255) DEFAULT NULL,
  `updated_by` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `skills`
--

CREATE TABLE `skills` (
  `id` varchar(255) NOT NULL,
  `skillName` varchar(255) NOT NULL,
  `client_id` varchar(255) NOT NULL,
  `created_by` varchar(255) DEFAULT NULL,
  `updated_by` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `stages`
--

CREATE TABLE `stages` (
  `id` varchar(255) NOT NULL,
  `stageType` varchar(255) NOT NULL,
  `stageName` varchar(255) NOT NULL,
  `pipeline` varchar(255) NOT NULL,
  `client_id` varchar(255) NOT NULL,
  `created_by` varchar(255) DEFAULT NULL,
  `updated_by` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `stages`
--

INSERT INTO `stages` (`id`, `stageType`, `stageName`, `pipeline`, `client_id`, `created_by`, `updated_by`, `createdAt`, `updatedAt`) VALUES
('1j1Mfax4tYdOONQGLA23CeQ', 'deal', 'Lead Received', 'iiUsXOteVUFiCIMkgR6DObO', '4kykUHcg5oLrhNDkfCLNYYG', 'Silverline Systems', NULL, '2025-03-31 10:30:29', '2025-03-31 10:30:29'),
('BYNYLCidEQll0qKymn79W76', 'lead', 'Closed Won', 'm6SveJxdmilrXCvOALBKRek', '4kykUHcg5oLrhNDkfCLNYYG', 'Silverline Systems', NULL, '2025-03-31 10:30:29', '2025-03-31 10:30:29'),
('eTzCUBr5Y232i82lxUoP9vJ', 'lead', 'Qualified', 'm6SveJxdmilrXCvOALBKRek', '4kykUHcg5oLrhNDkfCLNYYG', 'Silverline Systems', NULL, '2025-03-31 10:30:29', '2025-03-31 10:30:29'),
('icIkzFa9jKpV26cO64IJS7f', 'lead', 'Negotiation', 'm6SveJxdmilrXCvOALBKRek', '4kykUHcg5oLrhNDkfCLNYYG', 'Silverline Systems', NULL, '2025-03-31 10:30:29', '2025-03-31 10:30:29'),
('kf3CdKopyyAqyES98pDDPaA', 'deal', 'Deal Closed', 'iiUsXOteVUFiCIMkgR6DObO', '4kykUHcg5oLrhNDkfCLNYYG', 'Silverline Systems', NULL, '2025-03-31 10:30:29', '2025-03-31 10:30:29'),
('TzwcX4i23otRdEITIioMMoR', 'deal', 'Proposal Sent', 'iiUsXOteVUFiCIMkgR6DObO', '4kykUHcg5oLrhNDkfCLNYYG', 'Silverline Systems', NULL, '2025-03-31 10:30:29', '2025-03-31 10:30:29'),
('ucHxzJDG8XiUl7sMzJz0OJL', 'deal', 'Initial Contact', 'iiUsXOteVUFiCIMkgR6DObO', '4kykUHcg5oLrhNDkfCLNYYG', 'Silverline Systems', NULL, '2025-03-31 10:30:29', '2025-03-31 10:30:29'),
('y75dLVbz4NfpZMCehFqh7VJ', 'lead', 'New Lead', 'm6SveJxdmilrXCvOALBKRek', '4kykUHcg5oLrhNDkfCLNYYG', 'Silverline Systems', NULL, '2025-03-31 10:30:29', '2025-03-31 10:30:29');

-- --------------------------------------------------------

--
-- Table structure for table `subscriptionplans`
--

CREATE TABLE `subscriptionplans` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `currency` varchar(255) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `duration` varchar(255) NOT NULL,
  `trial_period` varchar(255) DEFAULT NULL,
  `max_users` varchar(255) NOT NULL,
  `max_clients` varchar(255) NOT NULL,
  `max_customers` varchar(255) NOT NULL,
  `max_vendors` varchar(255) NOT NULL,
  `storage_limit` varchar(255) NOT NULL,
  `features` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`features`)),
  `status` enum('active','inactive') NOT NULL DEFAULT 'active',
  `created_by` varchar(255) DEFAULT NULL,
  `updated_by` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `subscriptionplans`
--

INSERT INTO `subscriptionplans` (`id`, `name`, `currency`, `price`, `duration`, `trial_period`, `max_users`, `max_clients`, `max_customers`, `max_vendors`, `storage_limit`, `features`, `status`, `created_by`, `updated_by`, `createdAt`, `updatedAt`) VALUES
('7jkFMDlerBM0I8peB1i6QHG', 'Professional Plan', 'INR', 2499.00, 'Per Month', '14', '15', '25', '100', '50', '25', '{}', 'active', 'superadmin', NULL, '2025-03-31 10:46:40', '2025-03-31 10:46:40'),
('jvsA7iVLdbIs0mtKFXiwiMT', 'Business Plan', 'INR', 4999.00, 'Per Month', '30', '30', '50', '250', '100', '50', '{}', 'active', 'superadmin', NULL, '2025-03-31 10:47:33', '2025-03-31 10:47:33'),
('uzptLdgqYFRoK23ORcMgQrg', 'Basic Plan', 'INR', 999.00, 'Per Month', '7', '5', '10', '50', '20', '10', '{}', 'active', 'superadmin', NULL, '2025-03-31 10:12:10', '2025-03-31 10:12:10');

-- --------------------------------------------------------

--
-- Table structure for table `superadmins`
--

CREATE TABLE `superadmins` (
  `id` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `role_id` varchar(255) NOT NULL,
  `profilePic` varchar(255) DEFAULT NULL,
  `firstName` varchar(255) DEFAULT NULL,
  `lastName` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `created_by` varchar(255) DEFAULT NULL,
  `updated_by` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `superadmins`
--

INSERT INTO `superadmins` (`id`, `username`, `password`, `email`, `role_id`, `profilePic`, `firstName`, `lastName`, `phone`, `created_by`, `updated_by`, `createdAt`, `updatedAt`) VALUES
('e3qTU0bEmlIvYu8v4jFmjxv', 'superadmin', '$2b$10$OSsFR7hz.ndO2H24rgoz1eEY/kMH/vdGfrxVxy4HqIcl2yqMoOabS', 'superadmin@nexisvision.com', 'ZeizasNdwwvSP1gpQjdGzy9', NULL, NULL, NULL, NULL, NULL, NULL, '2025-03-31 09:21:03', '2025-03-31 09:21:03');

-- --------------------------------------------------------

--
-- Table structure for table `tags`
--

CREATE TABLE `tags` (
  `id` varchar(255) NOT NULL,
  `related_id` varchar(255) NOT NULL,
  `lableType` varchar(255) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `color` varchar(255) DEFAULT NULL,
  `client_id` varchar(255) NOT NULL,
  `created_by` varchar(255) DEFAULT NULL,
  `updated_by` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tags`
--

INSERT INTO `tags` (`id`, `related_id`, `lableType`, `name`, `color`, `client_id`, `created_by`, `updated_by`, `createdAt`, `updatedAt`) VALUES
('09Ok7SBxIIaLs8QQxmpeNBf', 'AsPoso1y1OL5uY5URy57ZPw', 'followup', 'Email', '#EA4335', 'AsPoso1y1OL5uY5URy57ZPw', 'system', NULL, '2025-03-31 09:29:46', '2025-03-31 09:29:46'),
('0cLO9RXQ6rCgBoIcKjsNnhN', '7aRxfVTXsxd31PyBz9WzEjx', 'source', 'Referral', '#2980B9', '7aRxfVTXsxd31PyBz9WzEjx', 'system', NULL, '2025-03-31 09:30:53', '2025-03-31 09:30:53'),
('0ga51ZccuIiGGEudOSNNRDJ', '4kykUHcg5oLrhNDkfCLNYYG', 'source', 'Phone', '#34495E', '4kykUHcg5oLrhNDkfCLNYYG', 'system', NULL, '2025-03-31 09:41:22', '2025-03-31 09:41:22'),
('0juRsz21A5ZtveHJkM5XAfw', 'Bot3GuoPgOHloKvTPRtcz2A', 'source', 'Phone', '#34495E', 'Bot3GuoPgOHloKvTPRtcz2A', 'system', NULL, '2025-03-31 09:33:59', '2025-03-31 09:33:59'),
('0OlY7GrRVXrpGctpJ1W8woD', 'EYxL2jumtV4h2riCxEXLcGp', 'contract_type', 'Project Based', '#27AE60', 'EYxL2jumtV4h2riCxEXLcGp', 'system', NULL, '2025-03-31 09:32:32', '2025-03-31 09:32:32'),
('0PTjfmVnNoWVG697TEecBoT', '4kykUHcg5oLrhNDkfCLNYYG', 'source', 'Partner', '#27AE60', '4kykUHcg5oLrhNDkfCLNYYG', 'system', NULL, '2025-03-31 09:41:22', '2025-03-31 09:41:22'),
('0S2g8QaYhZn52lAMupZZjT1', '4kykUHcg5oLrhNDkfCLNYYG', 'tag', 'Low Priority', '#F39C12', '4kykUHcg5oLrhNDkfCLNYYG', 'system', NULL, '2025-03-31 09:41:22', '2025-03-31 09:41:22'),
('0t5FAZ1TNG65oLGhUlkQaxc', 'lsA3bWwiHYURgcxV1p9JKYL', 'tag', 'Medium Priority', '#D35400', 'lsA3bWwiHYURgcxV1p9JKYL', 'system', NULL, '2025-03-31 09:39:39', '2025-03-31 09:39:39'),
('1CaLDp7D00On5UIURGx2zqg', '7aRxfVTXsxd31PyBz9WzEjx', 'tag', 'Important', '#8E44AD', '7aRxfVTXsxd31PyBz9WzEjx', 'system', NULL, '2025-03-31 09:30:53', '2025-03-31 09:30:53'),
('1dM4BgSy5uAUmxBbygKhvBs', 'e5ESgU0K4XFQMWlwlcdl89T', 'status', 'Approved', '#27AE60', 'e5ESgU0K4XFQMWlwlcdl89T', 'system', NULL, '2025-03-31 09:36:52', '2025-03-31 09:36:52'),
('1j3KtelBZu9JsJEHSuV2smX', 'e5ESgU0K4XFQMWlwlcdl89T', 'source', 'Direct', '#8E44AD', 'e5ESgU0K4XFQMWlwlcdl89T', 'system', NULL, '2025-03-31 09:36:52', '2025-03-31 09:36:52'),
('1jGyazthRqykwrP3OyQ5WTA', '7aRxfVTXsxd31PyBz9WzEjx', 'tag', 'High Priority', '#C0392B', '7aRxfVTXsxd31PyBz9WzEjx', 'system', NULL, '2025-03-31 09:30:53', '2025-03-31 09:30:53'),
('1mswdHa0gIeo5LhNlpczliL', 'lsA3bWwiHYURgcxV1p9JKYL', 'contract_type', 'Milestone Based', '#8E44AD', 'lsA3bWwiHYURgcxV1p9JKYL', 'system', NULL, '2025-03-31 09:39:39', '2025-03-31 09:39:39'),
('1oNDhwGieiVn6vt8hnC1hLh', 'Bot3GuoPgOHloKvTPRtcz2A', 'source', 'Social Media', '#27AE60', 'Bot3GuoPgOHloKvTPRtcz2A', 'system', NULL, '2025-03-31 09:33:59', '2025-03-31 09:33:59'),
('1QFRfESrZjuJc0iBoyeNrzp', 'AsPoso1y1OL5uY5URy57ZPw', 'source', 'Website', '#16A085', 'AsPoso1y1OL5uY5URy57ZPw', 'system', NULL, '2025-03-31 09:29:46', '2025-03-31 09:29:46'),
('1QxYiOXI3bijijgoWlXfk5E', 'tawmdBbwDXMrKoMp57lQPEJ', 'followup', 'Video Call', '#7c3aed', 'tawmdBbwDXMrKoMp57lQPEJ', 'system', NULL, '2025-03-31 09:35:06', '2025-03-31 09:35:06'),
('1wHupFBxTJKhzbCuXYQlHiH', 'EYxL2jumtV4h2riCxEXLcGp', 'category', 'Healthcare', '#1ABC9C', 'EYxL2jumtV4h2riCxEXLcGp', 'system', NULL, '2025-03-31 09:32:32', '2025-03-31 09:32:32'),
('1ZikJTq3pw760tWnug2J1nh', 'EYxL2jumtV4h2riCxEXLcGp', 'tag', 'Follow-up', '#16A085', 'EYxL2jumtV4h2riCxEXLcGp', 'system', NULL, '2025-03-31 09:32:32', '2025-03-31 09:32:32'),
('1zyG4xZgh5DSznIVDcH9vRe', 'tawmdBbwDXMrKoMp57lQPEJ', 'category', 'Training', '#2980B9', 'tawmdBbwDXMrKoMp57lQPEJ', 'system', NULL, '2025-03-31 09:35:06', '2025-03-31 09:35:06'),
('256KsSteYnPhK3ECHJ9cqPQ', 'M3kofTRJDv4cm25SZetXgro', 'tag', 'Medium Priority', '#D35400', 'M3kofTRJDv4cm25SZetXgro', 'system', NULL, '2025-03-31 09:43:22', '2025-03-31 09:43:22'),
('2e5BM1rMkmcF7mJ4b91vmpI', 'lsA3bWwiHYURgcxV1p9JKYL', 'source', 'Website', '#16A085', 'lsA3bWwiHYURgcxV1p9JKYL', 'system', NULL, '2025-03-31 09:39:39', '2025-03-31 09:39:39'),
('2FzQWb4Vhg1yIgseAiI7JiZ', 'e5ESgU0K4XFQMWlwlcdl89T', 'category', 'Healthcare', '#1ABC9C', 'e5ESgU0K4XFQMWlwlcdl89T', 'system', NULL, '2025-03-31 09:36:52', '2025-03-31 09:36:52'),
('2RVHkqkRZnhok2UrTouQMPe', 'AsPoso1y1OL5uY5URy57ZPw', 'status', 'Completed', '#2ECC71', 'AsPoso1y1OL5uY5URy57ZPw', 'system', NULL, '2025-03-31 09:29:46', '2025-03-31 09:29:46'),
('2zcTo6KakqMxbO4OQJLmlwq', 'M3kofTRJDv4cm25SZetXgro', 'status', 'Cancelled', '#E74C3C', 'M3kofTRJDv4cm25SZetXgro', 'system', NULL, '2025-03-31 09:43:22', '2025-03-31 09:43:22'),
('3bVpv4eoG3FVwhSJDgFqAQZ', '7aRxfVTXsxd31PyBz9WzEjx', 'status', 'In Progress', '#3498DB', '7aRxfVTXsxd31PyBz9WzEjx', 'system', NULL, '2025-03-31 09:30:53', '2025-03-31 09:30:53'),
('3bXgC9KGP80CR1AjgKDOBA5', 'EYxL2jumtV4h2riCxEXLcGp', 'followup', 'Phone Call', '#1890ff', 'EYxL2jumtV4h2riCxEXLcGp', 'system', NULL, '2025-03-31 09:32:32', '2025-03-31 09:32:32'),
('3DILcXa1GuJYr3VjTHKf9DB', 'tawmdBbwDXMrKoMp57lQPEJ', 'status', 'Rejected', '#C0392B', 'tawmdBbwDXMrKoMp57lQPEJ', 'system', NULL, '2025-03-31 09:35:06', '2025-03-31 09:35:06'),
('3noK39DfarLT7XivFs2Y0Ty', '7aRxfVTXsxd31PyBz9WzEjx', 'followup', 'WhatsApp', '#25D366', '7aRxfVTXsxd31PyBz9WzEjx', 'system', NULL, '2025-03-31 09:30:53', '2025-03-31 09:30:53'),
('3s5OhbsxCUQSCo0KSbjg6Fu', 'AsPoso1y1OL5uY5URy57ZPw', 'tag', 'Sensitive', '#C0392B', 'AsPoso1y1OL5uY5URy57ZPw', 'system', NULL, '2025-03-31 09:29:46', '2025-03-31 09:29:46'),
('3VHIGlCjqLo1KokMggB3kCO', '7aRxfVTXsxd31PyBz9WzEjx', 'source', 'Social Media', '#27AE60', '7aRxfVTXsxd31PyBz9WzEjx', 'system', NULL, '2025-03-31 09:30:53', '2025-03-31 09:30:53'),
('4A4XK3GYWXk3oikMsyvkSdC', 'lsA3bWwiHYURgcxV1p9JKYL', 'tag', 'Urgent', '#E74C3C', 'lsA3bWwiHYURgcxV1p9JKYL', 'system', NULL, '2025-03-31 09:39:39', '2025-03-31 09:39:39'),
('4erPRbVVyu15Q3HORQNeh2J', '4kykUHcg5oLrhNDkfCLNYYG', 'tag', 'Medium Priority', '#D35400', '4kykUHcg5oLrhNDkfCLNYYG', 'system', NULL, '2025-03-31 09:41:22', '2025-03-31 09:41:22'),
('4geyBXDdZbgK4XQVBsjrOj1', 'AsPoso1y1OL5uY5URy57ZPw', 'source', 'Referral', '#2980B9', 'AsPoso1y1OL5uY5URy57ZPw', 'system', NULL, '2025-03-31 09:29:46', '2025-03-31 09:29:46'),
('4JEkQKsegQMoihdmW6nfkFS', 'AsPoso1y1OL5uY5URy57ZPw', 'tag', 'Low Priority', '#F39C12', 'AsPoso1y1OL5uY5URy57ZPw', 'system', NULL, '2025-03-31 09:29:46', '2025-03-31 09:29:46'),
('4oASAr0VmHHVdDIswtJ1Ua6', 'Bot3GuoPgOHloKvTPRtcz2A', 'tag', 'Special', '#8E44AD', 'Bot3GuoPgOHloKvTPRtcz2A', 'system', NULL, '2025-03-31 09:33:59', '2025-03-31 09:33:59'),
('4pWxPgYS3TRJhWLFX3z630b', '4kykUHcg5oLrhNDkfCLNYYG', 'source', 'Advertisement', '#2C3E50', '4kykUHcg5oLrhNDkfCLNYYG', 'system', NULL, '2025-03-31 09:41:22', '2025-03-31 09:41:22'),
('4rjMJW0LYOEnpt46PpMzXXt', '7aRxfVTXsxd31PyBz9WzEjx', 'source', 'Other', '#34495E', '7aRxfVTXsxd31PyBz9WzEjx', 'system', NULL, '2025-03-31 09:30:53', '2025-03-31 09:30:53'),
('4UnAGDIRmdI1tW4FK9hURtC', 'Wek9GHYyp9ebFwzjFZHtuvA', 'status', 'Rejected', '#C0392B', 'Wek9GHYyp9ebFwzjFZHtuvA', 'system', NULL, '2025-03-31 09:27:31', '2025-03-31 09:27:31'),
('4ZvqPTsOFx9wJYE1t9JbZbm', 'Bot3GuoPgOHloKvTPRtcz2A', 'category', 'Real Estate', '#3498DB', 'Bot3GuoPgOHloKvTPRtcz2A', 'system', NULL, '2025-03-31 09:33:59', '2025-03-31 09:33:59'),
('538GuJlzt7ZHowgWbRcnL7s', 'AsPoso1y1OL5uY5URy57ZPw', 'category', 'E-commerce', '#8E44AD', 'AsPoso1y1OL5uY5URy57ZPw', 'system', NULL, '2025-03-31 09:29:46', '2025-03-31 09:29:46'),
('65DkvLmy0UupS3XI7oIyloU', 'lsA3bWwiHYURgcxV1p9JKYL', 'source', 'Event', '#16A085', 'lsA3bWwiHYURgcxV1p9JKYL', 'system', NULL, '2025-03-31 09:39:39', '2025-03-31 09:39:39'),
('6A82FKPWMu8CJgMXjvvhlj6', 'Bot3GuoPgOHloKvTPRtcz2A', 'status', 'Rejected', '#C0392B', 'Bot3GuoPgOHloKvTPRtcz2A', 'system', NULL, '2025-03-31 09:33:59', '2025-03-31 09:33:59'),
('6bxR98p7ThNuc7OfHyxfyom', '7aRxfVTXsxd31PyBz9WzEjx', 'contract_type', 'Milestone Based', '#8E44AD', '7aRxfVTXsxd31PyBz9WzEjx', 'system', NULL, '2025-03-31 09:30:53', '2025-03-31 09:30:53'),
('6ECFx8SCMi5rjgf5QsgN36J', 'Bot3GuoPgOHloKvTPRtcz2A', 'category', 'Software Development', '#2C3E50', 'Bot3GuoPgOHloKvTPRtcz2A', 'system', NULL, '2025-03-31 09:33:59', '2025-03-31 09:33:59'),
('6kgwTAqhAQsapmnGyReKcJL', 'lsA3bWwiHYURgcxV1p9JKYL', 'category', 'Marketing', '#27AE60', 'lsA3bWwiHYURgcxV1p9JKYL', 'system', NULL, '2025-03-31 09:39:39', '2025-03-31 09:39:39'),
('6OjV2IMM0MhZogfm3Vwp0xL', 'lsA3bWwiHYURgcxV1p9JKYL', 'tag', 'High Priority', '#C0392B', 'lsA3bWwiHYURgcxV1p9JKYL', 'system', NULL, '2025-03-31 09:39:39', '2025-03-31 09:39:39'),
('6qr1dAwRIXrn5ROqkBQcrqF', '4kykUHcg5oLrhNDkfCLNYYG', 'source', 'Website', '#16A085', '4kykUHcg5oLrhNDkfCLNYYG', 'system', NULL, '2025-03-31 09:41:22', '2025-03-31 09:41:22'),
('6tHz08MhXEFwZ0IeNun7itP', 'tawmdBbwDXMrKoMp57lQPEJ', 'category', 'Healthcare', '#1ABC9C', 'tawmdBbwDXMrKoMp57lQPEJ', 'system', NULL, '2025-03-31 09:35:06', '2025-03-31 09:35:06'),
('6TYfwDNvhMa0bzUxHVPFXd8', 'Bot3GuoPgOHloKvTPRtcz2A', 'followup', 'Phone Call', '#1890ff', 'Bot3GuoPgOHloKvTPRtcz2A', 'system', NULL, '2025-03-31 09:33:59', '2025-03-31 09:33:59'),
('6YLCZx7YXHxrAaiLuoNDJZc', 'M3kofTRJDv4cm25SZetXgro', 'contract_type', 'Retainer', '#D35400', 'M3kofTRJDv4cm25SZetXgro', 'system', NULL, '2025-03-31 09:43:22', '2025-03-31 09:43:22'),
('7AdnlaQ1RJFLqw764gFRcNb', 'M3kofTRJDv4cm25SZetXgro', 'followup', 'Phone Call', '#1890ff', 'M3kofTRJDv4cm25SZetXgro', 'system', NULL, '2025-03-31 09:43:22', '2025-03-31 09:43:22'),
('7dT0XGW8t5soah2ikL3mvEM', 'tawmdBbwDXMrKoMp57lQPEJ', 'tag', 'Sensitive', '#C0392B', 'tawmdBbwDXMrKoMp57lQPEJ', 'system', NULL, '2025-03-31 09:35:06', '2025-03-31 09:35:06'),
('7IscckGxkMWWK0mVYTXb7bf', 'e5ESgU0K4XFQMWlwlcdl89T', 'status', 'In Progress', '#3498DB', 'e5ESgU0K4XFQMWlwlcdl89T', 'system', NULL, '2025-03-31 09:36:52', '2025-03-31 09:36:52'),
('7lEDlzf4CTS2LBJdE62VCD8', 'e5ESgU0K4XFQMWlwlcdl89T', 'tag', 'Regular', '#27AE60', 'e5ESgU0K4XFQMWlwlcdl89T', 'system', NULL, '2025-03-31 09:36:52', '2025-03-31 09:36:52'),
('7lxoqKKbPA8j1wtirq5RknE', 'e5ESgU0K4XFQMWlwlcdl89T', 'status', 'On Hold', '#34495E', 'e5ESgU0K4XFQMWlwlcdl89T', 'system', NULL, '2025-03-31 09:36:52', '2025-03-31 09:36:52'),
('7Mqh6nLtbN8lBlqUMJv0TLH', 'lsA3bWwiHYURgcxV1p9JKYL', 'tag', 'Important', '#8E44AD', 'lsA3bWwiHYURgcxV1p9JKYL', 'system', NULL, '2025-03-31 09:39:39', '2025-03-31 09:39:39'),
('7P0WQPSkrrp11aIXz61U0ne', 'Bot3GuoPgOHloKvTPRtcz2A', 'source', 'Direct', '#8E44AD', 'Bot3GuoPgOHloKvTPRtcz2A', 'system', NULL, '2025-03-31 09:33:59', '2025-03-31 09:33:59'),
('7qGxqylqusAFTghNCOaPFww', 'Bot3GuoPgOHloKvTPRtcz2A', 'contract_type', 'Project Based', '#27AE60', 'Bot3GuoPgOHloKvTPRtcz2A', 'system', NULL, '2025-03-31 09:33:59', '2025-03-31 09:33:59'),
('7Y9eKOOyLubpwdfEsFTRGcS', 'M3kofTRJDv4cm25SZetXgro', 'category', 'Software Development', '#2C3E50', 'M3kofTRJDv4cm25SZetXgro', 'system', NULL, '2025-03-31 09:43:22', '2025-03-31 09:43:22'),
('7zc2h2fkc99DBlFd0NvGUqz', '7aRxfVTXsxd31PyBz9WzEjx', 'tag', 'Sensitive', '#C0392B', '7aRxfVTXsxd31PyBz9WzEjx', 'system', NULL, '2025-03-31 09:30:53', '2025-03-31 09:30:53'),
('8AmsYpQDyM0UajvTKol3MfL', 'Wek9GHYyp9ebFwzjFZHtuvA', 'status', 'Cancelled', '#E74C3C', 'Wek9GHYyp9ebFwzjFZHtuvA', 'system', NULL, '2025-03-31 09:27:31', '2025-03-31 09:27:31'),
('8Ilb5fc8UXLZn8PDylPyZXk', '7aRxfVTXsxd31PyBz9WzEjx', 'status', 'Cancelled', '#E74C3C', '7aRxfVTXsxd31PyBz9WzEjx', 'system', NULL, '2025-03-31 09:30:53', '2025-03-31 09:30:53'),
('8mPl5lEXmi4dnjh4GK1dZWp', '7aRxfVTXsxd31PyBz9WzEjx', 'tag', 'VIP', '#2980B9', '7aRxfVTXsxd31PyBz9WzEjx', 'system', NULL, '2025-03-31 09:30:53', '2025-03-31 09:30:53'),
('8OBS7VFU9B68cgnGqhZvZu4', 'tawmdBbwDXMrKoMp57lQPEJ', 'source', 'Other', '#34495E', 'tawmdBbwDXMrKoMp57lQPEJ', 'system', NULL, '2025-03-31 09:35:06', '2025-03-31 09:35:06'),
('8S3kQAaYHKPY4bzeP7Rh5EC', 'M3kofTRJDv4cm25SZetXgro', 'tag', 'Important', '#8E44AD', 'M3kofTRJDv4cm25SZetXgro', 'system', NULL, '2025-03-31 09:43:22', '2025-03-31 09:43:22'),
('8TYBzdxpDdC73lhXPcr8Kev', 'tawmdBbwDXMrKoMp57lQPEJ', 'category', 'Manufacturing', '#9B59B6', 'tawmdBbwDXMrKoMp57lQPEJ', 'system', NULL, '2025-03-31 09:35:06', '2025-03-31 09:35:06'),
('8ucHJQH90S1unSBlCcZQEL6', '4kykUHcg5oLrhNDkfCLNYYG', 'source', 'Direct', '#8E44AD', '4kykUHcg5oLrhNDkfCLNYYG', 'system', NULL, '2025-03-31 09:41:22', '2025-03-31 09:41:22'),
('8z4vFGkRpXxpK1qQ7v40sFs', 'tawmdBbwDXMrKoMp57lQPEJ', 'tag', 'Low Priority', '#F39C12', 'tawmdBbwDXMrKoMp57lQPEJ', 'system', NULL, '2025-03-31 09:35:06', '2025-03-31 09:35:06'),
('99fHZ4H1Urslbi6jLX1uD1J', 'Wek9GHYyp9ebFwzjFZHtuvA', 'source', 'Partner', '#27AE60', 'Wek9GHYyp9ebFwzjFZHtuvA', 'system', NULL, '2025-03-31 09:27:31', '2025-03-31 09:27:31'),
('9DE1KTrui5kmb4SdphWzgDv', '4kykUHcg5oLrhNDkfCLNYYG', 'status', 'Cancelled', '#E74C3C', '4kykUHcg5oLrhNDkfCLNYYG', 'system', NULL, '2025-03-31 09:41:22', '2025-03-31 09:41:22'),
('9GMONzKEWIleBp3aQDvWVwd', 'Bot3GuoPgOHloKvTPRtcz2A', 'status', 'Cancelled', '#E74C3C', 'Bot3GuoPgOHloKvTPRtcz2A', 'system', NULL, '2025-03-31 09:33:59', '2025-03-31 09:33:59'),
('9qFjMSSkPDlC4KswsvwFd9L', 'Wek9GHYyp9ebFwzjFZHtuvA', 'contract_type', 'Time & Material', '#16A085', 'Wek9GHYyp9ebFwzjFZHtuvA', 'system', NULL, '2025-03-31 09:27:31', '2025-03-31 09:27:31'),
('9ryOn18INLjsvv1Ly3o80Of', 'tawmdBbwDXMrKoMp57lQPEJ', 'followup', 'Client Meeting', '#52c41a', 'tawmdBbwDXMrKoMp57lQPEJ', 'system', NULL, '2025-03-31 09:35:06', '2025-03-31 09:35:06'),
('9sy8yfZsiBhRD972vnMBwW4', 'EYxL2jumtV4h2riCxEXLcGp', 'tag', 'Important', '#8E44AD', 'EYxL2jumtV4h2riCxEXLcGp', 'system', NULL, '2025-03-31 09:32:32', '2025-03-31 09:32:32'),
('9uREMpa6TeCE5luEzpdsF2l', '7aRxfVTXsxd31PyBz9WzEjx', 'contract_type', 'Fixed Price', '#2980B9', '7aRxfVTXsxd31PyBz9WzEjx', 'system', NULL, '2025-03-31 09:30:53', '2025-03-31 09:30:53'),
('9WDyVqWmjJRBwhpBELtThz5', 'e5ESgU0K4XFQMWlwlcdl89T', 'source', 'Website', '#16A085', 'e5ESgU0K4XFQMWlwlcdl89T', 'system', NULL, '2025-03-31 09:36:52', '2025-03-31 09:36:52'),
('9xgHp2k5RQyGOSZY3aJrJ2w', 'M3kofTRJDv4cm25SZetXgro', 'tag', 'Low Priority', '#F39C12', 'M3kofTRJDv4cm25SZetXgro', 'system', NULL, '2025-03-31 09:43:22', '2025-03-31 09:43:22'),
('A2Q1r2MQwEHvCvJpJqN014H', 'Wek9GHYyp9ebFwzjFZHtuvA', 'source', 'Email', '#2C3E50', 'Wek9GHYyp9ebFwzjFZHtuvA', 'system', NULL, '2025-03-31 09:27:31', '2025-03-31 09:27:31'),
('A3PtCFNojiREE2zXggMginZ', '4kykUHcg5oLrhNDkfCLNYYG', 'tag', 'Sensitive', '#C0392B', '4kykUHcg5oLrhNDkfCLNYYG', 'system', NULL, '2025-03-31 09:41:22', '2025-03-31 09:41:22'),
('A4YjuxbKJWCAcyqMLcO80yg', '4kykUHcg5oLrhNDkfCLNYYG', 'source', 'Email', '#2C3E50', '4kykUHcg5oLrhNDkfCLNYYG', 'system', NULL, '2025-03-31 09:41:22', '2025-03-31 09:41:22'),
('A7VSOwARtcsOut6AGQWs0fg', 'M3kofTRJDv4cm25SZetXgro', 'followup', 'Client Meeting', '#52c41a', 'M3kofTRJDv4cm25SZetXgro', 'system', NULL, '2025-03-31 09:43:22', '2025-03-31 09:43:22'),
('AbFQGGLt6mMnRxlSJ9Cg2wr', 'EYxL2jumtV4h2riCxEXLcGp', 'tag', 'High Priority', '#C0392B', 'EYxL2jumtV4h2riCxEXLcGp', 'system', NULL, '2025-03-31 09:32:32', '2025-03-31 09:32:32'),
('acjcjiKAUIJi2DMSdhLxbsA', 'Wek9GHYyp9ebFwzjFZHtuvA', 'status', 'Approved', '#27AE60', 'Wek9GHYyp9ebFwzjFZHtuvA', 'system', NULL, '2025-03-31 09:27:31', '2025-03-31 09:27:31'),
('AF5oPwzBL96ODdaB0TeEr6s', 'M3kofTRJDv4cm25SZetXgro', 'status', 'Pending', '#9B59B6', 'M3kofTRJDv4cm25SZetXgro', 'system', NULL, '2025-03-31 09:43:22', '2025-03-31 09:43:22'),
('aGfbXe7L3GzRmMocXIc1OgN', 'lsA3bWwiHYURgcxV1p9JKYL', 'status', 'Review', '#7F8C8D', 'lsA3bWwiHYURgcxV1p9JKYL', 'system', NULL, '2025-03-31 09:39:39', '2025-03-31 09:39:39'),
('AmljQgNz9Qgutc14GgZHGpT', 'EYxL2jumtV4h2riCxEXLcGp', 'status', 'Review', '#7F8C8D', 'EYxL2jumtV4h2riCxEXLcGp', 'system', NULL, '2025-03-31 09:32:32', '2025-03-31 09:32:32'),
('ANFH0ueYVLUq2Y4NH70Wh6E', '7aRxfVTXsxd31PyBz9WzEjx', 'category', 'Manufacturing', '#9B59B6', '7aRxfVTXsxd31PyBz9WzEjx', 'system', NULL, '2025-03-31 09:30:53', '2025-03-31 09:30:53'),
('aNsQRxJBmdxJdCkj85eLspG', 'lsA3bWwiHYURgcxV1p9JKYL', 'category', 'Software Development', '#2C3E50', 'lsA3bWwiHYURgcxV1p9JKYL', 'system', NULL, '2025-03-31 09:39:39', '2025-03-31 09:39:39'),
('AOwPIrzePpLbryczjzm5zvS', 'EYxL2jumtV4h2riCxEXLcGp', 'category', 'Marketing', '#27AE60', 'EYxL2jumtV4h2riCxEXLcGp', 'system', NULL, '2025-03-31 09:32:32', '2025-03-31 09:32:32'),
('asgL5UobC6WiDFYFzEdXDSR', 'e5ESgU0K4XFQMWlwlcdl89T', 'source', 'Referral', '#2980B9', 'e5ESgU0K4XFQMWlwlcdl89T', 'system', NULL, '2025-03-31 09:36:52', '2025-03-31 09:36:52'),
('AVYggyU2VYo6HBJUPeIwuyp', 'Wek9GHYyp9ebFwzjFZHtuvA', 'tag', 'Sensitive', '#C0392B', 'Wek9GHYyp9ebFwzjFZHtuvA', 'system', NULL, '2025-03-31 09:27:31', '2025-03-31 09:27:31'),
('AwzJHc4J92L54pVNwjK8LQe', '7aRxfVTXsxd31PyBz9WzEjx', 'contract_type', 'Time & Material', '#16A085', '7aRxfVTXsxd31PyBz9WzEjx', 'system', NULL, '2025-03-31 09:30:53', '2025-03-31 09:30:53'),
('AXIAvWyabu7nP2YFb0dxRaA', 'Wek9GHYyp9ebFwzjFZHtuvA', 'category', 'Manufacturing', '#9B59B6', 'Wek9GHYyp9ebFwzjFZHtuvA', 'system', NULL, '2025-03-31 09:27:31', '2025-03-31 09:27:31'),
('axsa3rLIeBF8FZrenrcloy1', 'M3kofTRJDv4cm25SZetXgro', 'followup', 'Video Call', '#7c3aed', 'M3kofTRJDv4cm25SZetXgro', 'system', NULL, '2025-03-31 09:43:22', '2025-03-31 09:43:22'),
('AYOOMdv29L6LLME7gGLbEO1', 'Bot3GuoPgOHloKvTPRtcz2A', 'tag', 'Medium Priority', '#D35400', 'Bot3GuoPgOHloKvTPRtcz2A', 'system', NULL, '2025-03-31 09:33:59', '2025-03-31 09:33:59'),
('aZkBTS5XwimwmZlU4xsFHCQ', 'tawmdBbwDXMrKoMp57lQPEJ', 'status', 'Review', '#7F8C8D', 'tawmdBbwDXMrKoMp57lQPEJ', 'system', NULL, '2025-03-31 09:35:06', '2025-03-31 09:35:06'),
('b4At7h42VI5wGlgj5d3N8Bd', 'AsPoso1y1OL5uY5URy57ZPw', 'contract_type', 'Fixed Price', '#2980B9', 'AsPoso1y1OL5uY5URy57ZPw', 'system', NULL, '2025-03-31 09:29:46', '2025-03-31 09:29:46'),
('b4BfKs0DcFQQSyOKrOt2d3v', 'tawmdBbwDXMrKoMp57lQPEJ', 'status', 'New', '#1ABC9C', 'tawmdBbwDXMrKoMp57lQPEJ', 'system', NULL, '2025-03-31 09:35:06', '2025-03-31 09:35:06'),
('B5EvRJ2Grh96Vl8Ob3GQkSz', 'lsA3bWwiHYURgcxV1p9JKYL', 'category', 'Real Estate', '#3498DB', 'lsA3bWwiHYURgcxV1p9JKYL', 'system', NULL, '2025-03-31 09:39:39', '2025-03-31 09:39:39'),
('B7fQGe6SpNMHddcXaoGq3uQ', '7aRxfVTXsxd31PyBz9WzEjx', 'source', 'Partner', '#27AE60', '7aRxfVTXsxd31PyBz9WzEjx', 'system', NULL, '2025-03-31 09:30:53', '2025-03-31 09:30:53'),
('b7UZeiMBo8MnmW8AnaMEGvE', '7aRxfVTXsxd31PyBz9WzEjx', 'status', 'New', '#1ABC9C', '7aRxfVTXsxd31PyBz9WzEjx', 'system', NULL, '2025-03-31 09:30:53', '2025-03-31 09:30:53'),
('B8ryJ67IsnHUosyiihnhg06', 'EYxL2jumtV4h2riCxEXLcGp', 'followup', 'Email', '#EA4335', 'EYxL2jumtV4h2riCxEXLcGp', 'system', NULL, '2025-03-31 09:32:32', '2025-03-31 09:32:32'),
('Bb8KLSXkh3eR2V3wwNRhB3Y', 'EYxL2jumtV4h2riCxEXLcGp', 'category', 'Financial Services', '#2ECC71', 'EYxL2jumtV4h2riCxEXLcGp', 'system', NULL, '2025-03-31 09:32:32', '2025-03-31 09:32:32'),
('bbr66b56lYqTkbMebTwWT9s', 'AsPoso1y1OL5uY5URy57ZPw', 'tag', 'Regular', '#27AE60', 'AsPoso1y1OL5uY5URy57ZPw', 'system', NULL, '2025-03-31 09:29:46', '2025-03-31 09:29:46'),
('BcOFPpPbZgwMnF4Ck1F3j2t', '4kykUHcg5oLrhNDkfCLNYYG', 'category', 'Design', '#16A085', '4kykUHcg5oLrhNDkfCLNYYG', 'system', NULL, '2025-03-31 09:41:22', '2025-03-31 09:41:22'),
('bDs7GVmoHbv7X3wj0FoNIVN', 'Bot3GuoPgOHloKvTPRtcz2A', 'category', 'Healthcare', '#1ABC9C', 'Bot3GuoPgOHloKvTPRtcz2A', 'system', NULL, '2025-03-31 09:33:59', '2025-03-31 09:33:59'),
('BFvCGNq0T3uPSJaMkH5JZjH', 'lsA3bWwiHYURgcxV1p9JKYL', 'category', 'Manufacturing', '#9B59B6', 'lsA3bWwiHYURgcxV1p9JKYL', 'system', NULL, '2025-03-31 09:39:39', '2025-03-31 09:39:39'),
('Bg6agZ5Fh9inX0C6Pb7BTDh', 'tawmdBbwDXMrKoMp57lQPEJ', 'contract_type', 'Fixed Price', '#2980B9', 'tawmdBbwDXMrKoMp57lQPEJ', 'system', NULL, '2025-03-31 09:35:06', '2025-03-31 09:35:06'),
('bG6wcFEYVLJZqjwH05hemW2', 'lsA3bWwiHYURgcxV1p9JKYL', 'tag', 'Regular', '#27AE60', 'lsA3bWwiHYURgcxV1p9JKYL', 'system', NULL, '2025-03-31 09:39:39', '2025-03-31 09:39:39'),
('bhLarhYCAdgj8ckmdUJsupC', 'Bot3GuoPgOHloKvTPRtcz2A', 'category', 'Financial Services', '#2ECC71', 'Bot3GuoPgOHloKvTPRtcz2A', 'system', NULL, '2025-03-31 09:33:59', '2025-03-31 09:33:59'),
('Bjy8RPRGOvtL3hGNYLM24Y5', 'tawmdBbwDXMrKoMp57lQPEJ', 'contract_type', 'Project Based', '#27AE60', 'tawmdBbwDXMrKoMp57lQPEJ', 'system', NULL, '2025-03-31 09:35:06', '2025-03-31 09:35:06'),
('bkEHyiBS6xSq3dLY8oBFVo3', '7aRxfVTXsxd31PyBz9WzEjx', 'category', 'Marketing', '#27AE60', '7aRxfVTXsxd31PyBz9WzEjx', 'system', NULL, '2025-03-31 09:30:53', '2025-03-31 09:30:53'),
('BluV21VC24JR8iNDBpD5Lyp', 'Wek9GHYyp9ebFwzjFZHtuvA', 'source', 'Event', '#16A085', 'Wek9GHYyp9ebFwzjFZHtuvA', 'system', NULL, '2025-03-31 09:27:31', '2025-03-31 09:27:31'),
('BLxrhrW31q94qsXVwcXrdsE', 'EYxL2jumtV4h2riCxEXLcGp', 'followup', 'Video Call', '#7c3aed', 'EYxL2jumtV4h2riCxEXLcGp', 'system', NULL, '2025-03-31 09:32:32', '2025-03-31 09:32:32'),
('btXKpCWq6CWPW4aKc6OslPV', 'lsA3bWwiHYURgcxV1p9JKYL', 'source', 'Other', '#34495E', 'lsA3bWwiHYURgcxV1p9JKYL', 'system', NULL, '2025-03-31 09:39:39', '2025-03-31 09:39:39'),
('C0OPFa6s9ceW7mYO1CWP98V', 'EYxL2jumtV4h2riCxEXLcGp', 'category', 'E-commerce', '#8E44AD', 'EYxL2jumtV4h2riCxEXLcGp', 'system', NULL, '2025-03-31 09:32:32', '2025-03-31 09:32:32'),
('C3IPPureX7sL5522APe8maE', '7aRxfVTXsxd31PyBz9WzEjx', 'source', 'Direct', '#8E44AD', '7aRxfVTXsxd31PyBz9WzEjx', 'system', NULL, '2025-03-31 09:30:53', '2025-03-31 09:30:53'),
('C99d4nptFzeUp63qOmpcBw2', 'lsA3bWwiHYURgcxV1p9JKYL', 'category', 'E-commerce', '#8E44AD', 'lsA3bWwiHYURgcxV1p9JKYL', 'system', NULL, '2025-03-31 09:39:39', '2025-03-31 09:39:39'),
('CabklYGugCWOaNBDmKKzOrt', 'Wek9GHYyp9ebFwzjFZHtuvA', 'followup', 'Client Meeting', '#52c41a', 'Wek9GHYyp9ebFwzjFZHtuvA', 'system', NULL, '2025-03-31 09:27:31', '2025-03-31 09:27:31'),
('cbk5oPrIZ1eWGv4S7fIPoEM', 'tawmdBbwDXMrKoMp57lQPEJ', 'category', 'Consulting', '#34495E', 'tawmdBbwDXMrKoMp57lQPEJ', 'system', NULL, '2025-03-31 09:35:06', '2025-03-31 09:35:06'),
('CdndAeMvkkTMmKizt2OaQEc', 'lsA3bWwiHYURgcxV1p9JKYL', 'source', 'Partner', '#27AE60', 'lsA3bWwiHYURgcxV1p9JKYL', 'system', NULL, '2025-03-31 09:39:39', '2025-03-31 09:39:39'),
('CePXn2IXKeQv2TMNkO4Z11Q', 'M3kofTRJDv4cm25SZetXgro', 'tag', 'VIP', '#2980B9', 'M3kofTRJDv4cm25SZetXgro', 'system', NULL, '2025-03-31 09:43:22', '2025-03-31 09:43:22'),
('cFHFdQzswg3nNIV14JHE3sX', 'M3kofTRJDv4cm25SZetXgro', 'tag', 'High Priority', '#C0392B', 'M3kofTRJDv4cm25SZetXgro', 'system', NULL, '2025-03-31 09:43:22', '2025-03-31 09:43:22'),
('CICu67LABvIODH5rtKszxQL', 'Bot3GuoPgOHloKvTPRtcz2A', 'contract_type', 'Fixed Price', '#2980B9', 'Bot3GuoPgOHloKvTPRtcz2A', 'system', NULL, '2025-03-31 09:33:59', '2025-03-31 09:33:59'),
('CiERvCI11D16ToGiXMrRWuT', 'Bot3GuoPgOHloKvTPRtcz2A', 'tag', 'Regular', '#27AE60', 'Bot3GuoPgOHloKvTPRtcz2A', 'system', NULL, '2025-03-31 09:33:59', '2025-03-31 09:33:59'),
('Cis5XNzAZB78E69JLlDwwrm', 'Bot3GuoPgOHloKvTPRtcz2A', 'followup', 'Video Call', '#7c3aed', 'Bot3GuoPgOHloKvTPRtcz2A', 'system', NULL, '2025-03-31 09:33:59', '2025-03-31 09:33:59'),
('ck3ABNcnSpkdXUJkooQJYar', 'Wek9GHYyp9ebFwzjFZHtuvA', 'category', 'Financial Services', '#2ECC71', 'Wek9GHYyp9ebFwzjFZHtuvA', 'system', NULL, '2025-03-31 09:27:31', '2025-03-31 09:27:31'),
('CLRr3b8qdihmZgEG1uZRC5a', 'tawmdBbwDXMrKoMp57lQPEJ', 'category', 'Design', '#16A085', 'tawmdBbwDXMrKoMp57lQPEJ', 'system', NULL, '2025-03-31 09:35:06', '2025-03-31 09:35:06'),
('CNoBLL2DjxVS4Sb7buZndIe', 'lsA3bWwiHYURgcxV1p9JKYL', 'status', 'Cancelled', '#E74C3C', 'lsA3bWwiHYURgcxV1p9JKYL', 'system', NULL, '2025-03-31 09:39:39', '2025-03-31 09:39:39'),
('CrBw10SenmH0NEowElhJYEg', 'e5ESgU0K4XFQMWlwlcdl89T', 'status', 'Pending', '#9B59B6', 'e5ESgU0K4XFQMWlwlcdl89T', 'system', NULL, '2025-03-31 09:36:52', '2025-03-31 09:36:52'),
('CUi8hQIzrXr15HKqTiwT2x9', 'e5ESgU0K4XFQMWlwlcdl89T', 'tag', 'Sensitive', '#C0392B', 'e5ESgU0K4XFQMWlwlcdl89T', 'system', NULL, '2025-03-31 09:36:52', '2025-03-31 09:36:52'),
('CuXWTmOAjEtAVqSX1Fi6XS5', '4kykUHcg5oLrhNDkfCLNYYG', 'tag', 'Regular', '#27AE60', '4kykUHcg5oLrhNDkfCLNYYG', 'system', NULL, '2025-03-31 09:41:22', '2025-03-31 09:41:22'),
('CuYclHkgFkQR8FVuJzNBa7u', 'M3kofTRJDv4cm25SZetXgro', 'contract_type', 'Fixed Price', '#2980B9', 'M3kofTRJDv4cm25SZetXgro', 'system', NULL, '2025-03-31 09:43:22', '2025-03-31 09:43:22'),
('CvXGMwi2fy87whvajWJIYUn', 'lsA3bWwiHYURgcxV1p9JKYL', 'status', 'Delayed', '#95A5A6', 'lsA3bWwiHYURgcxV1p9JKYL', 'system', NULL, '2025-03-31 09:39:39', '2025-03-31 09:39:39'),
('Cw1PXAwxoV2AZEvASuCL77t', 'M3kofTRJDv4cm25SZetXgro', 'source', 'Phone', '#34495E', 'M3kofTRJDv4cm25SZetXgro', 'system', NULL, '2025-03-31 09:43:22', '2025-03-31 09:43:22'),
('d1XEZw6d6XtCHrACGNYtzhG', 'AsPoso1y1OL5uY5URy57ZPw', 'category', 'Healthcare', '#1ABC9C', 'AsPoso1y1OL5uY5URy57ZPw', 'system', NULL, '2025-03-31 09:29:46', '2025-03-31 09:29:46'),
('dELJIREvkJwZkg0kPoWY4Qi', 'lsA3bWwiHYURgcxV1p9JKYL', 'source', 'Email', '#2C3E50', 'lsA3bWwiHYURgcxV1p9JKYL', 'system', NULL, '2025-03-31 09:39:39', '2025-03-31 09:39:39'),
('Df87CLGcVFDfLYaUGERyyRf', 'EYxL2jumtV4h2riCxEXLcGp', 'status', 'Completed', '#2ECC71', 'EYxL2jumtV4h2riCxEXLcGp', 'system', NULL, '2025-03-31 09:32:32', '2025-03-31 09:32:32'),
('dLgfqrB80bopKz2zcEVDW9B', 'Bot3GuoPgOHloKvTPRtcz2A', 'contract_type', 'Milestone Based', '#8E44AD', 'Bot3GuoPgOHloKvTPRtcz2A', 'system', NULL, '2025-03-31 09:33:59', '2025-03-31 09:33:59'),
('DQOpzAEThg6qE4a5dKpNIVN', 'e5ESgU0K4XFQMWlwlcdl89T', 'status', 'Completed', '#2ECC71', 'e5ESgU0K4XFQMWlwlcdl89T', 'system', NULL, '2025-03-31 09:36:52', '2025-03-31 09:36:52'),
('DRzDM6gVzVZsogj8pmn5b6O', 'AsPoso1y1OL5uY5URy57ZPw', 'source', 'Direct', '#8E44AD', 'AsPoso1y1OL5uY5URy57ZPw', 'system', NULL, '2025-03-31 09:29:46', '2025-03-31 09:29:46'),
('dSHbvmgQQaMHufN3Dyi3aoK', 'AsPoso1y1OL5uY5URy57ZPw', 'tag', 'Urgent', '#E74C3C', 'AsPoso1y1OL5uY5URy57ZPw', 'system', NULL, '2025-03-31 09:29:46', '2025-03-31 09:29:46'),
('dyssz4J1mK5AAp2eHCqvfQZ', 'tawmdBbwDXMrKoMp57lQPEJ', 'category', 'E-commerce', '#8E44AD', 'tawmdBbwDXMrKoMp57lQPEJ', 'system', NULL, '2025-03-31 09:35:06', '2025-03-31 09:35:06'),
('DYTLisT6joqYJ6hUkawtdUW', 'tawmdBbwDXMrKoMp57lQPEJ', 'status', 'Delayed', '#95A5A6', 'tawmdBbwDXMrKoMp57lQPEJ', 'system', NULL, '2025-03-31 09:35:06', '2025-03-31 09:35:06'),
('Dz9ib0CeIjhPXCXc6XXf1xt', 'EYxL2jumtV4h2riCxEXLcGp', 'tag', 'Urgent', '#E74C3C', 'EYxL2jumtV4h2riCxEXLcGp', 'system', NULL, '2025-03-31 09:32:32', '2025-03-31 09:32:32'),
('E05zOSR2uYTq04r6g584pLm', 'M3kofTRJDv4cm25SZetXgro', 'source', 'Event', '#16A085', 'M3kofTRJDv4cm25SZetXgro', 'system', NULL, '2025-03-31 09:43:22', '2025-03-31 09:43:22'),
('e7DqT2o5ihiqnVIOG4UqBvi', 'lsA3bWwiHYURgcxV1p9JKYL', 'contract_type', 'Retainer', '#D35400', 'lsA3bWwiHYURgcxV1p9JKYL', 'system', NULL, '2025-03-31 09:39:39', '2025-03-31 09:39:39'),
('e8rbATPybVPqWpazs35UXZQ', 'lsA3bWwiHYURgcxV1p9JKYL', 'source', 'Phone', '#34495E', 'lsA3bWwiHYURgcxV1p9JKYL', 'system', NULL, '2025-03-31 09:39:39', '2025-03-31 09:39:39'),
('EaSi30tm4TRiNlgBNXaGpzD', 'Bot3GuoPgOHloKvTPRtcz2A', 'source', 'Event', '#16A085', 'Bot3GuoPgOHloKvTPRtcz2A', 'system', NULL, '2025-03-31 09:33:59', '2025-03-31 09:33:59'),
('eBFMBKCiwXJCwOkfYXqV07n', 'M3kofTRJDv4cm25SZetXgro', 'source', 'Referral', '#2980B9', 'M3kofTRJDv4cm25SZetXgro', 'system', NULL, '2025-03-31 09:43:22', '2025-03-31 09:43:22'),
('EbUmVtslKfAFhywewwvT5xB', 'Wek9GHYyp9ebFwzjFZHtuvA', 'source', 'Advertisement', '#2C3E50', 'Wek9GHYyp9ebFwzjFZHtuvA', 'system', NULL, '2025-03-31 09:27:31', '2025-03-31 09:27:31'),
('ecefPhHPxuD4sKLPnI4pF9n', 'AsPoso1y1OL5uY5URy57ZPw', 'category', 'Software Development', '#2C3E50', 'AsPoso1y1OL5uY5URy57ZPw', 'system', NULL, '2025-03-31 09:29:46', '2025-03-31 09:29:46'),
('efmhn7h8jViJhU4KYBwysjc', 'EYxL2jumtV4h2riCxEXLcGp', 'contract_type', 'Retainer', '#D35400', 'EYxL2jumtV4h2riCxEXLcGp', 'system', NULL, '2025-03-31 09:32:32', '2025-03-31 09:32:32'),
('EgYLQtNy8xweF5Y1r1eT1tV', 'Wek9GHYyp9ebFwzjFZHtuvA', 'category', 'E-commerce', '#8E44AD', 'Wek9GHYyp9ebFwzjFZHtuvA', 'system', NULL, '2025-03-31 09:27:31', '2025-03-31 09:27:31'),
('EHyQe457dgVPnHXjrQmKbWL', 'Bot3GuoPgOHloKvTPRtcz2A', 'status', 'Pending', '#9B59B6', 'Bot3GuoPgOHloKvTPRtcz2A', 'system', NULL, '2025-03-31 09:33:59', '2025-03-31 09:33:59'),
('EjGCUopxMut6vM2HFCZtcMA', 'AsPoso1y1OL5uY5URy57ZPw', 'status', 'On Hold', '#34495E', 'AsPoso1y1OL5uY5URy57ZPw', 'system', NULL, '2025-03-31 09:29:46', '2025-03-31 09:29:46'),
('EJhZVVxxc7GsMQtDgaXqYOB', '4kykUHcg5oLrhNDkfCLNYYG', 'source', 'Referral', '#2980B9', '4kykUHcg5oLrhNDkfCLNYYG', 'system', NULL, '2025-03-31 09:41:22', '2025-03-31 09:41:22'),
('ELKWLab6CxcLIDNhzr7IPJf', 'lsA3bWwiHYURgcxV1p9JKYL', 'status', 'Completed', '#2ECC71', 'lsA3bWwiHYURgcxV1p9JKYL', 'system', NULL, '2025-03-31 09:39:39', '2025-03-31 09:39:39'),
('eLSRGGeFBthVyvYi9Xi1WgX', 'Wek9GHYyp9ebFwzjFZHtuvA', 'status', 'Pending', '#9B59B6', 'Wek9GHYyp9ebFwzjFZHtuvA', 'system', NULL, '2025-03-31 09:27:31', '2025-03-31 09:27:31'),
('EnOLM9t9nFQeaK4ypYlnxwY', 'Bot3GuoPgOHloKvTPRtcz2A', 'source', 'Partner', '#27AE60', 'Bot3GuoPgOHloKvTPRtcz2A', 'system', NULL, '2025-03-31 09:33:59', '2025-03-31 09:33:59'),
('ErvvIylEfBvoH7vGI7pNwTH', 'Bot3GuoPgOHloKvTPRtcz2A', 'status', 'In Progress', '#3498DB', 'Bot3GuoPgOHloKvTPRtcz2A', 'system', NULL, '2025-03-31 09:33:59', '2025-03-31 09:33:59'),
('ETrwAg1wu2n2zuayZdy2Nyj', '7aRxfVTXsxd31PyBz9WzEjx', 'tag', 'Special', '#8E44AD', '7aRxfVTXsxd31PyBz9WzEjx', 'system', NULL, '2025-03-31 09:30:53', '2025-03-31 09:30:53'),
('euS9PjPK3y5fvaCM4laVLNY', 'AsPoso1y1OL5uY5URy57ZPw', 'category', 'Marketing', '#27AE60', 'AsPoso1y1OL5uY5URy57ZPw', 'system', NULL, '2025-03-31 09:29:46', '2025-03-31 09:29:46'),
('euyiH6ETdH3pPfihfC75EqU', 'tawmdBbwDXMrKoMp57lQPEJ', 'followup', 'Phone Call', '#1890ff', 'tawmdBbwDXMrKoMp57lQPEJ', 'system', NULL, '2025-03-31 09:35:06', '2025-03-31 09:35:06'),
('EWqiWNlP2vpkqK3BvSOZl2L', 'Bot3GuoPgOHloKvTPRtcz2A', 'category', 'E-commerce', '#8E44AD', 'Bot3GuoPgOHloKvTPRtcz2A', 'system', NULL, '2025-03-31 09:33:59', '2025-03-31 09:33:59'),
('eYFEeLCZDpwGQidMuNNnRs5', 'M3kofTRJDv4cm25SZetXgro', 'category', 'Real Estate', '#3498DB', 'M3kofTRJDv4cm25SZetXgro', 'system', NULL, '2025-03-31 09:43:22', '2025-03-31 09:43:22'),
('f10mWnpAR5GsmaGnsrccyQx', 'Wek9GHYyp9ebFwzjFZHtuvA', 'source', 'Referral', '#2980B9', 'Wek9GHYyp9ebFwzjFZHtuvA', 'system', NULL, '2025-03-31 09:27:31', '2025-03-31 09:27:31'),
('f2BvtjP1Hi1F7HEeJDFreBE', 'M3kofTRJDv4cm25SZetXgro', 'source', 'Direct', '#8E44AD', 'M3kofTRJDv4cm25SZetXgro', 'system', NULL, '2025-03-31 09:43:22', '2025-03-31 09:43:22'),
('F4AQ3RKlN9SeH3LXewxm5Jm', 'lsA3bWwiHYURgcxV1p9JKYL', 'tag', 'Sensitive', '#C0392B', 'lsA3bWwiHYURgcxV1p9JKYL', 'system', NULL, '2025-03-31 09:39:39', '2025-03-31 09:39:39'),
('FF5op0AuwZc3cADgh2v6H4F', 'AsPoso1y1OL5uY5URy57ZPw', 'source', 'Other', '#34495E', 'AsPoso1y1OL5uY5URy57ZPw', 'system', NULL, '2025-03-31 09:29:46', '2025-03-31 09:29:46'),
('FHnoagQ3bCh6mjFlQ3iwE79', 'Wek9GHYyp9ebFwzjFZHtuvA', 'category', 'Software Development', '#2C3E50', 'Wek9GHYyp9ebFwzjFZHtuvA', 'system', NULL, '2025-03-31 09:27:31', '2025-03-31 09:27:31'),
('fhVfZWL0wFEil01By62dKFM', 'Wek9GHYyp9ebFwzjFZHtuvA', 'category', 'Marketing', '#27AE60', 'Wek9GHYyp9ebFwzjFZHtuvA', 'system', NULL, '2025-03-31 09:27:31', '2025-03-31 09:27:31'),
('FKHkc8yto2CwMmFmiLZbtUk', 'AsPoso1y1OL5uY5URy57ZPw', 'contract_type', 'Milestone Based', '#8E44AD', 'AsPoso1y1OL5uY5URy57ZPw', 'system', NULL, '2025-03-31 09:29:46', '2025-03-31 09:29:46'),
('FNVdIKMlNy5oZ6KkSq9oZyG', '4kykUHcg5oLrhNDkfCLNYYG', 'category', 'Manufacturing', '#9B59B6', '4kykUHcg5oLrhNDkfCLNYYG', 'system', NULL, '2025-03-31 09:41:22', '2025-03-31 09:41:22'),
('FRrq6ajKuH8drVBeZPJGwCH', 'Bot3GuoPgOHloKvTPRtcz2A', 'contract_type', 'Retainer', '#D35400', 'Bot3GuoPgOHloKvTPRtcz2A', 'system', NULL, '2025-03-31 09:33:59', '2025-03-31 09:33:59'),
('FssFRfGO6uVMJEudkpSvem4', 'AsPoso1y1OL5uY5URy57ZPw', 'tag', 'Follow-up', '#16A085', 'AsPoso1y1OL5uY5URy57ZPw', 'system', NULL, '2025-03-31 09:29:46', '2025-03-31 09:29:46'),
('FTSfxhYLxKRcorPwonsoXm3', 'M3kofTRJDv4cm25SZetXgro', 'source', 'Social Media', '#27AE60', 'M3kofTRJDv4cm25SZetXgro', 'system', NULL, '2025-03-31 09:43:22', '2025-03-31 09:43:22'),
('FtYI2ql51zbzCDzRXKBRVdD', '7aRxfVTXsxd31PyBz9WzEjx', 'category', 'Healthcare', '#1ABC9C', '7aRxfVTXsxd31PyBz9WzEjx', 'system', NULL, '2025-03-31 09:30:53', '2025-03-31 09:30:53'),
('fXHooPBkye4UGQWX4Sbn3zc', 'AsPoso1y1OL5uY5URy57ZPw', 'source', 'Event', '#16A085', 'AsPoso1y1OL5uY5URy57ZPw', 'system', NULL, '2025-03-31 09:29:46', '2025-03-31 09:29:46'),
('FZNkTuSyn2jzMy4gYccfhf3', 'M3kofTRJDv4cm25SZetXgro', 'category', 'Financial Services', '#2ECC71', 'M3kofTRJDv4cm25SZetXgro', 'system', NULL, '2025-03-31 09:43:22', '2025-03-31 09:43:22'),
('G2hFTkfkgZiDFmllPzbximV', 'tawmdBbwDXMrKoMp57lQPEJ', 'status', 'On Hold', '#34495E', 'tawmdBbwDXMrKoMp57lQPEJ', 'system', NULL, '2025-03-31 09:35:06', '2025-03-31 09:35:06'),
('g4S6Andg4k2K7rNr1jQaTng', 'M3kofTRJDv4cm25SZetXgro', 'status', 'In Progress', '#3498DB', 'M3kofTRJDv4cm25SZetXgro', 'system', NULL, '2025-03-31 09:43:22', '2025-03-31 09:43:22'),
('G78Ty7rDwmT7wsYVg0Ov8Zj', 'lsA3bWwiHYURgcxV1p9JKYL', 'tag', 'Special', '#8E44AD', 'lsA3bWwiHYURgcxV1p9JKYL', 'system', NULL, '2025-03-31 09:39:39', '2025-03-31 09:39:39'),
('gBR3F75YT5MctcXD1NBQ2K5', 'M3kofTRJDv4cm25SZetXgro', 'tag', 'Urgent', '#E74C3C', 'M3kofTRJDv4cm25SZetXgro', 'system', NULL, '2025-03-31 09:43:22', '2025-03-31 09:43:22'),
('gdakVcIlcWV40BgYPcYZXyG', 'Bot3GuoPgOHloKvTPRtcz2A', 'followup', 'Client Meeting', '#52c41a', 'Bot3GuoPgOHloKvTPRtcz2A', 'system', NULL, '2025-03-31 09:33:59', '2025-03-31 09:33:59'),
('GdVL9ty41demDFAVhbCTgVQ', 'tawmdBbwDXMrKoMp57lQPEJ', 'category', 'Real Estate', '#3498DB', 'tawmdBbwDXMrKoMp57lQPEJ', 'system', NULL, '2025-03-31 09:35:06', '2025-03-31 09:35:06'),
('GGIVR5jUdH25Dxb2D92CG9U', 'M3kofTRJDv4cm25SZetXgro', 'tag', 'Follow-up', '#16A085', 'M3kofTRJDv4cm25SZetXgro', 'system', NULL, '2025-03-31 09:43:22', '2025-03-31 09:43:22'),
('GIlFspP36KxvxDdoTjFl5OL', 'Bot3GuoPgOHloKvTPRtcz2A', 'tag', 'Urgent', '#E74C3C', 'Bot3GuoPgOHloKvTPRtcz2A', 'system', NULL, '2025-03-31 09:33:59', '2025-03-31 09:33:59'),
('GOnt5ofX3DtX7QY7DzzAdkv', '7aRxfVTXsxd31PyBz9WzEjx', 'status', 'Rejected', '#C0392B', '7aRxfVTXsxd31PyBz9WzEjx', 'system', NULL, '2025-03-31 09:30:53', '2025-03-31 09:30:53'),
('GQZLCkctCG88eC7F0UpsSFk', '7aRxfVTXsxd31PyBz9WzEjx', 'category', 'Real Estate', '#3498DB', '7aRxfVTXsxd31PyBz9WzEjx', 'system', NULL, '2025-03-31 09:30:53', '2025-03-31 09:30:53'),
('GR4Auhj24N2Y01dCjqlfV3W', 'AsPoso1y1OL5uY5URy57ZPw', 'status', 'Pending', '#9B59B6', 'AsPoso1y1OL5uY5URy57ZPw', 'system', NULL, '2025-03-31 09:29:46', '2025-03-31 09:29:46'),
('GSG30mG7m1OJirEDUCiTYgD', 'tawmdBbwDXMrKoMp57lQPEJ', 'tag', 'Medium Priority', '#D35400', 'tawmdBbwDXMrKoMp57lQPEJ', 'system', NULL, '2025-03-31 09:35:06', '2025-03-31 09:35:06'),
('gTxEVqzPTRBDd0oi8vdXGSJ', 'Bot3GuoPgOHloKvTPRtcz2A', 'category', 'Marketing', '#27AE60', 'Bot3GuoPgOHloKvTPRtcz2A', 'system', NULL, '2025-03-31 09:33:59', '2025-03-31 09:33:59'),
('Gu9nUVqt8VHZVujHmLY3zPp', 'e5ESgU0K4XFQMWlwlcdl89T', 'status', 'New', '#1ABC9C', 'e5ESgU0K4XFQMWlwlcdl89T', 'system', NULL, '2025-03-31 09:36:52', '2025-03-31 09:36:52'),
('GxLUTWmaXu8cWxn2e8zmhWZ', 'EYxL2jumtV4h2riCxEXLcGp', 'tag', 'VIP', '#2980B9', 'EYxL2jumtV4h2riCxEXLcGp', 'system', NULL, '2025-03-31 09:32:32', '2025-03-31 09:32:32'),
('h1JQtzcisH9YD0gX6uNoLa8', 'e5ESgU0K4XFQMWlwlcdl89T', 'category', 'Financial Services', '#2ECC71', 'e5ESgU0K4XFQMWlwlcdl89T', 'system', NULL, '2025-03-31 09:36:52', '2025-03-31 09:36:52'),
('H3cYBoz7i81cjBjJcqJ1bRt', 'lsA3bWwiHYURgcxV1p9JKYL', 'source', 'Referral', '#2980B9', 'lsA3bWwiHYURgcxV1p9JKYL', 'system', NULL, '2025-03-31 09:39:39', '2025-03-31 09:39:39'),
('H5495oVRDTWY1tJ12j5Dh44', 'AsPoso1y1OL5uY5URy57ZPw', 'status', 'Delayed', '#95A5A6', 'AsPoso1y1OL5uY5URy57ZPw', 'system', NULL, '2025-03-31 09:29:46', '2025-03-31 09:29:46'),
('h5BMClgl5QWaAcX3qs9rg6l', 'Wek9GHYyp9ebFwzjFZHtuvA', 'category', 'Training', '#2980B9', 'Wek9GHYyp9ebFwzjFZHtuvA', 'system', NULL, '2025-03-31 09:27:31', '2025-03-31 09:27:31'),
('HCjvrJ5wp5sm2VhSEPujNnN', 'Wek9GHYyp9ebFwzjFZHtuvA', 'category', 'Real Estate', '#3498DB', 'Wek9GHYyp9ebFwzjFZHtuvA', 'system', NULL, '2025-03-31 09:27:31', '2025-03-31 09:27:31'),
('HgbFaZb2bW7bqnX6xEFUgli', 'Wek9GHYyp9ebFwzjFZHtuvA', 'contract_type', 'Fixed Price', '#2980B9', 'Wek9GHYyp9ebFwzjFZHtuvA', 'system', NULL, '2025-03-31 09:27:31', '2025-03-31 09:27:31'),
('hH6nqpjzz0HJ9WH1fWCh2HA', 'AsPoso1y1OL5uY5URy57ZPw', 'category', 'Training', '#2980B9', 'AsPoso1y1OL5uY5URy57ZPw', 'system', NULL, '2025-03-31 09:29:46', '2025-03-31 09:29:46'),
('HHnFU2b9Q6xJySH5MkFOXHF', 'Wek9GHYyp9ebFwzjFZHtuvA', 'followup', 'Phone Call', '#1890ff', 'Wek9GHYyp9ebFwzjFZHtuvA', 'system', NULL, '2025-03-31 09:27:31', '2025-03-31 09:27:31'),
('HisfyY1biZXlTHivOZlqC8M', 'e5ESgU0K4XFQMWlwlcdl89T', 'contract_type', 'Time & Material', '#16A085', 'e5ESgU0K4XFQMWlwlcdl89T', 'system', NULL, '2025-03-31 09:36:52', '2025-03-31 09:36:52'),
('hLixCW2H79ekr0BMEo5dF7z', 'EYxL2jumtV4h2riCxEXLcGp', 'tag', 'Special', '#8E44AD', 'EYxL2jumtV4h2riCxEXLcGp', 'system', NULL, '2025-03-31 09:32:32', '2025-03-31 09:32:32'),
('hORsvYXKdaI0ZWPGjBLYZPZ', 'Bot3GuoPgOHloKvTPRtcz2A', 'followup', 'WhatsApp', '#25D366', 'Bot3GuoPgOHloKvTPRtcz2A', 'system', NULL, '2025-03-31 09:33:59', '2025-03-31 09:33:59'),
('HqutoSLeyjZw8jdWNqhzvDE', 'AsPoso1y1OL5uY5URy57ZPw', 'tag', 'High Priority', '#C0392B', 'AsPoso1y1OL5uY5URy57ZPw', 'system', NULL, '2025-03-31 09:29:46', '2025-03-31 09:29:46'),
('hQZ3c9MGGT44981NlUzXJpx', 'e5ESgU0K4XFQMWlwlcdl89T', 'category', 'Software Development', '#2C3E50', 'e5ESgU0K4XFQMWlwlcdl89T', 'system', NULL, '2025-03-31 09:36:52', '2025-03-31 09:36:52'),
('Hr4yNTEAuqAK3MdwbJo4kfm', 'AsPoso1y1OL5uY5URy57ZPw', 'source', 'Email', '#2C3E50', 'AsPoso1y1OL5uY5URy57ZPw', 'system', NULL, '2025-03-31 09:29:46', '2025-03-31 09:29:46'),
('Htf695UosR4iFUhv32jfoTn', '7aRxfVTXsxd31PyBz9WzEjx', 'source', 'Phone', '#34495E', '7aRxfVTXsxd31PyBz9WzEjx', 'system', NULL, '2025-03-31 09:30:53', '2025-03-31 09:30:53'),
('hVFw5GddkCrkmHqfJ6zIAGR', 'AsPoso1y1OL5uY5URy57ZPw', 'category', 'Real Estate', '#3498DB', 'AsPoso1y1OL5uY5URy57ZPw', 'system', NULL, '2025-03-31 09:29:46', '2025-03-31 09:29:46'),
('hYswxCFE9MS0eNWE8u1yA66', '7aRxfVTXsxd31PyBz9WzEjx', 'source', 'Advertisement', '#2C3E50', '7aRxfVTXsxd31PyBz9WzEjx', 'system', NULL, '2025-03-31 09:30:53', '2025-03-31 09:30:53'),
('hzixJFLYPZD315CA7ojLCHI', 'M3kofTRJDv4cm25SZetXgro', 'category', 'E-commerce', '#8E44AD', 'M3kofTRJDv4cm25SZetXgro', 'system', NULL, '2025-03-31 09:43:22', '2025-03-31 09:43:22'),
('i40aHrDsVjPTA7Oe1JgNXWn', 'AsPoso1y1OL5uY5URy57ZPw', 'tag', 'Important', '#8E44AD', 'AsPoso1y1OL5uY5URy57ZPw', 'system', NULL, '2025-03-31 09:29:46', '2025-03-31 09:29:46'),
('I7xiu4A9Te3mMekRQg2TCHY', 'M3kofTRJDv4cm25SZetXgro', 'status', 'Rejected', '#C0392B', 'M3kofTRJDv4cm25SZetXgro', 'system', NULL, '2025-03-31 09:43:22', '2025-03-31 09:43:22'),
('i84pnI1JKA1cgGEWMuhbBKP', '4kykUHcg5oLrhNDkfCLNYYG', 'contract_type', 'Fixed Price', '#2980B9', '4kykUHcg5oLrhNDkfCLNYYG', 'system', NULL, '2025-03-31 09:41:22', '2025-03-31 09:41:22'),
('i9TgRUDlAXKkcgwUy3XUHdx', 'EYxL2jumtV4h2riCxEXLcGp', 'status', 'Cancelled', '#E74C3C', 'EYxL2jumtV4h2riCxEXLcGp', 'system', NULL, '2025-03-31 09:32:32', '2025-03-31 09:32:32'),
('IDBcp8AwQtIGWv3xw6GCjcr', '4kykUHcg5oLrhNDkfCLNYYG', 'followup', 'Client Meeting', '#52c41a', '4kykUHcg5oLrhNDkfCLNYYG', 'system', NULL, '2025-03-31 09:41:22', '2025-03-31 09:41:22'),
('idNDcTzAGiuhfInDOrNml1b', 'EYxL2jumtV4h2riCxEXLcGp', 'source', 'Referral', '#2980B9', 'EYxL2jumtV4h2riCxEXLcGp', 'system', NULL, '2025-03-31 09:32:32', '2025-03-31 09:32:32'),
('ie680ULMqQmqkSJW3e99wBo', 'M3kofTRJDv4cm25SZetXgro', 'category', 'Training', '#2980B9', 'M3kofTRJDv4cm25SZetXgro', 'system', NULL, '2025-03-31 09:43:22', '2025-03-31 09:43:22'),
('IFzPFxyXX51MvQfCmAhFlPg', 'lsA3bWwiHYURgcxV1p9JKYL', 'source', 'Advertisement', '#2C3E50', 'lsA3bWwiHYURgcxV1p9JKYL', 'system', NULL, '2025-03-31 09:39:39', '2025-03-31 09:39:39'),
('inYsdELlzvwtopk6XcUBzJ5', '7aRxfVTXsxd31PyBz9WzEjx', 'status', 'Pending', '#9B59B6', '7aRxfVTXsxd31PyBz9WzEjx', 'system', NULL, '2025-03-31 09:30:53', '2025-03-31 09:30:53'),
('IQTq3OfBYgksyaMwntbrq9L', 'Bot3GuoPgOHloKvTPRtcz2A', 'category', 'Design', '#16A085', 'Bot3GuoPgOHloKvTPRtcz2A', 'system', NULL, '2025-03-31 09:33:59', '2025-03-31 09:33:59'),
('irKmj2OXLWC2hHONjBF4jpL', 'lsA3bWwiHYURgcxV1p9JKYL', 'followup', 'WhatsApp', '#25D366', 'lsA3bWwiHYURgcxV1p9JKYL', 'system', NULL, '2025-03-31 09:39:39', '2025-03-31 09:39:39'),
('IrxFuZBQoWOicigw8uJYRT3', 'tawmdBbwDXMrKoMp57lQPEJ', 'followup', 'Email', '#EA4335', 'tawmdBbwDXMrKoMp57lQPEJ', 'system', NULL, '2025-03-31 09:35:06', '2025-03-31 09:35:06'),
('isyiNpdFN5k5pxqjKsbY4MI', 'e5ESgU0K4XFQMWlwlcdl89T', 'source', 'Advertisement', '#2C3E50', 'e5ESgU0K4XFQMWlwlcdl89T', 'system', NULL, '2025-03-31 09:36:52', '2025-03-31 09:36:52'),
('ITkye3TNuhzt50SeSiFE4yC', 'tawmdBbwDXMrKoMp57lQPEJ', 'contract_type', 'Retainer', '#D35400', 'tawmdBbwDXMrKoMp57lQPEJ', 'system', NULL, '2025-03-31 09:35:06', '2025-03-31 09:35:06'),
('iw4diyGxDzXEceRn3rHzRKi', 'lsA3bWwiHYURgcxV1p9JKYL', 'contract_type', 'Time & Material', '#16A085', 'lsA3bWwiHYURgcxV1p9JKYL', 'system', NULL, '2025-03-31 09:39:39', '2025-03-31 09:39:39'),
('j7gekyOm4F3ujTz1TnXafzJ', 'EYxL2jumtV4h2riCxEXLcGp', 'status', 'New', '#1ABC9C', 'EYxL2jumtV4h2riCxEXLcGp', 'system', NULL, '2025-03-31 09:32:32', '2025-03-31 09:32:32'),
('Jag2yq3hW0nNUmhsutXKhuO', 'Wek9GHYyp9ebFwzjFZHtuvA', 'followup', 'WhatsApp', '#25D366', 'Wek9GHYyp9ebFwzjFZHtuvA', 'system', NULL, '2025-03-31 09:27:31', '2025-03-31 09:27:31'),
('JBLO0dN20Pv2rNLLoS1h0iV', 'M3kofTRJDv4cm25SZetXgro', 'contract_type', 'Project Based', '#27AE60', 'M3kofTRJDv4cm25SZetXgro', 'system', NULL, '2025-03-31 09:43:22', '2025-03-31 09:43:22'),
('jFe963bvopyPq5Be7kmP5t5', 'Bot3GuoPgOHloKvTPRtcz2A', 'tag', 'Important', '#8E44AD', 'Bot3GuoPgOHloKvTPRtcz2A', 'system', NULL, '2025-03-31 09:33:59', '2025-03-31 09:33:59'),
('jGxDJDPdYd6rX1aEwg37m38', 'e5ESgU0K4XFQMWlwlcdl89T', 'source', 'Other', '#34495E', 'e5ESgU0K4XFQMWlwlcdl89T', 'system', NULL, '2025-03-31 09:36:52', '2025-03-31 09:36:52'),
('Jk92XCtH2Rj6skrBOceoVsA', 'Bot3GuoPgOHloKvTPRtcz2A', 'contract_type', 'Time & Material', '#16A085', 'Bot3GuoPgOHloKvTPRtcz2A', 'system', NULL, '2025-03-31 09:33:59', '2025-03-31 09:33:59'),
('jkIx2FLhPfpHSJX7j9ruZ5N', 'EYxL2jumtV4h2riCxEXLcGp', 'followup', 'WhatsApp', '#25D366', 'EYxL2jumtV4h2riCxEXLcGp', 'system', NULL, '2025-03-31 09:32:32', '2025-03-31 09:32:32'),
('JLrUMGDdKrCdfVHJhHcw72P', 'AsPoso1y1OL5uY5URy57ZPw', 'status', 'Approved', '#27AE60', 'AsPoso1y1OL5uY5URy57ZPw', 'system', NULL, '2025-03-31 09:29:46', '2025-03-31 09:29:46'),
('jM9ExdF3VTU8W0277HWNHlE', 'AsPoso1y1OL5uY5URy57ZPw', 'followup', 'Telegram', '#0088cc', 'AsPoso1y1OL5uY5URy57ZPw', 'system', NULL, '2025-03-31 09:29:46', '2025-03-31 09:29:46'),
('jo7SERmyf3bvmJYVm6GXBnI', '4kykUHcg5oLrhNDkfCLNYYG', 'source', 'Event', '#16A085', '4kykUHcg5oLrhNDkfCLNYYG', 'system', NULL, '2025-03-31 09:41:22', '2025-03-31 09:41:22'),
('JpFufxlg7qxWDwB3kUEY3a0', 'lsA3bWwiHYURgcxV1p9JKYL', 'tag', 'Follow-up', '#16A085', 'lsA3bWwiHYURgcxV1p9JKYL', 'system', NULL, '2025-03-31 09:39:39', '2025-03-31 09:39:39'),
('Jq6VB9g3QDsIfBAWgA2U9b4', '4kykUHcg5oLrhNDkfCLNYYG', 'status', 'Review', '#7F8C8D', '4kykUHcg5oLrhNDkfCLNYYG', 'system', NULL, '2025-03-31 09:41:22', '2025-03-31 09:41:22'),
('jqsZkZ6n6Z1Eu9Pp2x1fJeF', 'Wek9GHYyp9ebFwzjFZHtuvA', 'source', 'Direct', '#8E44AD', 'Wek9GHYyp9ebFwzjFZHtuvA', 'system', NULL, '2025-03-31 09:27:31', '2025-03-31 09:27:31'),
('JTIYhilJ4MB4tXecLLBNFDZ', 'M3kofTRJDv4cm25SZetXgro', 'category', 'Design', '#16A085', 'M3kofTRJDv4cm25SZetXgro', 'system', NULL, '2025-03-31 09:43:22', '2025-03-31 09:43:22'),
('jUzPec2JKg84h2qHiBZMxZZ', 'tawmdBbwDXMrKoMp57lQPEJ', 'contract_type', 'Milestone Based', '#8E44AD', 'tawmdBbwDXMrKoMp57lQPEJ', 'system', NULL, '2025-03-31 09:35:06', '2025-03-31 09:35:06'),
('K1IDG0uZND9ZDTvF4DwWkOp', 'EYxL2jumtV4h2riCxEXLcGp', 'category', 'Manufacturing', '#9B59B6', 'EYxL2jumtV4h2riCxEXLcGp', 'system', NULL, '2025-03-31 09:32:32', '2025-03-31 09:32:32'),
('k9Mf4uvl7z3XwOhBWUjJRZD', '7aRxfVTXsxd31PyBz9WzEjx', 'status', 'Completed', '#2ECC71', '7aRxfVTXsxd31PyBz9WzEjx', 'system', NULL, '2025-03-31 09:30:53', '2025-03-31 09:30:53'),
('kdIrdn3XjVh6g0czqasKPq1', 'e5ESgU0K4XFQMWlwlcdl89T', 'status', 'Rejected', '#C0392B', 'e5ESgU0K4XFQMWlwlcdl89T', 'system', NULL, '2025-03-31 09:36:52', '2025-03-31 09:36:52'),
('Kg4y1cj6ItKMqBNKpQoYk0g', '4kykUHcg5oLrhNDkfCLNYYG', 'status', 'Approved', '#27AE60', '4kykUHcg5oLrhNDkfCLNYYG', 'system', NULL, '2025-03-31 09:41:22', '2025-03-31 09:41:22'),
('kHD4KzzlKedXWQhfZhX65cK', 'Bot3GuoPgOHloKvTPRtcz2A', 'source', 'Email', '#2C3E50', 'Bot3GuoPgOHloKvTPRtcz2A', 'system', NULL, '2025-03-31 09:33:59', '2025-03-31 09:33:59'),
('KhpFeZv0cnKyD5mlhPnr0UY', 'Wek9GHYyp9ebFwzjFZHtuvA', 'source', 'Social Media', '#27AE60', 'Wek9GHYyp9ebFwzjFZHtuvA', 'system', NULL, '2025-03-31 09:27:31', '2025-03-31 09:27:31'),
('kICyr0DNACPmbye2ybhrA5z', '4kykUHcg5oLrhNDkfCLNYYG', 'status', 'Completed', '#2ECC71', '4kykUHcg5oLrhNDkfCLNYYG', 'system', NULL, '2025-03-31 09:41:22', '2025-03-31 09:41:22'),
('kjVCo2fsoSY51WJJURSCmYF', 'AsPoso1y1OL5uY5URy57ZPw', 'category', 'Design', '#16A085', 'AsPoso1y1OL5uY5URy57ZPw', 'system', NULL, '2025-03-31 09:29:46', '2025-03-31 09:29:46'),
('Kkt2yFDenNI6GUjUjAhjcGe', 'Wek9GHYyp9ebFwzjFZHtuvA', 'source', 'Website', '#16A085', 'Wek9GHYyp9ebFwzjFZHtuvA', 'system', NULL, '2025-03-31 09:27:31', '2025-03-31 09:27:31'),
('Koxnx1YhcOOCJznFmwVgMY3', '4kykUHcg5oLrhNDkfCLNYYG', 'category', 'Marketing', '#27AE60', '4kykUHcg5oLrhNDkfCLNYYG', 'system', NULL, '2025-03-31 09:41:22', '2025-03-31 09:41:22'),
('kpFuOpZveowVKKDrEfqzjXS', 'M3kofTRJDv4cm25SZetXgro', 'tag', 'Regular', '#27AE60', 'M3kofTRJDv4cm25SZetXgro', 'system', NULL, '2025-03-31 09:43:22', '2025-03-31 09:43:22'),
('KTeRYBtUJ98LFPk9822jL1o', '4kykUHcg5oLrhNDkfCLNYYG', 'tag', 'High Priority', '#C0392B', '4kykUHcg5oLrhNDkfCLNYYG', 'system', NULL, '2025-03-31 09:41:22', '2025-03-31 09:41:22'),
('Kv639tOBK6TUqz9gr34O5n6', '7aRxfVTXsxd31PyBz9WzEjx', 'status', 'Approved', '#27AE60', '7aRxfVTXsxd31PyBz9WzEjx', 'system', NULL, '2025-03-31 09:30:53', '2025-03-31 09:30:53'),
('KVF8VPuuiCxHdL5Ovn6GQJr', '4kykUHcg5oLrhNDkfCLNYYG', 'status', 'Pending', '#9B59B6', '4kykUHcg5oLrhNDkfCLNYYG', 'system', NULL, '2025-03-31 09:41:22', '2025-03-31 09:41:22'),
('KXs65JO1BEi8Q2KdGKEWNbb', 'M3kofTRJDv4cm25SZetXgro', 'source', 'Email', '#2C3E50', 'M3kofTRJDv4cm25SZetXgro', 'system', NULL, '2025-03-31 09:43:22', '2025-03-31 09:43:22'),
('l4scrKk8u3hv1h03BfpYCwK', 'lsA3bWwiHYURgcxV1p9JKYL', 'tag', 'Low Priority', '#F39C12', 'lsA3bWwiHYURgcxV1p9JKYL', 'system', NULL, '2025-03-31 09:39:39', '2025-03-31 09:39:39'),
('LBMNWu5Q9aDzviFUFwVXMqR', '7aRxfVTXsxd31PyBz9WzEjx', 'category', 'Consulting', '#34495E', '7aRxfVTXsxd31PyBz9WzEjx', 'system', NULL, '2025-03-31 09:30:53', '2025-03-31 09:30:53'),
('LDpFQmCzTx0TsncvzvtxjwI', 'EYxL2jumtV4h2riCxEXLcGp', 'category', 'Consulting', '#34495E', 'EYxL2jumtV4h2riCxEXLcGp', 'system', NULL, '2025-03-31 09:32:32', '2025-03-31 09:32:32'),
('ldsFzbMDdoZdxQeXltG2aQS', 'tawmdBbwDXMrKoMp57lQPEJ', 'category', 'Marketing', '#27AE60', 'tawmdBbwDXMrKoMp57lQPEJ', 'system', NULL, '2025-03-31 09:35:06', '2025-03-31 09:35:06'),
('LRq7ruo6B48w7LzrcXCgUY3', 'EYxL2jumtV4h2riCxEXLcGp', 'contract_type', 'Milestone Based', '#8E44AD', 'EYxL2jumtV4h2riCxEXLcGp', 'system', NULL, '2025-03-31 09:32:32', '2025-03-31 09:32:32'),
('lVdLZre6crXjTioGUnI5opB', 'M3kofTRJDv4cm25SZetXgro', 'category', 'Consulting', '#34495E', 'M3kofTRJDv4cm25SZetXgro', 'system', NULL, '2025-03-31 09:43:22', '2025-03-31 09:43:22'),
('LwF6DNADp7gHK82jZMjMQ3e', 'e5ESgU0K4XFQMWlwlcdl89T', 'followup', 'Telegram', '#0088cc', 'e5ESgU0K4XFQMWlwlcdl89T', 'system', NULL, '2025-03-31 09:36:52', '2025-03-31 09:36:52'),
('LZKxdxC1mYzLjAdYbmbZFNX', 'tawmdBbwDXMrKoMp57lQPEJ', 'tag', 'Follow-up', '#16A085', 'tawmdBbwDXMrKoMp57lQPEJ', 'system', NULL, '2025-03-31 09:35:06', '2025-03-31 09:35:06'),
('m2cEy1T6DrcX3xlAwDdCVWl', '4kykUHcg5oLrhNDkfCLNYYG', 'tag', 'Important', '#8E44AD', '4kykUHcg5oLrhNDkfCLNYYG', 'system', NULL, '2025-03-31 09:41:22', '2025-03-31 09:41:22'),
('M2PZCsvXaZsNBIU2c1WzFe9', 'AsPoso1y1OL5uY5URy57ZPw', 'source', 'Phone', '#34495E', 'AsPoso1y1OL5uY5URy57ZPw', 'system', NULL, '2025-03-31 09:29:46', '2025-03-31 09:29:46'),
('m8gaau9lVoayUnBhmYCFnac', '7aRxfVTXsxd31PyBz9WzEjx', 'status', 'On Hold', '#34495E', '7aRxfVTXsxd31PyBz9WzEjx', 'system', NULL, '2025-03-31 09:30:53', '2025-03-31 09:30:53'),
('m90EhpcB0iMotYGvdC3ad7B', 'tawmdBbwDXMrKoMp57lQPEJ', 'status', 'Approved', '#27AE60', 'tawmdBbwDXMrKoMp57lQPEJ', 'system', NULL, '2025-03-31 09:35:06', '2025-03-31 09:35:06'),
('MbJpxwZTub2Z1iR1Hl1v40a', 'Bot3GuoPgOHloKvTPRtcz2A', 'status', 'Approved', '#27AE60', 'Bot3GuoPgOHloKvTPRtcz2A', 'system', NULL, '2025-03-31 09:33:59', '2025-03-31 09:33:59'),
('MdNyWplMXtXthGgnnjtlxWg', '4kykUHcg5oLrhNDkfCLNYYG', 'contract_type', 'Time & Material', '#16A085', '4kykUHcg5oLrhNDkfCLNYYG', 'system', NULL, '2025-03-31 09:41:22', '2025-03-31 09:41:22'),
('MFa0o0qcdBnRODPVuywnSOq', 'M3kofTRJDv4cm25SZetXgro', 'contract_type', 'Milestone Based', '#8E44AD', 'M3kofTRJDv4cm25SZetXgro', 'system', NULL, '2025-03-31 09:43:22', '2025-03-31 09:43:22'),
('mjJy0gwMs8dl2XPQ0Gv7XpP', 'e5ESgU0K4XFQMWlwlcdl89T', 'source', 'Email', '#2C3E50', 'e5ESgU0K4XFQMWlwlcdl89T', 'system', NULL, '2025-03-31 09:36:52', '2025-03-31 09:36:52'),
('MLMEbyWANSnwpTKMOfjL3t2', 'e5ESgU0K4XFQMWlwlcdl89T', 'status', 'Cancelled', '#E74C3C', 'e5ESgU0K4XFQMWlwlcdl89T', 'system', NULL, '2025-03-31 09:36:52', '2025-03-31 09:36:52'),
('MN0knppFdSNRFI9YlXGLGkC', 'lsA3bWwiHYURgcxV1p9JKYL', 'status', 'On Hold', '#34495E', 'lsA3bWwiHYURgcxV1p9JKYL', 'system', NULL, '2025-03-31 09:39:39', '2025-03-31 09:39:39'),
('MnBGjO1vEurVbvvRS0n0uAO', 'Bot3GuoPgOHloKvTPRtcz2A', 'tag', 'VIP', '#2980B9', 'Bot3GuoPgOHloKvTPRtcz2A', 'system', NULL, '2025-03-31 09:33:59', '2025-03-31 09:33:59'),
('mnBZ62R0SR8OnFNekvy9glN', '4kykUHcg5oLrhNDkfCLNYYG', 'status', 'In Progress', '#3498DB', '4kykUHcg5oLrhNDkfCLNYYG', 'system', NULL, '2025-03-31 09:41:22', '2025-03-31 09:41:22'),
('mqLhGePLm7gzPtUmF9UbbvX', 'EYxL2jumtV4h2riCxEXLcGp', 'category', 'Real Estate', '#3498DB', 'EYxL2jumtV4h2riCxEXLcGp', 'system', NULL, '2025-03-31 09:32:32', '2025-03-31 09:32:32');
INSERT INTO `tags` (`id`, `related_id`, `lableType`, `name`, `color`, `client_id`, `created_by`, `updated_by`, `createdAt`, `updatedAt`) VALUES
('mqWYbnwA47kfqEyZAZErPHg', 'e5ESgU0K4XFQMWlwlcdl89T', 'category', 'Design', '#16A085', 'e5ESgU0K4XFQMWlwlcdl89T', 'system', NULL, '2025-03-31 09:36:52', '2025-03-31 09:36:52'),
('MS9jSyvojVvipuH19mgYi2f', 'lsA3bWwiHYURgcxV1p9JKYL', 'category', 'Training', '#2980B9', 'lsA3bWwiHYURgcxV1p9JKYL', 'system', NULL, '2025-03-31 09:39:39', '2025-03-31 09:39:39'),
('msynhpPHp5SY0poiRc2uOqP', 'Wek9GHYyp9ebFwzjFZHtuvA', 'contract_type', 'Milestone Based', '#8E44AD', 'Wek9GHYyp9ebFwzjFZHtuvA', 'system', NULL, '2025-03-31 09:27:31', '2025-03-31 09:27:31'),
('mtrIJUtBH0o6vXYqsGExLO2', '4kykUHcg5oLrhNDkfCLNYYG', 'contract_type', 'Project Based', '#27AE60', '4kykUHcg5oLrhNDkfCLNYYG', 'system', NULL, '2025-03-31 09:41:22', '2025-03-31 09:41:22'),
('mTtRjWmI2SsM9zcKXGFnEJy', 'Bot3GuoPgOHloKvTPRtcz2A', 'tag', 'High Priority', '#C0392B', 'Bot3GuoPgOHloKvTPRtcz2A', 'system', NULL, '2025-03-31 09:33:59', '2025-03-31 09:33:59'),
('MuoCpe6y6JlNfXjvvSpAuzu', 'Wek9GHYyp9ebFwzjFZHtuvA', 'status', 'On Hold', '#34495E', 'Wek9GHYyp9ebFwzjFZHtuvA', 'system', NULL, '2025-03-31 09:27:31', '2025-03-31 09:27:31'),
('MZtaaEbJT380nuZeCmzNeUf', 'AsPoso1y1OL5uY5URy57ZPw', 'tag', 'Medium Priority', '#D35400', 'AsPoso1y1OL5uY5URy57ZPw', 'system', NULL, '2025-03-31 09:29:46', '2025-03-31 09:29:46'),
('n1vnhZvgrcoKvi3RKPpXeIm', 'lsA3bWwiHYURgcxV1p9JKYL', 'status', 'Approved', '#27AE60', 'lsA3bWwiHYURgcxV1p9JKYL', 'system', NULL, '2025-03-31 09:39:39', '2025-03-31 09:39:39'),
('n2t8tB5F2FZrTi7Qh10pc5f', 'AsPoso1y1OL5uY5URy57ZPw', 'tag', 'Special', '#8E44AD', 'AsPoso1y1OL5uY5URy57ZPw', 'system', NULL, '2025-03-31 09:29:46', '2025-03-31 09:29:46'),
('N4bWHQOr8tNd66GJNyyCNhn', 'tawmdBbwDXMrKoMp57lQPEJ', 'status', 'Cancelled', '#E74C3C', 'tawmdBbwDXMrKoMp57lQPEJ', 'system', NULL, '2025-03-31 09:35:06', '2025-03-31 09:35:06'),
('n5Bm64rSHv1abNrZOpeJjOv', 'EYxL2jumtV4h2riCxEXLcGp', 'tag', 'Sensitive', '#C0392B', 'EYxL2jumtV4h2riCxEXLcGp', 'system', NULL, '2025-03-31 09:32:32', '2025-03-31 09:32:32'),
('N9GixIW6TJ5FE06HCldmFUa', 'M3kofTRJDv4cm25SZetXgro', 'status', 'On Hold', '#34495E', 'M3kofTRJDv4cm25SZetXgro', 'system', NULL, '2025-03-31 09:43:22', '2025-03-31 09:43:22'),
('nBKJHHYJpS8uNyfQ8zLhHPm', '7aRxfVTXsxd31PyBz9WzEjx', 'tag', 'Medium Priority', '#D35400', '7aRxfVTXsxd31PyBz9WzEjx', 'system', NULL, '2025-03-31 09:30:53', '2025-03-31 09:30:53'),
('NCUhvQXva9BGTQeLkYuZYsf', 'tawmdBbwDXMrKoMp57lQPEJ', 'tag', 'Urgent', '#E74C3C', 'tawmdBbwDXMrKoMp57lQPEJ', 'system', NULL, '2025-03-31 09:35:06', '2025-03-31 09:35:06'),
('NisGWyf0iliz1e6JmN3Ucep', 'Wek9GHYyp9ebFwzjFZHtuvA', 'source', 'Other', '#34495E', 'Wek9GHYyp9ebFwzjFZHtuvA', 'system', NULL, '2025-03-31 09:27:31', '2025-03-31 09:27:31'),
('niXl4N6OqONqMV3Ehu3oPHd', '7aRxfVTXsxd31PyBz9WzEjx', 'tag', 'Regular', '#27AE60', '7aRxfVTXsxd31PyBz9WzEjx', 'system', NULL, '2025-03-31 09:30:53', '2025-03-31 09:30:53'),
('NJVVLr36S961D5VIKK2Fhzq', 'e5ESgU0K4XFQMWlwlcdl89T', 'followup', 'Client Meeting', '#52c41a', 'e5ESgU0K4XFQMWlwlcdl89T', 'system', NULL, '2025-03-31 09:36:52', '2025-03-31 09:36:52'),
('NlIhLnyWpLeVkie2zsY1Zgl', '4kykUHcg5oLrhNDkfCLNYYG', 'source', 'Other', '#34495E', '4kykUHcg5oLrhNDkfCLNYYG', 'system', NULL, '2025-03-31 09:41:22', '2025-03-31 09:41:22'),
('NmPtg0m6yL57xAJn9ILR27A', 'M3kofTRJDv4cm25SZetXgro', 'status', 'Completed', '#2ECC71', 'M3kofTRJDv4cm25SZetXgro', 'system', NULL, '2025-03-31 09:43:22', '2025-03-31 09:43:22'),
('nOoh2fYQsoDeFdaU1t2QbsJ', 'AsPoso1y1OL5uY5URy57ZPw', 'source', 'Social Media', '#27AE60', 'AsPoso1y1OL5uY5URy57ZPw', 'system', NULL, '2025-03-31 09:29:46', '2025-03-31 09:29:46'),
('Nqb2gpVWS3p1u6thM2Xpven', '7aRxfVTXsxd31PyBz9WzEjx', 'tag', 'Urgent', '#E74C3C', '7aRxfVTXsxd31PyBz9WzEjx', 'system', NULL, '2025-03-31 09:30:53', '2025-03-31 09:30:53'),
('nqFSJCYb87UlilsBCKkfJGd', 'lsA3bWwiHYURgcxV1p9JKYL', 'followup', 'Email', '#EA4335', 'lsA3bWwiHYURgcxV1p9JKYL', 'system', NULL, '2025-03-31 09:39:39', '2025-03-31 09:39:39'),
('nSSFhpfvEJi30RRcCKBdbND', 'Bot3GuoPgOHloKvTPRtcz2A', 'source', 'Website', '#16A085', 'Bot3GuoPgOHloKvTPRtcz2A', 'system', NULL, '2025-03-31 09:33:59', '2025-03-31 09:33:59'),
('Nt6T28Qy5fsrhetX3PG2nTU', 'e5ESgU0K4XFQMWlwlcdl89T', 'source', 'Event', '#16A085', 'e5ESgU0K4XFQMWlwlcdl89T', 'system', NULL, '2025-03-31 09:36:52', '2025-03-31 09:36:52'),
('nwCRs9XkEsI6bZi14IY1JLK', 'EYxL2jumtV4h2riCxEXLcGp', 'contract_type', 'Fixed Price', '#2980B9', 'EYxL2jumtV4h2riCxEXLcGp', 'system', NULL, '2025-03-31 09:32:32', '2025-03-31 09:32:32'),
('oaOHr7jTqsASZuiBymThkQ2', '7aRxfVTXsxd31PyBz9WzEjx', 'source', 'Email', '#2C3E50', '7aRxfVTXsxd31PyBz9WzEjx', 'system', NULL, '2025-03-31 09:30:53', '2025-03-31 09:30:53'),
('oAYvmdKzvXvW4kK112qYFAP', 'AsPoso1y1OL5uY5URy57ZPw', 'followup', 'Client Meeting', '#52c41a', 'AsPoso1y1OL5uY5URy57ZPw', 'system', NULL, '2025-03-31 09:29:46', '2025-03-31 09:29:46'),
('ObL5t4E8LO8NY7WIm2wuAcP', 'tawmdBbwDXMrKoMp57lQPEJ', 'category', 'Financial Services', '#2ECC71', 'tawmdBbwDXMrKoMp57lQPEJ', 'system', NULL, '2025-03-31 09:35:06', '2025-03-31 09:35:06'),
('oCIPzxuZS74S52CY67EQ0rS', 'AsPoso1y1OL5uY5URy57ZPw', 'category', 'Manufacturing', '#9B59B6', 'AsPoso1y1OL5uY5URy57ZPw', 'system', NULL, '2025-03-31 09:29:46', '2025-03-31 09:29:46'),
('oCzhE8fDyzftRp4TNtJzO9X', 'AsPoso1y1OL5uY5URy57ZPw', 'status', 'New', '#1ABC9C', 'AsPoso1y1OL5uY5URy57ZPw', 'system', NULL, '2025-03-31 09:29:46', '2025-03-31 09:29:46'),
('oEF3L6jv919UFEiRAHgMdKD', 'lsA3bWwiHYURgcxV1p9JKYL', 'contract_type', 'Project Based', '#27AE60', 'lsA3bWwiHYURgcxV1p9JKYL', 'system', NULL, '2025-03-31 09:39:39', '2025-03-31 09:39:39'),
('OisL91H7VsS4OfY7ZBvgPew', 'lsA3bWwiHYURgcxV1p9JKYL', 'tag', 'VIP', '#2980B9', 'lsA3bWwiHYURgcxV1p9JKYL', 'system', NULL, '2025-03-31 09:39:39', '2025-03-31 09:39:39'),
('ol1X2rZVBWcziz1qZVmJbAW', '7aRxfVTXsxd31PyBz9WzEjx', 'category', 'Financial Services', '#2ECC71', '7aRxfVTXsxd31PyBz9WzEjx', 'system', NULL, '2025-03-31 09:30:53', '2025-03-31 09:30:53'),
('oo0iZzxUVnpwnOUMJHwc75i', 'Bot3GuoPgOHloKvTPRtcz2A', 'status', 'On Hold', '#34495E', 'Bot3GuoPgOHloKvTPRtcz2A', 'system', NULL, '2025-03-31 09:33:59', '2025-03-31 09:33:59'),
('OonsgYGYKcOgLvNCoGAPEiI', 'Bot3GuoPgOHloKvTPRtcz2A', 'followup', 'Telegram', '#0088cc', 'Bot3GuoPgOHloKvTPRtcz2A', 'system', NULL, '2025-03-31 09:33:59', '2025-03-31 09:33:59'),
('oPonLheDeD8bBBQnAm0Jwdo', 'AsPoso1y1OL5uY5URy57ZPw', 'status', 'Rejected', '#C0392B', 'AsPoso1y1OL5uY5URy57ZPw', 'system', NULL, '2025-03-31 09:29:46', '2025-03-31 09:29:46'),
('OQeBzTNEGH8MVdxX6xXIPW5', 'e5ESgU0K4XFQMWlwlcdl89T', 'status', 'Delayed', '#95A5A6', 'e5ESgU0K4XFQMWlwlcdl89T', 'system', NULL, '2025-03-31 09:36:52', '2025-03-31 09:36:52'),
('oviGUX8FY9TrhaYrFA6F05l', 'Wek9GHYyp9ebFwzjFZHtuvA', 'tag', 'Medium Priority', '#D35400', 'Wek9GHYyp9ebFwzjFZHtuvA', 'system', NULL, '2025-03-31 09:27:31', '2025-03-31 09:27:31'),
('Oy5qVTJ7LeqONOH72yao8zS', 'tawmdBbwDXMrKoMp57lQPEJ', 'source', 'Advertisement', '#2C3E50', 'tawmdBbwDXMrKoMp57lQPEJ', 'system', NULL, '2025-03-31 09:35:06', '2025-03-31 09:35:06'),
('p0FWD733ckLEjAUI41eIBbG', 'M3kofTRJDv4cm25SZetXgro', 'category', 'Healthcare', '#1ABC9C', 'M3kofTRJDv4cm25SZetXgro', 'system', NULL, '2025-03-31 09:43:22', '2025-03-31 09:43:22'),
('P1QgHNLDuC5B9Jy5khRtrqq', '4kykUHcg5oLrhNDkfCLNYYG', 'followup', 'Video Call', '#7c3aed', '4kykUHcg5oLrhNDkfCLNYYG', 'system', NULL, '2025-03-31 09:41:22', '2025-03-31 09:41:22'),
('p3UU1gKr2RjOelqmruElbxc', 'tawmdBbwDXMrKoMp57lQPEJ', 'source', 'Event', '#16A085', 'tawmdBbwDXMrKoMp57lQPEJ', 'system', NULL, '2025-03-31 09:35:06', '2025-03-31 09:35:06'),
('P4aLxD3aeJNqduJwTORAasj', '4kykUHcg5oLrhNDkfCLNYYG', 'category', 'Software Development', '#2C3E50', '4kykUHcg5oLrhNDkfCLNYYG', 'system', NULL, '2025-03-31 09:41:22', '2025-03-31 09:41:22'),
('P6LDT8TNsmeBOlMSQcSwpzz', 'Bot3GuoPgOHloKvTPRtcz2A', 'tag', 'Follow-up', '#16A085', 'Bot3GuoPgOHloKvTPRtcz2A', 'system', NULL, '2025-03-31 09:33:59', '2025-03-31 09:33:59'),
('paUjgBiCh5FqGuK3KkkDSs9', 'tawmdBbwDXMrKoMp57lQPEJ', 'status', 'Completed', '#2ECC71', 'tawmdBbwDXMrKoMp57lQPEJ', 'system', NULL, '2025-03-31 09:35:06', '2025-03-31 09:35:06'),
('pBAynatXdyLIlgPxEQXAAFT', 'M3kofTRJDv4cm25SZetXgro', 'category', 'Manufacturing', '#9B59B6', 'M3kofTRJDv4cm25SZetXgro', 'system', NULL, '2025-03-31 09:43:22', '2025-03-31 09:43:22'),
('PBpA65NBLbKVmjUgvgwaYO8', 'tawmdBbwDXMrKoMp57lQPEJ', 'source', 'Partner', '#27AE60', 'tawmdBbwDXMrKoMp57lQPEJ', 'system', NULL, '2025-03-31 09:35:06', '2025-03-31 09:35:06'),
('pEyqckWAL6nHFtNpeGVrUbB', '4kykUHcg5oLrhNDkfCLNYYG', 'status', 'Delayed', '#95A5A6', '4kykUHcg5oLrhNDkfCLNYYG', 'system', NULL, '2025-03-31 09:41:22', '2025-03-31 09:41:22'),
('pis2Ixpj4L4OvJiLUFPe9Ni', 'Bot3GuoPgOHloKvTPRtcz2A', 'source', 'Advertisement', '#2C3E50', 'Bot3GuoPgOHloKvTPRtcz2A', 'system', NULL, '2025-03-31 09:33:59', '2025-03-31 09:33:59'),
('PJQzvIb5iFbPCQJeUOdIQcy', 'Wek9GHYyp9ebFwzjFZHtuvA', 'followup', 'Telegram', '#0088cc', 'Wek9GHYyp9ebFwzjFZHtuvA', 'system', NULL, '2025-03-31 09:27:31', '2025-03-31 09:27:31'),
('PKbYPGD1bmuNn6HPSfml4XH', 'M3kofTRJDv4cm25SZetXgro', 'category', 'Marketing', '#27AE60', 'M3kofTRJDv4cm25SZetXgro', 'system', NULL, '2025-03-31 09:43:22', '2025-03-31 09:43:22'),
('PP1wZjcdAVu4fK3jY5MnxTq', 'M3kofTRJDv4cm25SZetXgro', 'status', 'Approved', '#27AE60', 'M3kofTRJDv4cm25SZetXgro', 'system', NULL, '2025-03-31 09:43:22', '2025-03-31 09:43:22'),
('pPkwjgme4g20CUsNZTpVlZN', 'Bot3GuoPgOHloKvTPRtcz2A', 'source', 'Other', '#34495E', 'Bot3GuoPgOHloKvTPRtcz2A', 'system', NULL, '2025-03-31 09:33:59', '2025-03-31 09:33:59'),
('pTpcRCy4bZwQqLLV8MzsEUo', 'AsPoso1y1OL5uY5URy57ZPw', 'source', 'Advertisement', '#2C3E50', 'AsPoso1y1OL5uY5URy57ZPw', 'system', NULL, '2025-03-31 09:29:46', '2025-03-31 09:29:46'),
('pU48A1QfaGgSWoi2orf6ht8', 'AsPoso1y1OL5uY5URy57ZPw', 'category', 'Financial Services', '#2ECC71', 'AsPoso1y1OL5uY5URy57ZPw', 'system', NULL, '2025-03-31 09:29:46', '2025-03-31 09:29:46'),
('pUTCPgDWCtEQenC2EhccYyj', 'Wek9GHYyp9ebFwzjFZHtuvA', 'tag', 'Special', '#8E44AD', 'Wek9GHYyp9ebFwzjFZHtuvA', 'system', NULL, '2025-03-31 09:27:31', '2025-03-31 09:27:31'),
('pVF6fU0e33Rm2L4v8B0z4Ac', 'tawmdBbwDXMrKoMp57lQPEJ', 'tag', 'Regular', '#27AE60', 'tawmdBbwDXMrKoMp57lQPEJ', 'system', NULL, '2025-03-31 09:35:06', '2025-03-31 09:35:06'),
('pxAN5HcQjVb04v5pDkzdgtc', 'e5ESgU0K4XFQMWlwlcdl89T', 'tag', 'Special', '#8E44AD', 'e5ESgU0K4XFQMWlwlcdl89T', 'system', NULL, '2025-03-31 09:36:52', '2025-03-31 09:36:52'),
('pXklkhYIcxzvfrkle7t5Xgk', 'EYxL2jumtV4h2riCxEXLcGp', 'source', 'Social Media', '#27AE60', 'EYxL2jumtV4h2riCxEXLcGp', 'system', NULL, '2025-03-31 09:32:32', '2025-03-31 09:32:32'),
('Pz6SXaZBhiW3d8y7vVXua4c', 'Bot3GuoPgOHloKvTPRtcz2A', 'status', 'Review', '#7F8C8D', 'Bot3GuoPgOHloKvTPRtcz2A', 'system', NULL, '2025-03-31 09:33:59', '2025-03-31 09:33:59'),
('PzV2nAmKjjmJx6MynWxF6U0', 'Wek9GHYyp9ebFwzjFZHtuvA', 'status', 'Review', '#7F8C8D', 'Wek9GHYyp9ebFwzjFZHtuvA', 'system', NULL, '2025-03-31 09:27:31', '2025-03-31 09:27:31'),
('Q2UHaR9LfPhazAEXhR5qahL', 'e5ESgU0K4XFQMWlwlcdl89T', 'category', 'Consulting', '#34495E', 'e5ESgU0K4XFQMWlwlcdl89T', 'system', NULL, '2025-03-31 09:36:52', '2025-03-31 09:36:52'),
('Q7wRSQE9cY8zRtg4gRQ3fb3', '7aRxfVTXsxd31PyBz9WzEjx', 'status', 'Delayed', '#95A5A6', '7aRxfVTXsxd31PyBz9WzEjx', 'system', NULL, '2025-03-31 09:30:53', '2025-03-31 09:30:53'),
('Q9AnNmc28LjvQpODgoYuUsH', 'e5ESgU0K4XFQMWlwlcdl89T', 'followup', 'Phone Call', '#1890ff', 'e5ESgU0K4XFQMWlwlcdl89T', 'system', NULL, '2025-03-31 09:36:52', '2025-03-31 09:36:52'),
('qc3Bq6SV5aqLEvLlGw6uVwC', '4kykUHcg5oLrhNDkfCLNYYG', 'contract_type', 'Retainer', '#D35400', '4kykUHcg5oLrhNDkfCLNYYG', 'system', NULL, '2025-03-31 09:41:22', '2025-03-31 09:41:22'),
('Qja98nHJFnNN52jOaKULVjG', 'M3kofTRJDv4cm25SZetXgro', 'source', 'Partner', '#27AE60', 'M3kofTRJDv4cm25SZetXgro', 'system', NULL, '2025-03-31 09:43:22', '2025-03-31 09:43:22'),
('QkJBSrK8Bm6fQXWC1i4yXHQ', 'Bot3GuoPgOHloKvTPRtcz2A', 'followup', 'Email', '#EA4335', 'Bot3GuoPgOHloKvTPRtcz2A', 'system', NULL, '2025-03-31 09:33:59', '2025-03-31 09:33:59'),
('QlgrZr4vdawBibZAWuNViNv', 'AsPoso1y1OL5uY5URy57ZPw', 'contract_type', 'Time & Material', '#16A085', 'AsPoso1y1OL5uY5URy57ZPw', 'system', NULL, '2025-03-31 09:29:46', '2025-03-31 09:29:46'),
('QMOhNT0cLnY32SceuoOoDA0', 'tawmdBbwDXMrKoMp57lQPEJ', 'source', 'Social Media', '#27AE60', 'tawmdBbwDXMrKoMp57lQPEJ', 'system', NULL, '2025-03-31 09:35:06', '2025-03-31 09:35:06'),
('QnaYnjJwJJz3JLasHieyPoE', 'tawmdBbwDXMrKoMp57lQPEJ', 'followup', 'WhatsApp', '#25D366', 'tawmdBbwDXMrKoMp57lQPEJ', 'system', NULL, '2025-03-31 09:35:06', '2025-03-31 09:35:06'),
('qnlYDK6pNc8h84ICTM4y3NF', '4kykUHcg5oLrhNDkfCLNYYG', 'followup', 'WhatsApp', '#25D366', '4kykUHcg5oLrhNDkfCLNYYG', 'system', NULL, '2025-03-31 09:41:22', '2025-03-31 09:41:22'),
('qOQ5pGqsVlC0fBMuxP2dMFX', '4kykUHcg5oLrhNDkfCLNYYG', 'tag', 'VIP', '#2980B9', '4kykUHcg5oLrhNDkfCLNYYG', 'system', NULL, '2025-03-31 09:41:22', '2025-03-31 09:41:22'),
('QQtlNxiBcKZglfEVPYrguRw', 'EYxL2jumtV4h2riCxEXLcGp', 'source', 'Advertisement', '#2C3E50', 'EYxL2jumtV4h2riCxEXLcGp', 'system', NULL, '2025-03-31 09:32:32', '2025-03-31 09:32:32'),
('qTc2pnLsEH4NhdUAXaD3OoJ', 'lsA3bWwiHYURgcxV1p9JKYL', 'category', 'Design', '#16A085', 'lsA3bWwiHYURgcxV1p9JKYL', 'system', NULL, '2025-03-31 09:39:39', '2025-03-31 09:39:39'),
('QV7UtJJfTt6DKQIilyaaOpE', 'Wek9GHYyp9ebFwzjFZHtuvA', 'tag', 'Important', '#8E44AD', 'Wek9GHYyp9ebFwzjFZHtuvA', 'system', NULL, '2025-03-31 09:27:31', '2025-03-31 09:27:31'),
('QyHu7IibPXcZCpWjNF1zrKp', '7aRxfVTXsxd31PyBz9WzEjx', 'tag', 'Follow-up', '#16A085', '7aRxfVTXsxd31PyBz9WzEjx', 'system', NULL, '2025-03-31 09:30:53', '2025-03-31 09:30:53'),
('qytiq6V1NXCURMSmgtnqkbN', 'lsA3bWwiHYURgcxV1p9JKYL', 'source', 'Direct', '#8E44AD', 'lsA3bWwiHYURgcxV1p9JKYL', 'system', NULL, '2025-03-31 09:39:39', '2025-03-31 09:39:39'),
('R07hXHiSkWItKgzuqbdoWO4', 'tawmdBbwDXMrKoMp57lQPEJ', 'source', 'Phone', '#34495E', 'tawmdBbwDXMrKoMp57lQPEJ', 'system', NULL, '2025-03-31 09:35:06', '2025-03-31 09:35:06'),
('R1m8zZJVnWJFxRzMOIvns6O', '7aRxfVTXsxd31PyBz9WzEjx', 'status', 'Review', '#7F8C8D', '7aRxfVTXsxd31PyBz9WzEjx', 'system', NULL, '2025-03-31 09:30:53', '2025-03-31 09:30:53'),
('r2mJlL65G0WIPSqMB0oBkXK', 'e5ESgU0K4XFQMWlwlcdl89T', 'tag', 'Important', '#8E44AD', 'e5ESgU0K4XFQMWlwlcdl89T', 'system', NULL, '2025-03-31 09:36:52', '2025-03-31 09:36:52'),
('R3jKYZXZiZfdu8N1PlL8e30', 'tawmdBbwDXMrKoMp57lQPEJ', 'status', 'In Progress', '#3498DB', 'tawmdBbwDXMrKoMp57lQPEJ', 'system', NULL, '2025-03-31 09:35:06', '2025-03-31 09:35:06'),
('R8KxJnaggMVZ6fdGBT3sGu0', '4kykUHcg5oLrhNDkfCLNYYG', 'status', 'Rejected', '#C0392B', '4kykUHcg5oLrhNDkfCLNYYG', 'system', NULL, '2025-03-31 09:41:22', '2025-03-31 09:41:22'),
('RaV84ubCVRC0HEkxHvDp9rM', 'lsA3bWwiHYURgcxV1p9JKYL', 'followup', 'Video Call', '#7c3aed', 'lsA3bWwiHYURgcxV1p9JKYL', 'system', NULL, '2025-03-31 09:39:39', '2025-03-31 09:39:39'),
('rdh8IYCYpry9FGVfXQsGWVa', 'lsA3bWwiHYURgcxV1p9JKYL', 'category', 'Financial Services', '#2ECC71', 'lsA3bWwiHYURgcxV1p9JKYL', 'system', NULL, '2025-03-31 09:39:39', '2025-03-31 09:39:39'),
('rdSSnHRI1MgSnlAahEqznO8', 'EYxL2jumtV4h2riCxEXLcGp', 'followup', 'Client Meeting', '#52c41a', 'EYxL2jumtV4h2riCxEXLcGp', 'system', NULL, '2025-03-31 09:32:32', '2025-03-31 09:32:32'),
('rHSPZD6VHlbJep8vR9UcvxV', 'e5ESgU0K4XFQMWlwlcdl89T', 'tag', 'High Priority', '#C0392B', 'e5ESgU0K4XFQMWlwlcdl89T', 'system', NULL, '2025-03-31 09:36:52', '2025-03-31 09:36:52'),
('rkwFL7b02ckKKh8S5jiCKsH', '4kykUHcg5oLrhNDkfCLNYYG', 'category', 'E-commerce', '#8E44AD', '4kykUHcg5oLrhNDkfCLNYYG', 'system', NULL, '2025-03-31 09:41:22', '2025-03-31 09:41:22'),
('rlHaaZ89uvuBN1awhLlZuBW', '7aRxfVTXsxd31PyBz9WzEjx', 'followup', 'Client Meeting', '#52c41a', '7aRxfVTXsxd31PyBz9WzEjx', 'system', NULL, '2025-03-31 09:30:53', '2025-03-31 09:30:53'),
('rQIdhNEw2GkRXlnrhQmi4h9', '7aRxfVTXsxd31PyBz9WzEjx', 'followup', 'Telegram', '#0088cc', '7aRxfVTXsxd31PyBz9WzEjx', 'system', NULL, '2025-03-31 09:30:53', '2025-03-31 09:30:53'),
('Rr2nFmLSK6q6Uvfst3dsNoS', '4kykUHcg5oLrhNDkfCLNYYG', 'followup', 'Email', '#EA4335', '4kykUHcg5oLrhNDkfCLNYYG', 'system', NULL, '2025-03-31 09:41:22', '2025-03-31 09:41:22'),
('RR9DIkjaTlSxclrtVuHF2Hs', 'tawmdBbwDXMrKoMp57lQPEJ', 'tag', 'High Priority', '#C0392B', 'tawmdBbwDXMrKoMp57lQPEJ', 'system', NULL, '2025-03-31 09:35:06', '2025-03-31 09:35:06'),
('rxVfw1pu6Pjswhj8INzE4IZ', '7aRxfVTXsxd31PyBz9WzEjx', 'contract_type', 'Project Based', '#27AE60', '7aRxfVTXsxd31PyBz9WzEjx', 'system', NULL, '2025-03-31 09:30:53', '2025-03-31 09:30:53'),
('ryNZYMsFTRuA7Sb4ODuUpjd', 'e5ESgU0K4XFQMWlwlcdl89T', 'followup', 'Email', '#EA4335', 'e5ESgU0K4XFQMWlwlcdl89T', 'system', NULL, '2025-03-31 09:36:52', '2025-03-31 09:36:52'),
('rYvYf7Sl64tDFCqLpQq6n2l', 'lsA3bWwiHYURgcxV1p9JKYL', 'status', 'Pending', '#9B59B6', 'lsA3bWwiHYURgcxV1p9JKYL', 'system', NULL, '2025-03-31 09:39:39', '2025-03-31 09:39:39'),
('Rz6XfG6JVaIyewOebPjOwZO', 'e5ESgU0K4XFQMWlwlcdl89T', 'source', 'Social Media', '#27AE60', 'e5ESgU0K4XFQMWlwlcdl89T', 'system', NULL, '2025-03-31 09:36:52', '2025-03-31 09:36:52'),
('RzdfKa1J3J70GDMJTJ3nqXB', '7aRxfVTXsxd31PyBz9WzEjx', 'followup', 'Video Call', '#7c3aed', '7aRxfVTXsxd31PyBz9WzEjx', 'system', NULL, '2025-03-31 09:30:53', '2025-03-31 09:30:53'),
('rzDxto42LIC5B0i3ldi3jYy', '7aRxfVTXsxd31PyBz9WzEjx', 'followup', 'Phone Call', '#1890ff', '7aRxfVTXsxd31PyBz9WzEjx', 'system', NULL, '2025-03-31 09:30:53', '2025-03-31 09:30:53'),
('S3Q6EMzbKgCKfqAseAyA5bC', 'Bot3GuoPgOHloKvTPRtcz2A', 'tag', 'Low Priority', '#F39C12', 'Bot3GuoPgOHloKvTPRtcz2A', 'system', NULL, '2025-03-31 09:33:59', '2025-03-31 09:33:59'),
('sa8PyHS9OVY61wbAFUze8sv', 'Wek9GHYyp9ebFwzjFZHtuvA', 'tag', 'VIP', '#2980B9', 'Wek9GHYyp9ebFwzjFZHtuvA', 'system', NULL, '2025-03-31 09:27:31', '2025-03-31 09:27:31'),
('SAnL5ngeu3qgJRRpuWjSmGC', 'lsA3bWwiHYURgcxV1p9JKYL', 'status', 'Rejected', '#C0392B', 'lsA3bWwiHYURgcxV1p9JKYL', 'system', NULL, '2025-03-31 09:39:39', '2025-03-31 09:39:39'),
('Sh77o8tCIhSJgaCaQpakaCo', 'AsPoso1y1OL5uY5URy57ZPw', 'status', 'Cancelled', '#E74C3C', 'AsPoso1y1OL5uY5URy57ZPw', 'system', NULL, '2025-03-31 09:29:46', '2025-03-31 09:29:46'),
('shUzbR9fqQgw2BIjNHeH8GQ', 'tawmdBbwDXMrKoMp57lQPEJ', 'tag', 'Important', '#8E44AD', 'tawmdBbwDXMrKoMp57lQPEJ', 'system', NULL, '2025-03-31 09:35:06', '2025-03-31 09:35:06'),
('SpPjEJd246dwyYtKbJaxkVI', 'e5ESgU0K4XFQMWlwlcdl89T', 'contract_type', 'Retainer', '#D35400', 'e5ESgU0K4XFQMWlwlcdl89T', 'system', NULL, '2025-03-31 09:36:52', '2025-03-31 09:36:52'),
('SPSCNJaofKAlUrkNf6boFNg', 'EYxL2jumtV4h2riCxEXLcGp', 'status', 'Pending', '#9B59B6', 'EYxL2jumtV4h2riCxEXLcGp', 'system', NULL, '2025-03-31 09:32:32', '2025-03-31 09:32:32'),
('SPtj6lQM69kRket4T1zc6Sd', 'e5ESgU0K4XFQMWlwlcdl89T', 'category', 'E-commerce', '#8E44AD', 'e5ESgU0K4XFQMWlwlcdl89T', 'system', NULL, '2025-03-31 09:36:52', '2025-03-31 09:36:52'),
('Sq9j2FCi4KwO7dbhwMvlKOV', 'Wek9GHYyp9ebFwzjFZHtuvA', 'source', 'Phone', '#34495E', 'Wek9GHYyp9ebFwzjFZHtuvA', 'system', NULL, '2025-03-31 09:27:31', '2025-03-31 09:27:31'),
('SWJhm5cLsUw8hmdASp57gFe', 'e5ESgU0K4XFQMWlwlcdl89T', 'category', 'Manufacturing', '#9B59B6', 'e5ESgU0K4XFQMWlwlcdl89T', 'system', NULL, '2025-03-31 09:36:52', '2025-03-31 09:36:52'),
('SxC6DolNBGflRfx1oeuRF2m', 'Wek9GHYyp9ebFwzjFZHtuvA', 'category', 'Healthcare', '#1ABC9C', 'Wek9GHYyp9ebFwzjFZHtuvA', 'system', NULL, '2025-03-31 09:27:31', '2025-03-31 09:27:31'),
('SZzqdK8TszslWpF7nM36PuV', 'lsA3bWwiHYURgcxV1p9JKYL', 'status', 'New', '#1ABC9C', 'lsA3bWwiHYURgcxV1p9JKYL', 'system', NULL, '2025-03-31 09:39:39', '2025-03-31 09:39:39'),
('t3RkwYLkrgo68t7pMwgONO0', 'M3kofTRJDv4cm25SZetXgro', 'source', 'Advertisement', '#2C3E50', 'M3kofTRJDv4cm25SZetXgro', 'system', NULL, '2025-03-31 09:43:22', '2025-03-31 09:43:22'),
('T8IPolPOM6WVJ2PIUrMWO1C', 'EYxL2jumtV4h2riCxEXLcGp', 'source', 'Website', '#16A085', 'EYxL2jumtV4h2riCxEXLcGp', 'system', NULL, '2025-03-31 09:32:32', '2025-03-31 09:32:32'),
('t8wSSnAIUQAIRgvDFXGauKC', 'EYxL2jumtV4h2riCxEXLcGp', 'category', 'Design', '#16A085', 'EYxL2jumtV4h2riCxEXLcGp', 'system', NULL, '2025-03-31 09:32:32', '2025-03-31 09:32:32'),
('Tajou0ccths4zdXXFQhuLGW', 'e5ESgU0K4XFQMWlwlcdl89T', 'tag', 'Low Priority', '#F39C12', 'e5ESgU0K4XFQMWlwlcdl89T', 'system', NULL, '2025-03-31 09:36:52', '2025-03-31 09:36:52'),
('tB7GbSYgEazwNj05j0depNi', '4kykUHcg5oLrhNDkfCLNYYG', 'category', 'Real Estate', '#3498DB', '4kykUHcg5oLrhNDkfCLNYYG', 'system', NULL, '2025-03-31 09:41:22', '2025-03-31 09:41:22'),
('tB9filaOIVGK6Du2LuL2qNe', 'EYxL2jumtV4h2riCxEXLcGp', 'category', 'Training', '#2980B9', 'EYxL2jumtV4h2riCxEXLcGp', 'system', NULL, '2025-03-31 09:32:32', '2025-03-31 09:32:32'),
('teaGaWWVJOrrDzL7QvBciXV', 'Wek9GHYyp9ebFwzjFZHtuvA', 'tag', 'Low Priority', '#F39C12', 'Wek9GHYyp9ebFwzjFZHtuvA', 'system', NULL, '2025-03-31 09:27:31', '2025-03-31 09:27:31'),
('tHkIzV4AKzmtMjVa6ly75GU', 'EYxL2jumtV4h2riCxEXLcGp', 'source', 'Email', '#2C3E50', 'EYxL2jumtV4h2riCxEXLcGp', 'system', NULL, '2025-03-31 09:32:32', '2025-03-31 09:32:32'),
('Ti4hLTJMOgUrOoYslQWFJIj', 'e5ESgU0K4XFQMWlwlcdl89T', 'contract_type', 'Fixed Price', '#2980B9', 'e5ESgU0K4XFQMWlwlcdl89T', 'system', NULL, '2025-03-31 09:36:52', '2025-03-31 09:36:52'),
('TJlBtfKJDPp3RzrTWcvt4fc', '7aRxfVTXsxd31PyBz9WzEjx', 'source', 'Website', '#16A085', '7aRxfVTXsxd31PyBz9WzEjx', 'system', NULL, '2025-03-31 09:30:53', '2025-03-31 09:30:53'),
('tKyNj4KT9pfqGSLvMgupyE0', 'EYxL2jumtV4h2riCxEXLcGp', 'tag', 'Low Priority', '#F39C12', 'EYxL2jumtV4h2riCxEXLcGp', 'system', NULL, '2025-03-31 09:32:32', '2025-03-31 09:32:32'),
('TLQY1P0Ku1LebPmyGsBzaEn', '7aRxfVTXsxd31PyBz9WzEjx', 'source', 'Event', '#16A085', '7aRxfVTXsxd31PyBz9WzEjx', 'system', NULL, '2025-03-31 09:30:53', '2025-03-31 09:30:53'),
('TMwvYTKGDyOEOzlSUhpM77J', 'EYxL2jumtV4h2riCxEXLcGp', 'followup', 'Telegram', '#0088cc', 'EYxL2jumtV4h2riCxEXLcGp', 'system', NULL, '2025-03-31 09:32:32', '2025-03-31 09:32:32'),
('tsEg2MmKOPhdTucGzathwmV', 'EYxL2jumtV4h2riCxEXLcGp', 'source', 'Partner', '#27AE60', 'EYxL2jumtV4h2riCxEXLcGp', 'system', NULL, '2025-03-31 09:32:32', '2025-03-31 09:32:32'),
('twN0ovuMDrXkdfypSD97Zwa', 'Wek9GHYyp9ebFwzjFZHtuvA', 'tag', 'Follow-up', '#16A085', 'Wek9GHYyp9ebFwzjFZHtuvA', 'system', NULL, '2025-03-31 09:27:31', '2025-03-31 09:27:31'),
('tXjjr7ZteZrOddGB376oqZy', '7aRxfVTXsxd31PyBz9WzEjx', 'category', 'Software Development', '#2C3E50', '7aRxfVTXsxd31PyBz9WzEjx', 'system', NULL, '2025-03-31 09:30:53', '2025-03-31 09:30:53'),
('tZcbA0ssCxGg2bxgN93xHF4', 'EYxL2jumtV4h2riCxEXLcGp', 'source', 'Phone', '#34495E', 'EYxL2jumtV4h2riCxEXLcGp', 'system', NULL, '2025-03-31 09:32:32', '2025-03-31 09:32:32'),
('u0YLrnl822WmXBPBR5eRnMx', 'e5ESgU0K4XFQMWlwlcdl89T', 'contract_type', 'Milestone Based', '#8E44AD', 'e5ESgU0K4XFQMWlwlcdl89T', 'system', NULL, '2025-03-31 09:36:52', '2025-03-31 09:36:52'),
('U2c2agFKslhlmr6fdqjHUik', '4kykUHcg5oLrhNDkfCLNYYG', 'followup', 'Telegram', '#0088cc', '4kykUHcg5oLrhNDkfCLNYYG', 'system', NULL, '2025-03-31 09:41:22', '2025-03-31 09:41:22'),
('U7QSLQ1y9gWVeBG6TkVAxpQ', '7aRxfVTXsxd31PyBz9WzEjx', 'category', 'Training', '#2980B9', '7aRxfVTXsxd31PyBz9WzEjx', 'system', NULL, '2025-03-31 09:30:53', '2025-03-31 09:30:53'),
('Uc7XTLX7Uho3XgeGMQ0XPeL', 'Bot3GuoPgOHloKvTPRtcz2A', 'category', 'Consulting', '#34495E', 'Bot3GuoPgOHloKvTPRtcz2A', 'system', NULL, '2025-03-31 09:33:59', '2025-03-31 09:33:59'),
('ucqoGqLcKDnHzldaebt6vVA', 'Bot3GuoPgOHloKvTPRtcz2A', 'category', 'Manufacturing', '#9B59B6', 'Bot3GuoPgOHloKvTPRtcz2A', 'system', NULL, '2025-03-31 09:33:59', '2025-03-31 09:33:59'),
('uD6Ov16iyau0J9qmjKah8bR', 'AsPoso1y1OL5uY5URy57ZPw', 'source', 'Partner', '#27AE60', 'AsPoso1y1OL5uY5URy57ZPw', 'system', NULL, '2025-03-31 09:29:46', '2025-03-31 09:29:46'),
('uGAZnTDhqikDxGZCbFDhXAm', 'AsPoso1y1OL5uY5URy57ZPw', 'status', 'Review', '#7F8C8D', 'AsPoso1y1OL5uY5URy57ZPw', 'system', NULL, '2025-03-31 09:29:46', '2025-03-31 09:29:46'),
('uhpK8AXiDA0FeZS1vW7DI9W', 'M3kofTRJDv4cm25SZetXgro', 'followup', 'Telegram', '#0088cc', 'M3kofTRJDv4cm25SZetXgro', 'system', NULL, '2025-03-31 09:43:22', '2025-03-31 09:43:22'),
('UhV0cMEFrbci1V5C5PLsYBp', 'EYxL2jumtV4h2riCxEXLcGp', 'source', 'Direct', '#8E44AD', 'EYxL2jumtV4h2riCxEXLcGp', 'system', NULL, '2025-03-31 09:32:32', '2025-03-31 09:32:32'),
('UI3RFfNDaIjamOpKApuMXEp', 'Bot3GuoPgOHloKvTPRtcz2A', 'status', 'Completed', '#2ECC71', 'Bot3GuoPgOHloKvTPRtcz2A', 'system', NULL, '2025-03-31 09:33:59', '2025-03-31 09:33:59'),
('UqaphpcZJbTCtOacQcCSLeJ', 'Wek9GHYyp9ebFwzjFZHtuvA', 'status', 'Completed', '#2ECC71', 'Wek9GHYyp9ebFwzjFZHtuvA', 'system', NULL, '2025-03-31 09:27:31', '2025-03-31 09:27:31'),
('uqE62YUTYy7KtYNWBO7zUu8', 'EYxL2jumtV4h2riCxEXLcGp', 'status', 'On Hold', '#34495E', 'EYxL2jumtV4h2riCxEXLcGp', 'system', NULL, '2025-03-31 09:32:32', '2025-03-31 09:32:32'),
('uqUty6CCLvfGK7lT6VvzWqu', 'M3kofTRJDv4cm25SZetXgro', 'status', 'Delayed', '#95A5A6', 'M3kofTRJDv4cm25SZetXgro', 'system', NULL, '2025-03-31 09:43:22', '2025-03-31 09:43:22'),
('urbw8gsM2xI0hIYeJHMw3Ap', '4kykUHcg5oLrhNDkfCLNYYG', 'followup', 'Phone Call', '#1890ff', '4kykUHcg5oLrhNDkfCLNYYG', 'system', NULL, '2025-03-31 09:41:22', '2025-03-31 09:41:22'),
('USXkQZGBK85bxP2HuusFcxE', 'tawmdBbwDXMrKoMp57lQPEJ', 'source', 'Email', '#2C3E50', 'tawmdBbwDXMrKoMp57lQPEJ', 'system', NULL, '2025-03-31 09:35:06', '2025-03-31 09:35:06'),
('utE1NEgar86AviECpIMidf0', 'M3kofTRJDv4cm25SZetXgro', 'source', 'Other', '#34495E', 'M3kofTRJDv4cm25SZetXgro', 'system', NULL, '2025-03-31 09:43:22', '2025-03-31 09:43:22'),
('uXK3szKohxxhePijftBXJzm', '7aRxfVTXsxd31PyBz9WzEjx', 'tag', 'Low Priority', '#F39C12', '7aRxfVTXsxd31PyBz9WzEjx', 'system', NULL, '2025-03-31 09:30:53', '2025-03-31 09:30:53'),
('UxtYR2ih8dzGvniEqvPxXlG', 'e5ESgU0K4XFQMWlwlcdl89T', 'tag', 'Medium Priority', '#D35400', 'e5ESgU0K4XFQMWlwlcdl89T', 'system', NULL, '2025-03-31 09:36:52', '2025-03-31 09:36:52'),
('uzLj7KSYMLzSeq1FRxNUQnD', '4kykUHcg5oLrhNDkfCLNYYG', 'tag', 'Special', '#8E44AD', '4kykUHcg5oLrhNDkfCLNYYG', 'system', NULL, '2025-03-31 09:41:22', '2025-03-31 09:41:22'),
('V05kls9qR5qiOkheXw7p5Ik', '7aRxfVTXsxd31PyBz9WzEjx', 'category', 'Design', '#16A085', '7aRxfVTXsxd31PyBz9WzEjx', 'system', NULL, '2025-03-31 09:30:53', '2025-03-31 09:30:53'),
('v2lOaNAcVo6FiATMRG5ypOU', 'e5ESgU0K4XFQMWlwlcdl89T', 'tag', 'Urgent', '#E74C3C', 'e5ESgU0K4XFQMWlwlcdl89T', 'system', NULL, '2025-03-31 09:36:52', '2025-03-31 09:36:52'),
('V42nQ0NIAItCBxPXGmCzxvr', 'Wek9GHYyp9ebFwzjFZHtuvA', 'tag', 'High Priority', '#C0392B', 'Wek9GHYyp9ebFwzjFZHtuvA', 'system', NULL, '2025-03-31 09:27:31', '2025-03-31 09:27:31'),
('V97Em0Pl2ZiwxWzvG9qutNq', 'M3kofTRJDv4cm25SZetXgro', 'followup', 'Email', '#EA4335', 'M3kofTRJDv4cm25SZetXgro', 'system', NULL, '2025-03-31 09:43:22', '2025-03-31 09:43:22'),
('VaYNq66P89ts924tn8duVqH', 'Wek9GHYyp9ebFwzjFZHtuvA', 'contract_type', 'Project Based', '#27AE60', 'Wek9GHYyp9ebFwzjFZHtuvA', 'system', NULL, '2025-03-31 09:27:31', '2025-03-31 09:27:31'),
('vCXkr4XOBWMJgWfE0djIZYX', 'lsA3bWwiHYURgcxV1p9JKYL', 'category', 'Consulting', '#34495E', 'lsA3bWwiHYURgcxV1p9JKYL', 'system', NULL, '2025-03-31 09:39:39', '2025-03-31 09:39:39'),
('vdr2t2jLcGJ44TSd03AR2V1', 'M3kofTRJDv4cm25SZetXgro', 'tag', 'Special', '#8E44AD', 'M3kofTRJDv4cm25SZetXgro', 'system', NULL, '2025-03-31 09:43:22', '2025-03-31 09:43:22'),
('VisoYm2gdh5dX80HHnIohuS', 'tawmdBbwDXMrKoMp57lQPEJ', 'followup', 'Telegram', '#0088cc', 'tawmdBbwDXMrKoMp57lQPEJ', 'system', NULL, '2025-03-31 09:35:06', '2025-03-31 09:35:06'),
('VN6XIiFNM6UeHmioe0QjQPN', 'tawmdBbwDXMrKoMp57lQPEJ', 'category', 'Software Development', '#2C3E50', 'tawmdBbwDXMrKoMp57lQPEJ', 'system', NULL, '2025-03-31 09:35:06', '2025-03-31 09:35:06'),
('VRANlMqasRPd9OXVgS0QLxY', 'Bot3GuoPgOHloKvTPRtcz2A', 'tag', 'Sensitive', '#C0392B', 'Bot3GuoPgOHloKvTPRtcz2A', 'system', NULL, '2025-03-31 09:33:59', '2025-03-31 09:33:59'),
('vuAUUERHF1Abj2w2eFyiICr', 'EYxL2jumtV4h2riCxEXLcGp', 'source', 'Other', '#34495E', 'EYxL2jumtV4h2riCxEXLcGp', 'system', NULL, '2025-03-31 09:32:32', '2025-03-31 09:32:32'),
('VVkgF7jZcY9UsyZcC7xt9i5', 'M3kofTRJDv4cm25SZetXgro', 'tag', 'Sensitive', '#C0392B', 'M3kofTRJDv4cm25SZetXgro', 'system', NULL, '2025-03-31 09:43:22', '2025-03-31 09:43:22'),
('VyQWdLG1waX2FqfxmxEgr9v', 'AsPoso1y1OL5uY5URy57ZPw', 'status', 'In Progress', '#3498DB', 'AsPoso1y1OL5uY5URy57ZPw', 'system', NULL, '2025-03-31 09:29:46', '2025-03-31 09:29:46'),
('vZvYKdy2in34sIrfpHapXHU', 'e5ESgU0K4XFQMWlwlcdl89T', 'contract_type', 'Project Based', '#27AE60', 'e5ESgU0K4XFQMWlwlcdl89T', 'system', NULL, '2025-03-31 09:36:52', '2025-03-31 09:36:52'),
('waUN93ubGqX1I97LzqQzY2e', 'e5ESgU0K4XFQMWlwlcdl89T', 'source', 'Partner', '#27AE60', 'e5ESgU0K4XFQMWlwlcdl89T', 'system', NULL, '2025-03-31 09:36:52', '2025-03-31 09:36:52'),
('WbVaWK41f0rtIWNV4mMrIPe', 'AsPoso1y1OL5uY5URy57ZPw', 'contract_type', 'Retainer', '#D35400', 'AsPoso1y1OL5uY5URy57ZPw', 'system', NULL, '2025-03-31 09:29:46', '2025-03-31 09:29:46'),
('wCGIvQZtMRz0DBUs2pPoBOU', 'tawmdBbwDXMrKoMp57lQPEJ', 'source', 'Referral', '#2980B9', 'tawmdBbwDXMrKoMp57lQPEJ', 'system', NULL, '2025-03-31 09:35:06', '2025-03-31 09:35:06'),
('wDzY4Zpe1dKE1TdtDgH2aEG', '4kykUHcg5oLrhNDkfCLNYYG', 'tag', 'Follow-up', '#16A085', '4kykUHcg5oLrhNDkfCLNYYG', 'system', NULL, '2025-03-31 09:41:22', '2025-03-31 09:41:22'),
('wGeq7zSf0ENPYS2CYhXNUc8', 'M3kofTRJDv4cm25SZetXgro', 'source', 'Website', '#16A085', 'M3kofTRJDv4cm25SZetXgro', 'system', NULL, '2025-03-31 09:43:22', '2025-03-31 09:43:22'),
('wh5y2iH8h3ATpjHqvguiTRK', '4kykUHcg5oLrhNDkfCLNYYG', 'category', 'Financial Services', '#2ECC71', '4kykUHcg5oLrhNDkfCLNYYG', 'system', NULL, '2025-03-31 09:41:22', '2025-03-31 09:41:22'),
('wJZRpSw7GovBykqiVjWAfjL', 'Wek9GHYyp9ebFwzjFZHtuvA', 'tag', 'Regular', '#27AE60', 'Wek9GHYyp9ebFwzjFZHtuvA', 'system', NULL, '2025-03-31 09:27:31', '2025-03-31 09:27:31'),
('WkznuJQnarQONnV9txf9NHv', 'AsPoso1y1OL5uY5URy57ZPw', 'followup', 'WhatsApp', '#25D366', 'AsPoso1y1OL5uY5URy57ZPw', 'system', NULL, '2025-03-31 09:29:46', '2025-03-31 09:29:46'),
('wNU99agVfFAzw4btPoBs90y', 'AsPoso1y1OL5uY5URy57ZPw', 'contract_type', 'Project Based', '#27AE60', 'AsPoso1y1OL5uY5URy57ZPw', 'system', NULL, '2025-03-31 09:29:46', '2025-03-31 09:29:46'),
('WNxI3rh71qgj7Z6scfiBxMc', '4kykUHcg5oLrhNDkfCLNYYG', 'tag', 'Urgent', '#E74C3C', '4kykUHcg5oLrhNDkfCLNYYG', 'system', NULL, '2025-03-31 09:41:22', '2025-03-31 09:41:22'),
('wr3JS1PLJ3142XCbTBnrHNM', 'EYxL2jumtV4h2riCxEXLcGp', 'category', 'Software Development', '#2C3E50', 'EYxL2jumtV4h2riCxEXLcGp', 'system', NULL, '2025-03-31 09:32:32', '2025-03-31 09:32:32'),
('WREDhXiVhISsv0zAxdpBH0g', 'EYxL2jumtV4h2riCxEXLcGp', 'status', 'Rejected', '#C0392B', 'EYxL2jumtV4h2riCxEXLcGp', 'system', NULL, '2025-03-31 09:32:32', '2025-03-31 09:32:32'),
('wsbjoDHrqzGlDB7L0vCXONe', 'e5ESgU0K4XFQMWlwlcdl89T', 'category', 'Real Estate', '#3498DB', 'e5ESgU0K4XFQMWlwlcdl89T', 'system', NULL, '2025-03-31 09:36:52', '2025-03-31 09:36:52'),
('WWG7Q9YMGRDoXNtES4qvzDy', 'Wek9GHYyp9ebFwzjFZHtuvA', 'status', 'New', '#1ABC9C', 'Wek9GHYyp9ebFwzjFZHtuvA', 'system', NULL, '2025-03-31 09:27:31', '2025-03-31 09:27:31'),
('X3SWYiKke7xZrZaCwhB2RMZ', 'Bot3GuoPgOHloKvTPRtcz2A', 'status', 'Delayed', '#95A5A6', 'Bot3GuoPgOHloKvTPRtcz2A', 'system', NULL, '2025-03-31 09:33:59', '2025-03-31 09:33:59'),
('x7ul4kmIX0j1LoM7wipyyPG', '4kykUHcg5oLrhNDkfCLNYYG', 'contract_type', 'Milestone Based', '#8E44AD', '4kykUHcg5oLrhNDkfCLNYYG', 'system', NULL, '2025-03-31 09:41:22', '2025-03-31 09:41:22'),
('xaOoQEUY5rzUlV59cm2EBFO', 'EYxL2jumtV4h2riCxEXLcGp', 'status', 'In Progress', '#3498DB', 'EYxL2jumtV4h2riCxEXLcGp', 'system', NULL, '2025-03-31 09:32:32', '2025-03-31 09:32:32'),
('XCn5cTPJ3NmrehFfhOMmVRf', 'Wek9GHYyp9ebFwzjFZHtuvA', 'tag', 'Urgent', '#E74C3C', 'Wek9GHYyp9ebFwzjFZHtuvA', 'system', NULL, '2025-03-31 09:27:31', '2025-03-31 09:27:31'),
('XH0q4zVEWx2IlVRDsFRT1ig', '7aRxfVTXsxd31PyBz9WzEjx', 'category', 'E-commerce', '#8E44AD', '7aRxfVTXsxd31PyBz9WzEjx', 'system', NULL, '2025-03-31 09:30:53', '2025-03-31 09:30:53'),
('XhcGm7kpqEoKMhI2fg37cAD', 'e5ESgU0K4XFQMWlwlcdl89T', 'category', 'Training', '#2980B9', 'e5ESgU0K4XFQMWlwlcdl89T', 'system', NULL, '2025-03-31 09:36:52', '2025-03-31 09:36:52'),
('XhO6EhjVqoPl0sEe3zyW4zs', 'tawmdBbwDXMrKoMp57lQPEJ', 'status', 'Pending', '#9B59B6', 'tawmdBbwDXMrKoMp57lQPEJ', 'system', NULL, '2025-03-31 09:35:06', '2025-03-31 09:35:06'),
('xmC8Qt09GzfEInzP1JIx39k', 'Wek9GHYyp9ebFwzjFZHtuvA', 'category', 'Consulting', '#34495E', 'Wek9GHYyp9ebFwzjFZHtuvA', 'system', NULL, '2025-03-31 09:27:31', '2025-03-31 09:27:31'),
('XmPxKWOdlCFM22QjGgx1dNl', 'lsA3bWwiHYURgcxV1p9JKYL', 'followup', 'Phone Call', '#1890ff', 'lsA3bWwiHYURgcxV1p9JKYL', 'system', NULL, '2025-03-31 09:39:39', '2025-03-31 09:39:39'),
('XnQOAmTwdak6EKoCE9pl8WB', 'AsPoso1y1OL5uY5URy57ZPw', 'category', 'Consulting', '#34495E', 'AsPoso1y1OL5uY5URy57ZPw', 'system', NULL, '2025-03-31 09:29:46', '2025-03-31 09:29:46'),
('xOOUVwaj2OiYAvaQ4VytNtD', 'AsPoso1y1OL5uY5URy57ZPw', 'followup', 'Video Call', '#7c3aed', 'AsPoso1y1OL5uY5URy57ZPw', 'system', NULL, '2025-03-31 09:29:46', '2025-03-31 09:29:46'),
('XpMPzwuHYMKYwz5fK4WAEXc', '4kykUHcg5oLrhNDkfCLNYYG', 'category', 'Healthcare', '#1ABC9C', '4kykUHcg5oLrhNDkfCLNYYG', 'system', NULL, '2025-03-31 09:41:22', '2025-03-31 09:41:22'),
('XqiMmDenQYPazbH2qMhMLrT', '7aRxfVTXsxd31PyBz9WzEjx', 'followup', 'Email', '#EA4335', '7aRxfVTXsxd31PyBz9WzEjx', 'system', NULL, '2025-03-31 09:30:53', '2025-03-31 09:30:53'),
('XrClSvd6URHSCcQqDDdRxDP', 'lsA3bWwiHYURgcxV1p9JKYL', 'contract_type', 'Fixed Price', '#2980B9', 'lsA3bWwiHYURgcxV1p9JKYL', 'system', NULL, '2025-03-31 09:39:39', '2025-03-31 09:39:39'),
('xuB1EFLnxfOC50fursRLoCz', '4kykUHcg5oLrhNDkfCLNYYG', 'source', 'Social Media', '#27AE60', '4kykUHcg5oLrhNDkfCLNYYG', 'system', NULL, '2025-03-31 09:41:22', '2025-03-31 09:41:22'),
('xUhcBDf03cUsHEWbxar4zE4', 'EYxL2jumtV4h2riCxEXLcGp', 'status', 'Delayed', '#95A5A6', 'EYxL2jumtV4h2riCxEXLcGp', 'system', NULL, '2025-03-31 09:32:32', '2025-03-31 09:32:32'),
('Xwu6xRM8w4j2MeFnIhbOHUB', 'e5ESgU0K4XFQMWlwlcdl89T', 'category', 'Marketing', '#27AE60', 'e5ESgU0K4XFQMWlwlcdl89T', 'system', NULL, '2025-03-31 09:36:52', '2025-03-31 09:36:52'),
('xwUIgaJBfsTw6k4zasWwptM', 'e5ESgU0K4XFQMWlwlcdl89T', 'source', 'Phone', '#34495E', 'e5ESgU0K4XFQMWlwlcdl89T', 'system', NULL, '2025-03-31 09:36:52', '2025-03-31 09:36:52'),
('xXfrZok5sY9P6Id3UTzAidm', 'AsPoso1y1OL5uY5URy57ZPw', 'followup', 'Phone Call', '#1890ff', 'AsPoso1y1OL5uY5URy57ZPw', 'system', NULL, '2025-03-31 09:29:46', '2025-03-31 09:29:46'),
('xxMc6RHoK5XvujXCUB0saqe', 'M3kofTRJDv4cm25SZetXgro', 'status', 'New', '#1ABC9C', 'M3kofTRJDv4cm25SZetXgro', 'system', NULL, '2025-03-31 09:43:22', '2025-03-31 09:43:22'),
('y06vfwSkdHd5F2KiHnDqSh3', 'e5ESgU0K4XFQMWlwlcdl89T', 'tag', 'Follow-up', '#16A085', 'e5ESgU0K4XFQMWlwlcdl89T', 'system', NULL, '2025-03-31 09:36:52', '2025-03-31 09:36:52'),
('Y1ViwA9V1IDTMTjgnIyU7i6', 'M3kofTRJDv4cm25SZetXgro', 'contract_type', 'Time & Material', '#16A085', 'M3kofTRJDv4cm25SZetXgro', 'system', NULL, '2025-03-31 09:43:22', '2025-03-31 09:43:22'),
('Y3T0bChJDNqTyGz9tUnFvI6', '7aRxfVTXsxd31PyBz9WzEjx', 'contract_type', 'Retainer', '#D35400', '7aRxfVTXsxd31PyBz9WzEjx', 'system', NULL, '2025-03-31 09:30:53', '2025-03-31 09:30:53'),
('y55ACiJrmH2MvQSoEEm9Qi4', 'Wek9GHYyp9ebFwzjFZHtuvA', 'status', 'In Progress', '#3498DB', 'Wek9GHYyp9ebFwzjFZHtuvA', 'system', NULL, '2025-03-31 09:27:31', '2025-03-31 09:27:31'),
('y7LRgdWPlyuQDnjfHmqJXZi', 'tawmdBbwDXMrKoMp57lQPEJ', 'contract_type', 'Time & Material', '#16A085', 'tawmdBbwDXMrKoMp57lQPEJ', 'system', NULL, '2025-03-31 09:35:06', '2025-03-31 09:35:06'),
('Y8Q2RfdEMxRoY2eK3UEBXbl', 'e5ESgU0K4XFQMWlwlcdl89T', 'followup', 'WhatsApp', '#25D366', 'e5ESgU0K4XFQMWlwlcdl89T', 'system', NULL, '2025-03-31 09:36:52', '2025-03-31 09:36:52'),
('y91MskdiJl0zORROi8e8auJ', 'e5ESgU0K4XFQMWlwlcdl89T', 'tag', 'VIP', '#2980B9', 'e5ESgU0K4XFQMWlwlcdl89T', 'system', NULL, '2025-03-31 09:36:52', '2025-03-31 09:36:52'),
('YBtcfb077DLO8OsI5dS1R08', 'e5ESgU0K4XFQMWlwlcdl89T', 'followup', 'Video Call', '#7c3aed', 'e5ESgU0K4XFQMWlwlcdl89T', 'system', NULL, '2025-03-31 09:36:52', '2025-03-31 09:36:52'),
('Yd8hftTvpfBuyRIkGjqSTKn', 'M3kofTRJDv4cm25SZetXgro', 'status', 'Review', '#7F8C8D', 'M3kofTRJDv4cm25SZetXgro', 'system', NULL, '2025-03-31 09:43:22', '2025-03-31 09:43:22'),
('yfKF0EIEM7vq8M1PaRNdDHQ', 'Wek9GHYyp9ebFwzjFZHtuvA', 'followup', 'Email', '#EA4335', 'Wek9GHYyp9ebFwzjFZHtuvA', 'system', NULL, '2025-03-31 09:27:31', '2025-03-31 09:27:31'),
('YFvEU9b30jE7v4bKnuNmBKh', 'e5ESgU0K4XFQMWlwlcdl89T', 'status', 'Review', '#7F8C8D', 'e5ESgU0K4XFQMWlwlcdl89T', 'system', NULL, '2025-03-31 09:36:52', '2025-03-31 09:36:52'),
('YHzA2hVfrEUjFenfnShqsTA', 'tawmdBbwDXMrKoMp57lQPEJ', 'source', 'Direct', '#8E44AD', 'tawmdBbwDXMrKoMp57lQPEJ', 'system', NULL, '2025-03-31 09:35:06', '2025-03-31 09:35:06'),
('ylSHjZ54CNCbH32sb8TXnwA', 'lsA3bWwiHYURgcxV1p9JKYL', 'source', 'Social Media', '#27AE60', 'lsA3bWwiHYURgcxV1p9JKYL', 'system', NULL, '2025-03-31 09:39:39', '2025-03-31 09:39:39'),
('YN9cVWum6rQFVOr0H4B9FJq', 'Bot3GuoPgOHloKvTPRtcz2A', 'category', 'Training', '#2980B9', 'Bot3GuoPgOHloKvTPRtcz2A', 'system', NULL, '2025-03-31 09:33:59', '2025-03-31 09:33:59'),
('YR0KnJ490aLDGPE75P6vjt8', '4kykUHcg5oLrhNDkfCLNYYG', 'status', 'New', '#1ABC9C', '4kykUHcg5oLrhNDkfCLNYYG', 'system', NULL, '2025-03-31 09:41:22', '2025-03-31 09:41:22'),
('YV5bYTe8FVqH73D38TKPrrU', 'M3kofTRJDv4cm25SZetXgro', 'followup', 'WhatsApp', '#25D366', 'M3kofTRJDv4cm25SZetXgro', 'system', NULL, '2025-03-31 09:43:22', '2025-03-31 09:43:22'),
('yv8twVxDMQQmWeQvKmeDQwd', 'Wek9GHYyp9ebFwzjFZHtuvA', 'contract_type', 'Retainer', '#D35400', 'Wek9GHYyp9ebFwzjFZHtuvA', 'system', NULL, '2025-03-31 09:27:31', '2025-03-31 09:27:31'),
('yWY8Wy4G7JireQk3zUdhv47', 'EYxL2jumtV4h2riCxEXLcGp', 'source', 'Event', '#16A085', 'EYxL2jumtV4h2riCxEXLcGp', 'system', NULL, '2025-03-31 09:32:32', '2025-03-31 09:32:32'),
('yXpw1qI27ZHXAlUvCQ7s6sH', '4kykUHcg5oLrhNDkfCLNYYG', 'category', 'Consulting', '#34495E', '4kykUHcg5oLrhNDkfCLNYYG', 'system', NULL, '2025-03-31 09:41:22', '2025-03-31 09:41:22'),
('yy1BxHPe9rTArdYcp3gYfwv', 'Wek9GHYyp9ebFwzjFZHtuvA', 'category', 'Design', '#16A085', 'Wek9GHYyp9ebFwzjFZHtuvA', 'system', NULL, '2025-03-31 09:27:31', '2025-03-31 09:27:31'),
('YylHNsqxYEhECbiy7BjOuli', 'lsA3bWwiHYURgcxV1p9JKYL', 'followup', 'Telegram', '#0088cc', 'lsA3bWwiHYURgcxV1p9JKYL', 'system', NULL, '2025-03-31 09:39:39', '2025-03-31 09:39:39'),
('YyOu8aIwVw0AhQvtXa73C7c', 'Wek9GHYyp9ebFwzjFZHtuvA', 'followup', 'Video Call', '#7c3aed', 'Wek9GHYyp9ebFwzjFZHtuvA', 'system', NULL, '2025-03-31 09:27:31', '2025-03-31 09:27:31'),
('z07h9Fys6mkSK09AYTkzyyi', 'lsA3bWwiHYURgcxV1p9JKYL', 'category', 'Healthcare', '#1ABC9C', 'lsA3bWwiHYURgcxV1p9JKYL', 'system', NULL, '2025-03-31 09:39:39', '2025-03-31 09:39:39'),
('zbdE7AokO1pRPy2vw73dzJu', 'tawmdBbwDXMrKoMp57lQPEJ', 'tag', 'Special', '#8E44AD', 'tawmdBbwDXMrKoMp57lQPEJ', 'system', NULL, '2025-03-31 09:35:06', '2025-03-31 09:35:06'),
('ZBQZzvDinv4UoFtxJrZD3IJ', 'AsPoso1y1OL5uY5URy57ZPw', 'tag', 'VIP', '#2980B9', 'AsPoso1y1OL5uY5URy57ZPw', 'system', NULL, '2025-03-31 09:29:46', '2025-03-31 09:29:46'),
('Zc2BQfBtQK0xvgz1viSWIVu', 'EYxL2jumtV4h2riCxEXLcGp', 'tag', 'Medium Priority', '#D35400', 'EYxL2jumtV4h2riCxEXLcGp', 'system', NULL, '2025-03-31 09:32:32', '2025-03-31 09:32:32'),
('ZFdbW5uipr3Ea6V4sjHidEe', 'lsA3bWwiHYURgcxV1p9JKYL', 'followup', 'Client Meeting', '#52c41a', 'lsA3bWwiHYURgcxV1p9JKYL', 'system', NULL, '2025-03-31 09:39:39', '2025-03-31 09:39:39'),
('ZfjI3M7hM3Vs5yzIwRBMahB', '4kykUHcg5oLrhNDkfCLNYYG', 'category', 'Training', '#2980B9', '4kykUHcg5oLrhNDkfCLNYYG', 'system', NULL, '2025-03-31 09:41:22', '2025-03-31 09:41:22'),
('ZIrA6kG0BTiJau0KDDSGc95', 'Bot3GuoPgOHloKvTPRtcz2A', 'status', 'New', '#1ABC9C', 'Bot3GuoPgOHloKvTPRtcz2A', 'system', NULL, '2025-03-31 09:33:59', '2025-03-31 09:33:59'),
('ZJXPYVEKAj3iRrHBXUIv3ep', 'lsA3bWwiHYURgcxV1p9JKYL', 'status', 'In Progress', '#3498DB', 'lsA3bWwiHYURgcxV1p9JKYL', 'system', NULL, '2025-03-31 09:39:39', '2025-03-31 09:39:39'),
('ZkhcjojARtphOSPplazP7kX', 'Wek9GHYyp9ebFwzjFZHtuvA', 'status', 'Delayed', '#95A5A6', 'Wek9GHYyp9ebFwzjFZHtuvA', 'system', NULL, '2025-03-31 09:27:31', '2025-03-31 09:27:31'),
('zl1sJg11p5O9A74xGnU48Nr', 'EYxL2jumtV4h2riCxEXLcGp', 'contract_type', 'Time & Material', '#16A085', 'EYxL2jumtV4h2riCxEXLcGp', 'system', NULL, '2025-03-31 09:32:32', '2025-03-31 09:32:32'),
('ZoJF41S0I4wmushi9218FHx', 'tawmdBbwDXMrKoMp57lQPEJ', 'source', 'Website', '#16A085', 'tawmdBbwDXMrKoMp57lQPEJ', 'system', NULL, '2025-03-31 09:35:06', '2025-03-31 09:35:06'),
('ZQY4xYz1wfGkjW9VtjpAApG', 'EYxL2jumtV4h2riCxEXLcGp', 'status', 'Approved', '#27AE60', 'EYxL2jumtV4h2riCxEXLcGp', 'system', NULL, '2025-03-31 09:32:32', '2025-03-31 09:32:32'),
('zSbO7SnXM6p8IWiG1AZ1BtL', 'EYxL2jumtV4h2riCxEXLcGp', 'tag', 'Regular', '#27AE60', 'EYxL2jumtV4h2riCxEXLcGp', 'system', NULL, '2025-03-31 09:32:32', '2025-03-31 09:32:32'),
('zSjOqNrcFqxUsoAMYdd777c', '4kykUHcg5oLrhNDkfCLNYYG', 'status', 'On Hold', '#34495E', '4kykUHcg5oLrhNDkfCLNYYG', 'system', NULL, '2025-03-31 09:41:22', '2025-03-31 09:41:22'),
('ZxceUdK7fPn3q5tn99E1euB', 'tawmdBbwDXMrKoMp57lQPEJ', 'tag', 'VIP', '#2980B9', 'tawmdBbwDXMrKoMp57lQPEJ', 'system', NULL, '2025-03-31 09:35:06', '2025-03-31 09:35:06'),
('ZyD9xRaVJsmZpVbP9i4WXjw', 'Bot3GuoPgOHloKvTPRtcz2A', 'source', 'Referral', '#2980B9', 'Bot3GuoPgOHloKvTPRtcz2A', 'system', NULL, '2025-03-31 09:33:59', '2025-03-31 09:33:59');

-- --------------------------------------------------------

--
-- Table structure for table `taskcalendars`
--

CREATE TABLE `taskcalendars` (
  `id` varchar(255) NOT NULL,
  `taskName` varchar(255) NOT NULL,
  `taskDate` datetime NOT NULL,
  `taskTime` varchar(255) NOT NULL,
  `taskDescription` varchar(255) NOT NULL,
  `client_id` varchar(255) NOT NULL,
  `created_by` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tasks`
--

CREATE TABLE `tasks` (
  `id` varchar(255) NOT NULL,
  `related_id` varchar(255) NOT NULL,
  `taskName` varchar(255) NOT NULL,
  `category` varchar(255) DEFAULT NULL,
  `project` varchar(255) DEFAULT NULL,
  `lead` varchar(255) DEFAULT NULL,
  `file` varchar(255) DEFAULT NULL,
  `startDate` datetime NOT NULL,
  `dueDate` datetime NOT NULL,
  `assignTo` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`assignTo`)),
  `status` varchar(255) NOT NULL,
  `priority` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `reminder_date` datetime DEFAULT NULL,
  `client_id` varchar(255) NOT NULL,
  `task_reporter` varchar(255) NOT NULL,
  `created_by` varchar(255) DEFAULT NULL,
  `updated_by` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `taxes`
--

CREATE TABLE `taxes` (
  `id` varchar(255) NOT NULL,
  `gstName` varchar(255) NOT NULL,
  `gstPercentage` varchar(255) NOT NULL,
  `client_id` varchar(255) NOT NULL,
  `created_by` varchar(255) DEFAULT NULL,
  `updated_by` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `taxes`
--

INSERT INTO `taxes` (`id`, `gstName`, `gstPercentage`, `client_id`, `created_by`, `updated_by`, `createdAt`, `updatedAt`) VALUES
('FSq4XX9i6eb0ghsGzTZqkLW', 'PPT', '1', '4kykUHcg5oLrhNDkfCLNYYG', 'Silverline Systems', 'Silverline Systems', '2025-03-31 17:22:09', '2025-03-31 17:22:21');

-- --------------------------------------------------------

--
-- Table structure for table `terminationtypes`
--

CREATE TABLE `terminationtypes` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `client_id` varchar(255) NOT NULL,
  `created_by` varchar(255) DEFAULT NULL,
  `updated_by` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tickets`
--

CREATE TABLE `tickets` (
  `id` varchar(255) NOT NULL,
  `requestor` varchar(255) NOT NULL,
  `requestorName` varchar(255) DEFAULT NULL,
  `assignGroup` varchar(255) DEFAULT NULL,
  `agent` varchar(255) DEFAULT NULL,
  `project` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `ticketSubject` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `file` varchar(255) DEFAULT NULL,
  `priority` varchar(255) DEFAULT NULL,
  `channelName` varchar(255) DEFAULT NULL,
  `status` varchar(255) NOT NULL,
  `tag` varchar(255) DEFAULT NULL,
  `client_id` varchar(255) NOT NULL,
  `created_by` varchar(255) DEFAULT NULL,
  `updated_by` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `traingingtypes`
--

CREATE TABLE `traingingtypes` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `client_id` varchar(255) NOT NULL,
  `created_by` varchar(255) DEFAULT NULL,
  `updated_by` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `trainings`
--

CREATE TABLE `trainings` (
  `id` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `category` varchar(255) NOT NULL,
  `links` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`links`)),
  `client_id` varchar(255) NOT NULL,
  `created_by` varchar(255) DEFAULT NULL,
  `updated_by` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `transferaccounts`
--

CREATE TABLE `transferaccounts` (
  `id` varchar(255) NOT NULL,
  `fromAccount` varchar(255) NOT NULL,
  `toAccount` varchar(255) NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `date` datetime NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `client_id` varchar(255) NOT NULL,
  `created_by` varchar(255) DEFAULT NULL,
  `updated_by` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` varchar(255) NOT NULL,
  `employeeId` varchar(255) DEFAULT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `role_id` varchar(255) NOT NULL,
  `profilePic` varchar(255) DEFAULT NULL,
  `firstName` varchar(255) DEFAULT NULL,
  `lastName` varchar(255) DEFAULT NULL,
  `phoneCode` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `zipcode` varchar(255) DEFAULT NULL,
  `website` varchar(255) DEFAULT NULL,
  `gender` varchar(255) DEFAULT NULL,
  `joiningDate` datetime DEFAULT NULL,
  `leaveDate` datetime DEFAULT NULL,
  `branch` varchar(255) DEFAULT NULL,
  `department` varchar(255) DEFAULT NULL,
  `designation` varchar(255) DEFAULT NULL,
  `salary` decimal(10,2) DEFAULT NULL,
  `accountholder` varchar(255) DEFAULT NULL,
  `accountnumber` int(11) DEFAULT NULL,
  `bankname` varchar(255) DEFAULT NULL,
  `ifsc` varchar(255) DEFAULT NULL,
  `gstIn` varchar(255) DEFAULT NULL,
  `banklocation` varchar(255) DEFAULT NULL,
  `cv_path` varchar(255) DEFAULT NULL,
  `links` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`links`)),
  `e_signature` varchar(255) DEFAULT NULL,
  `accounttype` varchar(255) DEFAULT NULL,
  `client_id` varchar(255) DEFAULT NULL,
  `client_plan_id` varchar(255) DEFAULT NULL,
  `documents` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`documents`)),
  `conversations` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`conversations`)),
  `resetPasswordOTP` varchar(255) DEFAULT NULL,
  `resetPasswordOTPExpiry` datetime DEFAULT NULL,
  `created_by` varchar(255) DEFAULT NULL,
  `updated_by` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `employeeId`, `username`, `password`, `email`, `role_id`, `profilePic`, `firstName`, `lastName`, `phoneCode`, `phone`, `address`, `state`, `city`, `country`, `zipcode`, `website`, `gender`, `joiningDate`, `leaveDate`, `branch`, `department`, `designation`, `salary`, `accountholder`, `accountnumber`, `bankname`, `ifsc`, `gstIn`, `banklocation`, `cv_path`, `links`, `e_signature`, `accounttype`, `client_id`, `client_plan_id`, `documents`, `conversations`, `resetPasswordOTP`, `resetPasswordOTPExpiry`, `created_by`, `updated_by`, `createdAt`, `updatedAt`) VALUES
('0aMTORQ27wG00Ht5REhq13p', NULL, ' ba.silverline', '$2b$12$NT.meyBZRWfJve/VLDgQo.bwhzGz1ElPJcoihKL2lokuJpOAqHk6W', 'ba.silverline@yopmail.com', 'jdWbdnTrMDss1mxhqXBUhpI', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '4kykUHcg5oLrhNDkfCLNYYG', 'PLGtptJFFV4blMJfFi8AeBR', NULL, '{}', NULL, NULL, 'Silverline Systems', NULL, '2025-03-31 11:31:27', '2025-03-31 11:31:27'),
('4kykUHcg5oLrhNDkfCLNYYG', NULL, 'Silverline Systems', '$2b$12$.2Ia/XUZHrA7BEsLyf6uGuo9wgP9rGamovaR/ICL6YHHBDXVI5nIy', 'silverlinesystems@yopmail.com', 'vI5ukP3myMKhjXXeHsmq1Rj', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'e3qTU0bEmlIvYu8v4jFmjxv', 'PLGtptJFFV4blMJfFi8AeBR', NULL, '{}', NULL, NULL, 'superadmin', NULL, '2025-03-31 09:41:22', '2025-03-31 10:13:55'),
('7aRxfVTXsxd31PyBz9WzEjx', NULL, 'Quantum Enterprises', '$2b$12$OCduts6PI5L0YSEOVKT73uvS2zlUOaAPNMKWIxOO8tA/YpS1K.TRS', 'quantumeenterprises@yopmail.com', 'vI5ukP3myMKhjXXeHsmq1Rj', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'e3qTU0bEmlIvYu8v4jFmjxv', NULL, NULL, '{}', NULL, NULL, 'superadmin', NULL, '2025-03-31 09:30:53', '2025-03-31 09:30:53'),
('8v2FNBB31ognrYtRiqdgCVu', 'EMP#4', 'neha.singh', '$2b$12$TwPd6LVLsRlu/sI3bD7iuu0bqeeOYz5gXsjRT4Z4YDOLID3LHjVIG', 'neha.singh.silverline@yopmail.com', 'xqmOVHGdkwfQR93yXHRQg0c', NULL, 'Neha ', 'Singh', NULL, '6543210987', 'Silicon Towers\n567/A Tech Park Road\nElectronic City Phase 2\nPune, Maharashtra - 411057', NULL, NULL, NULL, NULL, NULL, 'female', '2024-02-15 00:00:00', '2025-03-29 00:00:00', 'UH8lBWZZAkctwuRFiCz5PMB', '8Yhv5i8Eu5y3rn3kJLY8VWC', 'flbhBdf5hBLZTNbwhc12BY7', 7000.00, ' John Smith', 920, 'Zephania Dominguez', 'Non est voluptates ', NULL, 'Proident culpa in i', NULL, NULL, NULL, NULL, '4kykUHcg5oLrhNDkfCLNYYG', NULL, NULL, '{}', NULL, NULL, 'Silverline Systems', NULL, '2025-03-31 12:53:17', '2025-03-31 12:53:17'),
('9VDWw1NRr3hnVRf82reZODt', NULL, 'Quantum Innovations', '$2b$12$mn0gG674rbqCn0UiYh7kuuZPDY.iZquWfgnPbgjYrwphrOOTtty86', 'quantum.innovations@yopmail.com', 'hQG7DPggtFQUMhEUdJjADL3', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '4kykUHcg5oLrhNDkfCLNYYG', NULL, NULL, '{}', NULL, NULL, 'Silverline Systems', NULL, '2025-03-31 11:53:36', '2025-03-31 11:53:36'),
('AsPoso1y1OL5uY5URy57ZPw', NULL, 'GreenLeaf Solutions', '$2b$12$jdkUAwOHEDU4Li1jNErGY.aJ/pFQwK8d9.7d8diQpXEj06F83taGG', 'greenleafsolutions@yopmail.com', 'vI5ukP3myMKhjXXeHsmq1Rj', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'e3qTU0bEmlIvYu8v4jFmjxv', NULL, NULL, '{}', NULL, NULL, 'superadmin', NULL, '2025-03-31 09:29:46', '2025-03-31 09:29:46'),
('Bot3GuoPgOHloKvTPRtcz2A', NULL, 'Stellar Innovations', '$2b$12$sSwouxycm.aoS6v28azzH.ZLAlo/PnAPu3sDrGPg/YqoWIkBbNiZ2', 'stellarinnovations@yopmail.com', 'vI5ukP3myMKhjXXeHsmq1Rj', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'e3qTU0bEmlIvYu8v4jFmjxv', NULL, NULL, '{}', NULL, NULL, 'superadmin', NULL, '2025-03-31 09:33:59', '2025-03-31 09:33:59'),
('e5ESgU0K4XFQMWlwlcdl89T', NULL, 'Evergreen Industries', '$2b$12$GQceEtTd1NESG/J5mg.Q8.AEIKJ1gsMMS2xbNVdjDePNTlMLFvLiS', 'evergreenindustries@yopmail.com', 'vI5ukP3myMKhjXXeHsmq1Rj', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'e3qTU0bEmlIvYu8v4jFmjxv', NULL, NULL, '{}', NULL, NULL, 'superadmin', NULL, '2025-03-31 09:36:52', '2025-03-31 09:36:52'),
('eEE5wWfTDjJP7MO9awu0JQZ', NULL, 'DigiSmart Enterprises', '$2b$12$6Ei8OTQDXDYsxBVNG6nPqOMr0K/33YaLZkHvlt5kKa5xeluANY0Y6', 'digiSmart.enterprises@yopmail.com', 'hQG7DPggtFQUMhEUdJjADL3', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '4kykUHcg5oLrhNDkfCLNYYG', NULL, NULL, '{}', NULL, NULL, 'Silverline Systems', NULL, '2025-03-31 11:57:20', '2025-03-31 11:57:20'),
('EYxL2jumtV4h2riCxEXLcGp', NULL, 'BlueWave Consulting', '$2b$12$YSZw14ngvPc.uopSO5xqLe71lG8Jj6beHaUcWNNmcb8d7U5DMuyLO', 'bluewaveconsulting@yopmail.com', 'vI5ukP3myMKhjXXeHsmq1Rj', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'e3qTU0bEmlIvYu8v4jFmjxv', NULL, NULL, '{}', NULL, NULL, 'superadmin', NULL, '2025-03-31 09:32:32', '2025-03-31 09:32:32'),
('fR58rBlXFTFi9u64oC62lLr', NULL, 'support.silverline', '$2b$12$rGhm/uJl0JyfuE4eZU3Kv.Zv3c8NZMZCx6KDl1pGlOKxaAJ3S4Bei', 'support.silverline@yopmail.com', '28RtGJ3pSZXAZTC5FKpuGMR', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '4kykUHcg5oLrhNDkfCLNYYG', 'PLGtptJFFV4blMJfFi8AeBR', NULL, '{}', NULL, NULL, 'Silverline Systems', NULL, '2025-03-31 11:26:50', '2025-03-31 11:26:50'),
('hzi3vKjwD5o8JREMxv9BrUS', NULL, 'DataCore Analytics', '$2b$12$EGLvE/xCB87DkFF3J/PIDuL742EbM0c5kY9odBm1lr3jSSubXJa9m', 'datacore.analytics@yopmail.com', 'hQG7DPggtFQUMhEUdJjADL3', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '4kykUHcg5oLrhNDkfCLNYYG', NULL, NULL, '{}', NULL, NULL, 'Silverline Systems', NULL, '2025-03-31 11:54:54', '2025-03-31 11:54:54'),
('lsA3bWwiHYURgcxV1p9JKYL', NULL, 'Phoenix Analytics', '$2b$12$qhlmQIBlPSkBmd8bSrR6TuNXaKj2ZxizAzBnC0rsW6183P/EiK2hu', 'phoenixanalytics@yopmail.com', 'vI5ukP3myMKhjXXeHsmq1Rj', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'e3qTU0bEmlIvYu8v4jFmjxv', NULL, NULL, '{}', NULL, NULL, 'superadmin', NULL, '2025-03-31 09:39:39', '2025-03-31 09:39:39'),
('M3kofTRJDv4cm25SZetXgro', NULL, 'Horizon Ventures', '$2b$12$7iomIkkNQiLfMaVbM8UOkeBEs2xHtb/JaeO5kmdbnzxGYTyr5r76C', 'horizonventures@yopmail.com', 'vI5ukP3myMKhjXXeHsmq1Rj', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'e3qTU0bEmlIvYu8v4jFmjxv', NULL, NULL, '{}', NULL, NULL, 'superadmin', NULL, '2025-03-31 09:43:22', '2025-03-31 09:43:22'),
('qOaIRiAfmmGcldnDcUAd51J', 'EMP#3', 'amit.kumar', '$2b$12$IhhZ5UUIkLAYY6.S9Tv4oeRGDwZGaPWGExusQ1ytrJ1qKG4K2T0ye', 'amit.kumar.silverline@yopmail.com', 'xqmOVHGdkwfQR93yXHRQg0c', NULL, 'Amit ', 'Kumar', NULL, '7654321098', 'Royal Meadows\nPlot No. 78, Palm Street\nJubilee Hills, Road No. 5\nHyderabad, Telangana - 500033', NULL, NULL, NULL, NULL, NULL, 'male', '2024-01-20 00:00:00', '2025-03-31 12:47:35', 'haQEJiCePwC0KeJsmUWsSZ7', 'mXwMtsZBDZktY3YRkoRvAvi', 'X2KYPor0OTGDRcP4b0h9nE5', 40000.00, 'At quia ut tempore ', 252, 'Zephania Dominguez', 'Non est voluptates ', NULL, 'Consequatur quas qua', NULL, NULL, NULL, NULL, '4kykUHcg5oLrhNDkfCLNYYG', NULL, NULL, '{}', NULL, NULL, 'Silverline Systems', NULL, '2025-03-31 12:48:50', '2025-03-31 12:48:50'),
('RDyEgAxQ5cdETq1XejlCWxe', 'EMP#2', 'priya.patel', '$2b$12$jpkKDi16nF/hELIGR1p5UeiUMrLo1R5pzTxjiWFR40gJrOH480PSC', 'priya.patel.silverline@yopmail.com', 'xqmOVHGdkwfQR93yXHRQg0c', NULL, 'priya', 'patel', NULL, '8765432109', 'Green Valley Residency\n45/B Sunflower Lane\nBehind City Hospital\nBangalore, Karnataka - 560034', NULL, NULL, NULL, NULL, NULL, 'female', '2024-02-01 00:00:00', '2025-03-29 00:00:00', 'bjHlRDFkaJBOh3kg2EP52VH', 'WpZ22PfzjzV1wJkWa5vjaRv', 'K3jNwVDdbFPaIah2U3nBh9B', 12000.00, 'At quia ut tempore ', 252, 'Amelia Powell', 'Dolore libero tempor', NULL, 'In non adipisci exce', NULL, NULL, NULL, NULL, '4kykUHcg5oLrhNDkfCLNYYG', NULL, NULL, '{}', NULL, NULL, 'Silverline Systems', NULL, '2025-03-31 12:45:25', '2025-03-31 12:45:25'),
('rk7q1WH2njPnIORx6OzH49x', NULL, 'tech.silverline', '$2b$12$rDjfS7uxMpaitCdr9uhhmOmvbCmPjZsU3znkcLjn49Vm76PqhNtRi', 'techsilverline@yopmail.com', 'SE8IBig8OMMQRI2yX7Exzhm', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '4kykUHcg5oLrhNDkfCLNYYG', 'PLGtptJFFV4blMJfFi8AeBR', NULL, '{}', NULL, NULL, 'Silverline Systems', NULL, '2025-03-31 11:19:06', '2025-03-31 11:19:06'),
('tawmdBbwDXMrKoMp57lQPEJ', NULL, 'Apex Global Trading', '$2b$12$HbSBJjNLEDCG8GoV5pN7jusMZk3yy.hO7rRzzz6WUdzkqVBOvV7uG', 'apexglobaltrading@yopmail.com', 'vI5ukP3myMKhjXXeHsmq1Rj', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'e3qTU0bEmlIvYu8v4jFmjxv', NULL, NULL, '{}', NULL, NULL, 'superadmin', NULL, '2025-03-31 09:35:06', '2025-03-31 09:35:06'),
('uBBcPYUpKbh5h7xlj3OIwrE', NULL, 'CloudBridge Technologies', '$2b$12$55qnHzzNVqG74GNxMGmU4OyUN7j3ciJYmWR/5jePA.dfrrALYyCCS', 'cloudBridge.technologies@yopmail.com', 'hQG7DPggtFQUMhEUdJjADL3', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '4kykUHcg5oLrhNDkfCLNYYG', NULL, NULL, '{}', NULL, NULL, 'Silverline Systems', NULL, '2025-03-31 11:56:13', '2025-03-31 11:56:13'),
('uRxNhU6mrI44fedl6HiOBYM', 'EMP#1', 'rahul.sharma', '$2b$12$TQXuI3L/vn0vhGz/aZquW.mKH0e1x/.CSBj9q7nfFmkuLURsdmSPi', 'rahul.sharma.silverline@yopmail.com', 'xqmOVHGdkwfQR93yXHRQg0c', NULL, 'Rahul ', 'Sharma', NULL, '9876543210', '123 Maple Avenue, Crystal Park\nNear Central Mall, Sector 15\nMumbai, Maharashtra - 400001', NULL, NULL, NULL, NULL, NULL, 'male', '2015-01-15 00:00:00', '2026-03-20 00:00:00', 'UH8lBWZZAkctwuRFiCz5PMB', '6aVUek1kX78VHjoDjhnJDAD', 'UUBCv7KfYd6JRjBUizsgD4o', 8000.00, 'At quia ut tempore ', 920, 'Robert Rollins', 'Non est voluptates ', NULL, 'In non adipisci exce', NULL, NULL, NULL, NULL, '4kykUHcg5oLrhNDkfCLNYYG', NULL, NULL, '{}', NULL, NULL, 'Silverline Systems', NULL, '2025-03-31 12:40:57', '2025-03-31 12:40:57'),
('W3LxNVQLCC7zrhxTyTlBnvz', NULL, 'pm.silverline', '$2b$12$NI0zKERwv2WACUaBqJ25s.tDuPK2dcopgxx53of.L8Ij5UIWYqlG6', 'pm.silverline@yopmail.com', 'pcmMgRgxCKK2LPLL2SXqjep', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '4kykUHcg5oLrhNDkfCLNYYG', 'PLGtptJFFV4blMJfFi8AeBR', NULL, '{}', NULL, NULL, 'Silverline Systems', NULL, '2025-03-31 11:17:06', '2025-03-31 11:17:06'),
('Wek9GHYyp9ebFwzjFZHtuvA', NULL, 'TechVision Dynamics', '$2b$12$9kHm79TeiEE8cMBO54AwgOqIV8w6C4965S4Psi2k8hZg6nsMYimuC', 'techVisiondynamics@yopmail.com', 'vI5ukP3myMKhjXXeHsmq1Rj', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'e3qTU0bEmlIvYu8v4jFmjxv', NULL, NULL, '{}', NULL, NULL, 'superadmin', NULL, '2025-03-31 09:27:31', '2025-03-31 09:27:31'),
('wPHc9cisqOzzpTW0MpzX8pR', NULL, 'admin.silverline', '$2b$12$fRFG3S0v5t0cfnSC5CSHDOdRsG.L8UIjol5Yt5ee7FlyV6AzLQW/e', 'admin.silverline@yopmail.com', '03qarcBedPhsVY3A1IKMMyW', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '4kykUHcg5oLrhNDkfCLNYYG', 'PLGtptJFFV4blMJfFi8AeBR', NULL, '{}', NULL, NULL, 'Silverline Systems', NULL, '2025-03-31 11:15:12', '2025-03-31 11:15:12'),
('ydriIPjLyAPT1OGipF5IHsY', 'EMP#5', ' sneha.gupta', '$2b$12$lYguxIGa5iNI1BIOFSujEePN1gCJYtFDj9.gQUAD7F/PC/kDQaBK6', 'sneha.gupta.silverline@yopmail.com', 'xqmOVHGdkwfQR93yXHRQg0c', NULL, 'Sneha ', 'Gupta', NULL, '4321098765', 'Golden Plaza\n892 Ring Road\nNear Metro Station, Rajouri Garden\nNew Delhi - 110027', NULL, NULL, NULL, NULL, NULL, 'female', '2024-01-20 00:00:00', '2025-03-27 00:00:00', 'bjHlRDFkaJBOh3kg2EP52VH', 'pUzEV1Givmo50CcSeJCyz5V', 'ZNJ9V5UAAoNO3DhdXGoYFr9', 70000.00, 'At quia ut tempore ', 252, 'Amelia Powell', 'Dolore libero tempor', NULL, 'Proident culpa in i', NULL, NULL, NULL, NULL, '4kykUHcg5oLrhNDkfCLNYYG', NULL, NULL, '{}', NULL, NULL, 'Silverline Systems', NULL, '2025-03-31 12:55:42', '2025-03-31 12:55:42'),
('yxycYESzDheRycH00QSw3sc', NULL, 'TechPro Solutions', '$2b$12$s/h5jUhubCRhTgMo0Fyev.INqHMG7Ir5UL6kh8kdqpfuqT3fCyE3C', 'techpro.solutions@yopmail.com', 'hQG7DPggtFQUMhEUdJjADL3', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '4kykUHcg5oLrhNDkfCLNYYG', NULL, NULL, '{}', NULL, NULL, 'Silverline Systems', NULL, '2025-03-31 11:47:31', '2025-03-31 11:47:31');

-- --------------------------------------------------------

--
-- Table structure for table `vendors`
--

CREATE TABLE `vendors` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `contact` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `taxNumber` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `city` varchar(255) NOT NULL,
  `state` varchar(255) NOT NULL,
  `country` varchar(255) NOT NULL,
  `zipcode` varchar(255) NOT NULL,
  `client_id` varchar(255) NOT NULL,
  `created_by` varchar(255) DEFAULT NULL,
  `updated_by` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `accounts`
--
ALTER TABLE `accounts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`),
  ADD UNIQUE KEY `accountNumber` (`accountNumber`);

--
-- Indexes for table `activities`
--
ALTER TABLE `activities`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Indexes for table `allowanceoptions`
--
ALTER TABLE `allowanceoptions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `allowances`
--
ALTER TABLE `allowances`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Indexes for table `announcements`
--
ALTER TABLE `announcements`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Indexes for table `appraisals`
--
ALTER TABLE `appraisals`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Indexes for table `attendances`
--
ALTER TABLE `attendances`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Indexes for table `audittrails`
--
ALTER TABLE `audittrails`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Indexes for table `awards`
--
ALTER TABLE `awards`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Indexes for table `awardtypes`
--
ALTER TABLE `awardtypes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `billdebitnotes`
--
ALTER TABLE `billdebitnotes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Indexes for table `bills`
--
ALTER TABLE `bills`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`),
  ADD UNIQUE KEY `billNumber` (`billNumber`);

--
-- Indexes for table `bill_payments`
--
ALTER TABLE `bill_payments`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Indexes for table `branches`
--
ALTER TABLE `branches`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Indexes for table `calendars`
--
ALTER TABLE `calendars`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Indexes for table `clientsubscriptions`
--
ALTER TABLE `clientsubscriptions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Indexes for table `commissions`
--
ALTER TABLE `commissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Indexes for table `competencies`
--
ALTER TABLE `competencies`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `contracts`
--
ALTER TABLE `contracts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `subject` (`subject`),
  ADD UNIQUE KEY `id` (`id`),
  ADD UNIQUE KEY `contract_number` (`contract_number`);

--
-- Indexes for table `countries`
--
ALTER TABLE `countries`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`),
  ADD UNIQUE KEY `countryName` (`countryName`),
  ADD UNIQUE KEY `countryCode` (`countryCode`),
  ADD UNIQUE KEY `phoneCode` (`phoneCode`);

--
-- Indexes for table `currencies`
--
ALTER TABLE `currencies`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`),
  ADD UNIQUE KEY `currencyName` (`currencyName`),
  ADD UNIQUE KEY `currencyCode` (`currencyCode`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`),
  ADD UNIQUE KEY `customerNumber` (`customerNumber`);

--
-- Indexes for table `deals`
--
ALTER TABLE `deals`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `dealName` (`dealName`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Indexes for table `deductionoptions`
--
ALTER TABLE `deductionoptions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `deductions`
--
ALTER TABLE `deductions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Indexes for table `departments`
--
ALTER TABLE `departments`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Indexes for table `designations`
--
ALTER TABLE `designations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Indexes for table `documents`
--
ALTER TABLE `documents`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `documenttypes`
--
ALTER TABLE `documenttypes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `emails`
--
ALTER TABLE `emails`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Indexes for table `esignatures`
--
ALTER TABLE `esignatures`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Indexes for table `expenses`
--
ALTER TABLE `expenses`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Indexes for table `features`
--
ALTER TABLE `features`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`),
  ADD UNIQUE KEY `featureName` (`featureName`);

--
-- Indexes for table `followups`
--
ALTER TABLE `followups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `goaltypes`
--
ALTER TABLE `goaltypes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `goal_trackings`
--
ALTER TABLE `goal_trackings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Indexes for table `holidays`
--
ALTER TABLE `holidays`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Indexes for table `indicators`
--
ALTER TABLE `indicators`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Indexes for table `inquiries`
--
ALTER TABLE `inquiries`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Indexes for table `interview_schedules`
--
ALTER TABLE `interview_schedules`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Indexes for table `invoices`
--
ALTER TABLE `invoices`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`),
  ADD UNIQUE KEY `invoiceNumber` (`invoiceNumber`);

--
-- Indexes for table `jobcategories`
--
ALTER TABLE `jobcategories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Indexes for table `jobonboardings`
--
ALTER TABLE `jobonboardings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Indexes for table `jobstages`
--
ALTER TABLE `jobstages`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Indexes for table `job_applications`
--
ALTER TABLE `job_applications`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Indexes for table `leads`
--
ALTER TABLE `leads`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Indexes for table `leaves`
--
ALTER TABLE `leaves`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Indexes for table `leavetypes`
--
ALTER TABLE `leavetypes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`),
  ADD UNIQUE KEY `leaveType` (`leaveType`);

--
-- Indexes for table `loanoptions`
--
ALTER TABLE `loanoptions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `loans`
--
ALTER TABLE `loans`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Indexes for table `meetings`
--
ALTER TABLE `meetings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Indexes for table `milestones`
--
ALTER TABLE `milestones`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Indexes for table `notes`
--
ALTER TABLE `notes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Indexes for table `offerletters`
--
ALTER TABLE `offerletters`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`),
  ADD UNIQUE KEY `orderNumber` (`orderNumber`);

--
-- Indexes for table `otherpayments`
--
ALTER TABLE `otherpayments`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Indexes for table `overtimes`
--
ALTER TABLE `overtimes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Indexes for table `paysliptypes`
--
ALTER TABLE `paysliptypes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `performancetypes`
--
ALTER TABLE `performancetypes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Indexes for table `pipelines`
--
ALTER TABLE `pipelines`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Indexes for table `policies`
--
ALTER TABLE `policies`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Indexes for table `projectreports`
--
ALTER TABLE `projectreports`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Indexes for table `projects`
--
ALTER TABLE `projects`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`),
  ADD UNIQUE KEY `project_name` (`project_name`);

--
-- Indexes for table `proposals`
--
ALTER TABLE `proposals`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `quotations`
--
ALTER TABLE `quotations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`),
  ADD UNIQUE KEY `quotationNumber` (`quotationNumber`);

--
-- Indexes for table `reminders`
--
ALTER TABLE `reminders`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Indexes for table `salaries`
--
ALTER TABLE `salaries`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Indexes for table `sales_creditnotes`
--
ALTER TABLE `sales_creditnotes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Indexes for table `sales_invoices`
--
ALTER TABLE `sales_invoices`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`),
  ADD UNIQUE KEY `salesInvoiceNumber` (`salesInvoiceNumber`);

--
-- Indexes for table `sales_quotations`
--
ALTER TABLE `sales_quotations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`),
  ADD UNIQUE KEY `salesQuotationNumber` (`salesQuotationNumber`);

--
-- Indexes for table `sales_revenues`
--
ALTER TABLE `sales_revenues`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Indexes for table `skills`
--
ALTER TABLE `skills`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Indexes for table `stages`
--
ALTER TABLE `stages`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Indexes for table `subscriptionplans`
--
ALTER TABLE `subscriptionplans`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Indexes for table `superadmins`
--
ALTER TABLE `superadmins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `id` (`id`),
  ADD UNIQUE KEY `phone` (`phone`),
  ADD KEY `role_id` (`role_id`);

--
-- Indexes for table `tags`
--
ALTER TABLE `tags`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Indexes for table `taskcalendars`
--
ALTER TABLE `taskcalendars`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Indexes for table `tasks`
--
ALTER TABLE `tasks`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `taxes`
--
ALTER TABLE `taxes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`),
  ADD UNIQUE KEY `gstName` (`gstName`),
  ADD UNIQUE KEY `gstPercentage` (`gstPercentage`);

--
-- Indexes for table `terminationtypes`
--
ALTER TABLE `terminationtypes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `tickets`
--
ALTER TABLE `tickets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `traingingtypes`
--
ALTER TABLE `traingingtypes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `trainings`
--
ALTER TABLE `trainings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Indexes for table `transferaccounts`
--
ALTER TABLE `transferaccounts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `id` (`id`),
  ADD UNIQUE KEY `phone` (`phone`),
  ADD KEY `role_id` (`role_id`);

--
-- Indexes for table `vendors`
--
ALTER TABLE `vendors`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `superadmins`
--
ALTER TABLE `superadmins`
  ADD CONSTRAINT `superadmins_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
