SELECT        TOP (100) PERCENT dbo.Airports.name, dbo.Flights.town_from, dbo.Pass_in_Flights.date, dbo.Travelers.name AS Expr1
FROM            dbo.Airports INNER JOIN
                         dbo.Flights ON dbo.Flights.ID_comp = dbo.Flights.ID_comp INNER JOIN
                         dbo.Pass_in_Flights ON dbo.Pass_in_Flights.Flights_no = dbo.Flights.Flights_no INNER JOIN
                         dbo.Travelers ON dbo.Travelers.ID_psg = dbo.Pass_in_Flights.ID_psg
ORDER BY dbo.Airports.name, dbo.Flights.town_from, dbo.Pass_in_Flights.date, Expr1