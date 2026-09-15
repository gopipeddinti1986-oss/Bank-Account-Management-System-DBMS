-- Drop tables if they exist
DROP TABLE IF EXISTS TransactionRecord;
DROP TABLE IF EXISTS Loan;
DROP TABLE IF EXISTS Account;
DROP TABLE IF EXISTS Employee;
DROP TABLE IF EXISTS Customer;
DROP TABLE IF EXISTS Branch;

-- ----------------------------------------------------------------------------
-- 1. BRANCH TABLE
-- ----------------------------------------------------------------------------
CREATE TABLE Branch (
    BranchID INTEGER PRIMARY KEY,
    BranchName VARCHAR(50) NOT NULL,
    IFSCCode VARCHAR(11) NOT NULL UNIQUE,
    City VARCHAR(50) NOT NULL,
    State VARCHAR(50) NOT NULL,
    ManagerName VARCHAR(50) NOT NULL,
    CreatedAt DATE DEFAULT CURRENT_DATE,
    CONSTRAINT chk_ifsc_len CHECK (LENGTH(IFSCCode) = 11)
);

-- ----------------------------------------------------------------------------
-- 2. CUSTOMER TABLE (Atomic attributes, 1NF/2NF/3NF compliant)
-- ----------------------------------------------------------------------------
CREATE TABLE Customer (
    CustomerID INTEGER PRIMARY KEY,
    FirstName VARCHAR(30) NOT NULL,
    MiddleName VARCHAR(30),
    LastName VARCHAR(30) NOT NULL,
    DOB DATE NOT NULL,
    Gender VARCHAR(10) CHECK (Gender IN ('Male', 'Female', 'Other')),
    AadhaarNo VARCHAR(12) NOT NULL UNIQUE,
    PANNo VARCHAR(10) NOT NULL UNIQUE,
    Email VARCHAR(100) NOT NULL UNIQUE,
    Phone VARCHAR(12) NOT NULL,
    Address VARCHAR(100) NOT NULL,
    CreatedAt DATE DEFAULT CURRENT_DATE,
    CONSTRAINT chk_aadhaar CHECK (LENGTH(AadhaarNo) = 12),
    CONSTRAINT chk_pan CHECK (LENGTH(PANNo) = 10)
);

-- ----------------------------------------------------------------------------
-- 3. EMPLOYEE TABLE
-- ----------------------------------------------------------------------------
CREATE TABLE Employee (
    EmployeeID INTEGER PRIMARY KEY,
    BranchID INTEGER NOT NULL,
    FirstName VARCHAR(30) NOT NULL,
    MiddleName VARCHAR(30),
    LastName VARCHAR(30) NOT NULL,
    Designation VARCHAR(50) NOT NULL,
    Qualifications TEXT,
    Salary DECIMAL(12, 2) NOT NULL CHECK (Salary >= 0),
    Phone VARCHAR(12) NOT NULL,
    Email VARCHAR(100) NOT NULL UNIQUE,
    HireDate DATE NOT NULL,
    FOREIGN KEY (BranchID) REFERENCES Branch(BranchID)
);

-- ----------------------------------------------------------------------------
-- 4. ACCOUNT TABLE
-- ----------------------------------------------------------------------------
CREATE TABLE Account (
    AccountNumber VARCHAR(20) PRIMARY KEY,
    CustomerID INTEGER NOT NULL,
    BranchID INTEGER NOT NULL,
    AccountType VARCHAR(20) NOT NULL CHECK (AccountType IN ('Savings', 'Current', 'Fixed Deposit')),
    Balance DECIMAL(15, 2) NOT NULL DEFAULT 0.00 CHECK (Balance >= 0),
    OpenDate DATE NOT NULL,
    Status VARCHAR(15) NOT NULL DEFAULT 'Active' CHECK (Status IN ('Active', 'Inactive', 'Frozen', 'Closed')),
    FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID),
    FOREIGN KEY (BranchID) REFERENCES Branch(BranchID) 
);

-- ----------------------------------------------------------------------------
-- 5. TRANSACTION TABLE
-- ----------------------------------------------------------------------------
CREATE TABLE TransactionRecord (
    TransactionID INTEGER PRIMARY KEY,
    AccountNumber VARCHAR(20) NOT NULL,
    TransactionType VARCHAR(15) NOT NULL CHECK (TransactionType IN ('Deposit', 'Withdrawal', 'Transfer')),
    Amount DECIMAL(15, 2) NOT NULL CHECK (Amount > 0),
    TransactionDate DATE DEFAULT CURRENT_DATE,
    Mode VARCHAR(20) NOT NULL CHECK (Mode IN ('Online', 'ATM', 'Branch', 'UPI', 'Net Banking')),
    Description VARCHAR(255),
    FOREIGN KEY (AccountNumber) REFERENCES Account(AccountNumber)
);

-- ----------------------------------------------------------------------------
-- 6. LOAN TABLE
-- ----------------------------------------------------------------------------
CREATE TABLE Loan (
    LoanID INTEGER PRIMARY KEY,
    CustomerID INTEGER NOT NULL,
    BranchID INTEGER NOT NULL,
    LoanType VARCHAR(50) NOT NULL CHECK (LoanType IN ('Home', 'Car', 'Personal', 'Education', 'Business')),
    LoanAmount DECIMAL(15, 2) NOT NULL CHECK (LoanAmount > 0),
    PrincipalAmount DECIMAL(15, 2) CHECK (PrincipalAmount > 0),
    InterestRate DECIMAL(5, 2) NOT NULL CHECK (InterestRate >= 0 AND InterestRate <= 100),
    StartDate DATE NOT NULL,
    DurationMonths INTEGER NOT NULL CHECK (DurationMonths > 0),
    EmiAmount DECIMAL(10, 2) CHECK (EmiAmount >= 0),
    Status VARCHAR(20) NOT NULL DEFAULT 'Pending' CHECK (Status IN ( 'Approved', 'Pending', 'Closed', 'Rejected', 'Active', 'Default')),
    SanctionDate DATE,
    FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID),
    FOREIGN KEY (BranchID) REFERENCES Branch(BranchID)
);