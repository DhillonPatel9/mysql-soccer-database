# MySQL Soccer League Database

## Project Description:
This fully normalized relational database (3NF) was developed for the fictitious Cincinnati Adult Soccer League (CASL) as a project for BUS 440 at NC State University. The database efficiently manages and queries team, player, coach, match, and sponsor data. The database enforces business rules to ensure data integrity, supporting CASL’s operations through features such as:
* Scheduling: Records matches across seasons and fields.
* Player & Team Statistics: Tracks key metrics like goals, assists, and match results.
* Sponsor Management: Records sponsor details and associations with teams.
This database provides CASL with quick insights and reporting capabilities to facilitate league operations and enhance data accessibility.

## Use Case:
Cincinnati Adult Soccer League (CASL) is a hypothetical adult-based outdoor soccer league based in Cincinnati, OH. The league boasts of 12 current teams, each with at least 11 players, playing a spring and fall season each year.

Each team is coached by one head coach and one assistant coach (optional) and sponsored by one local company. A coach is assigned to one team only. Coaches are usually selected on a volunteer basis and enrolled each season with their full name, age, and gender (e.g., Fred Lasso is the Head coach the Ranchers, while the Assistant coach is Red Beard). 

Players enroll in the league in the spring of each year and are assigned to play on one team. Each player on a team is assigned a jersey with a unique number. Players must include their full name, age, and gender when they enroll. Players must be at least 18 years of age to be accepted in the league. One player on each team is assigned as the captain.

Matches are 90 minutes in length and are played between two teams on one field of a park under the control of a referee (ref). If the match ends in a tie, the teams will play two extra times of 15 minutes or go directly to penalty kicks so that a match winner is established. Teams play matches on a field of a Cincinnati soccer park. Most of the soccer parks house several fields, and a field can host several matches. 

Typical positions on a team include a Goalkeeper, Forwards (Striker, Center Forward, Wingers), Midfielders (Mid, Right Mid, Center Mid, Attacking Mid, Defensive Mid), and Defenders (Center back, Left Back, Right Back, and Wing Backs). The coach picks a captain for each team, decides the roster (which players play which positions) before the match, and ensures that stats are tracked for each match and for each player. Some of the most-commonly tracked stats include match score, goals, assists, possession %, pass counts, and passing chains. For example, in the first match of the season, Denise Stacker had 3 goals and 2 assists.

Sponsor company names and addresses are tracked, as well as the email of the main contact at the sponsor company. Teams wear jerseys sporting the sponsor’s name. CASL allows companies to sponsor more than one team (e.g., First Union Bank sponsors both the Ranchers and Manchester teams).

The league director plans the season schedule for all the teams. The league director has been keeping data in text-based documents (e.g., MS Word or Google Sheets) but is finding it increasingly difficult to get insights from the data. Thus, the league has decided to build a database to support its operations. 

## Business Rules Derived From Use Case:
- 12 current teams (Each team has 11 to many players).
- A team plays in 1 to many seasons in a year.
- A team has 1 and only 1 head coach.
- A team may have 1 assistant coach (can be null)
- A team is sponsored by 1 and only 1 local company but a local company can sponsor 1 to many teams
- Full name, age, and gender classify the coaches
- A player can only play on 1 and only 1 team
- The jersey number uniquely identifies each player
- Players are classified by full name, age, and gender upon enrollment
- Players must be 18 years of age or older
- Each team has 1 and only 1 team captain
- A match can only be between two teams
- A match can only be played on one field
- A referee must be present in each game
- A soccer park has 1 to many fields
- A field can host 1 to many matches
- Teams must have 1 and only 1 Goalkeeper and must have Forwards, Midfielders, and Defenders.
- The coach delegates team captain for each team
- The coach decides roster
- The coach tracks stats for each team and player
- Stats consist of match score, goals, assists, possession %, pass counts, passing chains, and player tackles. 
- The coach tracks sponsor company name, address, and email of main contact
- League director plans season schedule for all teams

### How to Interact with the Soccer Database

1. **Clone the Repository**:
   ```bash
   git clone https://github.com/your-username/mysql-soccer-database.git
   ```
   
2. **Navigate to the Database and Docker Files Directories**:
   After cloning the repository, change to the `mysql-soccer-database` directory and then to the `docker-files` directory:
   ```bash
   cd mysql-soccer-database/docker-files
   ```
   
3. **Build the Docker Container**:
Run the following command to build the Docker container:
   ```bash
   docker compose up --build
   ```

4. **Access the MySQL Database**:
Open a new terminal and run these commands to access the MySQL database:
   ```bash
   docker exec -it castldb_container bash
   mysql -u root -p
   ```

5. **Enter the Password**:
Use "root" as the password when prompted.
	
6. **Select the Database**:
Use the following SQL command to select the castldb database:
   ```sql
   USE castldb;
   ```

7. **Query the Database**:
Sample queries are available in the sample-queries.sql file under the sql folder.

8. **Stop the Docker Container**:
When finished, run this command to stop the container:
   ```bash
   docker compose down
   ```
