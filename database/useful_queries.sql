-- create a new player with a guild name
INSERT INTO `players` (`discord_name`, `class`, `x_pos`, `y_pos`, `guild_id`) VALUES
('tlast', 'martian', 0, 0, (
    SELECT g.guild_id FROM guilds g
    WHERE g.name = 'The Federation'
));
	  
-- Get the name of the location of the player
SELECT l.name FROM locations l
JOIN players p ON
     p.x_pos = l.location_x_pos AND
     p.y_pos = l.location_y_pos
WHERE p.discord_name = 'tlast';

-- Get the name of the main planet of the guild of the user with the user's name
SELECT l.name FROM locations l
JOIN planets p ON
     l.location_x_pos = p.location_x_pos AND
     l.location_y_pos = p.location_y_pos
WHERE p.planet_id = (
      SELECT g.planet_id FROM guilds g
      JOIN players p ON p.guild_id = g.guild_id
      WHERE p.discord_name = 'tlast'
);

-- Create a new guild with a planet's name
INSERT INTO guilds (name, announcement_channel, planet_id) VALUES
('Apocalypse', 1, (
    SELECT planet_id FROM locations l
    JOIN planets p ON
	l.location_x_pos = p.location_x_pos AND
	l.location_y_pos = p.location_y_pos
    WHERE l.name = 'Mars'
));
