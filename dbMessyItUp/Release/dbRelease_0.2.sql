-- Create Schema

CREATE SCHEMA miu;

-- Create Customer Gender Table

CREATE TABLE IF NOT EXISTS miu.customer_gender(
   gender_id serial PRIMARY KEY,
   gender_name VARCHAR (10)
);

-- Create Customer Account table

CREATE TABLE IF NOT EXISTS miu.customer_account(
   account_id serial PRIMARY KEY,
   first_name VARCHAR (50) NOT NULL,
   last_name VARCHAR (50),
   account_password VARCHAR (50) NOT NULL,
   email VARCHAR (355) UNIQUE NOT NULL,
   phone_number VARCHAR (50),
   date_of_birth DATE,
   gender_id INT, 
   created_on TIMESTAMP NOT NULL,
   verified_on TIMESTAMP,
   last_login TIMESTAMP NOT NULL
);


ALTER TABLE miu.customer_account ADD CONSTRAINT fkey_customer_account_gender_id FOREIGN KEY (gender_id)
      REFERENCES miu.customer_gender (gender_id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION;

-- Create Customer Device table

CREATE TABLE miu.customer_device(
   device_id serial PRIMARY KEY,
   device_serial_number VARCHAR (50),
   device_name VARCHAR (50),
   device_os VARCHAR (50)
);

-- Create Account Device table

CREATE TABLE miu.account_device(
   account_id INTEGER NOT NULL,
   device_id INTEGER NOT NULL,
   grant_date TIMESTAMP,
  PRIMARY KEY (account_id, device_id),
  CONSTRAINT fkey_account_device_account_id FOREIGN KEY (account_id)
      REFERENCES miu.customer_account (account_id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT fkey_account_device_device_id FOREIGN KEY (device_id)
      REFERENCES miu.customer_device (device_id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
);

-- Create Customer Location table

CREATE TABLE miu.customer_location(
   location_id serial PRIMARY KEY,
   account_id INTEGER NOT NULL,
   city VARCHAR (50),
   region VARCHAR (50),
   country VARCHAR (355) NOT NULL,
   ip_address VARCHAR (50),
   recorded_on TIMESTAMP NOT NULL,
   CONSTRAINT fkey_customer_loc_account_id FOREIGN KEY (account_id)
      REFERENCES miu.customer_account (account_id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
);

-- Create Generic Config Table

CREATE TABLE miu.generic_config(
   config_id SERIAL PRIMARY KEY,
   config_name VARCHAR(100) NOT NULL,
   config_type VARCHAR(50),
   config_value VARCHAR(5000)
);


