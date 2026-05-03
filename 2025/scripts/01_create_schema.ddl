BEGIN;

-- ====================================================================================================
-- drop any view since they are tied back to tables
-- ====================================================================================================
DROP VIEW IF EXISTS batting_view;
DROP VIEW IF EXISTS pitching_view;

-- ====================================================================================================
-- allstar_full
-- ====================================================================================================

DROP TABLE IF EXISTS allstar_full;
CREATE TABLE IF NOT EXISTS allstar_full (
    player_id TEXT NOT NULL,
    year_id INTEGER NOT NULL,
    game_num INTEGER DEFAULT NULL,
    game_id TEXT DEFAULT NULL,
    team_id TEXT DEFAULT NULL,
    lg_id TEXT DEFAULT NULL,
    played_in_game INTEGER DEFAULT NULL,
    starting_pos INTEGER DEFAULT NULL
);

-- This unique index fails due to duplicates.
-- CREATE UNIQUE INDEX ui_allstar_full_1
--  ON allstar_full(player_id,year_id,gameNum,game_id,lg_id);

-- ====================================================================================================
-- appearances
-- ====================================================================================================
DROP TABLE IF EXISTS appearances;
CREATE TABLE IF NOT EXISTS appearances (
    year_id INTEGER NOT NULL,
    team_id TEXT NOT NULL,
    lg_id TEXT DEFAULT NULL,
    player_id TEXT NOT NULL,
    games_all INTEGER DEFAULT NULL,
    games_started INTEGER DEFAULT NULL,
    games_batting INTEGER DEFAULT NULL,
    games_defense INTEGER DEFAULT NULL,
    games_p INTEGER DEFAULT NULL,
    games_c INTEGER DEFAULT NULL,
    games_1b INTEGER DEFAULT NULL,
    games_2b INTEGER DEFAULT NULL,
    games_3b INTEGER DEFAULT NULL,
    games_ss INTEGER DEFAULT NULL,
    games_lf INTEGER DEFAULT NULL,
    games_cf INTEGER DEFAULT NULL,
    games_rf INTEGER DEFAULT NULL,
    games_of INTEGER DEFAULT NULL,
    games_dh INTEGER DEFAULT NULL,
    games_ph INTEGER DEFAULT NULL,
    games_pr INTEGER DEFAULT NULL
);

CREATE UNIQUE INDEX ui_appearances_1
    ON appearances(year_id,team_id,player_id);

-- ====================================================================================================
-- awards_managers
-- ====================================================================================================

DROP TABLE IF EXISTS awards_managers;
CREATE TABLE IF NOT EXISTS awards_managers (
    player_id TEXT NOT NULL,
    award_id TEXT NOT NULL,
    year_id INTEGER NOT NULL,
    lg_id TEXT NOT NULL,
    tie TEXT DEFAULT NULL,
    notes TEXT DEFAULT NULL
);

CREATE UNIQUE INDEX ui_awards_managers_1
    ON awards_managers(year_id,award_id,lg_id,player_id);

-- ====================================================================================================
-- awards_players
-- ====================================================================================================

DROP TABLE IF EXISTS awards_players;
CREATE TABLE IF NOT EXISTS awards_players (
    player_id TEXT NOT NULL,
    award_id TEXT NOT NULL,
    year_id INTEGER NOT NULL,
    lg_id TEXT,            /* Made NULLABLE due to missing data. */
    tie TEXT DEFAULT NULL,
    notes TEXT DEFAULT NULL
);

-- Commented out for now due to duplicate rows.
-- CREATE UNIQUE INDEX ui_awards_players_1
--  ON awards_players(year_id,award_id,lg_id,player_id);

-- ====================================================================================================
-- awards_share_managers
-- ====================================================================================================

DROP TABLE IF EXISTS awards_share_managers;
CREATE TABLE IF NOT EXISTS awards_share_managers (
    award_id TEXT NOT NULL,
    year_id INTEGER NOT NULL,
    lg_id TEXT NOT NULL,
    player_id TEXT NOT NULL,
    points_won INTEGER DEFAULT NULL,
    points_max INTEGER DEFAULT NULL,
    votes_first INTEGER DEFAULT NULL
);

CREATE UNIQUE INDEX ui_awards_share_managers_1
    ON awards_share_managers(award_id,year_id,lg_id,player_id);

-- ====================================================================================================
-- awards_share_players
-- ====================================================================================================

DROP TABLE IF EXISTS awards_share_players;
CREATE TABLE IF NOT EXISTS awards_share_players (
    award_id TEXT NOT NULL,
    year_id INTEGER NOT NULL,
    lg_id TEXT NOT NULL,
    player_id TEXT NOT NULL,
    points_won REAL DEFAULT NULL,
    points_max INTEGER DEFAULT NULL,
    votes_first REAL DEFAULT NULL
);

CREATE UNIQUE INDEX ui_awards_share_players_1
    ON awards_share_players(award_id,year_id,lg_id,player_id);

-- ====================================================================================================
-- batting
-- ====================================================================================================

DROP TABLE IF EXISTS batting;
CREATE TABLE IF NOT EXISTS batting (
    player_id TEXT NOT NULL,
    year_id INTEGER NOT NULL,
    stint INTEGER NOT NULL,
    team_id TEXT DEFAULT NULL,
    lg_id TEXT DEFAULT NULL,
    games INTEGER DEFAULT NULL,
    at_bats INTEGER DEFAULT NULL,
    runs INTEGER DEFAULT NULL,
    hits INTEGER DEFAULT NULL,
    doubles INTEGER DEFAULT NULL,
    triples INTEGER DEFAULT NULL,
    home_runs INTEGER DEFAULT NULL,
    runs_batted_in INTEGER DEFAULT NULL,
    stolen_bases INTEGER DEFAULT NULL,
    caught_stealing INTEGER DEFAULT NULL,
    walks INTEGER DEFAULT NULL,
    strikeouts INTEGER DEFAULT NULL,
    intentional_walks INTEGER DEFAULT NULL,
    hit_by_pitch INTEGER DEFAULT NULL,
    sacrifice_hits INTEGER DEFAULT NULL,
    sacrifice_flys INTEGER DEFAULT NULL,
    ground_into_double_plays INTEGER DEFAULT NULL
);

CREATE UNIQUE INDEX ui_batting_1
    ON batting(player_id,year_id,stint);

-- ====================================================================================================
-- batting_post
-- ====================================================================================================

DROP TABLE IF EXISTS batting_post;
CREATE TABLE IF NOT EXISTS batting_post (
    year_id INTEGER NOT NULL,
    round TEXT NOT NULL,
    player_id TEXT NOT NULL,
    team_id TEXT DEFAULT NULL,
    lg_id TEXT DEFAULT NULL,
    games INTEGER DEFAULT NULL,
    at_bats INTEGER DEFAULT NULL,
    runs INTEGER DEFAULT NULL,
    hits INTEGER DEFAULT NULL,
    doubles INTEGER DEFAULT NULL,
    triples INTEGER DEFAULT NULL,
    home_runs INTEGER DEFAULT NULL,
    runs_batted_in INTEGER DEFAULT NULL,
    stolen_bases INTEGER DEFAULT NULL,
    caught_stealing INTEGER DEFAULT NULL,
    walks INTEGER DEFAULT NULL,
    strikeouts INTEGER DEFAULT NULL,
    intentional_walks INTEGER DEFAULT NULL,
    hit_by_pitch INTEGER DEFAULT NULL,
    sacrifice_hits INTEGER DEFAULT NULL,
    sacrifice_flys INTEGER DEFAULT NULL,
    ground_into_double_plays INTEGER DEFAULT NULL
);

CREATE UNIQUE INDEX ui_batting_post_1
    ON batting_post(year_id,round,player_id);

-- ====================================================================================================
-- college_playing
-- ====================================================================================================

DROP TABLE IF EXISTS college_playing;
CREATE TABLE IF NOT EXISTS college_playing (
    player_id TEXT NOT NULL,
    school_id TEXT NOT NULL,
    year_id INTEGER NULL
);

CREATE UNIQUE INDEX ui_college_playing_1
    ON college_playing(player_id, school_id, year_id);

-- ====================================================================================================
-- fielding
-- ====================================================================================================

DROP TABLE IF EXISTS fielding;
CREATE TABLE IF NOT EXISTS fielding (
    player_id TEXT NOT NULL,
    year_id INTEGER NOT NULL,
    stint INTEGER NOT NULL,
    team_id TEXT DEFAULT NULL,
    lg_id TEXT DEFAULT NULL,
    position TEXT NOT NULL,
    games INTEGER DEFAULT NULL,
    games_started INTEGER DEFAULT NULL,
    inning_outs INTEGER DEFAULT NULL,
    put_outs INTEGER DEFAULT NULL,
    assists INTEGER DEFAULT NULL,
    errors INTEGER DEFAULT NULL,
    double_plays INTEGER DEFAULT NULL,
    passed_balls INTEGER DEFAULT NULL,
    wild_pitches INTEGER DEFAULT NULL,
    stolen_bases INTEGER DEFAULT NULL,
    caught_stealing INTEGER DEFAULT NULL,
    zone_rating REAL DEFAULT NULL
);

CREATE UNIQUE INDEX ui_fielding_1
    ON fielding(player_id,year_id,stint,position);

-- ====================================================================================================
-- fielding_of
-- ====================================================================================================

DROP TABLE IF EXISTS fielding_of;
CREATE TABLE IF NOT EXISTS fielding_of (
    player_id TEXT NOT NULL,
    year_id INTEGER NOT NULL,
    stint INTEGER NOT NULL,
    games_played_left_field INTEGER DEFAULT NULL,
    games_played_center_field INTEGER DEFAULT NULL,
    games_played_right_field INTEGER DEFAULT NULL
);

CREATE UNIQUE INDEX ui_fielding_of_1
    ON fielding_of(player_id,year_id,stint);

-- ====================================================================================================
-- fielding_of_split
-- ====================================================================================================

DROP TABLE IF EXISTS fielding_of_split;
CREATE TABLE IF NOT EXISTS fielding_of_split (
    player_id TEXT NOT NULL,
    year_id INTEGER NOT NULL,
    stint INTEGER NOT NULL,
    team_id TEXT DEFAULT NULL,
    lg_id TEXT DEFAULT NULL,
    position TEXT NOT NULL,
    games INTEGER DEFAULT NULL,
    games_started INTEGER DEFAULT NULL,
    inning_outs INTEGER DEFAULT NULL,
    put_outs INTEGER DEFAULT NULL,
    assists INTEGER DEFAULT NULL,
    errors INTEGER DEFAULT NULL,
    double_plays INTEGER DEFAULT NULL,
    passed_balls INTEGER DEFAULT NULL,
    wild_pitches INTEGER DEFAULT NULL,
    stolen_bases INTEGER DEFAULT NULL,
    caught_stealing INTEGER DEFAULT NULL,
    zone_rating REAL DEFAULT NULL
);

CREATE UNIQUE INDEX ui_fielding_of_split_1
    ON fielding_of_split(player_id,year_id,stint,position);

-- ====================================================================================================
-- fielding_post
-- ====================================================================================================

DROP TABLE IF EXISTS fielding_post;
CREATE TABLE IF NOT EXISTS fielding_post (
    player_id TEXT NOT NULL,
    year_id INTEGER NOT NULL,
    team_id TEXT DEFAULT NULL,
    lg_id TEXT DEFAULT NULL,
    round TEXT NOT NULL,
    position TEXT NOT NULL,
    games INTEGER DEFAULT NULL,
    games_started INTEGER DEFAULT NULL,
    inning_outs INTEGER DEFAULT NULL,
    put_outs INTEGER DEFAULT NULL,
    assists INTEGER DEFAULT NULL,
    errors INTEGER DEFAULT NULL,
    double_plays INTEGER DEFAULT NULL,
    triple_plays INTEGER DEFAULT NULL,
    passed_balls INTEGER DEFAULT NULL,
    stolen_bases INTEGER DEFAULT NULL,
    caught_stealing INTEGER DEFAULT NULL
);

CREATE UNIQUE INDEX ui_fielding_post_1
    ON fielding_post(player_id,year_id,round,position);

-- ====================================================================================================
-- hall_of_fame
-- ====================================================================================================

-- Looks like those voted thru the veterans committe have NA rather than empty (which will default to NULL).
-- As a result, I changed the data rather than change the data type.

DROP TABLE IF EXISTS hall_of_fame;
CREATE TABLE IF NOT EXISTS hall_of_fame (
    player_id TEXT NOT NULL,
    year_id INTEGER NOT NULL,
    voted_by TEXT NOT NULL DEFAULT '',
    ballots INTEGER DEFAULT NULL,    /* Update data from ,NA,NA,NA to ,,, */
    needed INTEGER DEFAULT NULL,     /* Update data from ,NA,NA,NA to ,,, */
    votes INTEGER DEFAULT NULL,      /* Update data from ,NA,NA,NA to ,,, */
    inducted TEXT DEFAULT NULL,
    category TEXT DEFAULT NULL,
    needed_note TEXT DEFAULT NULL
);

CREATE UNIQUE INDEX ui_hall_of_fame_1
    ON hall_of_fame(player_id,year_id,voted_by);

-- ====================================================================================================
-- home_games
-- ====================================================================================================

-- The columns defined in the csv file have periods for some of the columns. Hence, changed the header
-- row to: year,league,team,park,span_first,span_last,games,openings,attendance

DROP TABLE IF EXISTS home_games;
CREATE TABLE IF NOT EXISTS home_games (
    year_id INTEGER NOT NULL,
    league TEXT NULL DEFAULT '',
    team TEXT DEFAULT NULL,
    park TEXT DEFAULT NULL,
    span_first TEXT DEFAULT NULL,
    span_last TEXT DEFAULT NULL,
    games INTEGER DEFAULT NULL,
    openings INTEGER DEFAULT NULL,
    attendance INTEGER DEFAULT NULL
);

CREATE UNIQUE INDEX ui_home_games_1
    ON home_games(year_id,league,team,park);

-- ====================================================================================================
-- managers
-- ====================================================================================================

DROP TABLE IF EXISTS managers;
CREATE TABLE IF NOT EXISTS managers (
    player_id TEXT DEFAULT NULL,
    year_id INTEGER NOT NULL,
    team_id TEXT NOT NULL,
    lg_id TEXT DEFAULT NULL,
    in_season INTEGER NOT NULL,
    games INTEGER DEFAULT NULL,
    wins INTEGER DEFAULT NULL,
    losses INTEGER DEFAULT NULL,
    rank INTEGER DEFAULT NULL,
    player_manager TEXT DEFAULT NULL
);

CREATE UNIQUE INDEX ui_managers_1
    ON managers(year_id,team_id,in_season);

-- ====================================================================================================
-- managers_half
-- ====================================================================================================

DROP TABLE IF EXISTS managers_half;
CREATE TABLE IF NOT EXISTS managers_half (
    player_id TEXT NOT NULL,
    year_id INTEGER NOT NULL,
    team_id TEXT NOT NULL,
    lg_id TEXT DEFAULT NULL,
    in_season INTEGER DEFAULT NULL,
    half INTEGER NOT NULL,
    games INTEGER DEFAULT NULL,
    wins INTEGER DEFAULT NULL,
    losses INTEGER DEFAULT NULL,
    rank INTEGER DEFAULT NULL
);

CREATE UNIQUE INDEX ui_managers_half_1
    ON managers_half(year_id,team_id,player_id,half);

-- ====================================================================================================
-- parks
-- ====================================================================================================

-- The columns defined in the csv file have periods for some of the columns. Hence, changed the header
-- row to: park,park_name,park_alias,city,state,country

DROP TABLE IF EXISTS parks;
CREATE TABLE IF NOT EXISTS parks (
    id INTEGER NOT NULL,
    park_alias TEXT DEFAULT NULL,
    park_key TEXT NOT NULL,
    park_name TEXT DEFAULT NULL,
    city TEXT DEFAULT NULL,
    state TEXT DEFAULT NULL,
    country TEXT DEFAULT NULL
);

CREATE UNIQUE INDEX ui_parks_1
    ON parks(id);

-- ====================================================================================================
-- people
-- ====================================================================================================

DROP TABLE IF EXISTS people;
CREATE TABLE IF NOT EXISTS people (
    id INTEGER NOT NULL,
    player_id TEXT DEFAULT NULL,
    birth_year INTEGER DEFAULT NULL,
    birth_month INTEGER DEFAULT NULL,
    birth_day INTEGER DEFAULT NULL,
    birth_city TEXT DEFAULT NULL,
    birth_country TEXT DEFAULT NULL,
    birth_state TEXT DEFAULT NULL,
    death_year INTEGER DEFAULT NULL,
    death_month INTEGER DEFAULT NULL,
    death_day INTEGER DEFAULT NULL,
    death_country TEXT DEFAULT NULL,
    death_state TEXT DEFAULT NULL,
    death_city TEXT DEFAULT NULL,
    name_first TEXT DEFAULT NULL,
    name_last TEXT DEFAULT NULL,
    name_given TEXT DEFAULT NULL,
    weight INTEGER DEFAULT NULL,
    height REAL DEFAULT NULL,
    bats TEXT DEFAULT NULL,
    throws TEXT DEFAULT NULL,
    debut TEXT DEFAULT NULL,
    bbref_id TEXT DEFAULT NULL,
    final_game TEXT DEFAULT NULL,
    retro_id TEXT DEFAULT NULL
);

CREATE UNIQUE INDEX ui_people_1
    ON people(player_id);

-- ====================================================================================================
-- pitching
-- ====================================================================================================

DROP TABLE IF EXISTS pitching;
CREATE TABLE IF NOT EXISTS pitching (
    player_id TEXT NOT NULL,
    year_id INTEGER NOT NULL,
    stint INTEGER NOT NULL,
    team_id TEXT DEFAULT NULL,
    lg_id TEXT DEFAULT NULL,
    wins INTEGER DEFAULT NULL,
    losses INTEGER DEFAULT NULL,
    games INTEGER DEFAULT NULL,
    games_started INTEGER DEFAULT NULL,
    complete_games INTEGER DEFAULT NULL,
    shut_outs INTEGER DEFAULT NULL,
    saves INTEGER DEFAULT NULL,
    outs_pitched INTEGER DEFAULT NULL,
    hits INTEGER DEFAULT NULL,
    earned_runs INTEGER DEFAULT NULL,
    home_runs INTEGER DEFAULT NULL,
    walks INTEGER DEFAULT NULL,
    strikeouts INTEGER DEFAULT NULL,
    opponent_batting_average REAL DEFAULT NULL,
    earned_run_average REAL DEFAULT NULL,
    intentional_walks INTEGER DEFAULT NULL,
    wild_pitches INTEGER DEFAULT NULL,
    hit_by_pitch INTEGER DEFAULT NULL,
    balks INTEGER DEFAULT NULL,
    batters_faced INTEGER DEFAULT NULL,
    games_finished INTEGER DEFAULT NULL,
    runs INTEGER DEFAULT NULL,
    sacrifice_hits INTEGER DEFAULT NULL,
    sacrifice_flys INTEGER DEFAULT NULL,
    ground_into_double_plays INTEGER DEFAULT NULL
);

CREATE UNIQUE INDEX ui_pitching_1
    ON pitching(player_id,year_id,stint);

-- ====================================================================================================
-- pitching_post
-- ====================================================================================================

DROP TABLE IF EXISTS pitching_post;
CREATE TABLE IF NOT EXISTS pitching_post (
    player_id TEXT NOT NULL,
    year_id INTEGER NOT NULL,
    round TEXT NOT NULL,
    team_id TEXT DEFAULT NULL,
    lg_id TEXT DEFAULT NULL,
    wins INTEGER DEFAULT NULL,
    losses INTEGER DEFAULT NULL,
    games INTEGER DEFAULT NULL,
    games_started INTEGER DEFAULT NULL,
    complete_games INTEGER DEFAULT NULL,
    shut_outs INTEGER DEFAULT NULL,
    saves INTEGER DEFAULT NULL,
    outs_pitched INTEGER DEFAULT NULL,
    hits INTEGER DEFAULT NULL,
    earned_runs INTEGER DEFAULT NULL,
    home_runs INTEGER DEFAULT NULL,
    walks INTEGER DEFAULT NULL,
    strikeouts INTEGER DEFAULT NULL,
    opponent_batting_average REAL DEFAULT NULL,
    earned_run_average REAL DEFAULT NULL,
    intentional_walks INTEGER DEFAULT NULL,
    wild_pitches INTEGER DEFAULT NULL,
    hit_by_pitch INTEGER DEFAULT NULL,
    balks INTEGER DEFAULT NULL,
    batters_faced INTEGER DEFAULT NULL,
    games_finished INTEGER DEFAULT NULL,
    runs INTEGER DEFAULT NULL,
    sacrifice_hits INTEGER DEFAULT NULL,
    sacrifice_flys INTEGER DEFAULT NULL,
    ground_into_double_plays INTEGER DEFAULT NULL
);

CREATE UNIQUE INDEX ui_pitching_post_1
    ON pitching_post(player_id,year_id,round);

-- ====================================================================================================
-- salaries
-- ====================================================================================================

DROP TABLE IF EXISTS salaries;
CREATE TABLE IF NOT EXISTS salaries (
    year_id INTEGER NOT NULL,
    team_id TEXT NOT NULL,
    lg_id TEXT NOT NULL,
    player_id TEXT NOT NULL,
    salary REAL DEFAULT NULL
);

CREATE UNIQUE INDEX ui_salaries_1
    ON salaries(year_id,team_id,lg_id,player_id);

-- ====================================================================================================
-- schools
-- ====================================================================================================

DROP TABLE IF EXISTS schools;
CREATE TABLE IF NOT EXISTS schools (
    school_id TEXT NOT NULL,
    name_full TEXT DEFAULT NULL,
    city TEXT DEFAULT NULL,
    state TEXT DEFAULT NULL,
    country TEXT DEFAULT NULL
);

CREATE UNIQUE INDEX ui_schools_1
    ON schools(school_id);

-- ====================================================================================================
-- series_post
-- ====================================================================================================

DROP TABLE IF EXISTS series_post;
CREATE TABLE IF NOT EXISTS series_post (
    year_id INTEGER NOT NULL,
    round TEXT NOT NULL,
    team_id_winner TEXT DEFAULT NULL,
    lg_id_winner TEXT DEFAULT NULL,
    team_id_loser TEXT DEFAULT NULL,
    lg_id_loser TEXT DEFAULT NULL,
    wins INTEGER DEFAULT NULL,
    losses INTEGER DEFAULT NULL,
    ties INTEGER DEFAULT NULL
);

CREATE UNIQUE INDEX ui_series_post_1
    ON series_post(year_id,round);

-- ====================================================================================================
-- teams
-- ====================================================================================================

DROP TABLE IF EXISTS teams;
CREATE TABLE IF NOT EXISTS teams (
    year_id INTEGER NOT NULL,
    lg_id TEXT NOT NULL,
    team_id TEXT NOT NULL,
    franch_id TEXT DEFAULT NULL,
    div_id TEXT DEFAULT NULL,
    rank INTEGER DEFAULT NULL,
    games INTEGER DEFAULT NULL,
    games_home INTEGER DEFAULT NULL,
    wins INTEGER DEFAULT NULL,
    losses INTEGER DEFAULT NULL,
    division_winner TEXT DEFAULT NULL,
    wild_card_winner TEXT DEFAULT NULL,
    league_winner TEXT DEFAULT NULL,
    world_series_winner TEXT DEFAULT NULL,
    runs INTEGER DEFAULT NULL,
    at_bats INTEGER DEFAULT NULL,
    hits INTEGER DEFAULT NULL,
    doubles INTEGER DEFAULT NULL,
    triples INTEGER DEFAULT NULL,
    home_runs INTEGER DEFAULT NULL,
    walks INTEGER DEFAULT NULL,
    strikeouts INTEGER DEFAULT NULL,
    stolen_bases INTEGER DEFAULT NULL,
    caught_stealing INTEGER DEFAULT NULL,
    hit_by_pitch INTEGER DEFAULT NULL,
    sacrifice_flys INTEGER DEFAULT NULL,
    opponent_run_scored INTEGER DEFAULT NULL,
    earned_runs INTEGER DEFAULT NULL,
    earned_run_average REAL DEFAULT NULL,
    complete_games INTEGER DEFAULT NULL,
    shut_outs INTEGER DEFAULT NULL,
    saves INTEGER DEFAULT NULL,
    outs_pitched INTEGER DEFAULT NULL,
    hits_allowed INTEGER DEFAULT NULL,
    home_runs_allowed INTEGER DEFAULT NULL,
    walks_allowed INTEGER DEFAULT NULL,
    strikeouts_allowed INTEGER DEFAULT NULL,
    errors INTEGER DEFAULT NULL,
    double_plays INTEGER DEFAULT NULL,
    fielding_percentage REAL DEFAULT NULL,
    name TEXT DEFAULT NULL,
    park TEXT DEFAULT NULL,
    attendance INTEGER DEFAULT NULL,
    batters_park_factor INTEGER DEFAULT NULL,
    pitchers_park_factor INTEGER DEFAULT NULL,
    team_id_baseball_reference TEXT DEFAULT NULL,
    team_id_lahman45 TEXT DEFAULT NULL,
    team_id_retrosheet TEXT DEFAULT NULL
);

CREATE UNIQUE INDEX ui_teams_1
    ON teams(year_id,lg_id,team_id);

-- ====================================================================================================
-- teams_franchises
-- ====================================================================================================

DROP TABLE IF EXISTS teams_franchises;
CREATE TABLE IF NOT EXISTS teams_franchises (
    franch_id TEXT NOT NULL,
    franch_name TEXT DEFAULT NULL,
    active TEXT DEFAULT NULL,
    national_association_id TEXT DEFAULT NULL
);

CREATE UNIQUE INDEX ui_teams_franchises_1
    ON teams_franchises(franch_id);

-- ====================================================================================================
-- teams_half
-- ====================================================================================================

DROP TABLE IF EXISTS teams_half;
CREATE TABLE IF NOT EXISTS teams_half (
    year_id INTEGER NOT NULL,
    lg_id TEXT NOT NULL,
    team_id TEXT NOT NULL,
    half TEXT NOT NULL,
    div_id TEXT DEFAULT NULL,
    division_winner TEXT DEFAULT NULL,
    rank INTEGER DEFAULT NULL,
    games INTEGER DEFAULT NULL,
    wins INTEGER DEFAULT NULL,
    losses INTEGER DEFAULT NULL
);

CREATE UNIQUE INDEX ui_teams_half_1
    ON teams_half(year_id,team_id,lg_id,half);

COMMIT;

