 -- 5.    For the UIC-Halsted station on the Blue Line, find the average ridership before 
  -- coronavirus restrictions started in Illinois on March 1, 2020.  
  -- Use pattern matching (LIKE) to find the station containing “UIC-Halsted”.  
  -- Round this result to the nearest whole number, and call this column PreCOVIDAvg.  
  -- (HINT: the result is a 1x1 table, March 1st is excluded from the results)
  
SELECT round(AVG(Riderships.DailyTotal)) AS "PreCOVIDAvg"
FROM ((((Stops
INNER JOIN StopDetails ON StopDetails.StopID = Stops.StopID)
INNER JOIN Stations ON Stops.StationID = Stations.StationID)
INNER JOIN LineColors ON StopDetails.LineID = LineColors.LineID)
INNER JOIN Riderships ON  Riderships.StationID = Stations.StationID)
where LineColors.Color = "Blue" AND (Stops.Direction = "W"  OR  Stops.Direction = "S") 
AND Stations.Name LIKE "%UIC-Halsted%"  AND Riderships.TheDate < "2020-03-01" 
