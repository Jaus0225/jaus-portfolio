-- This file defines the structure of the chess database.
-- I used SQLite for this, but the syntax is standard SQL.

-- Table 1: Leaderboard
-- Tracks who played, what difficulty they faced, and if they won.
CREATE TABLE IF NOT EXISTS leaderboard (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    player_name TEXT NOT NULL,
    difficulty TEXT NOT NULL, -- Easy, Medium, Hard
    result TEXT NOT NULL,     -- Win, Loss, Draw
    date_played DATETIME DEFAULT CURRENT_TIMESTAMP
);

-- Table 2: Move History
-- If you want to get fancy, this tracks every move made in a specific game.
CREATE TABLE IF NOT EXISTS game_moves (
    move_id INTEGER PRIMARY KEY AUTOINCREMENT,
    game_id INTEGER,
    move_number INTEGER,
    move_notation TEXT, -- e.g., "e2e4"
    FOREIGN KEY (game_id) REFERENCES leaderboard(id)
);
