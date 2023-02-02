-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/dlKkBe
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.

DROP TABLE campaign;
CREATE TABLE "campaign" (
    "cf_id" int   NOT NULL,
    "contact_id" int   NOT NULL,
    "company_name" varchar(100)   NOT NULL,
    "description" text   NOT NULL,
    "goal" numeric(10,2)   NOT NULL,
    "pledged" numeric(10,2)   NOT NULL,
    "outcome" varchar(50)   NOT NULL,
    "backers_count" int   NOT NULL,
    "country" varchar(10)   NOT NULL,
    "currency" varchar(10)   NOT NULL,
    "launch_date" date   NOT NULL,
    "end_date" date   NOT NULL,
    "category_id" varchar(10)   NOT NULL,
    "subcategory_id" varchar(10)   NOT NULL
);

DROP TABLE category;
CREATE TABLE "category" (
    "category_id" varchar(10)   NOT NULL,
    "category_name" varchar(50)   NOT NULL
);

DROP TABLE subcategory;
CREATE TABLE "subcategory" (
    "subcategory_id" varchar(10)   NOT NULL,
    "subcategory_name" varchar(50)   NOT NULL
);

DROP TABLE contacts;
CREATE TABLE "contacts" (
    "contact_id" int   NOT NULL,
    "first_name" varchar(50)   NOT NULL,
    "last_name" varchar(50)   NOT NULL,
    "email" varchar(100)   NOT NULL
);

DROP TABLE backers;
CREATE TABLE "backers" (
    "backer_id" varchar NOT NULL,
    "cf_id" int   NOT NULL,
    "first_name" varchar NOT NULL,
    "last_name" varchar NOT NULL,
    "email" varchar NOT NULL
);

SELECT * FROM backers;

ALTER TABLE "campaign" ADD CONSTRAINT "fk_campaign_contact_id" FOREIGN KEY("contact_id")
REFERENCES "contacts" ("contact_id");

ALTER TABLE "campaign" ADD CONSTRAINT "fk_campaign_category_id" FOREIGN KEY("category_id")
REFERENCES "category" ("category_id");

ALTER TABLE "campaign" ADD CONSTRAINT "fk_campaign_subcategory_id" FOREIGN KEY("subcategory_id")
REFERENCES "subcategory" ("subcategory_id");



-- Challenge Bonus queries.
-- 1. (2.5 pts)
-- Retrieve all the number of backer_counts in descending order for each `cf_id` for the "live" campaigns.
SELECT cf_id, sum(backers_count) as sum_of_backercounts
FROM campaign
WHERE outcome = 'live'
GROUP BY cf_id
ORDER BY sum(backers_count) Desc;

-- 2. (2.5 pts)
-- Using the "backers" table confirm the results in the first query.
SELECT cf_id, count(backer_id) as count
FROM backers 
GROUP BY cf_id
ORDER BY count Desc;

-- 3. (5 pts)
-- Create a table that has the first and last name, and email address of each contact.
-- and the amount left to reach the goal for all "live" projects in descending order. 
DROP TABLE email_contacts_remaining_goal_amount;
SELECT c.first_name, c.last_name, c.email, ((ca.goal) - (ca.pledged)) AS "Remaining_Goal_Amount"
INTO email_contacts_remaining_goal_amount
FROM contacts as c
INNER JOIN campaign as ca 
ON c.contact_id = ca.contact_id
Where outcome = 'live' 
ORDER BY "Remaining_Goal_Amount" DESC



-- Check the table
SELECT * FROM email_contacts_remaining_goal_amount

-- 4. (5 pts)
-- Create a table, "email_backers_remaining_goal_amount" that contains the email address of each backer in descending order, 
-- and has the first and last name of each backer, the cf_id, company name, description, 
-- end date of the campaign, and the remaining amount of the campaign goal as "Left of Goal". 
DROP TABLE email_backers_remaining_goal_amount;
SELECT b.email, b.first_name, b.last_name, b.cf_id, ca.company_name, ca.description, ca.end_date,
((ca.goal) - (ca.pledged)) AS "Left of Goal"
INTO email_backers_remaining_goal_amount
FROM  campaign as ca  
INNER JOIN backers as b 
ON b.cf_id = ca.cf_id
Where ca.outcome = 'live'
ORDER BY b.last_name, b.first_name  ASC;


-- Check the table
SELECT * FROM email_backers_remaining_goal_amount