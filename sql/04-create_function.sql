DELIMITER //
CREATE FUNCTION `get_full_name` (
firstName VARCHAR(45),
middleInitial VARCHAR(1),
lastName VARCHAR(45)
)
RETURNS VARCHAR(150)
DETERMINISTIC
BEGIN
RETURN 
	CONCAT(firstName, ' ',
	IF (middleInitial != '', CONCAT(middleInitial, '. '), ''), 
	lastName);
END //

CREATE FUNCTION `get_win_rate` (
    teamName VARCHAR(45),
    seasonName VARCHAR(45)
)
RETURNS DECIMAL(5, 2)
DETERMINISTIC
BEGIN
    DECLARE total_matches INT;
    DECLARE total_wins INT;

    -- Calculate the total number of matches for the season
    SELECT COUNT(*) INTO total_matches 
    FROM matches 
    WHERE season = seasonName;

    -- Avoid division by zero
    IF total_matches = 0 THEN
        RETURN 0.00;
    END IF;

    -- Calculate the total wins for the team in the given season
    SELECT COUNT(*) INTO total_wins 
    FROM matches 
    WHERE winner = teamName AND season = seasonName;

    -- Return the win rate
    RETURN total_wins / total_matches;
END //

DELIMITER ;