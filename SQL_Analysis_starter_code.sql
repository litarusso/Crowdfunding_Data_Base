-- Challenge Bonus queries.
-- 1. (2.5 pts)
-- Retrieve all the number of backer_counts in descending order for each `cf_id` for the "live" campaigns. 

SELECT 
ca.backers_count,
ca.cf_id,
ca.outcome
FROM campaign as ca
WHERE outcome = 'live'
	ORDER BY backers_count DESC;
	
-- 2. (2.5 pts)
-- Using the "backers" table confirm the results in the first query.
SELECT 
ca.backers_count,
ca.outcome,
b.cf_id
FROM campaign as ca, backers as b
WHERE outcome = 'live';


-- 3. (5 pts)
-- Create a table that has the first and last name, and email address of each contact.
-- and the amount left to reach the goal for all "live" projects in descending order. 
SELECT c.first_name, c.last_name, c.email, ca.outcome, (ca.goal - ca.pledged) as amount_left
INTO contact_summary
FROM contact as c JOIN campaign as ca on c.contact_id = ca.contact_id
WHERE ca.outcome = 'live' 
ORDER BY amount_left DESC
-- Check the table
SELECT * FROM contact_summary

-- 4. (5 pts)
-- Create a table, "email_backers_remaining_goal_amount" that contains the email address of each backer in descending order, 
-- and has the first and last name of each backer, the cf_id, company name, description, 
-- end date of the campaign, and the remaining amount of the campaign goal as "Left of Goal". 
SELECT b.first_name, 
b.last_name, 
b.email, 
ca.cf_id, 
ca.company_name, 
ca.blurb, ca.deadline, 
(ca.goal - ca.pledged) as Left_of_Goal
INTO email_backers_remaining_goal_amount
FROM campaign as ca
JOIN backers as b on ca.cf_id = b.cf_id
ORDER BY last_name DESC

-- Check the table

SELECT * FROM email_backers_remaining_goal_amount
