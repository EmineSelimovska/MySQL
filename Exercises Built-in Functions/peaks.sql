SELECT * FROM geography.peaks;
use geography;

SELECT peak_name,river_name,
 concat(LOWER(peak_name),LOWER(SUBSTRING(river_name, 2))) AS 'mix'
 FROM peaks, rivers
 WHERE right(peak_name,1) = left(river_name,1)
 ORDER BY mix;
