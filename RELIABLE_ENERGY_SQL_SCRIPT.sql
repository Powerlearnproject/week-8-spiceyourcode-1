-- creating the tables and the structure

CREATE TABLE ENERGY_ACCESS_DATA (
  location VARCHAR(255) PRIMARY KEY,
  urban_rural_classification VARCHAR(255),
  grid_connectivity VARCHAR(255),
  energy_reliability VARCHAR(255),
  energy_cost FLOAT
);

CREATE TABLE RENEWABLE_ENERGY_DATA (
  region VARCHAR(255) PRIMARY KEY,
  energy_type VARCHAR(255),
  adoption_rate FLOAT,
  infrastructure VARCHAR(255),
  government_policies VARCHAR(255),
  costs FLOAT
);

CREATE TABLE DEMOGRAPHIC_DATA (
  id INT PRIMARY KEY,
  population INT,
  income_levels FLOAT,
  education VARCHAR(255)
);

CREATE TABLE ENERGY_ACCESS_DEMOGRAPHIC_LINK (
  energy_access_location VARCHAR(255),
  demographic_id INT,
  PRIMARY KEY (energy_access_location, demographic_id),
  FOREIGN KEY (energy_access_location) REFERENCES ENERGY_ACCESS_DATA(location),
  FOREIGN KEY (demographic_id) REFERENCES DEMOGRAPHIC_DATA(id)
);

CREATE TABLE RENEWABLE_ENERGY_ACCESS_LINK (
  renewable_energy_region VARCHAR(255),
  energy_access_location VARCHAR(255),
  PRIMARY KEY (renewable_energy_region, energy_access_location),
  FOREIGN KEY (renewable_energy_region) REFERENCES RENEWABLE_ENERGY_DATA(region),
  FOREIGN KEY (energy_access_location) REFERENCES ENERGY_ACCESS_DATA(location)
);

CREATE TABLE RENEWABLE_ENERGY_DEMOGRAPHIC_LINK (
  renewable_energy_region VARCHAR(255),
  demographic_id INT,
  PRIMARY KEY (renewable_energy_region, demographic_id),
  FOREIGN KEY (renewable_energy_region) REFERENCES RENEWABLE_ENERGY_DATA(region),
  FOREIGN KEY (demographic_id) REFERENCES DEMOGRAPHIC_DATA(id)
);

/-- inserting data into the tables 
INSERT INTO ENERGY_ACCESS_DATA (location, urban_rural_classification, grid_connectivity, energy_reliability, energy_cost)
VALUES
  ('New York City', 'Urban', 'Grid Connected', 'High', 0.15),
  ('Los Angeles', 'Urban', 'Grid Connected', 'High', 0.18),
  ('Chicago', 'Urban', 'Grid Connected', 'Medium', 0.12),
  ('Houston', 'Urban', 'Grid Connected', 'High', 0.16),
  ('Phoenix', 'Urban', 'Grid Connected', 'Medium', 0.14),
  ('Rural Alabama', 'Rural', 'Off-Grid', 'Low', 0.20),
  ('Rural Texas', 'Rural', 'Off-Grid', 'Low', 0.22),
  ('San Francisco', 'Urban', 'Grid Connected', 'High', 0.19),
  ('Miami', 'Urban', 'Grid Connected', 'Medium', 0.13),
  ('Denver', 'Urban', 'Grid Connected', 'High', 0.17);
  
  INSERT INTO RENEWABLE_ENERGY_DATA (region, energy_type, adoption_rate, infrastructure, government_policies, costs)
VALUES
  ('California', 'Solar', 0.35, 'Advanced', 'Supportive', 0.08),
  ('Texas', 'Wind', 0.40, 'Developing', 'Neutral', 0.10),
  ('New York', 'Hydro', 0.25, 'Mature', 'Supportive', 0.12),
  ('Florida', 'Solar', 0.30, 'Developing', 'Neutral', 0.11),
  ('North Dakota', 'Wind', 0.45, 'Advanced', 'Supportive', 0.09),
  ('Oregon', 'Hydro', 0.28, 'Mature', 'Supportive', 0.13),
  ('Georgia', 'Solar', 0.32, 'Developing', 'Neutral', 0.10),
  ('Iowa', 'Wind', 0.42, 'Advanced', 'Supportive', 0.08),
  ('Washington', 'Hydro', 0.30, 'Mature', 'Supportive', 0.12),
  ('Nevada', 'Solar', 0.38, 'Advanced', 'Supportive', 0.09);
  
INSERT INTO DEMOGRAPHIC_DATA (id, population, income_levels, education)
VALUES
  (1, 100000, 50000.00, 'High School'),
  (2, 50000, 40000.00, 'College'),
  (3, 200000, 60000.00, 'Post Graduate'),
  (4, 80000, 35000.00, 'High School'),
  (5, 30000, 45000.00, 'College'),
  (6, 150000, 70000.00, 'Post Graduate'),
  (7, 120000, 32000.00, 'High School'),
  (8, 90000, 58000.00, 'College'),
  (9, 250000, 75000.00, 'Post Graduate'),
  (10, 60000, 48000.00, 'College');
  
  show tables;
  select * from demographic_data;