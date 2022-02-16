
--���������� �� ����� 20-�� �������� SELECT, ����������� ��������� �������� ���������� �� ���� ������. 
--������� ������ �������� ������� ������������� �������� ���� WHERE, GROUP BY, HAVING, EXISTS, IN, INNER JOIN, 
--OUTER JOIN � ������������ �������.

--�������� ��������� � �������������� 1 
SELECT ID_psg, Name FROM Travelers WHERE ID_psg = 1;

--�������� ������ ����������, ��������������� �� ���� � ������� ����������� � ������ �����
SELECT Flights_no, date, ID_psg, place FROM Pass_in_Flights ORDER BY date, Flights_no DESC

--����� ���� ����������, ������� �����-���� ������.
SELECT * FROM Pass_in_Flights WHERE ID_psg IS NOT NULL

--������� ����� ������ �� ������������ ����.
SELECT * FROM Flights WHERE time_out >= '01/01/1900 00:00:00' AND time_out < '02/01/1900 00:00:00'

--������� ������������ � �� ����� ������� �����
SELECT  Airports.ID_comp,  Airports.name,  Flights.town_from FROM Airports 
  JOIN Flights  ON Flights.ID_comp = Airports.ID_comp

--������������, ����� �����������, ����, ��������
SELECT Airports.name, Flights.town_from, Pass_in_Flights.date, Travelers.name 
  FROM Airports
    INNER JOIN Flights ON Flights.ID_comp = Flights.ID_comp 
      INNER JOIN Pass_in_Flights ON Pass_in_Flights.Flights_no = Flights.Flights_no
        INNER JOIN Travelers ON Travelers.ID_psg = Pass_in_Flights.ID_psg 
  ORDER BY Airports.name, Flights.town_from, Pass_in_Flights.date, Travelers.name;

--������� ����������� � �� ����� ������� ������
SELECT Travelers.name, Flights.town_from
  FROM Travelers
      INNER JOIN Pass_in_Flights ON Pass_in_Flights.ID_psg = Travelers.ID_psg
        INNER JOIN Flights ON Flights.Flights_no = Pass_in_Flights.Flights_no 
  ORDER BY Travelers.name, Flights.town_from;

	--������� ���� ���������� � ��� ���������  � �.� ��� ���������
	SELECT  Travelers.name,  Pass_in_Flights.place FROM  Travelers  FULL JOIN Pass_in_Flights  ON Travelers.ID_psg = Pass_in_Flights.ID_psg; 

	--������� ���������� ������������ ������� �� ����� ����� ��� ��������������� 1100
	SELECT DATEDIFF (minute , time_out, time_in) AS FlyTime  FROM Flights WHERE Flights_no  = 1100;	

	--������� ���������� ����������� �� ����� 1100
	SELECT SUM(Travelers.ID_psg) AS CountTravelers
  FROM Travelers 	WHERE ID_psg IN (SELECT ID_psg FROM Pass_in_Flights JOIN Flights ON Pass_in_Flights.Flights_no = Flights.Flights_no WHERE Pass_in_Flights.Flights_no = 1100)

	-- ������� ��������� � ������������ � ��� 
SELECT * 
  FROM Pass_in_Flights
	WHERE EXISTS (SELECT * FROM Travelers WHERE Travelers.ID_psg = Pass_in_Flights.ID_psg);

SELECT * 
  FROM Pass_in_Flights
	WHERE NOT EXISTS (SELECT * FROM Travelers WHERE Travelers.ID_psg = Pass_in_Flights.ID_psg);

	-- ������� ��� ����������� �� ������ ���� ������      
SELECT Name
  FROM Travelers
  WHERE EXISTS (SELECT * FROM Pass_in_Flights WHERE Pass_in_Flights.ID_psg = Travelers.ID_psg AND date >= '01/04/2003 00:00:00' AND date < '11/04/2003 00:00:00');

	-- ������� ID ���������� �  ���������� ������������ ������� ������ ������������� ���������� � ������ ������������ ����
	SELECT Travelers.ID_psg, DATEDIFF (minute , time_out, time_in) AS FlyTime
  FROM Travelers  
	INNER JOIN Pass_in_Flights ON Pass_in_Flights.ID_psg = Travelers.ID_psg
		INNER JOIN Flights ON Pass_in_Flights.Flights_no = Flights.Flights_no
	WHERE date >= '01/04/2003 00:00:00' AND date < '11/04/2003 00:00:00'
  GROUP BY Travelers.ID_psg, DATEDIFF (minute , time_out, time_in)
	HAVING DATEDIFF (minute , time_out, time_in) >= 100
  ORDER BY ID_psg;

--������� ����������� � �� �������������� ���������� � �.�. ������� ��� ����������
SELECT Travelers.name, Pass_in_Flights.place
  FROM Travelers
    FULL OUTER JOIN Pass_in_Flights ON Pass_in_Flights.ID_psg = Travelers.ID_psg
  ORDER BY Travelers.name, Pass_in_Flights.place;

--������� ����������� � �� �������������� ���������� ������ ��� ��� � ����������
SELECT Travelers.name, Pass_in_Flights.place
  FROM Travelers
    RIGHT OUTER JOIN Pass_in_Flights ON Pass_in_Flights.ID_psg = Travelers.ID_psg
  ORDER BY Travelers.name, Pass_in_Flights.place;


  -- ������� ����� � ����� ������ ������� ��������� ����� ������� �� ���� �� ���� ����� ������ 2 �����
SELECT * 
  FROM Flights
	WHERE DATEDIFF (hour , time_out, time_in)  > ANY (SELECT DATEDIFF (hour , time_out, time_in)  FROM Flights WHERE DATEDIFF (hour , time_out, time_in) > 9);

  -- ������� ��� ����� � ����� ������ ������� ��������� ����� ������� �� ����� ����� ������ 2 �����

	SELECT * 
  FROM Flights
	WHERE DATEDIFF (hour , time_out, time_in)  > ALL (SELECT DATEDIFF (hour , time_out, time_in)  FROM Flights WHERE DATEDIFF (hour , time_out, time_in) < 2);
