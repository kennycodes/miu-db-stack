
CREATE TABLE customer_account(
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


ALTER TABLE customer_account ADD CONSTRAINT fkey_customer_account_gender_id FOREIGN KEY (gender_id)
      REFERENCES customer_gender (gender_id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION;