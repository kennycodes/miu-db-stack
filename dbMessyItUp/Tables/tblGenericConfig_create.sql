CREATE TABLE generic_config(
   config_id SERIAL PRIMARY KEY,
   config_name VARCHAR(100) NOT NULL,
   config_type VARCHAR(50),
   config_value VARCHAR(5000)
);
