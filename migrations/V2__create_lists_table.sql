CREATE TABLE lists
(
    id SERIAL PRIMARY KEY,
    name CHAR(128) NOT NULL,
    count_tasks integer NOT NULL DEFAULT 0,
    is_completed BOOLEAN NOT NULL,
    is_closed BOOLEAN NOT NULL,
    created_at TIMESTAMP,
    updated_at TIMESTAMP
);
