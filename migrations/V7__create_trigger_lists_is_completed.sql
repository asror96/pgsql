CREATE OR REPLACE FUNCTION lists_is_completed()
RETURNS TRIGGER AS $lists_is_completed$
DECLARE
    fin_tasks INTEGER:=(SELECT COUNT(*) FROM tasks WHERE list_id=NEW.id AND is_completed=TRUE);
BEGIN 
    IF NEW.count_tasks>0 AND NEW.count_tasks=fin_tasks 
        THEN NEW.is_completed=TRUE;
        ELSE NEW.is_completed=FALSE;
    END IF;
    RETURN NEW;
END;
$lists_is_completed$ LANGUAGE plpgsql;
CREATE TRIGGER lists_is_completed
BEFORE INSERT OR UPDATE ON lists
    FOR EACH ROW EXECUTE FUNCTION lists_is_completed();
