CREATE OR REPLACE FUNCTION tasks_urgency()
RETURNS TRIGGER AS $b_urgency$
BEGIN
    IF NEW.urgency NOT BETWEEN 1 and 5 THEN
        RAISE EXCEPTION 'Only has to be between 1 and 5!';
    END IF;
    RETURN NEW;
END;
$b_urgency$ LANGUAGE plpgsql;
CREATE TRIGGER check_urgency
BEFORE INSERT OR UPDATE ON tasks
    FOR EACH ROW
        EXECUTE FUNCTION tasks_urgency();

