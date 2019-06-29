CREATE TABLE customer_location(
   location_id serial PRIMARY KEY,
   account_id INTEGER NOT NULL,
   city VARCHAR (50),
   region VARCHAR (50),
   country VARCHAR (355) NOT NULL,
   ip_address VARCHAR (50),
   recorded_on TIMESTAMP NOT NULL,
   CONSTRAINT fkey_customer_loc_account_id FOREIGN KEY (account_id)
      REFERENCES customer_account (account_id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
);


