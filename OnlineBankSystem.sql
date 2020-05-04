use OnlineBankingSystemDB
go

create table AccountType(
AccountTypeId nvarchar(10) Primary key,
AccountName nvarchar(20) not null
)

INSERT into AccountType(AccountTypeId,AccountName)
VALUES('AT01','Cuurent Account'),
('AT02','Saving Account'),
('AT03','Fixed Deposit'),
('AT04','Recurring Deposit');

select * from AccountType


create table AccountMaster(
     AccountNo int Primary key identity(1000000,1),
	 AccountHolderName nvarchar(100) not null,
	 AccountTypeId nvarchar(10) not null,
	 OpeningBalance money not null,
	 CurrentBalance money not null,
	 OpeningDate date not null,
	 LoanAppliedStatus varchar(5) null,  
	 ChequeBookRequest varchar(5) null,  
     OTP int not null,
     CONSTRAINT FK_AccountMaster_type FOREIGN KEY(AccountTypeId)
	  REFERENCES AccountType(AccountTypeId)
	  )

	  select * from AccountMaster

INSERT into AccountMaster(AccountHolderName,AccountTypeId,OpeningBalance,CurrentBalance,OpeningDate,LoanAppliedStatus,ChequeBookRequest,OTP)
VALUES('Joseph Gale','AT01',1000,13000,'12-03-2000',1,0,10001),
('John Cross','AT02',1300,13460,'12-03-2004',1,1,10002),
('Kiran Kopal','AT02',1300,13045,'11-03-2004',1,0,10003),
('Mohan Singh','AT03',2000,34000,'10-03-2005',1,0,10004),
('Chris Messi','AT01',1000,15000,'12-09-2006',1,1,10005),
('Hitansh Agarwal','AT01',1000,19000,'12-08-2007',1,0,10006),
('Rosaly Welly','AT04',3000,12000,'12-07-2008',1,0,10007),
('Emmaline Watson','AT02',1300,13400,'1-03-2009',1,1,10008),
('Maverick Grey','AT01',1000,14000,'2-05-2010',1,1,10009),
('Corbin Sterling','AT02',1300,13520,'12-06-2012',1,1,10010);


INSERT into AccountMaster(AccountHolderName,AccountTypeId,OpeningBalance,CurrentBalance,OpeningDate,LoanAppliedStatus,ChequeBookRequest,OTP)
values('Kanika Jain','AT02',2000,23520,'12-11-2012',1,1,10011),
('Meenal Sarda','AT02',2300,17020,'12-25-2012',0,0,10012),
('Himanshu Jain','AT01',1300,20500,'12-26-2012',1,1,10013),
('Kushagra Sharma','AT02',1000,19000,'12-29-2012',0,1,10014),
('Vaibhav Ameta','AT02',2300,24000,'02-06-2013',1,0,10015),
('Rajendra Gupta','AT01',1000,16500,'02-21-2013',1,0,10016),
('Cristiano Ronaldo','AT01',2000,18000,'03-01-2013',0,1,10017),
('Chanchal Verma','AT03',2000,28000,'03-13-2013',1,0,10018),
('Rakesh Kumar','AT02',2000,13450,'03-20-2013',1,0,10019),
('Pankaj Advani','AT01',1300,12000,'07-10-2013',0,0,10020),
('Jayesh Ameta','AT03',2300,40000,'08-30-2013',0,1,10021),
('Kritika Khandelwal','AT02',1000,32500,'03-01-2014',1,0,10022),
('Natalia Messi','AT01',3000,29700,'04-16-2014',1,0,10023),
('Lara Jean','AT02',3000,25890,'07-03-2014',1,0,10024),
('Sonali Chadha','AT04',2000,18000,'07-13-2014',1,0,10025)

select * from AccountMaster
drop table AccountMaster

create table Facilities(
AccountId int not null,
AccountTypeId nvarchar(10) not null,
AvailableFacilities nvarchar(50) not null
 CONSTRAINT FK_Account_Facilities FOREIGN KEY(AccountId)
	  REFERENCES AccountMaster(AccountNo),
CONSTRAINT FK_Facilities_AccountType FOREIGN KEY(AccountTypeId)
	  REFERENCES AccountType(AccountTypeId)
)


INSERT INTO Facilities(AccountId,AccountTypeId,AvailableFacilities)
Values(1000000,'AT01','No limit on withdrawls and deposits in home branch'),
(1000001,'AT02','No holding account time limit'),
(1000002,'AT02','Earn interest over deposit'),
(1000003,'AT03','Gives higher rate of interest'),
(1000004,'AT01','No limit on withdrawls'),
(1000005,'AT01','No limit on withdrawls and deposits in home branch'),
(1000006,'AT04','Higher rate of interest'),
(1000007,'AT02','No holding account time limit'),
(1000008,'AT01','Allow Promt Bussiness Transactions'),
(1000009,'AT02','Earn higher interest over deposit');

INSERT INTO Facilities(AccountId,AccountTypeId,AvailableFacilities)
Values(1000010,'AT02','No limit on withdrawls'),
(1000011,'AT02','No limit on withdrawls and deposits in home branch'),
(1000012,'AT01','Earn higher interest over deposit'),
(1000013,'AT02','Gives higher rate of interest'),
(1000014,'AT02','Allow Promt Bussiness Transactions'),
(1000015,'AT01','No limit on withdrawls'),
(1000016,'AT01','Gives higher rate of interest'),
(1000017,'AT03','Allow Promt Bussiness Transactions'),
(1000018,'AT02','No limit on withdrawls and deposits in home branch'),
(1000019,'AT01','Earn higher interest over deposit'),
(1000020,'AT03','No limit on withdrawls and deposits in home branch'),
(1000021,'AT02','No holding account time limit'),
(1000022,'AT01','No holding account time limit'),
(1000023,'AT02','Earn higher interest over deposit'),
(1000024,'AT04','No limit on withdrawls')

select * from Facilities
drop table Facilities

Create table LoanType(
LoanTypeId nvarchar(10) Primary Key,
LoanName nvarchar(20) not null
)

INSERT into LoanType(LoanTypeId,LoanName)
VALUES('LT01','Education Loan'),
('LT02','Home Loan'),
('LT03','Gold Loan'),
('LT04','Personal Loan'),
('LT05','Vechile Loan');

select * from LoanType


create table LoanDetails(
   LoanID int Primary key identity(100,1),
   AccountNo int not null, 
   LoanTypeId nvarchar(10) not null,
   LoanAmount money not null,
   LoanDate date not null,
   MonthlyPayment money not null,
   InterestRate int  null,
   CONSTRAINT FK_Account_Loan FOREIGN KEY(AccountNo)
	  REFERENCES AccountMaster(AccountNo),
  CONSTRAINT FK_Loan_LoanType FOREIGN KEY(LoanTypeId)
	  REFERENCES LoanType(LoanTypeId)
)


INSERT INTO LoanDetails(AccountNo,LoanTypeId,LoanAmount,LoanDate,MonthlyPayment,InterestRate)
Values(1000000,'LT01',100000,convert(date,'29-04-2015' ,103),1000,5),
(1000001,'LT02',120000,convert(date,'29-04-2015',103),12000,12),
(1000002,'LT03',400000,convert(date,'2-04-2016',103),4000,3),
(1000003,'LT04',130000,convert(date,'01-04-2017',103),13000,5),
(1000004,'LT05',500000,convert(date,'11-04-2018',103),5000,6),
(1000005,'LT01',600000,convert(date,'10-04-2004',103),6000,5),
(1000006,'LT02',190000,convert(date,'13-04-2010',103),19000,12),
(1000007,'LT03',120000,convert(date,'3-09-2004',103),12000,3),
(1000008,'LT03',90000,convert(date,'23-05-2020',103),3000,3),
(1000009,'LT05',1500000,convert(date,'2-04-2000',103),1500,6);

INSERT INTO LoanDetails(AccountNo,LoanTypeId,LoanAmount,LoanDate,MonthlyPayment,InterestRate)
Values(1000010,'LT01',200000,convert(date,'29-04-2015' ,103),12500,5),
(1000012,'LT02',2500000,convert(date,'29-04-2018' ,103),15000,3),
(1000014,'LT02',1900000,convert(date,'29-04-2018' ,103),11000,6),
(1000015,'LT05',190000,convert(date,'29-04-2016' ,103),3200,6),
(1000017,'LT04',200000,convert(date,'29-04-2015' ,103),1000,11),
(1000018,'LT01',750000,convert(date,'29-04-2015' ,103),5000,3),
(1000021,'LT05',600000,convert(date,'29-04-2016' ,103),4500,5),
(1000022,'LT01',550000,convert(date,'29-04-2017' ,103),6000,5),
(1000023,'LT02',3100000,convert(date,'29-04-2018' ,103),7000,3),
(1000024,'LT03',800000,convert(date,'29-04-2017' ,103),6500,3)

select * from LoanDetails
drop table LoanDetails

create table WebsiteLogin(
	   UserId int primary key identity(1000,1),
	   AccountNo int not null, 
       UserName nvarchar(100) not null,
	   Password nvarchar(20) not null,
	   OTP int not null,
	   Role varchar(8) default 'Customer'
	   CONSTRAINT FK_Login_user FOREIGN KEY(AccountNo)
	  REFERENCES AccountMaster(AccountNo)
	  )


Insert into WebsiteLogin(AccountNo,UserName,Password,OTP)
	 VALUES(1000000,'Joseph Gale','Jose',10001),
	  (1000001,'John Cross','Joh',10002),
	  (1000002,'Kiran Kopal','Kir',10003),
	  (1000003,'Mohan Singh','Moh',10004),
	  (1000004,'Chris Messi','chr',10005),
	  (1000005,'Hitansh Agarwal','Hit',10006),
	  (1000006,'Rosaly Welly','Rose',10007),
	  (1000007,'Emmaline Watson','Emma',10008),
	  (1000008,'Maverick Grey','Mav',10009),
	  (1000009,'Corbin Sterling','Bin',10010);

Insert into WebsiteLogin(AccountNo,UserName,Password,OTP)
	 VALUES(1000010,'Kanika Jain','kani',10011),
	 (1000011,'Meenal Sarda','meen',10012),
	 (1000012,'Himanshu Jain','hima',10013),
	 (1000013,'Kushagra Sharma','kush',10014),
	 (1000014,'Vaibhav Ameta','vaib',10015),
	 (1000015,'Rajendra Gupta','raje',10016),
	 (1000016,'Cristiano Ronaldo','cris',10017),
	 (1000017,'Chanchal Verma','chan',10018),
	 (1000018,'Rakesh Kumar','rake',10019),
	 (1000019,'Pankaj Advani','pank',10020),
	 (1000020,'Jayesh Ameta','jaye',10021),
	 (1000021,'Kritika Khandelwal','krit',10022),
	 (1000022,'Natalia Messi','nata',10023),
	 (1000023,'Lara Jean','lara',10024),
	 (1000024,'Sonali Chadha','sona',10025)

	 select * from WebsiteLogin


	 create table UserDetails(
    UserId int not null,
	UserName nvarchar(100) not null,
	Password nvarchar(20) not null,
	Email nvarchar(50) not null,
	ContactNo nvarchar(10) not null,
	Gender varchar(10) not null,
	Address nvarchar(50) not null,
	City nvarchar(20) not null,
	State nvarchar(20) not null,
	PinCode int not null
	CONSTRAINT FK_Details_User FOREIGN KEY(UserId)
	REFERENCES WebsiteLogin(UserId)
	);


	INSERT INTO UserDetails(UserId,UserName,Password,Email,ContactNo,Gender,Address,City,State,PinCode)
	Values(1000,'Joseph Gale','Jose','jose345@gmail.com','9234567890','Male','22/j.k nagar' , 'Seattle','Washington',302030),
	(1001,'John Cross','Joh','jack123@gmail.com','9212347890','Male','5-A Road' , 'Gangnam','Seoul',302070),
	(1002,'Kiran Kopal','Kir','kir432@gmail.com','9234512340','Female','2-k nagar' , 'Jaipur','Rajasthan',692030),
	(1003,'Mohan Singh','Moh','moh789@gmail.com','9209877890','Male','lajpat nagar' , 'Mumbai','Maharashtra',345030),
	(1004,'Chris Messi','chr','chr435@gmail.com','9854567890','Male','4-Dance street' , 'Rome','Italy',129030),
	(1005,'Hitansh Agarwal','Hit','hit098@gmail.com','9675467890','Male','ajmer road nagar' , 'surat','Gujarat',201030),
	(1006,'Rosaly Welly','Rose','rose13@gmail.com','9876567890','Female','2-west nagar' , 'Melbourne','Florida',567030),
	(1007,'Emmaline Watson','Emma','emma453@gmail.com','8765567890','Female','3-j street' , 'San Fransisco','California',345030),
	(1008,'Maverick Grey','Mav','mav090@gmail.com','7654567890','Male','shore 4' , 'Rome','Italy',123030),
	(1009,'Corbin Sterling','Bin','bin0101@gmail.com','9543567890','Male','Tat road 2-A' , 'Mumbai','Maharashtra',398730);

	select * from UserDetails

		create table RegisteredUsers(
	   AccountNo int not null,
	  UserId int not null, 
	  UserName nvarchar(100) not null,
	  Password nvarchar(20) not null,
	  CONSTRAINT FK_Register_User FOREIGN KEY(UserId)
	  REFERENCES WebsiteLogin(UserId)
	  )



	  Insert into RegisteredUsers(AccountNo,UserId,UserName,Password)
	  VALUES(1000000,1000,'Joseph Gale','Jose'),
	  (1000001,1001,'John Cross','Joh'),
	  (1000002,1002,'Kiran Kopal','Kir'),
	  (1000003,1003,'Mohan Singh','Moh'),
	  (1000004,1004,'Chris Messi','chr'),
	  (1000005,1005,'Hitansh Agarwal','Hit'),
	  (1000006,1006,'Rosaly Welly','Rose'),
	  (1000007,1007,'Emmaline Watson','Emma'),
	  (1000008,1008,'Maverick Grey','Mav'),
	  (1000009,1009,'Corbin Sterling','Bin');

	  select * from RegisteredUsers


create table Transactions(
	TransactionId int Primary key identity(10001,1),
	DateofTransfer date not null,
	transactionType nvarchar(100) not null,
	AccountNo int not null,
	CONSTRAINT FK_Account_Trans FOREIGN KEY(AccountNo)
	REFERENCES AccountMaster(AccountNo)
)

INSERT INTO Transactions(DateofTransfer,transactionType,AccountNo)
VALUES(convert(date,'02-12-2006',103),'cash',1000000),
(convert(date,'10-02-2007',103),'cash',1000000),
(convert(date,'03-04-2007',103),'cheque',1000000),
(convert(date,'03-04-2007',103),'cash',1000002),
(convert(date,'30-07-2007',103),'cheque',1000004),
(convert(date,'20-01-2008',103),'cash',1000004),
(convert(date,'21-01-2008',103),'cash',1000001),
(convert(date,'29-01-2008',103),'cheque',1000005),
(convert(date,'02-04-2008',103),'cash',1000002),
(convert(date,'25-07-2008',103),'cheque',1000005),
(convert(date,'09-10-2008',103),'cash',1000003),
(convert(date,'12-06-2009',103),'cash',1000003),
(convert(date,'17-04-2010',103),'cash',1000007),
(convert(date,'26-04-2010',103),'cash',1000006),
(convert(date,'01-10-2010',103),'cash',1000003),
(convert(date,'11-03-2011',103),'cash',1000007),
(convert(date,'05-05-2012',103),'cheque',1000008),
(convert(date,'26-12-2012',103),'cash',1000010),
(convert(date,'12-01-2013',103),'cheque',1000009),
(convert(date,'12-01-2013',103),'cheque',1000011),
(convert(date,'15-05-2013',103),'cheque',1000010),
(convert(date,'10-06-2013',103),'cash',1000013),
(convert(date,'21-06-2013',103),'cash',1000012),
(convert(date,'05-09-2013',103),'cash',1000000),
(convert(date,'11-11-2013',103),'cheque',1000006),
(convert(date,'16-11-2013',103),'cash',1000012),
(convert(date,'25-12-2013',103),'cash',1000011),
(convert(date,'13-04-2014',103),'cheque',1000015),
(convert(date,'16-09-2014',103),'cash',1000014),
(convert(date,'16-10-2014',103),'cheque',1000016),
(convert(date,'13-12-2014',103),'cheque',1000017),
(convert(date,'20-12-2014',103),'cheque',1000018),
(convert(date,'20-12-2014',103),'cash',1000019),
(convert(date,'23-12-2014',103),'cash',1000020),
(convert(date,'26-01-2015',103),'cheque',1000021),
(convert(date,'13-02-2015',103),'cash',1000022),
(convert(date,'13-02-2015',103),'cheque',1000023),
(convert(date,'26-02-2015',103),'cash',1000024),
(convert(date,'20-04-2015',103),'cheque',1000008),
(convert(date,'26-04-2015',103),'cheque',1000009),
(convert(date,'03-05-2015',103),'cash',1000010),
(convert(date,'16-07-2015',103),'cash',1000011),
(convert(date,'23-09-2015',103),'cash',1000012),
(convert(date,'12-12-2015',103),'cash',1000013),
(convert(date,'07-04-2016',103),'cheque',1000014),
(convert(date,'17-04-2016',103),'cash',1000015),
(convert(date,'15-05-2016',103),'cash',1000016),
(convert(date,'02-09-2016',103),'cash',1000017),
(convert(date,'13-09-2016',103),'cash',1000018),
(convert(date,'20-04-2017',103),'cash',1000019),
(convert(date,'16-05-2017',103),'cheque',1000020),
(convert(date,'13-06-2017',103),'cash',1000021),
(convert(date,'13-08-2017',103),'cheque',1000022),
(convert(date,'07-10-2017',103),'cheque',1000023),
(convert(date,'16-11-2017',103),'cash',1000024),
(convert(date,'15-12-2017',103),'cash',1000022),
(convert(date,'16-03-2018',103),'cash',1000019),
(convert(date,'19-03-2018',103),'cash',1000000),
(convert(date,'20-04-2018',103),'cash',1000003),
(convert(date,'25-04-2018',103),'cheque',1000008),
(convert(date,'16-05-2018',103),'cash',1000020),
(convert(date,'13-06-2018',103),'cheque',1000022)

select * from Transactions

create table TransferFund(
    TransferId int Primary Key identity(100,1),
	TransactionId int not null,
	FromAccountId int not null,
	ToAccountId int not null,
	DateofTrans datetime not null,
	Amount money not null,
	CONSTRAINT FK_Trans_fund FOREIGN KEY(TransactionId)
	REFERENCES Transactions(TransactionId)
)

drop table TransferFund
select * from TransferFund


INSERT INTO TransferFund(TransactionId,FromAccountId,ToAccountId,DateofTrans,Amount)
	  VALUES(10001,1000000,1000003,convert(date,'02-12-2006',103),120500),
	  (10002,1000000,1000001,convert(date,'10-02-2007',103),15000),
	  (10003,1000000,1000002,convert(date,'03-04-2007',103),12000),
	  (10004,1000002,1000003,convert(date,'03-04-2007',103),200500),
	  (10005,1000004,1000000,convert(date,'30-07-2007',103),3450500),
	  (10006,1000004,1000002,convert(date,'20-01-2008',103),19000),
	  (10007,1000001,1000005,convert(date,'21-01-2008',103),340500),
	  (10008,1000005,1000004,convert(date,'29-01-2008',103),400670),
	  (10009,1000002,1000005,convert(date,'02-04-2008',103),100540),
	  (10010,1000005,1000000,convert(date,'25-07-2008',103),200500),
	  (10011,1000003,1000001,convert(date,'09-10-2008',103),24500),
	  (10012,1000003,1000006,convert(date,'12-06-2009',103),20500),
	  (10013,1000007,1000003,convert(date,'17-04-2010',103),7500),
	  (10014,1000006,1000007,convert(date,'26-04-2010',103),65200),
	  (10015,1000003,1000006,convert(date,'01-10-2010',103),5620),
	  (10016,1000007,1000003,convert(date,'11-03-2011',103),20300),
	  (10017,1000008,1000007,convert(date,'05-05-2012',103),14320),
	  (10018,1000010,1000006,convert(date,'26-12-2012',103),15600),
	  (10019,1000009,1000012,convert(date,'12-01-2013',103),20000),
	  (10020,1000011,1000013,convert(date,'12-01-2013',103),30000),
	  (10021,1000010,1000001,convert(date,'15-05-2013',103),200500),
	  (10022,1000013,1000004,convert(date,'10-06-2013',103),200500),
	  (10023,1000012,1000009,convert(date,'21-06-2013',103),20560),
	  (10024,1000000,1000010,convert(date,'05-09-2013',103),24300),
	  (10025,1000006,1000013,convert(date,'11-11-2013',103),30000),
	  (10026,1000012,1000015,convert(date,'16-11-2013',103),200500),
	  (10027,1000011,1000019,convert(date,'25-12-2013',103),30000),
	  (10028,1000015,1000020,convert(date,'13-04-2014',103),24300),
	  (10029,1000014,1000017,convert(date,'16-09-2014',103),200500),
	  (10030,1000016,1000015,convert(date,'16-10-2014',103),24300),
	  (10031,1000017,1000009,convert(date,'13-12-2014',103),230000),
	  (10032,1000018,1000020,convert(date,'20-12-2014',103),20500),
	  (10033,1000019,1000006,convert(date,'20-12-2014',103),200500),
	  (10034,1000020,1000007,convert(date,'23-12-2014',103),245500),
	  (10035,1000021,1000009,convert(date,'26-01-2015',103),70500),
	  (10036,1000022,1000011,convert(date,'13-02-2015',103),200500),
	  (10037,1000023,1000013,convert(date,'13-02-2015',103),30000),
	  (10038,1000024,1000015,convert(date,'26-02-2015',103),30000),
	  (10039,1000008,1000021,convert(date,'20-04-2015',103),200500),
	  (10040,1000009,1000023,convert(date,'26-04-2015',103),30000),
	  (10041,1000010,1000020,convert(date,'03-05-2015',103),200500),
	  (10042,1000011,1000024,convert(date,'16-07-2015',103),30000),
	  (10043,1000012,1000018,convert(date,'23-09-2015',103),200500),
	  (10044,1000013,1000022,convert(date,'12-12-2015',103),23000),
	  (10045,1000014,1000025,convert(date,'07-04-2016',103),83500),
	  (10046,1000015,1000017,convert(date,'17-04-2016',103),20300),
	  (10047,1000016,1000021,convert(date,'15-05-2016',103),206500),
	  (10048,1000017,1000005,convert(date,'02-09-2016',103),24300),
	  (10049,1000018,1000001,convert(date,'13-09-2016',103),51000),
	  (10050,1000019,1000020,convert(date,'20-04-2017',103),51000),
	  (10051,1000020,1000010,convert(date,'16-05-2017',103),30000),
	  (10052,1000021,1000015,convert(date,'13-06-2017',103),24300),
	  (10053,1000022,1000018,convert(date,'13-08-2017',103),200500),
	  (10054,1000023,1000010,convert(date,'07-10-2017',103),30000),
	  (10055,1000024,1000008,convert(date,'16-11-2017',103),24300),
	  (10056,1000022,1000009,convert(date,'15-12-2017',103),200500),
	  (10057,1000019,1000013,convert(date,'16-03-2018',103),51000),
	  (10058,1000000,1000012,convert(date,'19-03-2018',103),100500),
	  (10059,1000003,1000005,convert(date,'20-04-2018',103),30000),
	  (10060,1000008,1000008,convert(date,'25-04-2018',103),25000),
	  (10061,1000020,1000024,convert(date,'16-05-2018',103),51000),
	  (10062,1000022,1000017,convert(date,'13-06-2018',103),30000)


	  select *from Transactions

	  select * from TransferFund