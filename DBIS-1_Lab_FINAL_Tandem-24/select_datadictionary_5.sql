SELECT uc.constraint_name,uc.generated, ucc.column_name,ucc.position, uc.constraint_type, uc.search_condition, uc.deferrable, uc.deferred, uc.status
FROM user_constraints uc, user_cons_columns ucc
WHERE uc.table_name = Upper('&tabellenname')
  AND (uc.constraint_type = 'P' OR uc.constraint_type = 'U' OR uc.constraint_type = 'C')
  AND uc.constraint_name = ucc.constraint_name;
   
Select * From user_cons_columns;