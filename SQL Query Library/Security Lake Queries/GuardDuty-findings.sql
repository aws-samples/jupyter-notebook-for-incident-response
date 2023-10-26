-- The following SQL queries have been created to investigate Amazon GuardDuty findings
-- Note: The queries assume that you have implemented Amazon Security Lake into your AWS Environment. Change the database and tables names to reflect the appropriate databases and tables within your environment.
-- Follow the GuardDuty-analysis.ipynb Jupyter Notebook for assistance with Amazon Athena helper functions required for these queries. 

-- List all GuardDuty findings via Security Hub logs to get a broad view of the types of logs
-- Note 1: Change the limit to view more, or remote the limit to view all. 
-- Author: Tim Manik & Jeremy Wade
SELECT * 

FROM "amazon_security_lake_glue_db_us_east_1"."amazon_security_lake_table_us_east_1_sh_findings_1_0" 
WHERE metadata.product.feature.name = 'GuardDuty'
limit 5;

-- List the amount of critical, high, medium, and low severity Amazon GuardDuty findings
-- Note 1: Change the limit to view more, or remote the limit to view all. 
-- Author: Tim Manik & Jeremy Wade

SELECT
count(*) as count, severity as severity
FROM "amazon_security_lake_glue_db_us_east_1"."amazon_security_lake_table_us_east_1_sh_findings_1_0" 
WHERE metadata.product.feature.name = 'GuardDuty'
GROUP BY severity
limit 5;

-- List the 10 most common high severity Amazon GuardDuty finding by finding title (type)
-- Note 1: Change the limit from 10 to view more
-- Note 2: Change the severity to view other findings within different levels of severity: Critical, High, Medium, Low Severity
-- Author: Tim Manik & Jeremy Wade

SELECT
count(*) as count, severity as severity, finding.title as findingTitle
FROM "amazon_security_lake_glue_db_us_east_1"."amazon_security_lake_table_us_east_1_sh_findings_1_0" 
WHERE metadata.product.feature.name = 'GuardDuty'
AND severity = 'High'
GROUP BY severity, finding.title
ORDER BY count DESC
limit 10;

-- List the most common AWS resources associated with High severity Amazon GuardDuty findings
-- Note 1: Change the limit from 10 to view more resources
-- Note 2: Change the severity to view other findings within different levels of severity: Critical, High, Medium, Low Severity
-- Author: Tim Manik & Jeremy Wade

SELECT
count(*) as count, severity as severity, resources[1].type as resourceType, resources[1].uid as resourceId, finding.title as findingTitle
FROM "amazon_security_lake_glue_db_us_east_1"."amazon_security_lake_table_us_east_1_sh_findings_1_0" 
WHERE metadata.product.feature.name = 'GuardDuty'
AND severity = 'High'
GROUP BY severity, resources[1].type, resources[1].uid, finding.title
ORDER BY count DESC
limit 10;

-- List all GuardDuty findings against a specific AWS resource
-- Note 1: Change the limit from 20 to view more resources
-- Note 2: Change the severity to view other findings within different levels of severity: Critical, High, Medium, Low Severity
-- Note 3: {resource_arn} should be replaced with the ARN of the AWS resource in question
-- Author: Tim Manik & Jeremy Wade

SELECT
finding.first_seen_time FirstSeen, severity as severity, resources[1].type as resourceType, resources[1].uid as resourceId, finding.title as findingTitle
FROM "amazon_security_lake_glue_db_us_east_1"."amazon_security_lake_table_us_east_1_sh_findings_1_0" 
WHERE metadata.product.feature.name = 'GuardDuty'
AND severity = 'High'
AND resources[1].uid = '{resource_arn}'
ORDER BY finding.first_seen_time ASC
limit 20;

-- List all GuardDuty findings against a specific AWS resource, COUNT and group by first seen time
-- Note 1: Change the limit from 20 to view more resources
-- Note 2: Change the severity to view other findings within different levels of severity: Critical, High, Medium, Low Severity
-- Note 3: {resource_arn} should be replaced with the ARN of the AWS resource in question
-- Author: Tim Manik & Jeremy Wade

SELECT
finding.first_seen_time FirstSeen, count(finding.first_seen_time), severity as severity, resources[1].type as resourceType, resources[1].uid as resourceId, finding.title as findingTitle
FROM "amazon_security_lake_glue_db_us_east_1"."amazon_security_lake_table_us_east_1_sh_findings_1_0" 
WHERE metadata.product.feature.name = 'GuardDuty'
AND severity = 'High'
AND resources[1].uid = '{resource_arn}'
GROUP BY finding.title, finding.first_seen_time, severity, resources[1].type, resources[1].uid
ORDER BY finding.first_seen_time ASC
limit 20;