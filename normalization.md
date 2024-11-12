# Normalization Steps

ALLDATA(Match_Date, Match_Start_Time, Team_Name, Park, Field_#, Jersey_#, Home_Team_Name, Away_Team_Name, Field_Name, Referee, Match_Score, Winner, Player_Name, Player_Position, Coach_Name, Coach_Age, Coach_Gender, Coach_Type, Player_Age, Player_Gender, Season, IsTeam_Captain, Player_Goals, Player_Assists, Player_Possession_%, Player_Pass_Counts, Player_Passing_Chains, Sponsor_Name, Sponsor_Address, Sponsor_Email)

## 1NF:

**ALLDATA**(<ins>Match_Date</ins>, <ins>Match_Start_Time</ins>, <ins>Team_Name</ins>, <ins>Park</ins>, <ins>Field_#</ins>, <ins>Jersey_#</ins>, Home_Team_Name, Away_Team_Name, Field_Name, Referee, Match_Score, Winner, Player_Name, Player_Position, Coach_Name, Coach_Age, Coach_Gender, Coach_Type, Player_Age, Player_Gender, Season, IsTeam_Captain, Player_Goals, Player_Assists, Player_Possession_%, Player_Pass_Counts, Player_Passing_Chains, Sponsor_Name, Sponsor_Address, Sponsor_Email)

## 2NF:

**ALLDATA**(<ins>Match_Date</ins>, <ins>Match_Start_Time</ins>, <ins>Team_Name</ins>, <ins>Park</ins>, <ins>Field_#</ins>, <ins>Jersey_#</ins>, Player_Goals, Player_Assists, Player_Possession_%, Player_Pass_Counts, Player_Passing_Chains, Sponsor_Address, Sponsor_Email)

**FIELD**(<ins>Park</ins>, <ins>Field_#</ins>, Field_Name)

**MATCH**(<ins>Match_Date</ins>, <ins>Match_Start_Time</ins>, <ins>Team_Name</ins>, <ins>Park</ins>, <ins>Field_#</ins>, Home_Team_Name, Away_Team_Name, Referee, Match_Score, Winner, Season)

**PLAYER**(<ins>Team_Name</ins>, <ins>Jersey_#</ins>, Player_Name, Player_Position, Player_Age, Player_Gender, IsTeam_Captain)

**TEAM**(<ins>Team_Name</ins>, Coach_Name, Coach_Age, Coach_Gender, Coach_Type, Sponsor_Name)

## 3NF:

**ALLDATA**(<ins>Match_Date</ins>, <ins>Match_Start_Time</ins>, <ins>Team_Name</ins>, <ins>Park</ins>, <ins>Field_#</ins>, <ins>Jersey_#</ins>, Player_Goals, Player_Assists, Player_Possession_%, Player_Pass_Counts, Player_Passing_Chains)

**FIELD**(<ins>Park</ins>, <ins>Field_#</ins>, Field_Name)

**MATCH**(<ins>Match_Date</ins>, <ins>Match_Start_Time</ins>, <ins>Team_Name</ins>, <ins>Park</ins>, <ins>Field_#</ins>, Home_Team_Name, Away_Team_Name, Referee, Match_Score, Winner, Season)

**PLAYER**(<ins>Team_Name</ins>, <ins>Jersey_#</ins>, Player_Name, Player_Position, Player_Age, Player_Gender, IsTeam_Captain)

**TEAM**(<ins>Team_Name</ins>, Sponsor_Name)

**COACH**(<ins>Coach_Name</ins>, <ins>Team_Name</ins>, Coach_Age, Coach_Gender, Coach_Type)

**SPONSOR**(<ins>Sponsor_Name</ins>, Sponsor_Address, Sponsor_Email)

## 3NF WITH IMPROVEMENTS:

**PLAYER_MATCH_STATS**(<ins>Player_Stats_ID</ins>, Player_Goals, Player_Assists, Player_Possession_%, Player_Pass_Counts, Player_Passing_Chains, Player_Tackles, Match_ID, Player_ID)

**FIELD**(<ins>Field_ID</ins>, Park, Field_#, Field_Name)

**MATCH**(<ins>Match_ID</ins>, Match_Date, Match_Start_Time, Home_Team_Name, Away_Team_Name, RefereeFName, RefereeMInitial, RefereeLName, Match_Score, Winner, Season, Field_ID)

**PLAYER**(<ins>Player_ID</ins>, Jersey_#, PlayerFName, PlayerMInitial, PlayerLName, Player_Position, Player_Age, Player_Gender, IsTeam_Captain, Team_ID)

**TEAM**(<ins>Team_ID</ins>, Team_Name, Sponsor_ID)

**COACH**(<ins>Coach_ID</ins>, CoachFName, CoachMInitial, CoachLName, Coach_Age, Coach_Gender, Coach_Type, Team_ID)

**SPONSOR**(<ins>Sponsor_ID</ins>, Sponsor_Name, Sponsor_Address, Sponsor_Email)
