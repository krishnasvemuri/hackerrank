select sd,ed from 
( select MIN(start_date) as sd,MAX(end_date) as ed,(MAX(end_date)- MIN(start_date)) as day_diff from 
( select end_date-1 as start_date ,end_date as end_date ,row_number() over (order by end_date) as rn ,end_date-row_number() over (order by end_date) as end_date_grp from projects ) 
 GROUP BY end_date_grp ORDER BY 3,1 );