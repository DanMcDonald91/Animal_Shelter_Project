DROP TABLE animals CASCADE;
DROP TABLE owners CASCADE;
DROP TABLE adoptions CASCADE;


CREATE TABLE animals (
id SERIAL4 primary key,
animal_name VARCHAR(255) NOT NULL,
species VARCHAR(255) NOT NULL,
breed VARCHAR(255) NOT NULL,
admission_date DATE NOT NULL,
adoption_status VARCHAR(255) NOT NULL
);

CREATE TABLE owners (
id SERIAL4 primary key,
full_name VARCHAR(255) NOT NULL,
chosen_animal VARCHAR(255) NOT NULL
);

CREATE TABLE adoptions (
id SERIAL4 primary key,
animal_id INT4 references animals(id) ON DELETE CASCADE, 
owner_id INT4 references owners(id) ON DELETE CASCADE
);