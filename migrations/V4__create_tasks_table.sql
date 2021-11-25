CREATE TABLE tasks
(
    id SERIAL PRIMARY KEY,
    name CHAR(128) NOT NULL,
    list_id INTEGER NOT NULL REFERENCES lists (id),
    executor_user_id INTEGER NOT NULL REFERENCES users (id),
    is_completed boolean NOT NULL,
    description TEXT,
    urgency INTEGER NOT NULL,
    created_at TIMESTAMP,
    updated_at TIMESTAMP
);
