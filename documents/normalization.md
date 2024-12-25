# Normalization Steps

ALLDATA(Match_Date, Match_Start_Time, Team_Name, Park, Field_Num, Jersey_Num, Home_Team_Name, Away_Team_Name, Field_Name, Referee, Match_Score, Winner, Player_Name, Player_Position, Coach_Name, Coach_Age, Coach_Gender, Coach_Type, Player_Age, Player_Gender, Season, IsTeam_Captain, Player_Goals, Player_Assists, Player_Possession_%, Player_Pass_Counts, Player_Passing_Chains, Sponsor_Name, Sponsor_Address, Sponsor_Email)

## 1NF:

**ALLDATA**(<ins>Match_Date</ins>, <ins>Match_Start_Time</ins>, <ins>Team_Name</ins>, <ins>Park</ins>, <ins>Field_Num</ins>, <ins>Jersey_Num</ins>, Home_Team_Name, Away_Team_Name, Field_Name, Referee, Match_Score, Winner, Player_Name, Player_Position, Coach_Name, Coach_Age, Coach_Gender, Coach_Type, Player_Age, Player_Gender, Season, IsTeam_Captain, Player_Goals, Player_Assists, Player_Possession_%, Player_Pass_Counts, Player_Passing_Chains, Sponsor_Name, Sponsor_Address, Sponsor_Email)

## 2NF:

**ALLDATA**(<ins>Match_Date</ins>, <ins>Match_Start_Time</ins>, <ins>Team_Name</ins>, <ins>Park</ins>, <ins>Field_Num</ins>, <ins>Jersey_Num</ins>, Player_Goals, Player_Assists, Player_Possession_%, Player_Pass_Counts, Player_Passing_Chains, Sponsor_Address, Sponsor_Email)

**FIELD**(<ins>Park</ins>, <ins>Field_Num</ins>, Field_Name)

**MATCH**(<ins>Match_Date</ins>, <ins>Match_Start_Time</ins>, <ins>Team_Name</ins>, <ins>Park</ins>, <ins>Field_Num</ins>, Home_Team_Name, Away_Team_Name, Referee, Match_Score, Winner, Season)

**PLAYER**(<ins>Team_Name</ins>, <ins>Jersey_Num</ins>, Player_Name, Player_Position, Player_Age, Player_Gender, IsTeam_Captain)

**TEAM**(<ins>Team_Name</ins>, Coach_Name, Coach_Age, Coach_Gender, Coach_Type, Sponsor_Name)

## 3NF:

**ALLDATA**(<ins>Match_Date</ins>, <ins>Match_Start_Time</ins>, <ins>Team_Name</ins>, <ins>Park</ins>, <ins>Field_Num</ins>, <ins>Jersey_Num</ins>, Player_Goals, Player_Assists, Player_Possession_%, Player_Pass_Counts, Player_Passing_Chains)

**FIELD**(<ins>Park</ins>, <ins>Field_Num</ins>, Field_Name)

**MATCH**(<ins>Match_Date</ins>, <ins>Match_Start_Time</ins>, <ins>Team_Name</ins>, <ins>Park</ins>, <ins>Field_Num</ins>, Home_Team_Name, Away_Team_Name, Referee, Match_Score, Winner, Season)

**PLAYER**(<ins>Team_Name</ins>, <ins>Jersey_Num</ins>, Player_Name, Player_Position, Player_Age, Player_Gender, IsTeam_Captain)

**TEAM**(<ins>Team_Name</ins>, Sponsor_Name)

**COACH**(<ins>Coach_Name</ins>, <ins>Team_Name</ins>, Coach_Age, Coach_Gender, Coach_Type)

**SPONSOR**(<ins>Sponsor_Name</ins>, Sponsor_Address, Sponsor_Email)

## 3NF WITH IMPROVEMENTS:

**PLAYER_MATCH_STATS**(<ins>Player_Stats_ID</ins>, Goals, Assists, Possession_%, Pass_Counts, Passing_Chains, Tackles, Match_ID, Player_ID)

**FIELD**(<ins>Field_ID</ins>, Park, Field_Num, Field_Name)

**MATCH**(<ins>Match_ID</ins>, Match_Date, Match_Start_Time, Home_Team_Name, Away_Team_Name, Ref_FName, Ref_MInitial, Ref_LName, Match_Score, Winner, Season, Field_ID)

**PLAYER**(<ins>Player_ID</ins>, Jersey_Num, FName, MInitial, LName, Position, Age, Gender, IsTeam_Captain, Team_ID)

**TEAM**(<ins>Team_ID</ins>, Team_Name, Sponsor_ID)

**COACH**(<ins>Coach_ID</ins>, FName, MInitial, LName, Age, Gender, Coach_Type, Team_ID)

**SPONSOR**(<ins>Sponsor_ID</ins>, Sponsor_Name, Sponsor_Address, Sponsor_Email)
