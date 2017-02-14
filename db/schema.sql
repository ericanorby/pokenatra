DROP TABLE IF EXISTS pokemons;

CREATE TABLE pokemons(
  id SERIAL PRIMARY KEY,
  name VARCHAR,
  poke_type VARCHAR,
  cp INT,
  img_url VARCHAR
);
