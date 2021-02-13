-- 1. Generate a table containing a nicely formatted list of all stations for all lines. 
-- Label the left column "Color" with the color of the line and the right column "Name" 
-- with the name of the stop. Look carefully at the diagram to see how the tables will need 
-- to be joined to get the line colors and station names. 

 SELECT LineColors.Color as "Color", Stations.name as "Name"
FROM (((Stops
JOIN StopDetails USING (StopID))
JOIN Stations USING (StationID))
JOIN LineColors USING (LineID))
group by Color, Stations.StationID
