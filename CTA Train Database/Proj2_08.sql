-- 8.    Generate a table that shows the name of each station on the Blue Line, 
-- along with the calculated values for the previous question recomputed for each station
-- (PreCOVIDAvg, PostCOVIDAvg,  Decrease, and PercentDrop). 


SELECT Name,  round(PreCOVIDAvg) AS PreCOVIDAvg, round(PostCOVIDAvg) AS PostCOVIDAvg , round(PreCOVIDAvg - PostCOVIDAvg) AS Decrease, round(((PreCOVIDAvg - PostCOVIDAvg)/preCOVIDAvg * 100),2) AS PercentDrop
FROM
(
SELECT Stations.Name as "Name", round(AVG(Riderships.DailyTotal)) as "AvgRides", Riderships.StationID
FROM ((((Stops
JOIN StopDetails USING (StopID))
JOIN Stations USING (StationID))
JOIN LineColors USING (LineID))
JOIN Riderships USING  (StationID))
where (LineColors.Color = "Blue" AND Stops.Direction = "W" ) OR (LineColors.Color = "Blue" AND Stops.Direction = "S")
GROUP BY Stations.StationID
)Bruh0

JOIN
(
SELECT (AVG(Riderships.DailyTotal)) AS PreCOVIDAvg ,  Riderships.StationID
FROM ((((Stops
JOIN StopDetails USING (StopID))
JOIN Stations USING (StationID))
JOIN LineColors USING (LineID))
JOIN Riderships USING (StationID))
where LineColors.Color = "Blue" AND (Stops.Direction = "W"  OR  Stops.Direction = "S") AND Riderships.TheDate < "2020-03-01" 
GROUP BY Stations.StationID
) Bruh1
USING(StationID)

JOIN 
(
SELECT (AVG(Riderships.DailyTotal)) AS PostCOVIDAvg,  Riderships.StationID
FROM ((((Stops
JOIN StopDetails USING (StopID))
JOIN Stations USING (StationID))
JOIN LineColors USING (LineID))
JOIN Riderships USING (StationID))
where LineColors.Color = "Blue" AND (Stops.Direction = "W"  OR  Stops.Direction = "S")  AND Riderships.TheDate >= "2020-03-01" 
GROUP BY Stations.StationID
)Bruh2

USING (StationID)