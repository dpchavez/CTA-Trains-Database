-- 2.    Generate a table of all the stops and stop information for the stops on the Blue line.  Include all stops on that line, and the coordinates of each stop. 
-- Remember that there will generally be two stops (in either direction) for each station.

 SELECT LineColors.Color as "Color", Stops.Name as "Name", Latitude, Longitude
FROM (((Stops
JOIN StopDetails USING (StopID))
JOIN Stations USING (StationID))
JOIN LineColors USING (LineID))
where LineColors.Color = "Blue"
group by Stops.StopID

