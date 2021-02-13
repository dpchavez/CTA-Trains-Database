-- 9.    What is the Percentage drop for the Blue Line as a whole?  
-- Compute this by taking the average of the columns from the previous table.  
-- Again, round PreCOVIDAvg, PostCOVIDAvg, and Decrease to the nearest whole number, 
-- and PercentDrop to the nearest hundredth place. 
 

SELECT round(AVG(PreCOVIDAvg)) AS PreCOVIDAvg, round(AVG(PostCOVIDAvg)) AS PostCOVIDAvg, round(AVG(PreCOVIDAvg) - avg(PostCOVIDAvg) ) AS Decrease,  round(((AVG(PreCOVIDAvg) - AVG(PostCOVIDAvg))/AVG(PreCOVIDAvg) * 100),2) AS PercentDrop
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
SELECT AVG(Riderships.DailyTotal) AS PreCOVIDAvg ,  Riderships.StationID
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
SELECT AVG(Riderships.DailyTotal) AS PostCOVIDAvg,  Riderships.StationID
FROM ((((Stops
JOIN StopDetails USING (StopID))
JOIN Stations USING (StationID))
JOIN LineColors USING (LineID))
JOIN Riderships USING (StationID))
where LineColors.Color = "Blue" AND (Stops.Direction = "W"  OR  Stops.Direction = "S")  AND Riderships.TheDate >= "2020-03-01" 
GROUP BY Stations.StationID
)Bruh2

USING (StationID)