SELECT object_name, object_type
FROM user_objects
WHERE (object_type = 'TABLE' OR object_type = 'VIEW');