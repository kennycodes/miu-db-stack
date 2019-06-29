CREATE TABLE account_device(
   account_id INTEGER NOT NULL,
   device_id INTEGER NOT NULL,
   grant_date TIMESTAMP,
  PRIMARY KEY (account_id, device_id),
  CONSTRAINT fkey_account_device_account_id FOREIGN KEY (account_id)
      REFERENCES customer_account (account_id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT fkey_account_device_device_id FOREIGN KEY (device_id)
      REFERENCES customer_device (device_id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
);
