SELECT * FROM gringotts.wizzard_deposits;

SELECT COUNT(*) as 'count' FROM wizzard_deposits;


SELECT MAX(magic_wand_size) AS 'longest_magic_wand' FROM wizzard_deposits;

SELECT deposit_group,
 MAX(magic_wand_size) AS 'longest_magic_wand' 
 FROM wizzard_deposits
 GROUP BY deposit_group
 ORDER BY longest_magic_wand,deposit_group;
 
 SELECT deposit_group 
 FROM wizzard_deposits
	WHERE ( 
    SELECT MIN(magic_wand_size) from wizzard_deposits)
 LIMIT 1;
 
 
 
 SELECT deposit_group,
 SUM(deposit_amount) as 'total_sum'
 FROM wizzard_deposits
 GROUP BY deposit_group
 ORDER BY total_sum;
 
 
  SELECT deposit_group,
 SUM(deposit_amount) as 'total_sum'
 FROM wizzard_deposits
 WHERE magic_wand_creator = 'Ollivander family'
 GROUP BY deposit_group
 ORDER BY deposit_group;

 SELECT deposit_group,
 SUM(deposit_amount) as 'total_sum'
 FROM wizzard_deposits
 WHERE magic_wand_creator = 'Ollivander family'
 GROUP BY deposit_group
 HAVING total_sum < 150000
 ORDER BY total_sum DESC;
 
 
 
 SELECT deposit_group, magic_wand_creator, MIN(deposit_charge) as min_deposit_charge
 FROM wizzard_deposits
 GROUP BY deposit_group,magic_wand_creator
 ORDER BY magic_wand_creator,deposit_group;


SELECT
 CASE
   WHEN age <11 THEN '[0-10]'
   WHEN age <21  THEN '[11-20]'
   WHEN age <31 THEN '[21-30]'
   WHEN age <41 THEN '[31-40]'
   WHEN age <51 THEN '[41-50]'
   WHEN age <61    THEN '[51-60]'
   when age >= 61 then '[61+]'
   END as age_group,
 COUNT(*) as wizard_count
   FROM wizzard_deposits
   GROUP BY age_group
   ORDER BY wizard_count;

