-- 
--  Demo database : customer_relationships
--  MySQL 8
--

--
-- Table structure for table `city`
--

DROP TABLE IF EXISTS `city`;
CREATE TABLE `city` (
  `insee_code` char(5) NOT NULL,
  `postal_code` char(5) NOT NULL,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`insee_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Table structure for table `company`
--

DROP TABLE IF EXISTS `company`;
CREATE TABLE `company` (
  `siren` char(9) NOT NULL,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`siren`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
CREATE TABLE `customer` (
  `insee_code` varchar(45) NOT NULL,
  `lastname` varchar(45) NOT NULL,
  `firstname` varchar(45) DEFAULT NULL,
  `birthdate` date NOT NULL,
  `company_siren` char(9) NOT NULL,
  `city_insee_code` char(5) NOT NULL,
  PRIMARY KEY (`insee_code`),
  KEY `fk_customer_company_idx` (`company_siren`),
  KEY `fk_customer_city1_idx` (`city_insee_code`),
  CONSTRAINT `fk_customer_city1` FOREIGN KEY (`city_insee_code`) REFERENCES `city` (`insee_code`),
  CONSTRAINT `fk_customer_company` FOREIGN KEY (`company_siren`) REFERENCES `company` (`siren`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Table structure for table `command`
--
DROP TABLE IF EXISTS `command`;
CREATE TABLE `command` (
  `command_id` char(5) NOT NULL,
  `command_date` date NOT NULL,
  `command_amount` DECIMAL,
  `customer_insee_code` varchar(45) NOT NULL,
  PRIMARY KEY (`command_id`),
  KEY `fk_command_to_customer_idx` (`customer_insee_code`),
  CONSTRAINT `fk_command_to_customer` FOREIGN KEY (`customer_insee_code`) REFERENCES `customer` (`insee_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;


--
--  Some datas
--
INSERT INTO `city`
VALUES 
    ('13055','13000','MARSEILLE'),('31555','31000','TOULOUSE'),('33055','33000','BORDEAUX'),('45055','45000','ORLEANS');


INSERT INTO `company` 
VALUES 
    ('111222333','Ludwig'),('555666777','Aélion'),('888999000','Logyx');

INSERT INTO `customer` 
VALUES 
    ('1680403','AUBERT','Jean-Luc','1968-04-30','555666777','31555'),
    ('1920244','TALUT','Jean','1992-02-22','888999000','45055'),
    ('1980463','TALUT','Jean','1998-04-04','555666777','31555'),
    ('2091012','MIRANDE','Nicole','1992-10-20','111222333','31555'),
    ('2920945','CLERC','Delphine','1992-10-12','111222333','33055');

INSERT INTO `command` (`command_id`, `command_date`, `command_amount`, `customer_insee_code`) VALUES
('C0001', '2024-01-15', 156.78, '1680403'),
('C0002', '2024-01-17', 89.99, '1920244'),
('C0003', '2024-01-20', 234.56, '1980463'),
('C0004', '2024-01-22', 45.67, '2091012'),
('C0005', '2024-01-25', 789.12, '2920945'),
('C0006', '2024-01-28', 123.45, '1680403'),
('C0007', '2024-02-01', 67.89, '1920244'),
('C0008', '2024-02-03', 345.67, '1980463'),
('C0009', '2024-02-05', 234.56, '2091012'),
('C0010', '2024-02-08', 890.12, '2920945'),
('C0011', '2024-02-10', 45.67, '1680403'),
('C0012', '2024-02-12', 678.90, '1920244'),
('C0013', '2024-02-15', 123.45, '1980463'),
('C0014', '2024-02-18', 567.89, '2091012'),
('C0015', '2024-02-20', 234.56, '2920945'),
('C0016', '2024-02-23', 890.12, '1680403'),
('C0017', '2024-02-25', 45.67, '1920244'),
('C0018', '2024-02-28', 345.67, '1980463'),
('C0019', '2024-03-02', 678.90, '2091012'),
('C0020', '2024-03-05', 123.45, '2920945'),
('C0021', '2024-03-08', 567.89, '1680403'),
('C0022', '2024-03-10', 234.56, '1920244'),
('C0023', '2024-03-13', 890.12, '1980463'),
('C0024', '2024-03-15', 45.67, '2091012'),
('C0025', '2024-03-18', 345.67, '2920945'),
('C0026', '2024-03-20', 678.90, '1680403'),
('C0027', '2024-03-23', 123.45, '1920244'),
('C0028', '2024-03-25', 567.89, '1980463'),
('C0029', '2024-03-28', 234.56, '2091012'),
('C0030', '2024-03-30', 890.12, '2920945'),
('C0031', '2024-04-02', 45.67, '1680403'),
('C0032', '2024-04-05', 345.67, '1920244'),
('C0033', '2024-04-08', 678.90, '1980463'),
('C0034', '2024-04-10', 123.45, '2091012'),
('C0035', '2024-04-13', 567.89, '2920945'),
('C0036', '2024-04-15', 234.56, '1680403'),
('C0037', '2024-04-18', 890.12, '1920244'),
('C0038', '2024-04-20', 45.67, '1980463'),
('C0039', '2024-04-23', 345.67, '2091012'),
('C0040', '2024-04-25', 678.90, '2920945'),
('C0041', '2024-04-28', 123.45, '1680403'),
('C0042', '2024-04-30', 567.89, '1920244'),
('C0043', '2024-05-03', 234.56, '1980463'),
('C0044', '2024-05-05', 890.12, '2091012'),
('C0045', '2024-05-08', 45.67, '2920945'),
('C0046', '2024-05-10', 345.67, '1680403'),
('C0047', '2024-05-13', 678.90, '1920244'),
('C0048', '2024-05-15', 123.45, '1980463'),
('C0049', '2024-05-18', 567.89, '2091012'),
('C0050', '2024-05-20', 234.56, '2920945'),
('C0051', '2024-05-23', 890.12, '1680403'),
('C0052', '2024-05-25', 45.67, '1920244'),
('C0053', '2024-05-28', 345.67, '1980463'),
('C0054', '2024-05-30', 678.90, '2091012'),
('C0055', '2024-06-02', 123.45, '2920945'),
('C0056', '2024-06-05', 567.89, '1680403'),
('C0057', '2024-06-08', 234.56, '1920244'),
('C0058', '2024-06-10', 890.12, '1980463'),
('C0059', '2024-06-13', 45.67, '2091012'),
('C0060', '2024-06-15', 345.67, '2920945'),
('C0061', '2024-06-18', 678.90, '1680403'),
('C0062', '2024-06-20', 123.45, '1920244'),
('C0063', '2024-06-23', 567.89, '1980463'),
('C0064', '2024-06-25', 234.56, '2091012'),
('C0065', '2024-06-28', 890.12, '2920945'),
('C0066', '2024-06-30', 45.67, '1680403'),
('C0067', '2024-07-03', 345.67, '1920244'),
('C0068', '2024-07-05', 678.90, '1980463'),
('C0069', '2024-07-08', 123.45, '2091012'),
('C0070', '2024-07-10', 567.89, '2920945'),
('C0071', '2024-07-13', 234.56, '1680403'),
('C0072', '2024-07-15', 890.12, '1920244'),
('C0073', '2024-07-18', 45.67, '1980463'),
('C0074', '2024-07-20', 345.67, '2091012'),
('C0075', '2024-07-23', 678.90, '2920945'),
('C0076', '2024-07-25', 123.45, '1680403'),
('C0077', '2024-07-28', 567.89, '1920244'),
('C0078', '2024-07-30', 234.56, '1980463'),
('C0079', '2024-08-02', 890.12, '2091012'),
('C0080', '2024-08-05', 45.67, '2920945'),
('C0081', '2024-08-08', 345.67, '1680403'),
('C0082', '2024-08-10', 678.90, '1920244'),
('C0083', '2024-08-13', 123.45, '1980463'),
('C0084', '2024-08-15', 567.89, '2091012'),
('C0085', '2024-08-18', 234.56, '2920945'),
('C0086', '2024-08-20', 890.12, '1680403'),
('C0087', '2024-08-23', 45.67, '1920244'),
('C0088', '2024-08-25', 345.67, '1980463'),
('C0089', '2024-08-28', 678.90, '2091012'),
('C0090', '2024-08-30', 123.45, '2920945'),
('C0091', '2024-09-02', 567.89, '1680403'),
('C0092', '2024-09-05', 234.56, '1920244'),
('C0093', '2024-09-08', 890.12, '1980463'),
('C0094', '2024-09-10', 45.67, '2091012'),
('C0095', '2024-09-13', 345.67, '2920945'),
('C0096', '2024-09-15', 678.90, '1680403'),
('C0097', '2024-09-18', 123.45, '1920244'),
('C0098', '2024-09-20', 567.89, '1980463'),
('C0099', '2024-09-23', 234.56, '2091012'),
('C0100', '2024-09-25', 890.12, '2920945');
