DROP TABLE IF EXISTS album;
DROP TABLE IF EXISTS artists;



CREATE TABLE artists (
  id SERIAL4 primary key,
  name VARCHAR(255)
);

CREATE TABLE album (
id serial4 primary key,
title varchar(255),
genre varchar(255),
artist_id int4 references artists(id)
);