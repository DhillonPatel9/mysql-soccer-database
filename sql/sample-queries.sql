-- Dhillon Patel Project 1
USE castldb;

-- Show a sample match schedule
SELECT 
  match_date, 
  match_start_time, 
  park_name, 
  field_num, 
  field_name, 
  home_team_name,
  away_team_name, 
  get_full_name(ref_first_name, ref_middle_initial, ref_last_name) AS referee,
  match_score, 
  winner
FROM matches m
INNER JOIN `field` f ON m.field_id = f.field_id
ORDER BY match_date, match_start_time, park_name;

-- Generate sample roster for the 3rd match of the season
CALL get_match_roster(3);

-- List the stats for all players in the league, aggregated (summed) per player.
SELECT 
  p.player_id,
  get_full_name(first_name, middle_initial, last_name) AS player_name,
  SUM(goals_scored) AS total_goals, 
  SUM(goal_assists) AS total_assists, 
  SUM(possession_percent) AS total_possession, 
  SUM(pass_counts) AS total_passes, 
  SUM(passing_chains) AS total_passing_chains, 
  SUM(tackle_count) AS total_tackles
FROM player p
JOIN player_match_stats pm ON p.player_id = pm.player_id
GROUP BY p.player_id, player_name
ORDER BY player_id ASC;

-- Show the players with the most assists across all matches in the league in the spring 2024 season
SELECT 
  p.player_id,
  get_full_name(first_name, middle_initial, last_name) AS player_name,
  SUM(goal_assists) AS total_assists
FROM player p
JOIN player_match_stats pm ON p.player_id = pm.player_id
JOIN matches m ON pm.player_id = p.player_id
WHERE season = 'spring' AND match_date LIKE '2024%'
GROUP BY p.player_id, player_name
ORDER BY total_assists DESC
LIMIT 2;

-- Which team won the most matches in the spring season of 2024 and what is their win rate?
SELECT 
  winner, 
  COUNT(DISTINCT m.match_id) AS win_count, 
  get_win_rate(winner, 'Spring') AS win_rate
FROM matches m
JOIN player_match_stats pm ON m.match_id = pm.match_id
WHERE season = 'Spring' AND match_date LIKE '2024%'
GROUP BY winner
ORDER BY win_count DESC
LIMIT 1;

-- Which head coach won the most matches in the spring season of 2024 and what is the coach’s team?
SELECT 
  coach_id,
  coach_name,
  team_name,
  matches_won
FROM coach_performance
WHERE season = 'Spring' AND match_date LIKE '2024%'
LIMIT 1;

-- How many days have passed since the last casl match?
SELECT DATEDIFF(CURDATE(), MAX(match_date)) AS Days_Since_Last_Match
FROM matches;

-- Find the average number of goals scored and tackles made by players when their team won the match, grouping by player.
SELECT 
  p.player_id,
  get_full_name(first_name,middle_initial,last_name) AS player_name,
  ROUND(AVG(pm.goals_scored)) AS avg_goals_for_wins, 
  ROUND(AVG(pm.tackle_count)) AS avg_tackles_for_wins
FROM player p
JOIN player_match_stats pm ON p.player_id = pm.player_id
JOIN matches m ON pm.match_id = m.match_id
JOIN team t ON t.team_id = p.team_id
WHERE m.winner = t.team_name
GROUP BY p.player_id, player_name
ORDER BY p.player_id ASC;

