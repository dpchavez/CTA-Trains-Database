-- 7.   Find the % decrease in ridership for the UIC Halsted Stop.  
-- Include the intermediate results in your table, meaning there are 4 columns, PreCOVIDAvg, PostCOVIDAvg, Decrease, and Percent Drop.  
-- PreCOVIDAvg and PostCOVIDAvg are computed as in the previous two questions, and the new columns are calculated as follows:
-- Decrease = (Average ridership before 3/1/2020) – (Average ridership after 3/1/2020), 
-- % Decrease = Decrease ÷ (Average ridership before 3/1/2020) × 100
-- Round the PercentDrop to the nearest hundredth place (2 digits after the decimal). DO NOT round until the very last step here. 

SELECT PreCOVIDAvg, PostCOVIDAvg, PreCOVIDAvg - PostCOVIDAvg AS Decrease, round(((PreCOVIDAvg - PostCOVIDAvg)/preCOVIDAvg * 100),2) AS PercentDrop
FROM
(
SELECT round(AVG(Riderships.DailyTotal)) AS PreCOVIDAvg
FROM ((((Stops
JOIN StopDetails USING (StopID))
JOIN Stations USING (StationID))
JOIN LineColors USING (LineID))
JOIN Riderships USING (StationID))
where LineColors.Color = "Blue" AND (Stops.Direction = "W"  OR  Stops.Direction = "S") 
AND Stations.Name LIKE "%UIC-Halsted%"  AND Riderships.TheDate < "2020-03-01" 

) Bruh
,
(
SELECT round(AVG(Riderships.DailyTotal)) AS PostCOVIDAvg
FROM ((((Stops
JOIN StopDetails USING (StopID))
JOIN Stations USING (StationID))
JOIN LineColors USING (LineID))
JOIN Riderships USING (StationID))
where LineColors.Color = "Blue" AND (Stops.Direction = "W"  OR  Stops.Direction = "S") 
AND Stations.Name LIKE "%UIC-Halsted%"  AND Riderships.TheDate >= "2020-03-01" 

)Bruh2

