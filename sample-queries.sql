-- Dhillon Patel Project 1
USE castldb;
-- 1. Add SQL code to insert a constraint on the table with the data in the Player table
-- Includes age constraint as this is an adult league.

ALTER TABLE player ADD CONSTRAINT age_check CHECK (player.player_age >=18);

-- 2.	Create and run the following SQL programs
-- a.	Create a sample match schedule
SELECT 
  match_date, 
  match_start_time, 
  park_name,
  field_num, 
  field_name, 
  home_team_name,
  away_team_name, 
  ref_first_name, 
  ref_last_name, 
  match_score, 
  winner
FROM matches m
INNER JOIN `field` f ON m.field_id = f.field_id
ORDER BY match_date, match_start_time, park_name;

-- b.	Create the team rosters for the first match
SELECT
  team_name,
  first_name,
  middle_initial,
  last_name,
  player_position AS Position,
  jersey_num
FROM team t
INNER JOIN player p ON t.team_id = p.team_id
WHERE team_name = 'ranchers' OR team_name = 'bulls';

-- c.	List the stats for all players in the league, aggregated (summed) per player.
SELECT 
  p.player_id, 
  first_name, 
  last_name, 
  SUM(goals_scored) AS total_goals, 
  SUM(goal_assists) AS total_assists, 
  SUM(possession_percent) AS total_possession, 
  SUM(pass_counts) AS total_passes, 
  SUM(passing_chains) AS total_passing_chains, 
  SUM(tackle_count) AS total_tackles
FROM player p
JOIN player_match_stats pm ON p.player_id = pm.player_id
GROUP BY p.player_id, first_name, last_name
ORDER BY player_id ASC;

-- d.	Which player(s) has/have the most assists across all matches in the league in the spring 2024 season and what was that total?
SELECT 
  p.player_id,
  p.first_name,
  p.last_name,
  SUM(goal_assists) AS total_assists
FROM player p
JOIN player_match_stats pm ON p.player_id = pm.player_id
JOIN matches m ON pm.player_id = p.player_id
WHERE season = 'spring' AND match_date LIKE '2024%'
GROUP BY p.player_id, p.first_name
ORDER BY total_assists DESC
LIMIT 2;

-- e.	Which team won the most matches in the spring season of 2024 and what is their win rate?
SELECT 
    winner, 
    COUNT(DISTINCT m.match_id) AS win_count, 
    ROUND(
        (COUNT(DISTINCT m.match_id) / 
            (SELECT COUNT(*) 
             FROM matches 
             WHERE season = 'spring' 
             AND match_date LIKE '2024%')
        ) * 100, 2
    ) AS win_rate
FROM matches m
JOIN player_match_stats pm ON m.match_id = pm.match_id
WHERE season = 'spring' AND match_date LIKE '2024%'
GROUP BY winner
ORDER BY win_count DESC
LIMIT 1;

-- f.	Which head coach won the most matches in the spring season of 2024 and what is the coach’s team?
SELECT 
  c.coach_id, 
  c.first_name AS coach_first_name, 
  c.last_name AS coach_last_name, 
  t.team_name, 
COUNT(m.match_id) AS matches_won
FROM coach c
JOIN team t ON c.team_id = t.team_id
JOIN matches m ON m.winner = t.team_name
WHERE c.coach_type = 'head coach' AND m.season = 'spring' AND m.match_date LIKE '2024%'
GROUP BY c.coach_id, c.first_name, c.last_name, t.team_name
ORDER BY matches_won DESC
LIMIT 1;

-- g.	Create a query that shows how many days have passed since the last casl match.
SELECT DATEDIFF(CURDATE(), MAX(match_date)) AS Days_Since_Last_Match
FROM matches;

-- h.	Find the average number of goals scored and tackles made by players when their team won the match, grouping by player.
SELECT 
  p.player_id,
  p.first_name, 
  p.last_name, 
  ROUND(AVG(pm.goals_scored)) AS avg_goals_in_wins, 
  ROUND(AVG(pm.tackle_count)) AS avg_tackles_in_wins
FROM player p
JOIN player_match_stats pm ON p.player_id = pm.player_id
JOIN matches m ON pm.match_id = m.match_id
JOIN team t ON t.team_id = p.team_id
WHERE m.winner = t.team_name
GROUP BY p.player_id, p.first_name, p.last_name
ORDER BY player_id ASC;

-- i.	What are the names and the total count of players that play as left back?
SELECT DISTINCT 
  CONCAT(p.first_name, ' ', p.last_name) AS player_name,
  COUNT(player_position) AS player_count
FROM player p
WHERE player_position = 'left back'
GROUP BY player_name
WITH ROLLUP;
