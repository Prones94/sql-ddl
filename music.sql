-- Drop and create the database
DROP DATABASE IF EXISTS music;
CREATE DATABASE music;

\c music

-- Artists Table
CREATE TABLE artists (
    artist_id SERIAL PRIMARY KEY,
    name TEXT NOT NULL
);

-- Producers Table
CREATE TABLE producers (
    producer_id SERIAL PRIMARY KEY,
    name TEXT NOT NULL
);

-- Albums Table
CREATE TABLE albums (
    album_id SERIAL PRIMARY KEY,
    title TEXT NOT NULL,
    release_date DATE NOT NULL
);

-- Songs Table
CREATE TABLE songs (
    song_id SERIAL PRIMARY KEY,
    title TEXT NOT NULL,
    duration_in_seconds INTEGER NOT NULL,
    album_id INT NOT NULL,
    FOREIGN KEY (album_id) REFERENCES albums(album_id)
);

-- Song_Artists Table
CREATE TABLE song_artists (
    song_id INT NOT NULL,
    artist_id INT NOT NULL,
    FOREIGN KEY (song_id) REFERENCES songs(song_id),
    FOREIGN KEY (artist_id) REFERENCES artists(artist_id),
    PRIMARY KEY (song_id, artist_id)
);

-- Song_Producers Table
CREATE TABLE song_producers (
    song_id INT NOT NULL,
    producer_id INT NOT NULL,
    FOREIGN KEY (song_id) REFERENCES songs(song_id),
    FOREIGN KEY (producer_id) REFERENCES producers(producer_id),
    PRIMARY KEY (song_id, producer_id)
);

-- Insert into Artists Table
INSERT INTO artists (name)
VALUES
('Hanson'),
('Queen'),
('Mariah Carey'),
('Boyz II Men'),
('Lady Gaga'),
('Bradley Cooper'),
('Nickelback'),
('Jay Z'),
('Alicia Keys'),
('Katy Perry'),
('Juicy J'),
('Maroon 5'),
('Christina Aguilera'),
('Avril Lavigne'),
('Destiny\'s Child');

-- Insert into Producers Table
INSERT INTO producers (name)
VALUES
('Dust Brothers'),
('Stephen Lironi'),
('Roy Thomas Baker'),
('Walter Afanasieff'),
('Benjamin Rice'),
('Rick Parashar'),
('Al Shux'),
('Max Martin'),
('Cirkut'),
('Shellback'),
('Benny Blanco'),
('The Matrix'),
('Darkchild');

-- Insert into Albums Table
INSERT INTO albums (title, release_date)
VALUES
('Middle of Nowhere', '1997-04-15'),
('A Night at the Opera', '1975-10-31'),
('Daydream', '1995-11-14'),
('A Star Is Born', '2018-09-27'),
('Silver Side Up', '2001-08-21'),
('The Blueprint 3', '2009-10-20'),
('Prism', '2013-12-17'),
('Hands All Over', '2011-06-21'),
('Let Go', '2002-05-14'),
('The Writing\'s on the Wall', '1999-11-07');

-- Insert into Songs Table
INSERT INTO songs (title, duration_in_seconds, album_id)
VALUES
('MMMBop', 238, 1),
('Bohemian Rhapsody', 355, 2),
('One Sweet Day', 282, 3),
('Shallow', 216, 4),
('How You Remind Me', 223, 5),
('New York State of Mind', 276, 6),
('Dark Horse', 215, 7),
('Moves Like Jagger', 201, 8),
('Complicated', 244, 9),
('Say My Name', 240, 10);

-- Insert into Song_Artists Table
INSERT INTO song_artists (song_id, artist_id)
VALUES
(1, 1),
(2, 2),
(3, 3),
(3, 4),
(4, 5),
(4, 6),
(5, 7),
(6, 8),
(6, 9),
(7, 10),
(7, 11),
(8, 12),
(8, 13),
(9, 14),
(10, 15);

-- Insert into Song_Producers Table
INSERT INTO song_producers (song_id, producer_id)
VALUES
(1, 1),
(1, 2),
(2, 3),
(3, 4),
(4, 5),
(5, 6),
(6, 7),
(7, 8),
(7, 9),
(8, 10),
(8, 11),
(9, 12),
(10, 13);
