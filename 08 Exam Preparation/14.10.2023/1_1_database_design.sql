CREATE TABLE IF NOT EXISTS towns (
    id SERIAL PRIMARY KEY,
    name VARCHAR(45) NOT NULL
);

CREATE TABLE IF NOT EXISTS stadiums (
    id SERIAL PRIMARY KEY,
    name VARCHAR(45) NOT NULL,
    capacity INT NOT NULL,
    town_id INT NOT NULL,

    CONSTRAINT ck_capacity_is_positive
                      CHECK ( capacity > 0 ),
    CONSTRAINT fk_stadiums_towns
                      FOREIGN KEY (town_id)
                      REFERENCES towns(id)
                      ON UPDATE CASCADE
                      ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS teams (
    id SERIAL PRIMARY KEY,
    name VARCHAR(45) NOT NULL,
    established DATE NOT NULL,
    fan_base INT NOT NULL DEFAULT 0,
    stadium_id INT NOT NULL,

    CONSTRAINT ck_teams_fan_base_is_not_negative
                                 CHECK ( fan_base >= 0 ),
    CONSTRAINT fk_teams_stadiums
                                 FOREIGN KEY (stadium_id)
                                 REFERENCES stadiums(id)
                                 ON DELETE CASCADE
                                 ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS coaches (
    id SERIAL PRIMARY KEY,
    first_name VARCHAR(10) NOT NULL,
    last_name VARCHAR(20) NOT NULL,
    salary NUMERIC(10, 2) NOT NULL DEFAULT 0,
    coach_level INT NOT NULL DEFAULT 0,

    CONSTRAINT ck_coaches_salary_is_not_negative
                                   CHECK ( salary >= 0 ),
    CONSTRAINT ck_coach_level_is_not_negative
                                   CHECK ( coach_level >= 0 )
);

CREATE TABLE IF NOT EXISTS skills_data (
    id SERIAL PRIMARY KEY,
    dribbling INT DEFAULT 0 CHECK ( dribbling >= 0 ),
    pace INT DEFAULT 0 CHECK ( pace >= 0 ),
    passing INT DEFAULT 0 CHECK ( passing >= 0 ),
    shooting INT DEFAULT 0 CHECK ( shooting >= 0 ),
    speed INT DEFAULT 0 CHECK ( speed >= 0 ),
    strength INT DEFAULT 0 CHECK ( strength >= 0 )
);

CREATE TABLE IF NOT EXISTS players (
    id SERIAL PRIMARY KEY,
    first_name VARCHAR(10) NOT NULL,
    last_name VARCHAR(20) NOT NULL,
    age INT NOT NULL DEFAULT 0 CHECK ( age >= 0 ),
    position CHAR(1) NOT NULL,
    salary NUMERIC(10, 2) DEFAULT 0 NOT NULL CHECK ( salary >= 0 ),
    hire_date TIMESTAMP,
    skills_data_id INT NOT NULL REFERENCES skills_data(id) ON UPDATE CASCADE ON DELETE CASCADE,
    team_id INT REFERENCES teams(id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS players_coaches (
    player_id INT REFERENCES players(id) ON UPDATE CASCADE ON DELETE CASCADE,
    coach_id INT REFERENCES coaches(id) ON DELETE CASCADE ON UPDATE CASCADE
);