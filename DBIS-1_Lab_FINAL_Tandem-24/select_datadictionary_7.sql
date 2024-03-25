SELECT v.view_name, uuc.column_name, v.read_only,
    CASE WHEN uc.constraint_type = 'V' THEN 'Yes' ELSE 'No' END AS CHECK_OPTION, uuc.updatable, uuc.insertable, uuc.deletable
FROM user_views v
LEFT JOIN user_constraints uc ON v.view_name = uc.table_name
LEFT JOIN user_updatable_columns uuc ON v.view_name=uuc.table_name;
    

select * From user_views;



SELECT v.view_name, 
    CASE
        WHEN c.constraint_type = 'V' THEN 'YES'
        ELSE 'NO'
    END AS CHECK_OPTION,
    CASE
        WHEN v.read_only = 'N' THEN 'NO'
        ELSE 'YES'
    END AS READ_ONLY,
    CASE WHEN v.view_name IN (SELECT u.table_name
			  From USER_UPDATABLE_COLUMNS u
		WHERE u.updatable = 'NO' OR u.insertable = 'NO' OR u.deletable = 'NO')
			THEN 'NO'
			ELSE 'YES'
			END
		as UPDATABLE
FROM 
    USER_VIEWS v
    LEFT JOIN user_constraints c ON v.view_name = c.table_name ;