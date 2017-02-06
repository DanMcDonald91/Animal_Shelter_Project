DROP TABLE animals CASCADE;
DROP TABLE owners CASCADE;
DROP TABLE adoptions CASCADE;


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

CREATE TABLE adoptions (
id SERIAL4 primary key,
animal_id INT4 references animals(id) ON DELETE CASCADE, 
owner_id INT4 references owners(id) ON DELETE CASCADE
);