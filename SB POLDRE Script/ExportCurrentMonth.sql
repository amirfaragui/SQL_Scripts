SET NOCOUNT ON;

SELECT 
    T.TimeCreated,
    C.CardNumber,
    T.Amount,
    T.Hst,
    T.Deposit,
    T.Discount,
    C.Memo3
FROM dbo.EntervoTransactions T
INNER JOIN dbo.EntervoConsumers C 
    ON T.CardNumber = C.CardNumber
WHERE 
    C.Memo3 LIKE '%POL%'
    AND T.TimeCreated >= DATEFROMPARTS(YEAR(GETDATE()), MONTH(GETDATE()), 1)
    AND T.TimeCreated < DATEADD(MONTH, 1, DATEFROMPARTS(YEAR(GETDATE()), MONTH(GETDATE()), 1))
ORDER BY T.TimeCreated;
