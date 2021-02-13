 -- 3.    Filter the stops based on their direction to only the South and 
  -- West-bound stops from your table in step 2, leaving you with only the 
  -- stops in a single direction for the line  In this case, these are the 
 --  Forest Park bound as opposed to the O’Hare bound stops, but you should 
 --  use the direction to make this approach applicable to other lines. 
  -- There should no longer be two stop entries for each station. 
  -- Hint: On the data provided there should be 33 stations.

 SELECT LineColors.Color as "Color", Stops.Name as "Name", Latitude, Longitude
FROM (((Stops
JOIN StopDetails USING (StopID))
JOIN Stations USING (StationID))
JOIN LineColors USING (LineID))
WHERE (LineColors.Color = "Blue" AND Stops.Direction = "W" ) OR (LineColors.Color = "Blue" AND Stops.Direction = "S")
ORDER BY StopID
