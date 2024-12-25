DELIMITER //
CREATE PROCEDURE `get_match_roster` (IN matchID INT)
BEGIN

SELECT
	team_name,
	CONCAT(first_name, ' ',
    IF (middle_initial != '', CONCAT(middle_initial, '. '), ''), 
    last_name) AS player_name,
    player_position AS position,
	jersey_num
FROM team t
INNER JOIN player p ON t.team_id = p.team_id
WHERE 
  team_name IN (
    SELECT home_team_name 
    FROM matches 
    WHERE match_id = matchID
    UNION
    SELECT away_team_name 
    FROM matches 
    WHERE match_id = matchID
  );

END //
DELIMITER ;