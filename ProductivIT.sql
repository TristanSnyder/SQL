SELECT customer.custName
FROM customer
JOIN users ON customer.custNum = users.custNum
WHERE users.accountDisabled = 1
GROUP BY customer.custName
HAVING COUNT(users.accountDisabled) > 15;
;

SELECT empFName, empLNAME
FROM employee
WHERE empFNAME LIKE '_____'
;

SELECT AVG(lineItemAmt/carrental.carDays), lineItemCompany
FROM explineitem
JOIN carrental ON explineitem.expLineItemNum = carrental.expLineItemNum AND explineitem.expReportNum = carrental.expReportNum
WHERE carrental.carDays > 0
GROUP BY lineItemCompany
;

SELECT DISTINCT Subordinate.empFName, Subordinate.empLName, Subordinate.office, Boss.empFName,Boss.empLName, Boss.office
FROM employee AS Boss, employee AS Subordinate
JOIN expreport ON expreport.empNum = Subordinate.empNum
WHERE expRepApprovedBy IS NOT NULL AND Boss.office != Subordinate.office AND Boss.empNum = expRepApprovedBy
;

SELECT AVG(DATEDIFF(remitDate, invoiceDate)), customer.custName
FROM invoice
JOIN customer ON invoice.custNum = customer.custNum
GROUP BY customer.custName
HAVING MAX(datediff(invoice.remitDate,invoice.invoiceDate)) <= 20
;

SELECT meals.expReportNum, explineitem.lineItemCompany, employee.empFName, employee.empLName, AVG(explineitem.lineItemAmt / meals.numDiners) AS avgCostPerDiner
FROM explineitem
JOIN meals ON explineitem.expReportNum = meals.expReportNum AND explineitem.expLineItemNum = meals.expLineItemNum
JOIN expreport ON expreport.expReportNum = explineitem.expReportNum
JOIN employee ON expreport.empNum = employee.empNum
WHERE meals.numDiners > 0 
AND employee.office = 'Chicago'
GROUP BY meals.expReportNum, explineitem.lineItemCompany, employee.empFName, employee.empLName
HAVING AVG(explineitem.lineItemAmt / meals.numDiners) > (
    SELECT AVG(explineitem.lineItemAmt / meals.numDiners)
    FROM explineitem
    JOIN meals ON explineitem.expReportNum = meals.expReportNum AND explineitem.expLineItemNum = meals.expLineItemNum
    JOIN expreport ON expreport.expReportNum = explineitem.expReportNum
    JOIN employee ON expreport.empNum = employee.empNum
    WHERE meals.numDiners > 0 
    AND employee.office = 'Atlanta'
);

SELECT DISTINCT origin AS City, 'Origin' AS Origin_Destination
FROM airtravel
UNION ALL
SELECT DISTINCT destination AS City, 'Destination' AS Origin_Destination
FROM airtravel
;

SELECT *
FROM explineitem
LEFT JOIN meals ON meals.expReportNum = explineitem.expReportNum AND meals.expLineItemNum = explineitem.expLineItemNum
    AND explineitem.lineItemDesc = 'meal'
LEFT JOIN lodging ON lodging.expReportNum = explineitem.expReportNum 
    AND explineitem.lineItemDesc = 'lodging'
WHERE explineitem.lineItemDesc IN ('meal', 'lodging')
;

SELECT empFName, empLName, empSalary
FROM Employee
WHERE empSalary < (SELECT avg(empSalary) FROM Employee)
AND empTerminationDate IS NULL
;

SELECT COUNT(expReportNum) AS 'Number of Expense Reports', purpose.purposeDESC
FROM expreppurpose
JOIN purpose ON purpose.purposeID = expreppurpose.purposeID
GROUP BY purposeDESC
ORDER BY COUNT(expReportNum) desc
LIMIT 1
;