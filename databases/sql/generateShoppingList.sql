-- https://www.interviewquery.com/questions/generate-shopping-list-from-recipes

select grocery, sum(mass) as total_mass
from (
   select * from recipe1 
   union all
   select * from recipe2
   union all
   select * from recipe3
) as t
group by grocery