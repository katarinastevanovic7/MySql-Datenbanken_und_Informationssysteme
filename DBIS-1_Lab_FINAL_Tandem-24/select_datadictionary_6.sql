SELECT uc.constraint_name,uc.table_name as master_table,uc.generated,uc.status, ucc.column_name as master_column, ucc.position as master_position,
        uc2.table_name as dependent_table, ucc2.column_name as dependent_column, ucc2.position as dependent_position, 
        uc.r_constraint_name, uc.delete_rule, uc.deferrable, uc.deferred
FROM user_constraints uc, user_cons_columns ucc, user_constraints uc2, user_cons_columns ucc2
WHERE uc.table_name = upper('&tabellenname')
  AND uc.constraint_type = 'R'
  AND uc.constraint_name = ucc.constraint_name
  AND uc2.constraint_name = ucc2.constraint_name
  AND uc.r_constraint_name = uc2.constraint_name
  AND ucc.position = ucc2.position;
  
  
  
  
  Select * From user_cons_columns;
  Select * From user_constraints WHERE constraint_type = 'R';
   
  
   