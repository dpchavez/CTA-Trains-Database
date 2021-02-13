-- 6.   Find the average ridership after restrictions began 
-- (March 1 2020 – most recent date available) for the same station. 
-- Round this result to the nearest whole number, and call this column PostCOVIDAvg.  
-- (HINT: the result is a 1x1 table, March 1st is included in the results)

SELECT round(AVG(Riderships.DailyTotal)) AS "PostCOVIDAvg"
FROM ((((Stops
JOIN StopDetails USING (StopID))
JOIN Stations USING (StationID))
JOIN LineColors USING (LineID))
JOIN Riderships USING (StationID))
where LineColors.Color = "Blue" AND (Stops.Direction = "W"  OR  Stops.Direction = "S") 
AND Stations.Name LIKE "%UIC-Halsted%"  AND Riderships.TheDate >= "2020-03-01" 