# Data Normalization

ALLDATA(Match_Date, Match_Start_Time, Team_Name, Park, Field_#,  Jersey_#, Home_Team_Name, Away_Team_Name, Field_Name, Referee, Match_Score, Winner, Player_Name, Player_Position, Coach_Name, Coach_Age, Coach_Gender, Coach_Type, Player_Age, Player_Gender,  Season, IsTeam_Captain, Player_Goals, Player_Assists, Player_Possession_%, Player_Pass_Counts, Player_Passing_Chains, Sponsor_Name, Sponsor_Address, Sponsor_Email)

1NF

ALLDATA(Match_Date, Match_Start_Time, Team_Name, Park, Field_#,  Jersey_#, Home_Team_Name, Away_Team_Name, Field_Name, Referee, Match_Score, Winner, Player_Name, Player_Position, Coach_Name, Coach_Age, Coach_Gender, Coach_Type, Player_Age, Player_Gender,  Season, IsTeam_Captain, Player_Goals, Player_Assists, Player_Possession_%, Player_Pass_Counts, Player_Passing_Chains, Sponsor_Name, Sponsor_Address, Sponsor_Email)

2NF

ALLDATA(Match_Date, Match_Start_Time, Team_Name, Park, Field_#,  Jersey_#, Player_Goals, Player_Assists, Player_Possession_%, Player_Pass_Counts, Player_Passing_Chains, Sponsor_Address, Sponsor_Email)

FIELD(Park, Field_#, Field_Name)

MATCH(Match_Date, Match_Start_Time, Team_Name, Park, Field_#, Home_Team_Name, Away_Team_Name, Referee, Match_Score, Winner, Season)

PLAYER(Team_Name, Jersey_#, Player_Name, Player_Position, Player_Age, Player_Gender, IsTeam_Captain)

TEAM(Team_Name, Coach_Name, Coach_Age, Coach_Gender, Coach_Type, Sponsor_Name)

3NF

ALLDATA(Match_Date, Match_Start_Time, Team_Name, Park, Field_#,  Jersey_#, Player_Goals, Player_Assists, Player_Possession_%, Player_Pass_Counts, Player_Passing_Chains)

FIELD(Park, Field_#, Field_Name)

MATCH(Match_Date, Match_Start_Time, Team_Name, Park, Field_#, Home_Team_Name, Away_Team_Name, Referee, Match_Score, Winner, Season)

PLAYER(Team_Name, Jersey_#, Player_Name, Player_Position, Player_Age, Player_Gender, IsTeam_Captain)

TEAM(Team_Name, Sponsor_Name)

COACH(Coach_Name, Team_Name, Coach_Age, Coach_Gender, Coach_Type)

SPONSOR(Sponsor_Name, Sponsor_Address, Sponsor_Email)


3NF WITH IMPROVEMENTS

PLAYER_MATCH_STATS(Player_Stats_ID, Player_Goals, Player_Assists, Player_Possession_%, Player_Pass_Counts, Player_Passing_Chains, Player_Tackles, Match_ID, Player_ID)

FIELD(Field_ID, Park, Field_#, Field_Name)

MATCH(Match_ID, Match_Date, Match_Start_Time, Home_Team_Name, Away_Team_Name, RefereeFName, RefereeMInitial, RefereeLName, Match_Score, Winner, Season, Field_ID)

PLAYER(Player_ID, Jersey_#, PlayerFName, PlayerMInitial, PlayerLName, Player_Position, Player_Age, Player_Gender, IsTeam_Captain, Team_ID)

TEAM(Team_ID, Team_Name, Sponsor_ID)

COACH(Coach_ID, CoachFName, CoachMInitial, CoachLName, Coach_Age, Coach_Gender, Coach_Type, Team_ID)

SPONSOR(Sponsor_ID, Sponsor_Name, Sponsor_Address, Sponsor_Email)
