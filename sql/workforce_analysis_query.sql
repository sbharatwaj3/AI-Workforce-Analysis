CREATE OR REPLACE TABLE `future_of_work.analysis_ready_data` AS
WITH onet_pivoted AS (
  SELECT 
    -- trimmng O*NET code to match the 7-character BLS format
    SUBSTR(`O_NET-SOC Code`, 1, 7) as clean_code, 
    MAX(CASE WHEN `Element Name` = 'Thinking Creatively' AND `Scale ID` = 'IM' THEN `Data Value` END) as creativity,
    MAX(CASE WHEN `Element Name` = 'Working with Computers' AND `Scale ID` = 'IM' THEN `Data Value` END) as digital_intensity,
    MAX(CASE WHEN `Element Name` = 'Documenting/Recording Information' AND `Scale ID` = 'IM' THEN `Data Value` END) as routine_admin,
    MAX(CASE WHEN `Element Name` = 'Assisting and Caring for Others' AND `Scale ID` = 'IM' THEN `Data Value` END) as social_interaction
  FROM `future_of_work.work_activities`
  GROUP BY 1
)
SELECT 
  b.OCC_CODE as soc_code,
  b.OCC_TITLE as job_title,
  -- We already cleaned the wages and employment, but let's keep it safe
  SAFE_CAST(REPLACE(REPLACE(CAST(b.TOT_EMP AS STRING), ',', ''), '*', '0') AS INT64) as total_employment,
  SAFE_CAST(REPLACE(REPLACE(CAST(b.A_MEAN AS STRING), ',', ''), '*', '0') AS FLOAT64) as annual_wage,
  o.creativity,
  o.digital_intensity,
  o.routine_admin,
  o.social_interaction,
  -- Use the alias from the subquery here!
  o.clean_code
FROM `future_of_work.bls_national_2024` b
INNER JOIN onet_pivoted o ON b.OCC_CODE = o.clean_code
WHERE b.OCC_CODE IS NOT NULL;
