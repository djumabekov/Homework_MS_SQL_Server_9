-- - хранимые процедуры

	--выведет количество затраченного времени на полет рейса под идентификатором 1100
DROP PROC IF EXISTS dbo.GetCountimesByRaisID;
GO
CREATE PROC dbo.GetCountimesByRaisID
  @id  AS INT,           --объ€вл€ем 2 переменные в процедуре
  @count AS INT OUTPUT
AS BEGIN
	-- записываем результат запроса в переменную @count 
	SET @count  = (SELECT DATEDIFF (minute , time_out, time_in) AS FlyTime  FROM Flights WHERE Flights_no  = 1100); 

END	
GO

DECLARE @id INT, @count INT; --объ€вл€ем 2 переменные

EXEC dbo.GetCountimesByRaisID 1100, @count OUTPUT -- передаем в процедуру параметры запроса: @id и @count и выполн€ем процедуру

SELECT @count  AS 'Count of Fly Time';  -- именуем результат работы 

PRINT @count; --выводим результат
