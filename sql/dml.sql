-- ----------------------------------------------------------------------------
-- 1. SEED BRANCHES (5 Records)
-- ----------------------------------------------------------------------------
INSERT INTO Branch (BranchID, BranchName, IFSCCode, City, State, ManagerName) VALUES
(1, 'Aditya Campus', 'ADIT0001001', 'Surampalem', 'Andhra Pradesh', 'Dr. KVS Rama'),
(2, 'Vizag Branch', 'ADIT0001002', 'Visakhapatnam', 'Andhra Pradesh', 'Rajesh Sharma'),
(3, 'Hyderabad Corp', 'ADIT0001003', 'Hyderabad', 'Telangana', 'Priyanka Reddy'),
(4, 'Kakinada City', 'ADIT0001004', 'Kakinada', 'Andhra Pradesh', 'V. Prasad'),
(5, 'Rajahmundry', 'ADIT0001005', 'Rajahmundry', 'Andhra Pradesh', 'Suresh Varma');

-- ----------------------------------------------------------------------------
-- 2. SEED CUSTOMERS (10 Records) - Address is now a single consolidated field
-- ----------------------------------------------------------------------------
INSERT INTO Customer (CustomerID, FirstName, MiddleName, LastName, DOB, Gender, AadhaarNo, PANNo, Email, Phone, Address) VALUES
(1, 'Gopi', NULL, 'Peddinti', '2004-05-15', 'Male', '123456789012', 'ABCDE1234F', 'gopi.p@aditya.ac.in', '9876543210', 'D.No 4-12, Aditya University Road, Surampalem, Andhra Pradesh - 533437'),
(2, 'Aditya', 'Kumar', 'Verma', '2003-08-22', 'Male', '234567890123', 'BCDEF2345G', 'aditya.verma@example.com', '9876543211', 'Flat 302, Beach Road, Visakhapatnam, Andhra Pradesh - 530003'),
(3, 'Sai', 'Lakshmi', 'Narayana', '2002-11-10', 'Male', '345678901234', 'CDEFG3456H', 'sai.narayana@example.com', '9876543212', 'H.No 12-4, Main Street, Kakinada, Andhra Pradesh - 533001'),
(4, 'Bhavana', 'Sri', 'Kothapalli', '2004-01-30', 'Female', '456789012345', 'DEFGH4567I', 'bhavana.k@example.com', '9876543213', 'Plot 88, HiTech City, Hyderabad, Telangana - 500081'),
(5, 'Ananya', NULL, 'Rao', '2001-04-18', 'Female', '567890123456', 'EFGHI5678J', 'ananya.rao@example.com', '9876543214', 'D.No 8-90, Godavari Street, Rajahmundry, Andhra Pradesh - 533101'),
(6, 'Rohan', 'Venkata', 'Chowdary', '2003-12-05', 'Male', '678901234567', 'FGHIJ6789K', 'rohan.c@example.com', '9876543215', 'House 55, RTC Complex Area, Visakhapatnam, Andhra Pradesh - 530016'),
(7, 'Divya', 'Prasad', 'Reddy', '2002-07-14', 'Female', '789012345678', 'GHIJK7890L', 'divya.reddy@example.com', '9876543216', 'Flat 101, Jubilee Hills, Hyderabad, Telangana - 500033'),
(8, 'Karthik', NULL, 'Raju', '2004-09-09', 'Male', '890123456789', 'HIJKL8901M', 'karthik.raju@example.com', '9876543217', 'D.No 3-15, Cinema Road, Kakinada, Andhra Pradesh - 533003'),
(9, 'Sneha', 'Latha', 'Vaddi', '2003-03-27', 'Female', '901234567890', 'IJKLM9012N', 'sneha.vaddi@example.com', '9876543218', 'Plot 44, Danavaipeta, Rajahmundry, Andhra Pradesh - 533103'),
(10, 'Manohar', 'Singh', 'Rawat', '2000-06-11', 'Male', '012345678901', 'JKLMN0123O', 'manohar.rawat@example.com', '9876543219', 'H.No 7-2, Gachibowli, Hyderabad, Telangana - 500032');

-- ----------------------------------------------------------------------------
-- 3. SEED EMPLOYEES (12 Records) - Name split; Position -> Designation;
--    Qualifications added
-- ----------------------------------------------------------------------------
INSERT INTO Employee (EmployeeID, BranchID, FirstName, MiddleName, LastName, Designation, Qualifications, Salary, Phone, Email, HireDate) VALUES
(101, 1, 'Ramesh', NULL, 'Babu', 'Sr.Cashier', 'B.Com', 45000.00, '9123456780', 'ramesh.b@adityabank.com', '2021-06-01'),
(102, 1, 'Pooja', NULL, 'Hegde', 'CR Exec', 'MBA Mktg', 38000.00, '9123456781', 'pooja.h@adityabank.com', '2022-03-15'),
(103, 1, 'Suresh', NULL, 'Reddy', 'Loan Ofcr', 'MBA Fin', 52000.00, '9123456782', 'suresh.r@adityabank.com', '2020-01-10'),
(104, 2, 'Kalyan', NULL, 'Charya', 'Asst.Mgr', 'MBA, CAIIB', 65000.00, '9123456783', 'kalyan.c@adityabank.com', '2019-11-20'),
(105, 2, 'Meena', NULL, 'Kumari', 'Accountant', 'B.Com, CA Inter', 42000.00, '9123456784', 'meena.k@adityabank.com', '2021-09-01'),
(106, 2, 'Vijay', NULL, 'Kumar', 'Teller', 'B.Com', 32000.00, '9123456785', 'vijay.k@adityabank.com', '2023-02-14'),
(107, 3, 'Vikram', NULL, 'Rathore', 'VP Banking', 'MBA, CFA', 95000.00, '9123456786', 'vikram.r@adityabank.com', '2018-04-05'),
(108, 3, 'Deepika', NULL, 'Padukone', 'Sr Analyst', 'MBA Fin, FRM', 58000.00, '9123456787', 'deepika.p@adityabank.com', '2020-08-19'),
(109, 4, 'Nithin', NULL, 'Varma', 'Ops Mgr', 'MBA Ops', 60000.00, '9123456788', 'nithin.v@adityabank.com', '2020-05-12'),
(110, 4, 'Radha', NULL, 'Krishna', 'Cashier', 'B.Com', 35000.00, '9123456789', 'radha.k@adityabank.com', '2022-10-01'),
(111, 5, 'Manoj', NULL, 'Swamy', 'SysAdmin', 'B.Tech CSE', 48000.00, '9123456790', 'manoj.s@adityabank.com', '2021-12-01'),
(112, 5, 'Latha', NULL, 'Sri', 'Desk Ofcr', 'B.A.', 34000.00, '9123456791', 'latha.s@adityabank.com', '2023-01-20');

-- ----------------------------------------------------------------------------
-- 4. SEED ACCOUNTS (15 Records) - unchanged from previous schema
-- ----------------------------------------------------------------------------
INSERT INTO Account (AccountNumber, CustomerID, BranchID, AccountType, Balance, OpenDate, Status) VALUES
('10001', 1, 1, 'Savings', 85400.50, '2024-01-10', 'Active'),
('10002', 1, 1, 'Current', 250000.00, '2024-02-15', 'Active'),
('10003', 2, 2, 'Savings', 42300.00, '2023-05-20', 'Active'),
('10004', 2, 2, 'Fixed Deposit', 500000.00, '2023-06-01', 'Active'),
('10005', 3, 4, 'Savings', 12500.75, '2024-03-01', 'Active'),
('10006', 4, 3, 'Savings', 145000.00, '2023-09-12', 'Active'),
('10007', 4, 3, 'Current', 320000.00, '2023-11-05', 'Active'),
('10008', 5, 5, 'Savings', 67800.25, '2024-01-05', 'Active'),
('10009', 6, 2, 'Savings', 31200.00, '2023-12-20', 'Active'),
('10010', 7, 3, 'Savings', 98000.00, '2024-02-01', 'Active'),
('10011', 8, 4, 'Current', 185000.00, '2023-10-18', 'Active'),
('10012', 9, 5, 'Savings', 24500.00, '2024-04-10', 'Active'),
('10013', 10, 3, 'Fixed Deposit', 1000000.00, '2023-01-15', 'Active'),
('10014', 1, 4, 'Fixed Deposit', 150000.00, '2024-05-01', 'Active'),
('10015', 3, 4, 'Current', 75000.00, '2024-04-25', 'Active');

-- ----------------------------------------------------------------------------
-- 5. SEED LOANS (5 Records) - PrincipalAmount, EmiAmount (standard EMI
--    formula), SanctionDate added; disbursed loans marked 'Active'
-- ----------------------------------------------------------------------------
INSERT INTO Loan (LoanID, CustomerID, BranchID, LoanType, LoanAmount, PrincipalAmount, InterestRate, StartDate, DurationMonths, EmiAmount, Status, SanctionDate) VALUES
(501, 1, 1, 'Education', 450000.00, 450000.00, 8.50, '2024-02-01', 48, 11090.00, 'Active', '2024-01-25'),
(502, 2, 2, 'Home', 3500000.00, 3500000.00, 7.25, '2023-07-15', 240, 27660.00, 'Active', '2023-07-05'),
(503, 4, 3, 'Car', 800000.00, 800000.00, 9.10, '2023-12-10', 60, 16650.00, 'Active', '2023-12-01'),
(504, 7, 3, 'Personal', 250000.00, 250000.00, 11.50, '2024-03-20', 36, NULL, 'Pending', NULL),
(505, 8, 4, 'Business', 1500000.00, 1500000.00, 10.00, '2024-01-10', 120, 19825.00, 'Active', '2024-01-02');

-- ----------------------------------------------------------------------------
-- 6. SEED TRANSACTIONS (50 Records) - TransactionDate is date-only (DATE,
--    not DATETIME); time-of-day component dropped
-- ----------------------------------------------------------------------------
INSERT INTO TransactionRecord (TransactionID, AccountNumber, TransactionType, Amount, TransactionDate, Mode, Description) VALUES
(1001, '10001', 'Deposit', 50000.00, '2024-01-10', 'Branch', 'Initial account deposit'),
(1002, '10001', 'Deposit', 20000.00, '2024-01-15', 'UPI', 'Salary transfer received'),
(1003, '10001', 'Withdrawal', 5000.00, '2024-01-20', 'ATM', 'ATM cash withdrawal'),
(1004, '10001', 'Transfer', 10000.00, '2024-02-01', 'Online', 'Rent payment transfer'),
(1005, '10001', 'Deposit', 30400.50, '2024-02-10', 'UPI', 'Project stipend credit'),
(1006, '10002', 'Deposit', 300000.00, '2024-02-15', 'Branch', 'Business opening balance'),
(1007, '10002', 'Withdrawal', 50000.00, '2024-02-28', 'Net Banking', 'Supplier invoice payment'),
(1008, '10003', 'Deposit', 50000.00, '2023-05-20', 'Branch', 'Account opening deposit'),
(1009, '10003', 'Withdrawal', 7700.00, '2023-06-10', 'ATM', 'Shopping expense'),
(1010, '10004', 'Deposit', 500000.00, '2023-06-01', 'Branch', 'Fixed deposit creation'),
(1011, '10005', 'Deposit', 15000.00, '2024-03-01', 'Branch', 'Cash deposit'),
(1012, '10005', 'Withdrawal', 2499.25, '2024-03-15', 'UPI', 'Grocery store bill'),
(1013, '10006', 'Deposit', 100000.00, '2023-09-12', 'Branch', 'Opening balance'),
(1014, '10006', 'Deposit', 50000.00, '2023-10-01', 'Online', 'Consulting fee'),
(1015, '10006', 'Withdrawal', 5000.00, '2023-10-15', 'ATM', 'Cash withdrawal'),
(1016, '10007', 'Deposit', 400000.00, '2023-11-05', 'Branch', 'Corporate deposit'),
(1017, '10007', 'Withdrawal', 80000.00, '2023-12-01', 'Net Banking', 'Vendor payment'),
(1018, '10008', 'Deposit', 70000.00, '2024-01-05', 'Branch', 'Initial deposit'),
(1019, '10008', 'Withdrawal', 2199.75, '2024-01-25', 'UPI', 'Online shopping'),
(1020, '10009', 'Deposit', 35000.00, '2023-12-20', 'Branch', 'Savings deposit'),
(1021, '10009', 'Withdrawal', 3800.00, '2024-01-02', 'ATM', 'Travel expenses'),
(1022, '10010', 'Deposit', 100000.00, '2024-02-01', 'Branch', 'Cash deposit'),
(1023, '10010', 'Withdrawal', 2000.00, '2024-02-14', 'UPI', 'Utility bill payment'),
(1024, '10011', 'Deposit', 200000.00, '2023-10-18', 'Branch', 'Business current account fund'),
(1025, '10011', 'Withdrawal', 15000.00, '2023-11-10', 'Net Banking', 'Equipment purchase'),
(1026, '10012', 'Deposit', 25000.00, '2024-04-10', 'Branch', 'Initial cash deposit'),
(1027, '10012', 'Withdrawal', 500.00, '2024-04-20', 'UPI', 'Mobile recharge'),
(1028, '10013', 'Deposit', 1000000.00, '2023-01-15', 'Branch', 'Fixed deposit term creation'),
(1029, '10014', 'Deposit', 150000.00, '2024-05-01', 'Branch', 'FD deposit'),
(1030, '10015', 'Deposit', 80000.00, '2024-04-25', 'Branch', 'Current account funds'),
(1031, '10015', 'Withdrawal', 5000.00, '2024-05-05', 'ATM', 'Emergency cash'),
(1032, '10001', 'Deposit', 12000.00, '2024-03-01', 'UPI', 'Cashback credit'),
(1033, '10003', 'Deposit', 8000.00, '2023-08-15', 'Branch', 'Dividend payout'),
(1034, '10006', 'Withdrawal', 10000.00, '2023-11-20', 'ATM', 'Personal cash'),
(1035, '10007', 'Deposit', 50000.00, '2024-01-15', 'Net Banking', 'Client payment'),
(1036, '10008', 'Deposit', 5000.00, '2024-02-18', 'UPI', 'Peer to peer transfer'),
(1037, '10010', 'Deposit', 15000.00, '2024-03-10', 'Branch', 'Salary bonus'),
(1038, '10010', 'Withdrawal', 15000.00, '2024-03-25', 'Net Banking', 'Loan EMI deduction'),
(1039, '10011', 'Deposit', 30000.00, '2024-01-05', 'UPI', 'Sales collection'),
(1040, '10011', 'Withdrawal', 30000.00, '2024-02-02', 'Branch', 'Payroll disbursement'),
(1041, '10001', 'Deposit', 8000.00, '2024-04-01', 'UPI', 'Refund processed'),
(1042, '10002', 'Deposit', 20000.00, '2024-03-15', 'Net Banking', 'Interest credit'),
(1043, '10003', 'Withdrawal', 8000.00, '2023-09-01', 'ATM', 'ATM Cash'),
(1044, '10005', 'Deposit', 2000.00, '2024-04-05', 'UPI', 'Gift credit'),
(1045, '10009', 'Deposit', 5000.00, '2024-02-20', 'Branch', 'Deposit'),
(1046, '10012', 'Deposit', 5000.00, '2024-05-01', 'UPI', 'Credit transfer'),
(1047, '10015', 'Deposit', 5000.00, '2024-05-10', 'Online', 'Invoice settlement'),
(1048, '10001', 'Withdrawal', 2000.00, '2024-05-15', 'ATM', 'ATM Cash'),
(1049, '10006', 'Deposit', 10000.00, '2024-01-08', 'UPI', 'Consulting fee'),
(1050, '10007', 'Withdrawal', 50000.00, '2024-02-20', 'Net Banking', 'Vendor payment');
