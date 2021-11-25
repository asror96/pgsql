CREATE TABLE user_lists
(
    id SERIAL PRIMARY KEY,
    user_id INTEGER NOT NULL REFERENCES users (id),
    list_id INTEGER NOT NULL REFERENCES lists (id),
    created_at TIMESTAMP,
    updated_at TIMESTAMP
);
