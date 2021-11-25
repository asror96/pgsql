CREATE OR REPLACE FUNCTION update_tasks_count()
RETURNS TRIGGER AS $update_tasks_count$
BEGIN
    UPDATE lists 
    set count_tasks=(SELECT COUNT(*) FROM tasks WHERE list_id=NEW.list_id) WHERE id=NEW.list_id;
    UPDATE lists
    SET count_tasks=(SELECT COUNT(*) FROM tasks WHERE list_id=OLD.list_id) WHERE id=OLD.list_id;
    RETURN NULL;
END;
$update_tasks_count$ LANGUAGE plpgsql;
CREATE TRIGGER update_tasks_count AFTER INSERT OR UPDATE OR DELETE ON tasks
    FOR EACH ROW EXECUTE FUNCTION update_tasks_count();
    
