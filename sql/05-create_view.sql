CREATE VIEW coach_performance AS
SELECT 
  c.coach_id, 
  get_full_name (c.first_name, c.middle_name, c.last_name) AS coach_name,
  t.team_name, 
  COUNT(m.match_id) AS matches_won,
  season,
  match_date
FROM coach c
JOIN team t ON c.team_id = t.team_id
JOIN matches m ON m.winner = t.team_name
WHERE c.coach_type = 'head coach'
GROUP BY c.coach_id, coach_name, t.team_name, season, match_date
ORDER BY matches_won DESC;