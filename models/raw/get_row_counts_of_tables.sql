{%- set tab_name = run_query('SELECT table_name FROM raw.information_schema.tables where table_owner is not null')  -%}
--{%- set tab_name = ["customer","orders","product"] -%}
{%- set union_all = " UNION ALL " -%}


{% for tab_name in tab_name %}
select
'{{tab_name}}' as table_name, 
count(*) as cnt  
from RAW.GLOBALMART.{{tab_name}}
{% if not loop.last %} {{union_all}} {% endif %}

{% endfor %}
