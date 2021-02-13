-- 4. Generate a table that shows the average # of riders per day for each station from question 3. You will need to use the Riderships table which contains the total number of prople who entered the station on that day as the source of ridership data for this query.  
-- Round the result to the nearest whole number, and call that column AvgRides.

 SELECT Stations.Name as "Name", round(AVG(Riderships.DailyTotal)) as "AvgRides"
FROM ((((Stops
JOIN StopDetails USING (StopID))
JOIN Stations USING (StationID))
JOIN LineColors USING (LineID))
JOIN Riderships USING  (StationID))
where (LineColors.Color = "Blue" AND Stops.Direction = "W" ) OR (LineColors.Color = "Blue" AND Stops.Direction = "S")
group by Stations.StationID

