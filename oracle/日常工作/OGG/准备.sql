�������
set line 180
SELECT 'alter table '||owner||'.'||table_name||' disable constraint '||constraint_name||'; ' SQL 
from dba_constraints 
where constraint_type='R' and owner in  ('PBCEBDB');
 
 
���ô�����
SELECT 'alter trigger '||owner||'.'||trigger_name||' disable;' from dba_triggers where owner in ('PBCEBDB');
