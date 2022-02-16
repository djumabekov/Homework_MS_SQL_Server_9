-- - триггеры (необязательно!).

--В базе данных для таблицы Travelers, создается таблица (TravelersAudit) для хранения истории изменений.
DROP TABLE IF EXISTS TravelersAudit;
GO
CREATE TABLE TravelersAudit(
  AuditID INTEGER NOT NULL IDENTITY(1, 1),
  ID_psg INT,
  name CHAR(20),
  ModifiedBy VARCHAR(128),
  ModifiedDate DATETIME,
  Operation CHAR(1),
  PRIMARY KEY CLUSTERED (AuditID)
)
GO    

--Далее создаются триггеры для выбранной таблицы FOR INSERT, FOR UPDATE, FOR DELETE, позволяющие хранить историю изменений в соответствующей таблице TravelersAudit.
--TRIGGER INSERT!
DROP TRIGGER IF EXISTS TR_TravelersAudit_Insert;
GO

CREATE TRIGGER TR_TravelersAudit_Insert ON dbo.Travelers
  FOR INSERT
AS
  DECLARE @login_name VARCHAR(128);

  SELECT @login_name = login_name
    FROM sys.dm_exec_sessions
    WHERE session_id = @@SPID;

  INSERT INTO dbo.TravelersAudit (ID_psg, name, ModifiedBy, ModifiedDate, Operation)
    SELECT I.ID_psg, I.name, @login_name, GETDATE(), 'I'
      FROM inserted AS I;
GO

--TRIGGER UPDATE!
DROP TRIGGER IF EXISTS TR_TravelersAudit_Update;
GO

CREATE TRIGGER TR_TravelersAudit_Update ON dbo.Travelers
  FOR UPDATE
AS
  DECLARE @login_name VARCHAR(128);

  SELECT @login_name = login_name
    FROM sys.dm_exec_sessions
    WHERE session_id = @@SPID;

	  INSERT INTO dbo.TravelersAudit (ID_psg, name, ModifiedBy, ModifiedDate, Operation)
    SELECT D.ID_psg, D.name, @login_name, GETDATE(), 'U'
       FROM deleted AS D;
GO

--TRIGGER DELETE!
DROP TRIGGER IF EXISTS TR_TravelersAudit_Update;
GO

CREATE TRIGGER TR_TravelersAudit_Delete ON dbo.Travelers
  FOR DELETE
AS
  DECLARE @login_name VARCHAR(128);

  SELECT @login_name = login_name
    FROM sys.dm_exec_sessions
    WHERE session_id = @@SPID;

	INSERT INTO dbo.TravelersAudit (ID_psg, name, ModifiedBy, ModifiedDate, Operation)
    SELECT D.ID_psg, D.name, @login_name, GETDATE(), 'D'
       FROM deleted AS D;
GO

--Testing:
--INSERT
BEGIN TRANSACTION;
INSERT INTO Travelers(ID_psg, name) VALUES(11111, 'Елена')

SELECT *
  FROM dbo.Travelers ORDER BY ID_psg DESC;
  
ROLLBACK TRANSACTION;


--UPDATE
BEGIN TRANSACTION;
SELECT *
  FROM dbo.Travelers
  WHERE name = 'Елена';
 
UPDATE Travelers
  SET name = 'Наталья'
  WHERE name = 'Елена';
 
SELECT *
  FROM dbo.Travelers
  WHERE name = 'Наталья';
 
SELECT *
  FROM dbo.Travelers;
ROLLBACK TRANSACTION;


--DELETE
BEGIN TRANSACTION;
SELECT *
  FROM dbo.Travelers
  WHERE name = 'Наталья';

DELETE FROM dbo.Travelers
  WHERE name = 'Наталья';
 
SELECT *
  FROM dbo.Travelers
  WHERE name = 'Наталья';

SELECT *
  FROM dbo.Travelers;

ROLLBACK TRANSACTION;   



  SELECT * FROM TravelersAudit;