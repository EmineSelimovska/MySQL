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