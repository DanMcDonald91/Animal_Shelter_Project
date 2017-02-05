DROP TABLE animals;

CREATE TABLE animals (
id SERIAL4 primary key,
animal_name VARCHAR(255),
species VARCHAR(255),
breed VARCHAR(255),
admission_date DATE,
adoption_status VARCHAR(255)
);