
----Airports------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ 
insert into Airports values(1,'Don_avia  ')
insert into Airports values(2,'Aeroflot  ')
insert into Airports values(3,'Dale_avia ')
insert into Airports values(4,'air_France')
insert into Airports values(5,'British_AW')
GO

                                                                                                                                                                                                                                                                 
----Travelers------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ 
insert into Travelers values(1,'Bruce Willis        ')
insert into Travelers values(2,'George Clooney      ')
insert into Travelers values(3,'Kevin Costner       ')
insert into Travelers values(4,'Donald Sutherland   ')
insert into Travelers values(5,'Jennifer Lopez      ')
insert into Travelers values(6,'Ray Liotta          ')
insert into Travelers values(7,'Samuel L. Jackson   ')
insert into Travelers values(8,'Nikole Kidman       ')
insert into Travelers values(9,'Alan Rickman        ')
insert into Travelers values(10,'Kurt Russell        ')
insert into Travelers values(11,'Harrison Ford       ')
insert into Travelers values(12,'Russell Crowe       ')
insert into Travelers values(13,'Steve Martin        ')
insert into Travelers values(14,'Michael Caine       ')
insert into Travelers values(15,'Angelina Jolie      ')
insert into Travelers values(16,'Mel Gibson          ')
insert into Travelers values(17,'Michael Douglas     ')
insert into Travelers values(18,'John Travolta       ')
insert into Travelers values(19,'Sylvester Stallone  ')
insert into Travelers values(20,'Tommy Lee Jones     ')
insert into Travelers values(21,'Catherine Zeta-Jones')
insert into Travelers values(22,'Antonio Banderas    ')
insert into Travelers values(23,'Kim Basinger        ')
insert into Travelers values(24,'Sam Neill           ')
insert into Travelers values(25,'Gary Oldman         ')
insert into Travelers values(26,'Clint Eastwood      ')
insert into Travelers values(27,'Brad Pitt           ')
insert into Travelers values(28,'Johnny Depp         ')
insert into Travelers values(29,'Pierce Brosnan      ')
insert into Travelers values(30,'Sean Connery        ')
insert into Travelers values(31,'Bruce Willis        ')
insert into Travelers values(37,'Mullah Omar         ')

GO

                                                                                                                                                                                                                                                                 
----Flights------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ 
insert into Flights values(1100,4,'Boeing    ','Rostov                   ','Paris                    ','19000101 14:30:00.000','19000101 17:50:00.000')
insert into Flights values(1101,4,'Boeing    ','Paris                    ','Rostov                   ','19000101 08:12:00.000','19000101 11:45:00.000')
insert into Flights values(1123,3,'TU-154    ','Rostov                   ','Vladivostok              ','19000101 16:20:00.000','19000101 03:40:00.000')
insert into Flights values(1124,3,'TU-154    ','Vladivostok              ','Rostov                   ','19000101 09:00:00.000','19000101 19:50:00.000')
insert into Flights values(1145,2,'IL-86     ','Moscow                   ','Rostov                   ','19000101 09:35:00.000','19000101 11:23:00.000')
insert into Flights values(1146,2,'IL-86     ','Rostov                   ','Moscow                   ','19000101 17:55:00.000','19000101 20:01:00.000')
insert into Flights values(1181,1,'TU-134    ','Rostov                   ','Moscow                   ','19000101 06:12:00.000','19000101 08:01:00.000')
insert into Flights values(1182,1,'TU-134    ','Moscow                   ','Rostov                   ','19000101 12:35:00.000','19000101 14:30:00.000')
insert into Flights values(1187,1,'TU-134    ','Rostov                   ','Moscow                   ','19000101 15:42:00.000','19000101 17:39:00.000')
insert into Flights values(1188,1,'TU-134    ','Moscow                   ','Rostov                   ','19000101 22:50:00.000','19000101 00:48:00.000')
insert into Flights values(1195,1,'TU-154    ','Rostov                   ','Moscow                   ','19000101 23:30:00.000','19000101 01:11:00.000')
insert into Flights values(1196,1,'TU-154    ','Moscow                   ','Rostov                   ','19000101 04:00:00.000','19000101 05:45:00.000')
insert into Flights values(7771,5,'Boeing    ','London                   ','Singapore                ','19000101 01:00:00.000','19000101 11:00:00.000')
insert into Flights values(7772,5,'Boeing    ','Singapore                ','London                   ','19000101 12:00:00.000','19000101 02:00:00.000')
insert into Flights values(7773,5,'Boeing    ','London                   ','Singapore                ','19000101 03:00:00.000','19000101 13:00:00.000')
insert into Flights values(7774,5,'Boeing    ','Singapore                ','London                   ','19000101 14:00:00.000','19000101 06:00:00.000')
insert into Flights values(7775,5,'Boeing    ','London                   ','Singapore                ','19000101 09:00:00.000','19000101 20:00:00.000')
insert into Flights values(7776,5,'Boeing    ','Singapore                ','London                   ','19000101 18:00:00.000','19000101 08:00:00.000')
insert into Flights values(7777,5,'Boeing    ','London                   ','Singapore                ','19000101 18:00:00.000','19000101 06:00:00.000')
insert into Flights values(7778,5,'Boeing    ','Singapore                ','London                   ','19000101 22:00:00.000','19000101 12:00:00.000')
insert into Flights values(8881,5,'Boeing    ','London                   ','Paris                    ','19000101 03:00:00.000','19000101 04:00:00.000')
insert into Flights values(8882,5,'Boeing    ','Paris                    ','London                   ','19000101 22:00:00.000','19000101 23:00:00.000')

GO

                                                                                                                                                                                                                                                                 
----Pass_in_Flights------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ 
insert into Pass_in_Flights values(1100,'20030429 00:00:00.000',1,'1a        ')
insert into Pass_in_Flights values(1123,'20030405 00:00:00.000',3,'2a        ')
insert into Pass_in_Flights values(1123,'20030408 00:00:00.000',1,'4c        ')
insert into Pass_in_Flights values(1123,'20030408 00:00:00.000',6,'4b        ')
insert into Pass_in_Flights values(1124,'20030402 00:00:00.000',2,'2d        ')
insert into Pass_in_Flights values(1145,'20030405 00:00:00.000',3,'2c        ')
insert into Pass_in_Flights values(1181,'20030401 00:00:00.000',1,'1a        ')
insert into Pass_in_Flights values(1181,'20030401 00:00:00.000',6,'1b        ')
insert into Pass_in_Flights values(1181,'20030401 00:00:00.000',8,'3c        ')
insert into Pass_in_Flights values(1181,'20030413 00:00:00.000',5,'1b        ')
insert into Pass_in_Flights values(1182,'20030413 00:00:00.000',5,'4b        ')
insert into Pass_in_Flights values(1187,'20030414 00:00:00.000',8,'3a        ')
insert into Pass_in_Flights values(1188,'20030401 00:00:00.000',8,'3a        ')
insert into Pass_in_Flights values(1182,'20030413 00:00:00.000',9,'6d        ')
insert into Pass_in_Flights values(1145,'20030425 00:00:00.000',5,'1d        ')
insert into Pass_in_Flights values(1187,'20030414 00:00:00.000',10,'3d        ')
insert into Pass_in_Flights values(8882,'20051106 00:00:00.000',37,'1a        ') 
insert into Pass_in_Flights values(7771,'20051107 00:00:00.000',37,'1c        ') 
insert into Pass_in_Flights values(7772,'20051107 00:00:00.000',37,'1a        ') 
insert into Pass_in_Flights values(8881,'20051108 00:00:00.000',37,'1d        ') 
insert into Pass_in_Flights values(7778,'20051105 00:00:00.000',10,'2a        ') 
insert into Pass_in_Flights values(7772,'20051129 00:00:00.000',10,'3a        ')
insert into Pass_in_Flights values(7771,'20051104 00:00:00.000',11,'4a        ')
insert into Pass_in_Flights values(7771,'20051107 00:00:00.000',11,'1b        ')
insert into Pass_in_Flights values(7771,'20051109 00:00:00.000',11,'5a        ')
insert into Pass_in_Flights values(7772,'20051107 00:00:00.000',12,'1d        ')
insert into Pass_in_Flights values(7773,'20051107 00:00:00.000',13,'2d        ')
insert into Pass_in_Flights values(7772,'20051129 00:00:00.000',13,'1b        ')
insert into Pass_in_Flights values(8882,'20051113 00:00:00.000',14,'3d        ')
insert into Pass_in_Flights values(7771,'20051114 00:00:00.000',14,'4d        ')
insert into Pass_in_Flights values(7771,'20051116 00:00:00.000',14,'5d        ')
insert into Pass_in_Flights values(7772,'20051129 00:00:00.000',14,'1c        ')

GO




--Ќапишите несколько команд UPDATE и DELETE к различным таблицам.


-- DELETE

DELETE FROM Travelers  WHERE ID_psg = 1;

DELETE FROM Airports  WHERE ID_comp = 1;


 -- UPDATE

UPDATE Travelers  SET Name = 'Pooh'  WHERE ID_psg = 1;
	
UPDATE Airports  SET Name = N'Airports-1' WHERE ID_comp = 1;