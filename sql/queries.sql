-- ----------------------------------------------------------------------------
-- 1. BASIC SELECTION & FILTERING
-- ----------------------------------------------------------------------------

-- Q1: Retrieve all customer records
SELECT * FROM Customer;

-- Q2: Retrieve all active savings accounts
SELECT AccountNumber, CustomerID, Balance, OpenDate 
FROM Account 
WHERE AccountType = 'Savings' AND Status = 'Active'
ORDER BY Balance DESC;

-- Q3: Search customer by name or email
SELECT CustomerID, FirstName, LastName, Email, Phone 
FROM Customer 
WHERE FirstName LIKE '%Gopi%' OR Email LIKE '%aditya.ac.in%';


-- ----------------------------------------------------------------------------
-- 2. OPERATIONAL UPDATES & TRANSACTIONS
-- ----------------------------------------------------------------------------

-- Q4: Check account balance for account '10001'
SELECT Balance 
FROM Account 
WHERE AccountNumber = '10001';

-- Q5: Deposit funds into account '10001' (+ Rs. 5,000)
UPDATE Account 
SET Balance = Balance + 5000 
WHERE AccountNumber = '10001';

-- Record corresponding transaction log
INSERT INTO TransactionRecord (TransactionID, AccountNumber, TransactionType, Amount, Mode, Description)
VALUES (1051, '10001', 'Deposit', 5000.00, 'Branch', 'Cash Deposit by customer');

-- Q6: Withdraw funds from account '10001' (- Rs. 1,000)
UPDATE Account 
SET Balance = Balance - 1000 
WHERE AccountNumber = '10001' AND Balance >= 1000;

-- Record corresponding transaction log
INSERT INTO TransactionRecord (TransactionID, AccountNumber, TransactionType, Amount, Mode, Description)
VALUES (1052, '10001', 'Withdrawal', 1000.00, 'ATM', 'ATM cash withdrawal');

-- Q7: View transaction history for an account
SELECT TransactionID, TransactionType, Amount, TransactionDate, Mode, Description 
FROM TransactionRecord 
WHERE AccountNumber = '10001' 
ORDER BY TransactionDate DESC;


-- ----------------------------------------------------------------------------
-- 3. AGGREGATE FUNCTIONS & METRICS
-- ----------------------------------------------------------------------------

-- Q8: Calculate total funds held across all bank accounts
SELECT SUM(Balance) AS TotalBankFunds 
FROM Account;

-- Q9: Average account balance grouped by Account Type
SELECT AccountType, COUNT(*) AS AccountCount, AVG(Balance) AS AverageBalance, SUM(Balance) AS TotalTypeBalance 
FROM Account 
GROUP BY AccountType;

-- Q10: Total loan amount sanctioned per Loan Type
 
SELECT    LoanType,
        COUNT(*) AS LoanCount,
        SUM(LoanAmount) AS TotalLoanSanctioned,
        AVG(InterestRate) AS AvgInterestRate
FROM Loan
WHERE Status = 'Active'
GROUP BY LoanType;

-- ----------------------------------------------------------------------------
-- 4. GROUP BY WITH HAVING CLAUSE
-- ----------------------------------------------------------------------------

-- Q11: Find branches where total account balance exceeds Rs. 500,000
SELECT 
    b.BranchName, 
    SUM(a.Balance) AS TotalBalance
FROM Branch b
JOIN Account a 
    ON b.BranchID = a.BranchID
GROUP BY b.BranchID, b.BranchName
HAVING SUM(a.Balance) > 500000;

-- Q12: Find customers holding more than 1 account
SELECT 
    c.CustomerID, 
    c.FirstName || ' ' || c.LastName AS CustomerName, 
    COUNT(a.AccountNumber) AS AccountCount 
FROM Customer c 
JOIN Account a ON c.CustomerID = a.CustomerID 
GROUP BY c.CustomerID 
HAVING COUNT(a.AccountNumber) > 1;


-- ----------------------------------------------------------------------------
-- 5. SUBQUERIES
-- ----------------------------------------------------------------------------

-- Q13: Find customers whose total account balance is higher than the average balance across all bank accounts.
SELECT CustomerID, FirstName, LastName, Email 
FROM Customer 
WHERE CustomerID IN (
    SELECT CustomerID 
    FROM Account 
    GROUP BY CustomerID 
    HAVING SUM(Balance) > (SELECT AVG(Balance) FROM Account)
);

-- Q14: List transactions for the top highest-balance account
SELECT * 
FROM TransactionRecord 
WHERE AccountNumber = (
    SELECT AccountNumber 
    FROM Account 
    ORDER BY Balance DESC 
    LIMIT 1
);
