

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";




CREATE TABLE `admitpatient_room` (
  `PatientID` int(10) NOT NULL,
  `Disease` varchar(50) DEFAULT NULL,
  `AdmitDate` date DEFAULT NULL,
  `RoomNo` int(5) NOT NULL,
  `DoctorID` int(10) NOT NULL,
  `AP_Remarks` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



INSERT INTO `admitpatient_room` (`PatientID`, `Disease`, `AdmitDate`, `RoomNo`, `DoctorID`, `AP_Remarks`) VALUES
(1, 'Typhoid fever', '2022-01-02', 1, 1, 'High temp and weakness.');

-- --------------------------------------------------------



CREATE TABLE `bill_room` (
  `DischargeID` int(5) DEFAULT NULL,
  `BillingDate` date DEFAULT NULL,
  `RoomCharges` int(10) DEFAULT NULL,
  `ServiceCharges` int(10) DEFAULT NULL,
  `PaymentMode` varchar(20) DEFAULT NULL,
  `PaymentModeDetails` varchar(100) DEFAULT NULL,
  `TotalCharges` int(10) DEFAULT NULL,
  `NoOfDays` int(5) DEFAULT NULL,
  `TotalRoomCharges` int(10) DEFAULT NULL,
  `BillNo` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



INSERT INTO `bill_room` (`DischargeID`, `BillingDate`, `RoomCharges`, `ServiceCharges`, `PaymentMode`, `PaymentModeDetails`, `TotalCharges`, `NoOfDays`, `TotalRoomCharges`, `BillNo`) VALUES
(1, '2012-01-12', 5000, 500, 'by Cash', 'Payment done successfully!', 1485500, 297, 1485000, '120150112');

-- --------------------------------------------------------



CREATE TABLE `dischargepatient_room` (
  `AdmitID` int(20) DEFAULT NULL,
  `DischargeDate` date DEFAULT NULL,
  `DP_Remarks` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



INSERT INTO `dischargepatient_room` (`AdmitID`, `DischargeDate`, `DP_Remarks`) VALUES
(1, '2022-01-12', 'Patient recovered successfully!');

-- --------------------------------------------------------



CREATE TABLE `doctor` (
  `DoctorID` int(10) NOT NULL,
  `DoctorName` varchar(20) DEFAULT NULL,
  `FatherName` varchar(20) DEFAULT NULL,
  `Email` varchar(50) DEFAULT NULL,
  `ContacNo` varchar(11) DEFAULT NULL,
  `Qualifications` varchar(50) DEFAULT NULL,
  `Gender` varchar(1) DEFAULT NULL,
  `BloodGroup` varchar(5) DEFAULT NULL,
  `DateOfJoining` date DEFAULT NULL,
  `Address` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `doctor`
--

INSERT INTO `doctor` (`DoctorID`, `DoctorName`, `FatherName`, `Email`, `ContacNo`, `Qualifications`, `Gender`, `BloodGroup`, `DateOfJoining`, `Address`) VALUES
(1, 'Srinjay Maitra', 'Kaushik', 'srinjay@gmail.com ', '9880876532', 'MD,MBBS', 'M', 'A+', '2014-03-20', '108;Jayanagar,Bangalore-560066'),
(2, 'Doc2', 'ABC', 'Doc2@gmail.com', '9880756634', 'MD,MBBS', 'F', 'A-', '2016-01-02', '#111;JP Nagar;Bangalore-560066');

-- --------------------------------------------------------



CREATE TABLE `patientregistration` (
  `PatientID` int(10) NOT NULL,
  `PatientName` varchar(20) DEFAULT NULL,
  `FatherName` varchar(20) DEFAULT NULL,
  `Email` varchar(30) DEFAULT NULL,
  `ContactNo` varchar(11) DEFAULT NULL,
  `Age` int(2) DEFAULT NULL,
  `Remarks` varchar(100) DEFAULT NULL,
  `Gen` varchar(1) DEFAULT NULL,
  `BG` varchar(3) DEFAULT NULL,
  `Address` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



INSERT INTO `patientregistration` (`PatientID`, `PatientName`, `FatherName`, `Email`, `ContactNo`, `Age`, `Remarks`, `Gen`, `BG`, `Address`) VALUES
(1, 'Patient1', 'DEF', 'P1@gmail.com', '09272777334', 25, 'Covid19', 'M', 'C++', 'EC City');

-- --------------------------------------------------------



CREATE TABLE `registration` (
  `name` varchar(20) DEFAULT NULL,
  `user_name` varchar(20) NOT NULL,
  `password` varchar(20) DEFAULT NULL,
  `email_id` varchar(30) DEFAULT NULL,
  `contact_no` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


INSERT INTO `registration` (`name`, `user_name`, `password`, `email_id`, `contact_no`) VALUES
('Sreesha', 'cs503', '503', 'sreeshain20@gmil.com', 6361546961),
('Srinjay', 'cs506', '506', 'msrinjay@gmail.com', 9008021211),
('Bilva Teja', 'cs093', '093', 'bilva@gmail.com', 411621817);


-- --------------------------------------------------------



CREATE TABLE `room` (
  `RoomNo` int(5) NOT NULL,
  `RoomType` varchar(10) DEFAULT NULL,
  `RoomCharges` int(10) DEFAULT NULL,
  `RoomStatus` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



INSERT INTO `room` (`RoomNo`, `RoomType`, `RoomCharges`, `RoomStatus`) VALUES
(1, 'General', 5000, 'Vacant'),
(2, 'General', 2500, 'Vacant'),
(3, 'Deluxe', 10000, 'Booked');

-- --------------------------------------------------------



CREATE TABLE `services` (
  `ServiceName` varchar(20) DEFAULT NULL,
  `ServiceDate` date DEFAULT NULL,
  `PatientID` int(10) DEFAULT NULL,
  `ServiceCharges` int(10) DEFAULT NULL,
  `ServiceID` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



INSERT INTO `services` (`ServiceName`, `ServiceDate`, `PatientID`, `ServiceCharges`, `ServiceID`) VALUES
('General Consultation', '2022-03-01', 11111, 500, 16);

-- --------------------------------------------------------



CREATE TABLE `users` (
  `user_name` varchar(20) NOT NULL,
  `password` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



INSERT INTO `users` (`user_name`, `password`) VALUES
('cs503', '503'),
('cs506', '506'),
('cs093', '093');





ALTER TABLE `admitpatient_room`
  ADD PRIMARY KEY (`PatientID`),
  ADD KEY `RoomNo` (`RoomNo`),
  ADD KEY `DoctorID` (`DoctorID`);


ALTER TABLE `bill_room`
  ADD PRIMARY KEY (`BillNo`);


ALTER TABLE `doctor`
  ADD PRIMARY KEY (`DoctorID`);


ALTER TABLE `patientregistration`
  ADD PRIMARY KEY (`PatientID`);


ALTER TABLE `registration`
  ADD PRIMARY KEY (`user_name`);


ALTER TABLE `room`
  ADD PRIMARY KEY (`RoomNo`);


ALTER TABLE `services`
  ADD PRIMARY KEY (`ServiceID`);


ALTER TABLE `users`
  ADD PRIMARY KEY (`user_name`);


ALTER TABLE `services`
  MODIFY `ServiceID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;


ALTER TABLE `admitpatient_room`
  ADD CONSTRAINT `admitpatient_room_ibfk_1` FOREIGN KEY (`RoomNo`) REFERENCES `room` (`RoomNo`),
  ADD CONSTRAINT `admitpatient_room_ibfk_2` FOREIGN KEY (`DoctorID`) REFERENCES `doctor` (`DoctorID`);
COMMIT;

