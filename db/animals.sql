DROP TABLE animals;
DROP TABLE owners;

CREATE TABLE animals (
id SERIAL4 primary key,
animal_name VARCHAR(255),
species VARCHAR(255),
breed VARCHAR(255),
admission_date DATE,
adoption_status VARCHAR(255)
);

CREATE TABLE owners (
id SERIAL4 primary key,
full_name VARCHAR(255),
chosen_animal VARCHAR(255)
);