
--Реализуйте не менее 20-ти запросов SELECT, позволяющих извлекать полезную информацию из базы данных. 
--Запросы должны включать примеры использования ключевых слов WHERE, GROUP BY, HAVING, EXISTS, IN, INNER JOIN, 
--OUTER JOIN и агрегирующих функций.

--получить пассажира с дентификатором 1 
SELECT ID_psg, Name FROM Travelers WHERE ID_psg = 1;

--получить список пассажиров, отсортированный по дате в порядке возрастания и номеру рейса
SELECT Flights_no, date, ID_psg, place FROM Pass_in_Flights ORDER BY date, Flights_no DESC

--Найти всех пассажиров, которые когда-либо летали.
SELECT * FROM Pass_in_Flights WHERE ID_psg IS NOT NULL

--Вывести рейсы вылета за определенную дату.
SELECT * FROM Flights WHERE time_out >= '01/01/1900 00:00:00' AND time_out < '02/01/1900 00:00:00'

--выведет авиакомпании и из каких городов летят
SELECT  Airports.ID_comp,  Airports.name,  Flights.town_from FROM Airports 
  JOIN Flights  ON Flights.ID_comp = Airports.ID_comp

--авиакомпании, город отправления, дата, пассажир
SELECT Airports.name, Flights.town_from, Pass_in_Flights.date, Travelers.name 
  FROM Airports
    INNER JOIN Flights ON Flights.ID_comp = Flights.ID_comp 
      INNER JOIN Pass_in_Flights ON Pass_in_Flights.Flights_no = Flights.Flights_no
        INNER JOIN Travelers ON Travelers.ID_psg = Pass_in_Flights.ID_psg 
  ORDER BY Airports.name, Flights.town_from, Pass_in_Flights.date, Travelers.name;

--выведет пассажирова и из каких городов летали
SELECT Travelers.name, Flights.town_from
  FROM Travelers
      INNER JOIN Pass_in_Flights ON Pass_in_Flights.ID_psg = Travelers.ID_psg
        INNER JOIN Flights ON Flights.Flights_no = Pass_in_Flights.Flights_no 
  ORDER BY Travelers.name, Flights.town_from;

	--выведет всех пассажиров и все терминалы  в т.ч без терминала
	SELECT  Travelers.name,  Pass_in_Flights.place FROM  Travelers  FULL JOIN Pass_in_Flights  ON Travelers.ID_psg = Pass_in_Flights.ID_psg; 

	--выведет количество затраченного времени на полет рейса под идентификатором 1100
	SELECT DATEDIFF (minute , time_out, time_in) AS FlyTime  FROM Flights WHERE Flights_no  = 1100;	

	--выведет количество пассажирова на рейсе 1100
	SELECT SUM(Travelers.ID_psg) AS CountTravelers
  FROM Travelers 	WHERE ID_psg IN (SELECT ID_psg FROM Pass_in_Flights JOIN Flights ON Pass_in_Flights.Flights_no = Flights.Flights_no WHERE Pass_in_Flights.Flights_no = 1100)

	-- выведет терминалы с пассажирвами и без 
SELECT * 
  FROM Pass_in_Flights
	WHERE EXISTS (SELECT * FROM Travelers WHERE Travelers.ID_psg = Pass_in_Flights.ID_psg);

SELECT * 
  FROM Pass_in_Flights
	WHERE NOT EXISTS (SELECT * FROM Travelers WHERE Travelers.ID_psg = Pass_in_Flights.ID_psg);

	-- выведет ФИО пассажирова за период даты полета      
SELECT Name
  FROM Travelers
  WHERE EXISTS (SELECT * FROM Pass_in_Flights WHERE Pass_in_Flights.ID_psg = Travelers.ID_psg AND date >= '01/04/2003 00:00:00' AND date < '11/04/2003 00:00:00');

	-- выведет ID пассажиров и  количество затраченного времени больше определенного количества в период определенной даты
	SELECT Travelers.ID_psg, DATEDIFF (minute , time_out, time_in) AS FlyTime
  FROM Travelers  
	INNER JOIN Pass_in_Flights ON Pass_in_Flights.ID_psg = Travelers.ID_psg
		INNER JOIN Flights ON Pass_in_Flights.Flights_no = Flights.Flights_no
	WHERE date >= '01/04/2003 00:00:00' AND date < '11/04/2003 00:00:00'
  GROUP BY Travelers.ID_psg, DATEDIFF (minute , time_out, time_in)
	HAVING DATEDIFF (minute , time_out, time_in) >= 100
  ORDER BY ID_psg;

--выведет пассажирова и их идентификаторы терминалов в т.ч. включая без терминалов
SELECT Travelers.name, Pass_in_Flights.place
  FROM Travelers
    FULL OUTER JOIN Pass_in_Flights ON Pass_in_Flights.ID_psg = Travelers.ID_psg
  ORDER BY Travelers.name, Pass_in_Flights.place;

--выведет пассажирова и их идентификаторы терминалов только тех кто в терминалах
SELECT Travelers.name, Pass_in_Flights.place
  FROM Travelers
    RIGHT OUTER JOIN Pass_in_Flights ON Pass_in_Flights.ID_psg = Travelers.ID_psg
  ORDER BY Travelers.name, Pass_in_Flights.place;


  -- выведет рейсы и время полета которые превышают время полетов за хотя бы один полет больше 2 часов
SELECT * 
  FROM Flights
	WHERE DATEDIFF (hour , time_out, time_in)  > ANY (SELECT DATEDIFF (hour , time_out, time_in)  FROM Flights WHERE DATEDIFF (hour , time_out, time_in) > 9);

  -- выведет ВСЕ рейсы и время полета которые превышают время полетов за любой полет меньше 2 часов

	SELECT * 
  FROM Flights
	WHERE DATEDIFF (hour , time_out, time_in)  > ALL (SELECT DATEDIFF (hour , time_out, time_in)  FROM Flights WHERE DATEDIFF (hour , time_out, time_in) < 2);
