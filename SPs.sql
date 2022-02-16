-- - �������� ���������

	--������� ���������� ������������ ������� �� ����� ����� ��� ��������������� 1100
DROP PROC IF EXISTS dbo.GetCountimesByRaisID;
GO
CREATE PROC dbo.GetCountimesByRaisID
  @id  AS INT,           --��������� 2 ���������� � ���������
  @count AS INT OUTPUT
AS BEGIN
	-- ���������� ��������� ������� � ���������� @count 
	SET @count  = (SELECT DATEDIFF (minute , time_out, time_in) AS FlyTime  FROM Flights WHERE Flights_no  = 1100); 

END	
GO

DECLARE @id INT, @count INT; --��������� 2 ����������

EXEC dbo.GetCountimesByRaisID 1100, @count OUTPUT -- �������� � ��������� ��������� �������: @id � @count � ��������� ���������

SELECT @count  AS 'Count of Fly Time';  -- ������� ��������� ������ 

PRINT @count; --������� ���������
