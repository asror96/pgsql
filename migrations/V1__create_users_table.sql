CREATE TABLE users(
    id SERIAL PRIMARY KEY,
    name CHAR(128) NOT NULL,
    email CHAR(128) NOT NULL,
    password CHAR(128) NOT NULL,
    created_at TIMESTAMP,
    updated_at TIMESTAMP
);
