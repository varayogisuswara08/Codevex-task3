create database bank_transactions;
use  bank_transactions;
create table customers(
customer_id int primary key,
customer_name varchar(100) not null,
city varchar(50),
join_date date not null,
credit_score int not null
);
create table accounts(
account_id int primary key,
customer_id int not null,
account_type varchar(100) not null,
opening_balance decimal(12,2) not null,
status varchar(20) not null,
constraint fk_accounts_customer
  foreign key (customer_id)references customers(customer_id)
);

create table transactions(
transaction_id int primary key,
account_id int not null,
transaction_date date not null,
transaction_hour int not null,
amount decimal(12,2)not null,
transcation_type varchar(10) not null,
category varchar(30)not null,
constraint fk_transactions_account
  foreign key(account_id)references accounts(account_id)
);

create table loans(
loan_id int primary key,
customer_id int not null,
principal_amount decimal(12,2) not null,
interest_rate decimal(15,2),
issue_date date not null,
status varchar(20)not null,
constraint fk_loans_customer
  foreign key (customer_id) references customers(customer_id)
);

create index idx_account_customer on accounts(customer_id);
create index idx_transaction_account on transactions(account_id);
create index idx_transaction_date on transactions(transaction_date);
create index idx_loans_customer on loans(customer_id);

INSERT INTO customers (customer_id, customer_name, city, join_date, credit_score) VALUES
  (1, 'Jessica Jones', 'Bengaluru', '2021-03-19', 650),
  (2, 'Vikram Brown', 'Delhi', '2020-12-28', 681),
  (3, 'Karen Davis', 'Delhi', '2018-01-16', 633),
  (4, 'Kavya Reddy', 'Bengaluru', '2024-05-15', 693),
  (5, 'Rohan Rodriguez', 'Bengaluru', '2019-02-28', 687),
  (6, 'Vikram Reddy', 'Hyderabad', '2022-02-07', 502),
  (7, 'David Rodriguez', 'New York', '2020-03-16', 684),
  (8, 'Linda Miller', 'Hyderabad', '2022-10-21', 644),
  (9, 'John Patel', 'Mumbai', '2019-06-25', 688),
  (10, 'Linda Gupta', 'Hyderabad', '2024-08-11', 704),
  (11, 'James Verma', 'Houston', '2022-08-29', 686),
  (12, 'Rohan Miller', 'Hyderabad', '2024-08-04', 687),
  (13, 'Karen Gupta', 'San Francisco', '2021-09-15', 712),
  (14, 'Jennifer Patel', 'Delhi', '2018-09-09', 699),
  (15, 'Aditya Smith', 'New York', '2021-09-04', 645),
  (16, 'Robert Martinez', 'Bengaluru', '2020-10-09', 611),
  (17, 'Joseph Miller', 'San Francisco', '2024-01-08', 759),
  (18, 'John Reddy', 'Atlanta', '2024-11-07', 655),
  (19, 'Elizabeth Brown', 'Delhi', '2021-07-29', 652),
  (20, 'Patricia Rodriguez', 'Delhi', '2023-05-23', 660),
  (21, 'Karen Patel', 'Hyderabad', '2019-04-21', 613),
  (22, 'Mary Smith', 'Houston', '2021-06-20', 777),
  (23, 'Thomas Gupta', 'Bengaluru', '2021-02-01', 672),
  (24, 'Kavya Davis', 'Hyderabad', '2019-02-16', 752),
  (25, 'Rohan Sharma', 'Chicago', '2023-04-30', 576),
  (26, 'Elizabeth Brown', 'Atlanta', '2024-05-25', 660),
  (27, 'James Davis', 'Phoenix', '2023-08-04', 624),
  (28, 'Rohan Smith', 'Mumbai', '2021-05-02', 729),
  (29, 'Arjun Jones', 'New York', '2022-02-22', 769),
  (30, 'Patricia Johnson', 'Phoenix', '2018-06-26', 636),
  (31, 'Patricia Johnson', 'Bengaluru', '2024-12-01', 627),
  (32, 'Karen Jones', 'Hyderabad', '2020-06-12', 601),
  (33, 'Karen Johnson', 'Mumbai', '2020-10-01', 847),
  (34, 'Aditya Garcia', 'New York', '2021-04-23', 678),
  (35, 'Elizabeth Rao', 'Mumbai', '2023-04-25', 738),
  (36, 'Robert Chatterjee', 'Chicago', '2022-06-13', 602),
  (37, 'Charles Menon', 'Bengaluru', '2023-11-07', 725),
  (38, 'Arjun Brown', 'Houston', '2025-01-26', 678),
  (39, 'Barbara Nair', 'Mumbai', '2023-12-09', 535),
  (40, 'Thomas Gupta', 'San Francisco', '2019-12-19', 707),
  (41, 'Rajesh Verma', 'Delhi', '2019-03-14', 671),
  (42, 'Elizabeth Martinez', 'Bengaluru', '2020-12-10', 725),
  (43, 'Richard Brown', 'Delhi', '2024-09-07', 693),
  (44, 'Joseph Reddy', 'Bengaluru', '2021-06-23', 713),
  (45, 'Kavya Nair', 'Phoenix', '2023-07-17', 707),
  (46, 'Aditya Brown', 'Delhi', '2023-06-06', 664),
  (47, 'Thomas Jones', 'Hyderabad', '2022-02-18', 644),
  (48, 'Barbara Rodriguez', 'Houston', '2019-07-13', 616),
  (49, 'Sneha Verma', 'Phoenix', '2020-01-29', 663),
  (50, 'Jessica Iyer', 'Chicago', '2024-08-19', 699),
  (51, 'Charles Davis', 'Chicago', '2023-08-09', 621),
  (52, 'Patricia Gupta', 'San Francisco', '2022-05-31', 761),
  (53, 'Richard Nair', 'Mumbai', '2025-03-31', 743),
  (54, 'Rajesh Rodriguez', 'Houston', '2024-02-19', 575),
  (55, 'Ananya Miller', 'Chicago', '2024-06-15', 576),
  (56, 'Arjun Miller', 'Delhi', '2018-08-10', 789),
  (57, 'Arjun Gupta', 'New York', '2021-07-31', 655),
  (58, 'Aditya Davis', 'San Francisco', '2022-09-21', 607),
  (59, 'Sarah Sharma', 'San Francisco', '2023-04-19', 730),
  (60, 'Jessica Garcia', 'Chicago', '2022-02-21', 555),
  (61, 'John Martinez', 'Houston', '2022-02-06', 702),
  (62, 'Elizabeth Smith', 'Phoenix', '2024-04-17', 690),
  (63, 'Kavya Williams', 'New York', '2022-07-24', 741),
  (64, 'Richard Miller', 'Chicago', '2019-06-09', 730),
  (65, 'William Williams', 'Chicago', '2025-03-26', 737),
  (66, 'Aditya Sharma', 'Bengaluru', '2021-12-18', 604),
  (67, 'Joseph Rao', 'Bengaluru', '2021-11-06', 682),
  (68, 'Rajesh Miller', 'Hyderabad', '2021-04-08', 630),
  (69, 'David Rao', 'New York', '2019-09-16', 645),
  (70, 'Jennifer Nair', 'Atlanta', '2024-02-21', 710),
  (71, 'Sarah Gupta', 'Phoenix', '2023-10-30', 706),
  (72, 'Elizabeth Rodriguez', 'Houston', '2024-07-19', 750),
  (73, 'Kavya Nair', 'Mumbai', '2024-06-06', 717),
  (74, 'Jennifer Martinez', 'Houston', '2018-07-26', 638),
  (75, 'Rohan Jones', 'San Francisco', '2024-03-20', 699),
  (76, 'Aditya Gupta', 'Mumbai', '2020-10-13', 704),
  (77, 'Elizabeth Verma', 'Atlanta', '2020-04-16', 697),
  (78, 'Michael Johnson', 'New York', '2024-11-07', 685),
  (79, 'Arjun Verma', 'New York', '2024-06-03', 622),
  (80, 'Kavya Chatterjee', 'Houston', '2018-10-22', 660),
  (81, 'Rohan Gupta', 'Hyderabad', '2021-03-07', 732),
  (82, 'Richard Iyer', 'Phoenix', '2022-11-16', 665),
  (83, 'John Davis', 'Atlanta', '2024-11-19', 687),
  (84, 'Arjun Martinez', 'Bengaluru', '2024-05-02', 625),
  (85, 'Michael Nair', 'Mumbai', '2018-05-11', 686),
  (86, 'Barbara Menon', 'Hyderabad', '2024-03-06', 676),
  (87, 'Kavya Patel', 'Atlanta', '2019-07-21', 797),
  (88, 'Jennifer Brown', 'Atlanta', '2019-05-23', 773),
  (89, 'Susan Smith', 'Atlanta', '2021-09-21', 788),
  (90, 'Arjun Johnson', 'Mumbai', '2018-11-02', 537),
  (91, 'Susan Rodriguez', 'San Francisco', '2022-03-05', 664),
  (92, 'Priya Reddy', 'Houston', '2024-07-27', 662),
  (93, 'Susan Martinez', 'Mumbai', '2018-05-13', 743),
  (94, 'David Smith', 'Hyderabad', '2021-01-10', 721),
  (95, 'Robert Patel', 'Bengaluru', '2023-08-10', 652),
  (96, 'Rohan Miller', 'Phoenix', '2023-05-13', 688),
  (97, 'Charles Martinez', 'Bengaluru', '2022-03-30', 645),
  (98, 'Elizabeth Iyer', 'Houston', '2021-04-30', 788),
  (99, 'Arjun Verma', 'Hyderabad', '2020-06-08', 574),
  (100, 'Mary Reddy', 'Mumbai', '2024-01-05', 795),
  (101, 'Thomas Patel', 'Phoenix', '2022-01-21', 704),
  (102, 'Vikram Rao', 'Houston', '2021-02-07', 535),
  (103, 'Joseph Johnson', 'Bengaluru', '2023-02-09', 593),
  (104, 'Arjun Chatterjee', 'Atlanta', '2021-05-05', 506),
  (105, 'Charles Smith', 'Delhi', '2019-05-22', 815),
  (106, 'Susan Sharma', 'Bengaluru', '2018-07-31', 572),
  (107, 'Priya Rodriguez', 'San Francisco', '2021-02-23', 682),
  (108, 'Rohan Johnson', 'Bengaluru', '2022-08-30', 680),
  (109, 'John Gupta', 'Houston', '2020-01-20', 728),
  (110, 'Karen Sharma', 'New York', '2021-07-10', 522),
  (111, 'Kavya Davis', 'Atlanta', '2019-09-03', 669),
  (112, 'Sarah Nair', 'Phoenix', '2020-09-06', 689),
  (113, 'James Menon', 'Houston', '2025-05-02', 615),
  (114, 'Linda Gupta', 'Houston', '2021-03-08', 578),
  (115, 'Thomas Smith', 'Mumbai', '2025-05-08', 800),
  (116, 'Richard Martinez', 'Phoenix', '2018-09-10', 543),
  (117, 'Joseph Williams', 'Mumbai', '2019-09-13', 679),
  (118, 'Thomas Verma', 'San Francisco', '2023-06-06', 695),
  (119, 'Jennifer Patel', 'Delhi', '2020-08-23', 762),
  (120, 'Elizabeth Verma', 'New York', '2020-02-20', 668),
  (121, 'David Smith', 'Houston', '2022-04-05', 642),
  (122, 'William Jones', 'Delhi', '2022-07-18', 777),
  (123, 'Jennifer Verma', 'San Francisco', '2018-02-17', 669),
  (124, 'Rajesh Rao', 'San Francisco', '2022-05-16', 698),
  (125, 'Rajesh Reddy', 'Mumbai', '2020-09-01', 689),
  (126, 'David Patel', 'New York', '2022-01-29', 696),
  (127, 'Linda Nair', 'Mumbai', '2021-04-29', 737),
  (128, 'Sneha Menon', 'Chicago', '2021-05-20', 718),
  (129, 'Thomas Reddy', 'Delhi', '2018-05-29', 555),
  (130, 'Jessica Iyer', 'Mumbai', '2021-10-09', 678),
  (131, 'Karen Martinez', 'Atlanta', '2022-10-13', 730),
  (132, 'Susan Brown', 'New York', '2024-07-23', 686),
  (133, 'Linda Rao', 'Chicago', '2024-10-25', 613),
  (134, 'David Smith', 'New York', '2025-02-18', 658),
  (135, 'Mary Verma', 'Hyderabad', '2024-11-01', 745),
  (136, 'Aditya Jones', 'Houston', '2018-02-13', 766),
  (137, 'Michael Rao', 'New York', '2024-01-21', 607),
  (138, 'Rajesh Reddy', 'Houston', '2018-02-18', 715),
  (139, 'Richard Verma', 'Mumbai', '2022-03-01', 691),
  (140, 'Richard Patel', 'Mumbai', '2021-09-24', 611),
  (141, 'Sarah Smith', 'Chicago', '2023-10-05', 674),
  (142, 'Kavya Verma', 'New York', '2024-08-24', 703),
  (143, 'Mary Rodriguez', 'New York', '2022-05-08', 609),
  (144, 'Priya Johnson', 'Houston', '2021-05-19', 767),
  (145, 'Jessica Williams', 'Phoenix', '2020-11-22', 729),
  (146, 'Richard Jones', 'Delhi', '2021-05-17', 675),
  (147, 'Richard Verma', 'Hyderabad', '2023-06-20', 674),
  (148, 'Sarah Menon', 'Atlanta', '2025-02-08', 626),
  (149, 'Neha Menon', 'Phoenix', '2020-12-14', 681),
  (150, 'Vikram Menon', 'Bengaluru', '2023-09-17', 656);

INSERT INTO accounts (account_id, customer_id, account_type, opening_balance, status) VALUES
  (1, 1, 'Checking', 7255.89, 'Active'),
  (2, 1, 'Checking', 18363.45, 'Active'),
  (3, 2, 'Savings', 1137.68, 'Active'),
  (4, 2, 'Savings', 5683.94, 'Active'),
  (5, 3, 'Savings', 8723.93, 'Active'),
  (6, 4, 'Savings', 17900.51, 'Active'),
  (7, 5, 'Savings', 12396.35, 'Active'),
  (8, 6, 'Savings', 16715.6, 'Dormant'),
  (9, 6, 'Checking', 9928.4, 'Active'),
  (10, 7, 'Savings', 19475.6, 'Active'),
  (11, 8, 'Checking', 10732.6, 'Active'),
  (12, 9, 'Savings', 5956.33, 'Active'),
  (13, 9, 'Savings', 12891.86, 'Active'),
  (14, 10, 'Checking', 5814.19, 'Active'),
  (15, 10, 'Savings', 1447.61, 'Active'),
  (16, 11, 'Checking', 13187.98, 'Active'),
  (17, 12, 'Savings', 19688.99, 'Active'),
  (18, 13, 'Savings', 14929.75, 'Active'),
  (19, 14, 'Savings', 11319.35, 'Active'),
  (20, 15, 'Checking', 1214.8, 'Active'),
  (21, 15, 'Savings', 7346.88, 'Active'),
  (22, 16, 'Savings', 16116.53, 'Active'),
  (23, 17, 'Savings', 8611.33, 'Active'),
  (24, 18, 'Checking', 3013.78, 'Active'),
  (25, 19, 'Checking', 10475.74, 'Active'),
  (26, 19, 'Checking', 2257.15, 'Active'),
  (27, 20, 'Savings', 1168.11, 'Active'),
  (28, 20, 'Checking', 19770.17, 'Active'),
  (29, 21, 'Savings', 14761.01, 'Active'),
  (30, 22, 'Savings', 14540.14, 'Active'),
  (31, 23, 'Checking', 3072.11, 'Active'),
  (32, 23, 'Savings', 12955.28, 'Active'),
  (33, 24, 'Checking', 18547.39, 'Active'),
  (34, 25, 'Savings', 1193.16, 'Active'),
  (35, 26, 'Checking', 2603.26, 'Active'),
  (36, 27, 'Checking', 18531.07, 'Active'),
  (37, 28, 'Savings', 6528.13, 'Active'),
  (38, 29, 'Savings', 7085.16, 'Active'),
  (39, 29, 'Checking', 9182.52, 'Active'),
  (40, 30, 'Savings', 13873.6, 'Active'),
  (41, 31, 'Checking', 10150.18, 'Active'),
  (42, 32, 'Checking', 5729.24, 'Active'),
  (43, 32, 'Checking', 10649.49, 'Active'),
  (44, 33, 'Savings', 10233.81, 'Active'),
  (45, 33, 'Checking', 15792.96, 'Active'),
  (46, 34, 'Checking', 12846.38, 'Active'),
  (47, 34, 'Savings', 3792.0, 'Active'),
  (48, 35, 'Savings', 17007.49, 'Dormant'),
  (49, 36, 'Savings', 10144.27, 'Active'),
  (50, 37, 'Checking', 8438.97, 'Active'),
  (51, 38, 'Savings', 11866.61, 'Active'),
  (52, 39, 'Checking', 1444.96, 'Active'),
  (53, 40, 'Savings', 3786.21, 'Active'),
  (54, 40, 'Checking', 8974.91, 'Active'),
  (55, 41, 'Savings', 10419.44, 'Active'),
  (56, 42, 'Savings', 15347.54, 'Active'),
  (57, 43, 'Checking', 11727.24, 'Active'),
  (58, 43, 'Savings', 6335.81, 'Active'),
  (59, 44, 'Savings', 11754.93, 'Active'),
  (60, 45, 'Checking', 6418.01, 'Active'),
  (61, 46, 'Savings', 14191.97, 'Active'),
  (62, 47, 'Checking', 6526.34, 'Active'),
  (63, 48, 'Checking', 4789.79, 'Active'),
  (64, 49, 'Checking', 4803.0, 'Active'),
  (65, 49, 'Checking', 8697.33, 'Active'),
  (66, 50, 'Checking', 8515.1, 'Active'),
  (67, 51, 'Savings', 13840.99, 'Active'),
  (68, 51, 'Savings', 7936.4, 'Active'),
  (69, 52, 'Checking', 6338.03, 'Active'),
  (70, 52, 'Checking', 14776.86, 'Active'),
  (71, 53, 'Checking', 1391.69, 'Active'),
  (72, 54, 'Savings', 2880.09, 'Active'),
  (73, 55, 'Checking', 9136.27, 'Active'),
  (74, 56, 'Savings', 5573.06, 'Dormant'),
  (75, 57, 'Checking', 7732.15, 'Active'),
  (76, 58, 'Savings', 14383.24, 'Active'),
  (77, 58, 'Checking', 14174.5, 'Active'),
  (78, 59, 'Checking', 18722.01, 'Active'),
  (79, 59, 'Savings', 17094.03, 'Active'),
  (80, 60, 'Checking', 15139.24, 'Active'),
  (81, 61, 'Savings', 8040.72, 'Active'),
  (82, 62, 'Checking', 17379.86, 'Active'),
  (83, 63, 'Savings', 11944.44, 'Active'),
  (84, 63, 'Checking', 12759.41, 'Active'),
  (85, 64, 'Savings', 12629.5, 'Active'),
  (86, 64, 'Savings', 16641.64, 'Active'),
  (87, 65, 'Savings', 2081.47, 'Dormant'),
  (88, 66, 'Checking', 3863.29, 'Active'),
  (89, 67, 'Checking', 19109.79, 'Dormant'),
  (90, 68, 'Savings', 15453.27, 'Active'),
  (91, 69, 'Savings', 19810.43, 'Active'),
  (92, 70, 'Savings', 18410.28, 'Active'),
  (93, 71, 'Checking', 8142.81, 'Dormant'),
  (94, 71, 'Savings', 12917.44, 'Active'),
  (95, 72, 'Savings', 15568.74, 'Dormant'),
  (96, 73, 'Savings', 12984.48, 'Active'),
  (97, 74, 'Savings', 6817.79, 'Dormant'),
  (98, 75, 'Savings', 3931.7, 'Active'),
  (99, 76, 'Checking', 11294.65, 'Active'),
  (100, 77, 'Savings', 1442.98, 'Active'),
  (101, 78, 'Savings', 18103.87, 'Active'),
  (102, 78, 'Checking', 9559.93, 'Active'),
  (103, 79, 'Savings', 5662.34, 'Active'),
  (104, 79, 'Savings', 15569.41, 'Active'),
  (105, 80, 'Savings', 14663.66, 'Active'),
  (106, 81, 'Savings', 17377.16, 'Active'),
  (107, 81, 'Checking', 15722.26, 'Active'),
  (108, 82, 'Checking', 8494.83, 'Active'),
  (109, 82, 'Savings', 2060.62, 'Active'),
  (110, 83, 'Savings', 1585.73, 'Active'),
  (111, 84, 'Savings', 14493.57, 'Dormant'),
  (112, 85, 'Savings', 6099.38, 'Active'),
  (113, 85, 'Checking', 16498.2, 'Active'),
  (114, 86, 'Checking', 2958.6, 'Active'),
  (115, 87, 'Savings', 15619.82, 'Active'),
  (116, 88, 'Savings', 1740.2, 'Active'),
  (117, 88, 'Checking', 9655.96, 'Active'),
  (118, 89, 'Savings', 3934.86, 'Active'),
  (119, 90, 'Savings', 16497.9, 'Active'),
  (120, 90, 'Checking', 11483.93, 'Active'),
  (121, 91, 'Savings', 14112.75, 'Dormant'),
  (122, 92, 'Checking', 9691.07, 'Active'),
  (123, 93, 'Savings', 3742.48, 'Active'),
  (124, 94, 'Checking', 9933.56, 'Active'),
  (125, 95, 'Savings', 14033.49, 'Active'),
  (126, 95, 'Savings', 2493.56, 'Active'),
  (127, 96, 'Savings', 18784.37, 'Active'),
  (128, 97, 'Checking', 12689.35, 'Active'),
  (129, 98, 'Savings', 2173.94, 'Active'),
  (130, 98, 'Checking', 19456.93, 'Active');

INSERT INTO loans (loan_id, customer_id, principal_amount, interest_rate, issue_date, status) VALUES
  (1, 126, 34960.8, 8.24, '2024-02-12', 'Active'),
  (2, 10, 18523.33, 9.16, '2026-03-13', 'Active'),
  (3, 14, 41775.63, 10.95, '2025-10-14', 'Active'),
  (4, 67, 40179.16, 8.71, '2024-07-15', 'Paid Off'),
  (5, 61, 17352.05, 9.84, '2024-05-09', 'Active'),
  (6, 149, 11640.44, 11.24, '2024-11-14', 'Paid Off'),
  (7, 46, 12780.52, 11.91, '2025-06-24', 'Paid Off'),
  (8, 129, 7677.68, 14.38, '2026-03-13', 'Paid Off'),
  (9, 139, 27444.88, 8.39, '2024-11-19', 'Paid Off'),
  (10, 114, 11220.03, 15.06, '2026-04-12', 'Active'),
  (11, 102, 36965.8, 13.21, '2025-12-24', 'Defaulted'),
  (12, 100, 36237.49, 7.92, '2025-05-17', 'Active'),
  (13, 27, 18849.3, 14.0, '2024-06-03', 'Paid Off'),
  (14, 65, 32242.15, 9.88, '2026-02-17', 'Active'),
  (15, 37, 16425.65, 6.68, '2024-07-13', 'Paid Off'),
  (16, 110, 21307.59, 13.17, '2024-10-30', 'Defaulted'),
  (17, 54, 33123.77, 14.85, '2025-06-15', 'Defaulted'),
  (18, 38, 38973.94, 8.58, '2024-03-15', 'Active'),
  (19, 99, 40503.36, 14.89, '2026-03-26', 'Defaulted'),
  (20, 6, 32916.69, 9.55, '2025-09-22', 'Paid Off'),
  (21, 57, 9491.99, 8.79, '2025-08-24', 'Defaulted'),
  (22, 12, 31337.91, 15.39, '2025-07-28', 'Paid Off'),
  (23, 32, 36953.51, 13.94, '2026-03-22', 'Active'),
  (24, 62, 31460.48, 10.25, '2026-03-25', 'Active'),
  (25, 39, 9381.38, 10.75, '2026-01-17', 'Defaulted'),
  (26, 36, 24808.2, 10.33, '2024-10-18', 'Active'),
  (27, 33, 41188.19, 12.94, '2026-04-28', 'Paid Off'),
  (28, 119, 44801.6, 12.41, '2025-05-03', 'Active'),
  (29, 42, 25682.56, 11.26, '2026-01-05', 'Paid Off'),
  (30, 66, 21214.92, 7.64, '2024-03-30', 'Paid Off'),
  (31, 22, 35997.01, 10.08, '2025-11-06', 'Active'),
  (32, 2, 10230.05, 11.9, '2024-10-06', 'Active'),
  (33, 45, 17478.2, 7.71, '2025-05-26', 'Active'),
  (34, 118, 21787.57, 9.96, '2024-06-05', 'Active'),
  (35, 44, 9323.44, 12.81, '2024-12-29', 'Defaulted'),
  (36, 138, 43129.87, 11.29, '2025-04-21', 'Defaulted'),
  (37, 49, 46354.78, 7.86, '2025-08-20', 'Paid Off'),
  (38, 53, 45545.65, 8.44, '2026-04-13', 'Paid Off'),
  (39, 86, 10237.5, 6.96, '2026-03-08', 'Active'),
  (40, 71, 44258.51, 9.74, '2026-02-14', 'Paid Off'),
  (41, 59, 15665.92, 11.23, '2025-09-18', 'Paid Off'),
  (42, 148, 36324.73, 9.01, '2025-11-02', 'Defaulted'),
  (43, 43, 33920.25, 9.82, '2025-03-28', 'Active'),
  (44, 16, 17426.04, 8.79, '2024-07-17', 'Defaulted'),
  (45, 141, 44718.35, 14.13, '2025-06-25', 'Defaulted'),
  (46, 47, 48356.95, 13.98, '2025-03-20', 'Defaulted'),
  (47, 96, 35207.43, 8.2, '2024-04-18', 'Active'),
  (48, 95, 8848.29, 11.09, '2024-09-07', 'Active'),
  (49, 103, 8934.85, 13.4, '2024-08-20', 'Paid Off'),
  (50, 135, 21255.28, 8.19, '2025-09-08', 'Active'),
  (51, 77, 33800.18, 12.83, '2024-10-28', 'Paid Off'),
  (52, 19, 19337.85, 14.03, '2024-02-14', 'Defaulted'),
  (53, 145, 32290.04, 12.34, '2024-10-24', 'Paid Off'),
  (54, 131, 33583.38, 10.09, '2024-05-06', 'Paid Off'),
  (55, 69, 28258.78, 13.98, '2024-03-27', 'Paid Off'),
  (56, 122, 48297.52, 12.9, '2026-02-06', 'Paid Off'),
  (57, 98, 14518.85, 14.66, '2024-11-29', 'Active'),
  (58, 125, 26171.35, 12.41, '2025-03-25', 'Paid Off'),
  (59, 29, 46831.06, 8.09, '2025-07-29', 'Active'),
  (60, 124, 36191.19, 10.72, '2024-08-20', 'Active');
  
INSERT INTO transactions (transaction_id, account_id, transaction_date, transaction_hour, amount, transcation_type, category) VALUES
  (1, 1, '2026-03-22', 20, 384.51, 'Debit', 'Loan Payment'),
  (2, 1, '2026-03-27', 5, 442.24, 'Debit', 'Shopping'),
  (3, 1, '2026-04-04', 14, 433.88, 'Debit', 'Shopping'),
  (4, 1, '2026-04-07', 7, 484.33, 'Credit', 'Shopping'),
  (5, 1, '2026-04-07', 18, 209.03, 'Debit', 'Travel'),
  (6, 1, '2026-04-10', 11, 321.3, 'Debit', 'Loan Payment'),
  (7, 1, '2026-04-18', 18, 341.62, 'Debit', 'Utilities'),
  (8, 1, '2026-04-19', 14, 114.4, 'Debit', 'Transfer'),
  (9, 1, '2026-05-04', 18, 352.87, 'Debit', 'Dining'),
  (10, 1, '2026-05-05', 15, 514.09, 'Credit', 'Shopping'),
  (11, 1, '2026-05-10', 21, 269.07, 'Debit', 'ATM Withdrawal'),
  (12, 1, '2026-05-15', 11, 115.06, 'Debit', 'Travel'),
  (13, 1, '2026-05-27', 12, 528.11, 'Debit', 'Dining'),
  (14, 1, '2026-05-27', 16, 210.2, 'Debit', 'Travel'),
  (15, 1, '2026-06-01', 6, 227.76, 'Debit', 'Travel'),
  (16, 1, '2026-06-02', 11, 286.01, 'Debit', 'Groceries'),
  (17, 1, '2026-06-11', 12, 196.64, 'Debit', 'Utilities'),
  (18, 1, '2026-06-14', 14, 302.19, 'Debit', 'Loan Payment'),
  (19, 1, '2026-06-21', 6, 135.38, 'Credit', 'Dining'),
  (20, 1, '2026-06-23', 11, 275.43, 'Debit', 'Groceries'),
  (21, 1, '2026-06-24', 15, 319.94, 'Credit', 'Travel'),
  (22, 1, '2026-06-30', 14, 174.2, 'Credit', 'ATM Withdrawal'),
  (23, 2, '2026-03-04', 17, 106.64, 'Debit', 'Transfer'),
  (24, 2, '2026-03-20', 16, 79.84, 'Debit', 'Groceries'),
  (25, 2, '2026-03-25', 23, 52.43, 'Debit', 'Transfer'),
  (26, 2, '2026-03-26', 21, 120.8, 'Credit', 'Groceries'),
  (27, 2, '2026-03-26', 13, 92.49, 'Credit', 'Groceries'),
  (28, 2, '2026-03-28', 15, 132.14, 'Debit', 'Groceries'),
  (29, 2, '2026-03-29', 17, 70.08, 'Debit', 'Travel'),
  (30, 2, '2026-04-01', 14, 77.18, 'Debit', 'Shopping'),
  (31, 2, '2026-04-03', 12, 59.26, 'Debit', 'Transfer'),
  (32, 2, '2026-04-05', 17, 98.96, 'Credit', 'Loan Payment'),
  (33, 2, '2026-04-07', 14, 113.72, 'Credit', 'ATM Withdrawal'),
  (34, 2, '2026-04-07', 8, 27.91, 'Credit', 'ATM Withdrawal'),
  (35, 2, '2026-04-08', 14, 81.78, 'Debit', 'Transfer'),
  (36, 2, '2026-04-09', 15, 44.06, 'Debit', 'Transfer'),
  (37, 2, '2026-04-14', 18, 61.35, 'Credit', 'Groceries'),
  (38, 2, '2026-04-15', 10, 135.19, 'Debit', 'Utilities'),
  (39, 2, '2026-04-17', 14, 136.5, 'Debit', 'Dining'),
  (40, 2, '2026-04-23', 15, 85.05, 'Debit', 'Travel'),
  (41, 2, '2026-04-24', 12, 104.66, 'Debit', 'Dining'),
  (42, 2, '2026-04-26', 12, 119.46, 'Debit', 'Shopping'),
  (43, 2, '2026-04-26', 10, 66.51, 'Debit', 'Groceries'),
  (44, 2, '2026-04-29', 17, 31.18, 'Debit', 'Shopping'),
  (45, 2, '2026-04-30', 12, 101.28, 'Credit', 'Loan Payment'),
  (46, 2, '2026-04-30', 15, 59.01, 'Debit', 'Dining'),
  (47, 2, '2026-05-04', 13, 86.28, 'Debit', 'Loan Payment'),
  (48, 2, '2026-05-05', 19, 74.12, 'Debit', 'ATM Withdrawal'),
  (49, 2, '2026-05-05', 17, 89.22, 'Debit', 'Shopping'),
  (50, 2, '2026-05-11', 20, 86.15, 'Debit', 'Groceries'),
  (51, 2, '2026-05-13', 15, 150.34, 'Debit', 'Loan Payment'),
  (52, 2, '2026-05-17', 15, 111.45, 'Debit', 'Shopping'),
  (53, 2, '2026-05-21', 14, 119.65, 'Debit', 'ATM Withdrawal'),
  (54, 2, '2026-05-29', 18, 54.17, 'Debit', 'Transfer'),
  (55, 2, '2026-06-08', 16, 105.3, 'Debit', 'Dining'),
  (56, 2, '2026-06-10', 11, 66.07, 'Debit', 'Groceries'),
  (57, 2, '2026-06-12', 23, 116.37, 'Debit', 'Dining'),
  (58, 2, '2026-06-20', 7, 93.31, 'Debit', 'Groceries'),
  (59, 2, '2026-06-21', 17, 101.84, 'Debit', 'Loan Payment'),
  (60, 2, '2026-06-24', 9, 64.6, 'Credit', 'Shopping'),
  (61, 2, '2026-06-28', 16, 34.24, 'Debit', 'ATM Withdrawal'),
  (62, 2, '2026-06-28', 11, 95.63, 'Debit', 'ATM Withdrawal'),
  (63, 2, '2026-06-28', 8, 97.68, 'Debit', 'Loan Payment'),
  (64, 2, '2026-06-29', 10, 73.29, 'Debit', 'Dining'),
  (65, 2, '2026-06-30', 12, 92.76, 'Debit', 'Utilities'),
  (66, 3, '2026-03-04', 16, 163.77, 'Debit', 'Loan Payment'),
  (67, 3, '2026-03-07', 16, 62.01, 'Debit', 'ATM Withdrawal'),
  (68, 3, '2026-03-08', 6, 191.72, 'Debit', 'ATM Withdrawal'),
  (69, 3, '2026-03-13', 19, 191.93, 'Debit', 'Shopping'),
  (70, 3, '2026-03-14', 10, 216.11, 'Debit', 'Transfer'),
  (71, 3, '2026-03-15', 6, 111.76, 'Debit', 'Shopping'),
  (72, 3, '2026-03-22', 19, 191.69, 'Debit', 'Dining'),
  (73, 3, '2026-03-23', 9, 68.31, 'Debit', 'Transfer'),
  (74, 3, '2026-03-24', 12, 156.75, 'Debit', 'Dining'),
  (75, 3, '2026-03-26', 6, 160.97, 'Debit', 'Travel'),
  (76, 3, '2026-03-30', 16, 248.68, 'Debit', 'Transfer'),
  (77, 3, '2026-03-30', 14, 83.52, 'Credit', 'Loan Payment'),
  (78, 3, '2026-03-30', 14, 220.9, 'Debit', 'Utilities'),
  (79, 3, '2026-04-02', 7, 220.06, 'Credit', 'Utilities'),
  (80, 3, '2026-04-02', 14, 112.63, 'Credit', 'Shopping'),
  (81, 3, '2026-04-03', 11, 180.76, 'Debit', 'Loan Payment'),
  (82, 3, '2026-04-10', 17, 90.5, 'Debit', 'Dining'),
  (83, 3, '2026-04-19', 14, 120.19, 'Debit', 'ATM Withdrawal'),
  (84, 3, '2026-04-25', 16, 136.5, 'Debit', 'Travel'),
  (85, 3, '2026-04-28', 10, 131.28, 'Credit', 'Dining'),
  (86, 3, '2026-05-03', 12, 50.16, 'Debit', 'Transfer'),
  (87, 3, '2026-05-06', 16, 177.33, 'Debit', 'Transfer'),
  (88, 3, '2026-05-07', 15, 268.39, 'Debit', 'Dining'),
  (89, 3, '2026-05-08', 13, 274.17, 'Debit', 'Travel'),
  (90, 3, '2026-05-11', 10, 124.11, 'Debit', 'ATM Withdrawal'),
  (91, 3, '2026-05-12', 18, 225.03, 'Credit', 'Loan Payment'),
  (92, 3, '2026-05-15', 8, 162.82, 'Debit', 'Utilities'),
  (93, 3, '2026-05-17', 10, 174.08, 'Debit', 'Dining'),
  (94, 3, '2026-05-20', 17, 134.22, 'Debit', 'Travel'),
  (95, 3, '2026-05-21', 14, 135.83, 'Debit', 'Shopping'),
  (96, 3, '2026-05-25', 17, 325.92, 'Debit', 'Loan Payment'),
  (97, 3, '2026-05-29', 9, 127.15, 'Debit', 'Groceries'),
  (98, 3, '2026-06-01', 16, 44.57, 'Debit', 'Travel'),
  (99, 3, '2026-06-07', 14, 164.73, 'Debit', 'Transfer'),
  (100, 3, '2026-06-08', 16, 205.89, 'Debit', 'Loan Payment'),
  (101, 3, '2026-06-11', 12, 99.02, 'Debit', 'Dining'),
  (102, 3, '2026-06-11', 10, 125.11, 'Debit', 'Dining'),
  (103, 3, '2026-06-23', 16, 249.94, 'Debit', 'Loan Payment'),
  (104, 3, '2026-06-27', 13, 235.86, 'Debit', 'ATM Withdrawal'),
  (105, 3, '2026-06-28', 14, 110.7, 'Credit', 'Shopping'),
  (106, 4, '2026-03-12', 15, 173.22, 'Debit', 'Utilities'),
  (107, 4, '2026-03-29', 10, 184.16, 'Debit', 'ATM Withdrawal'),
  (108, 4, '2026-03-30', 13, 175.51, 'Debit', 'Groceries'),
  (109, 4, '2026-03-31', 12, 154.0, 'Debit', 'Loan Payment'),
  (110, 4, '2026-04-29', 4, 231.15, 'Debit', 'Shopping'),
  (111, 4, '2026-05-03', 5, 311.59, 'Debit', 'Loan Payment'),
  (112, 4, '2026-05-05', 22, 91.42, 'Debit', 'Travel'),
  (113, 4, '2026-05-28', 20, 107.99, 'Debit', 'Shopping'),
  (114, 4, '2026-06-06', 17, 275.32, 'Debit', 'Transfer'),
  (115, 4, '2026-06-09', 13, 304.79, 'Debit', 'ATM Withdrawal'),
  (116, 4, '2026-06-10', 11, 275.95, 'Credit', 'Shopping'),
  (117, 4, '2026-06-20', 14, 257.46, 'Credit', 'Utilities'),
  (118, 4, '2026-06-23', 10, 18.57, 'Debit', 'Utilities'),
  (119, 4, '2026-06-23', 19, 296.26, 'Debit', 'Utilities'),
  (120, 4, '2026-06-25', 15, 503.31, 'Debit', 'Dining'),
  (121, 4, '2026-06-26', 15, 206.86, 'Debit', 'ATM Withdrawal'),
  (122, 4, '2026-06-27', 13, 236.95, 'Debit', 'Travel'),
  (123, 5, '2026-03-12', 22, 191.76, 'Debit', 'Travel'),
  (124, 5, '2026-03-14', 17, 168.9, 'Debit', 'Utilities'),
  (125, 5, '2026-04-01', 8, 116.71, 'Debit', 'Groceries'),
  (126, 5, '2026-04-01', 4, 94.68, 'Credit', 'Shopping'),
  (127, 5, '2026-04-18', 12, 165.81, 'Debit', 'Shopping'),
  (128, 5, '2026-05-02', 10, 137.45, 'Debit', 'Loan Payment'),
  (129, 5, '2026-05-05', 18, 211.14, 'Debit', 'Transfer'),
  (130, 5, '2026-05-13', 14, 175.91, 'Credit', 'ATM Withdrawal'),
  (131, 5, '2026-05-15', 11, 248.82, 'Credit', 'Groceries'),
  (132, 5, '2026-05-18', 15, 198.17, 'Debit', 'Dining'),
  (133, 5, '2026-05-22', 15, 163.91, 'Debit', 'Travel'),
  (134, 5, '2026-05-28', 10, 103.08, 'Debit', 'Loan Payment'),
  (135, 5, '2026-05-28', 10, 183.49, 'Credit', 'Transfer'),
  (136, 5, '2026-05-31', 16, 52.95, 'Debit', 'Dining'),
  (137, 5, '2026-06-03', 11, 141.28, 'Debit', 'Loan Payment'),
  (138, 5, '2026-06-08', 19, 105.63, 'Debit', 'Transfer'),
  (139, 5, '2026-06-17', 15, 232.89, 'Debit', 'ATM Withdrawal'),
  (140, 5, '2026-06-24', 12, 256.31, 'Debit', 'Loan Payment'),
  (141, 5, '2026-06-25', 14, 192.71, 'Debit', 'Groceries'),
  (142, 6, '2026-03-06', 19, 269.61, 'Debit', 'Transfer'),
  (143, 6, '2026-03-12', 20, 133.11, 'Debit', 'Dining'),
  (144, 6, '2026-03-24', 12, 180.91, 'Credit', 'Shopping'),
  (145, 6, '2026-03-28', 13, 315.13, 'Debit', 'Groceries'),
  (146, 6, '2026-03-31', 14, 334.59, 'Credit', 'Travel'),
  (147, 6, '2026-04-06', 12, 292.81, 'Debit', 'Travel'),
  (148, 6, '2026-04-15', 19, 279.6, 'Debit', 'Utilities'),
  (149, 6, '2026-04-18', 14, 63.89, 'Credit', 'Loan Payment'),
  (150, 6, '2026-04-28', 12, 209.92, 'Debit', 'Travel'),
  (151, 6, '2026-05-05', 16, 156.39, 'Credit', 'Dining'),
  (152, 6, '2026-05-09', 15, 132.73, 'Debit', 'Loan Payment'),
  (153, 6, '2026-05-10', 5, 142.24, 'Debit', 'Shopping'),
  (154, 6, '2026-05-14', 10, 274.76, 'Credit', 'Shopping'),
  (155, 6, '2026-05-26', 9, 294.05, 'Credit', 'ATM Withdrawal'),
  (156, 6, '2026-05-27', 15, 295.82, 'Debit', 'Transfer'),
  (157, 6, '2026-05-27', 18, 250.18, 'Credit', 'Transfer'),
  (158, 6, '2026-06-06', 7, 212.22, 'Debit', 'Utilities'),
  (159, 6, '2026-06-07', 23, 260.52, 'Debit', 'Loan Payment'),
  (160, 6, '2026-06-08', 12, 300.36, 'Credit', 'Transfer'),
  (161, 6, '2026-06-11', 14, 328.74, 'Debit', 'ATM Withdrawal'),
  (162, 6, '2026-06-12', 13, 351.75, 'Credit', 'Groceries'),
  (163, 6, '2026-06-16', 13, 175.9, 'Credit', 'Travel'),
  (164, 6, '2026-06-19', 10, 109.1, 'Credit', 'Dining'),
  (165, 6, '2026-06-19', 10, 225.64, 'Debit', 'Transfer'),
  (166, 6, '2026-06-29', 14, 341.93, 'Credit', 'ATM Withdrawal'),
  (167, 6, '2026-06-30', 10, 271.61, 'Credit', 'Dining'),
  (168, 7, '2026-03-14', 17, 30.24, 'Debit', 'Loan Payment'),
  (169, 7, '2026-03-14', 10, 102.42, 'Credit', 'ATM Withdrawal'),
  (170, 7, '2026-03-28', 15, 49.48, 'Credit', 'Loan Payment'),
  (171, 7, '2026-03-29', 5, 186.06, 'Debit', 'ATM Withdrawal'),
  (172, 7, '2026-03-31', 8, 87.09, 'Debit', 'ATM Withdrawal'),
  (173, 7, '2026-04-07', 11, 141.76, 'Debit', 'ATM Withdrawal'),
  (174, 7, '2026-04-14', 13, 122.81, 'Debit', 'Utilities'),
  (175, 7, '2026-04-17', 9, 180.43, 'Debit', 'ATM Withdrawal'),
  (176, 7, '2026-04-19', 11, 110.02, 'Credit', 'Loan Payment'),
  (177, 7, '2026-04-21', 10, 70.29, 'Debit', 'Groceries'),
  (178, 7, '2026-04-22', 16, 145.6, 'Debit', 'Utilities'),
  (179, 7, '2026-05-03', 14, 140.72, 'Debit', 'Travel'),
  (180, 7, '2026-05-07', 12, 55.5, 'Debit', 'ATM Withdrawal'),
  (181, 7, '2026-05-18', 11, 186.34, 'Debit', 'Dining'),
  (182, 7, '2026-05-21', 13, 135.51, 'Debit', 'Groceries'),
  (183, 7, '2026-05-28', 16, 87.49, 'Debit', 'Loan Payment'),
  (184, 7, '2026-05-31', 14, 139.13, 'Credit', 'Transfer'),
  (185, 7, '2026-06-01', 19, 156.65, 'Debit', 'Loan Payment'),
  (186, 7, '2026-06-04', 13, 53.07, 'Debit', 'Utilities'),
  (187, 7, '2026-06-22', 13, 96.45, 'Credit', 'Utilities'),
  (188, 7, '2026-06-24', 13, 161.12, 'Debit', 'Transfer'),
  (189, 7, '2026-06-24', 18, 143.75, 'Debit', 'Groceries'),
  (190, 7, '2026-06-26', 10, 115.98, 'Debit', 'ATM Withdrawal'),
  (191, 8, '2026-03-03', 16, 166.51, 'Debit', 'Utilities'),
  (192, 8, '2026-03-17', 20, 185.78, 'Debit', 'Dining'),
  (193, 8, '2026-03-20', 19, 142.12, 'Debit', 'Shopping'),
  (194, 8, '2026-03-24', 23, 152.39, 'Debit', 'Shopping'),
  (195, 8, '2026-04-02', 16, 92.83, 'Debit', 'Groceries'),
  (196, 8, '2026-04-06', 15, 95.94, 'Debit', 'Utilities'),
  (197, 8, '2026-04-19', 13, 108.07, 'Debit', 'Transfer'),
  (198, 8, '2026-04-25', 17, 150.47, 'Debit', 'Loan Payment'),
  (199, 8, '2026-05-16', 7, 135.02, 'Debit', 'Transfer'),
  (200, 8, '2026-05-17', 19, 42.85, 'Debit', 'Shopping'),
  (201, 8, '2026-05-18', 18, 92.73, 'Debit', 'Utilities'),
  (202, 8, '2026-05-19', 18, 80.12, 'Debit', 'ATM Withdrawal'),
  (203, 8, '2026-05-29', 11, 126.37, 'Debit', 'Travel'),
  (204, 8, '2026-05-29', 14, 31.9, 'Debit', 'Transfer'),
  (205, 8, '2026-05-30', 11, 58.87, 'Debit', 'Transfer'),
  (206, 8, '2026-06-07', 14, 88.29, 'Debit', 'Utilities'),
  (207, 8, '2026-06-19', 19, 114.59, 'Debit', 'Travel'),
  (208, 8, '2026-06-25', 13, 5.0, 'Debit', 'Dining'),
  (209, 9, '2026-03-14', 19, 116.39, 'Debit', 'Dining'),
  (210, 9, '2026-03-16', 16, 66.15, 'Credit', 'Travel'),
  (211, 9, '2026-03-16', 13, 127.91, 'Debit', 'Shopping'),
  (212, 9, '2026-03-19', 11, 107.58, 'Debit', 'Loan Payment'),
  (213, 9, '2026-03-25', 10, 95.01, 'Credit', 'Travel'),
  (214, 9, '2026-03-26', 17, 87.93, 'Debit', 'Dining'),
  (215, 9, '2026-03-26', 21, 133.52, 'Debit', 'Utilities'),
  (216, 9, '2026-03-28', 3, 75.02, 'Debit', 'Shopping'),
  (217, 9, '2026-04-02', 9, 86.18, 'Debit', 'Transfer'),
  (218, 9, '2026-04-06', 14, 168.95, 'Credit', 'Utilities'),
  (219, 9, '2026-04-09', 15, 169.45, 'Debit', 'Loan Payment'),
  (220, 9, '2026-04-12', 15, 165.08, 'Debit', 'ATM Withdrawal'),
  (221, 9, '2026-04-13', 14, 76.06, 'Credit', 'Transfer'),
  (222, 9, '2026-04-13', 17, 109.12, 'Debit', 'Shopping'),
  (223, 9, '2026-04-18', 12, 115.8, 'Debit', 'Transfer'),
  (224, 9, '2026-04-20', 15, 67.94, 'Debit', 'Loan Payment'),
  (225, 9, '2026-04-21', 17, 114.88, 'Debit', 'Travel'),
  (226, 9, '2026-04-23', 11, 171.85, 'Credit', 'Groceries'),
  (227, 9, '2026-05-01', 19, 118.73, 'Debit', 'Dining'),
  (228, 9, '2026-05-02', 13, 106.44, 'Debit', 'Dining'),
  (229, 9, '2026-05-03', 21, 164.08, 'Credit', 'Dining'),
  (230, 9, '2026-05-14', 9, 159.6, 'Debit', 'Loan Payment'),
  (231, 9, '2026-05-18', 10, 88.98, 'Debit', 'Transfer'),
  (232, 9, '2026-05-18', 15, 231.46, 'Debit', 'Groceries'),
  (233, 9, '2026-05-23', 14, 128.87, 'Credit', 'Travel'),
  (234, 9, '2026-06-01', 20, 120.36, 'Debit', 'Groceries'),
  (235, 9, '2026-06-04', 17, 161.6, 'Debit', 'Loan Payment'),
  (236, 9, '2026-06-05', 13, 176.39, 'Credit', 'Loan Payment'),
  (237, 9, '2026-06-05', 12, 212.51, 'Debit', 'Groceries'),
  (238, 9, '2026-06-12', 18, 74.7, 'Debit', 'Groceries'),
  (239, 9, '2026-06-14', 6, 139.77, 'Debit', 'Utilities'),
  (240, 9, '2026-06-18', 16, 30.03, 'Debit', 'Loan Payment'),
  (241, 9, '2026-06-20', 13, 245.35, 'Debit', 'Transfer'),
  (242, 9, '2026-06-23', 15, 136.65, 'Debit', 'Utilities'),
  (243, 9, '2026-06-24', 17, 98.43, 'Debit', 'Travel'),
  (244, 9, '2026-06-30', 16, 133.25, 'Debit', 'Transfer'),
  (245, 10, '2026-03-16', 16, 124.79, 'Credit', 'Shopping'),
  (246, 10, '2026-03-21', 7, 72.47, 'Credit', 'Loan Payment'),
  (247, 10, '2026-03-22', 21, 112.65, 'Debit', 'ATM Withdrawal'),
  (248, 10, '2026-03-22', 16, 134.99, 'Debit', 'Travel'),
  (249, 10, '2026-03-29', 3, 62.99, 'Debit', 'Groceries'),
  (250, 10, '2026-04-02', 10, 69.56, 'Debit', 'Utilities'),
  (251, 10, '2026-04-14', 14, 87.81, 'Debit', 'Groceries'),
  (252, 10, '2026-04-27', 17, 127.49, 'Debit', 'Groceries'),
  (253, 10, '2026-05-03', 16, 168.61, 'Debit', 'Utilities'),
  (254, 10, '2026-05-09', 8, 137.42, 'Credit', 'Dining'),
  (255, 10, '2026-05-09', 16, 110.9, 'Debit', 'Travel'),
  (256, 10, '2026-05-13', 12, 60.39, 'Credit', 'Transfer'),
  (257, 10, '2026-05-16', 19, 125.67, 'Debit', 'Transfer'),
  (258, 10, '2026-05-19', 7, 125.46, 'Debit', 'Loan Payment'),
  (259, 10, '2026-05-25', 5, 71.5, 'Debit', 'Transfer'),
  (260, 10, '2026-06-01', 19, 112.52, 'Debit', 'Dining'),
  (261, 10, '2026-06-16', 21, 105.93, 'Credit', 'Dining'),
  (262, 10, '2026-06-16', 11, 83.35, 'Debit', 'ATM Withdrawal'),
  (263, 11, '2026-03-03', 9, 61.26, 'Debit', 'Transfer'),
  (264, 11, '2026-03-12', 8, 87.28, 'Debit', 'Loan Payment'),
  (265, 11, '2026-03-18', 3, 51.79, 'Credit', 'Shopping'),
  (266, 11, '2026-03-21', 15, 127.62, 'Credit', 'Travel'),
  (267, 11, '2026-04-01', 10, 82.27, 'Debit', 'Utilities'),
  (268, 11, '2026-04-08', 16, 70.49, 'Credit', 'Travel'),
  (269, 11, '2026-04-21', 17, 5.0, 'Credit', 'Groceries'),
  (270, 11, '2026-04-23', 17, 65.8, 'Debit', 'Dining'),
  (271, 11, '2026-05-03', 5, 72.39, 'Debit', 'Dining'),
  (272, 11, '2026-05-05', 12, 63.16, 'Credit', 'Groceries'),
  (273, 11, '2026-05-08', 16, 92.73, 'Debit', 'Loan Payment'),
  (274, 11, '2026-05-17', 14, 114.35, 'Debit', 'Dining'),
  (275, 11, '2026-05-31', 12, 35.87, 'Debit', 'Loan Payment'),
  (276, 11, '2026-06-16', 9, 33.32, 'Debit', 'Groceries'),
  (277, 11, '2026-06-17', 13, 80.84, 'Debit', 'Transfer'),
  (278, 11, '2026-06-17', 14, 54.76, 'Debit', 'Loan Payment'),
  (279, 11, '2026-06-24', 16, 83.27, 'Debit', 'Shopping'),
  (280, 11, '2026-06-26', 19, 74.04, 'Debit', 'Transfer'),
  (281, 12, '2026-03-03', 22, 47.14, 'Debit', 'ATM Withdrawal'),
  (282, 12, '2026-03-07', 10, 12.69, 'Credit', 'Travel'),
  (283, 12, '2026-03-10', 5, 47.73, 'Debit', 'ATM Withdrawal'),
  (284, 12, '2026-03-14', 18, 39.24, 'Debit', 'ATM Withdrawal'),
  (285, 12, '2026-03-15', 14, 86.42, 'Debit', 'Dining'),
  (286, 12, '2026-03-17', 13, 60.15, 'Credit', 'Loan Payment'),
  (287, 12, '2026-03-18', 15, 54.35, 'Debit', 'ATM Withdrawal'),
  (288, 12, '2026-03-21', 8, 82.08, 'Debit', 'Travel'),
  (289, 12, '2026-03-28', 15, 66.58, 'Debit', 'Groceries'),
  (290, 12, '2026-04-05', 12, 57.84, 'Debit', 'Utilities'),
  (291, 12, '2026-04-09', 17, 63.14, 'Debit', 'Groceries'),
  (292, 12, '2026-04-16', 14, 17.63, 'Debit', 'Transfer'),
  (293, 12, '2026-05-05', 16, 83.64, 'Credit', 'Dining'),
  (294, 12, '2026-05-11', 16, 6.43, 'Debit', 'Groceries'),
  (295, 12, '2026-05-11', 12, 46.56, 'Debit', 'Travel'),
  (296, 12, '2026-05-14', 21, 34.18, 'Debit', 'Utilities'),
  (297, 12, '2026-06-08', 17, 27.61, 'Debit', 'Travel'),
  (298, 12, '2026-06-09', 19, 25.54, 'Debit', 'Shopping'),
  (299, 12, '2026-06-26', 10, 72.64, 'Debit', 'Groceries'),
  (300, 13, '2026-03-04', 14, 61.68, 'Debit', 'Shopping'),
  (301, 13, '2026-03-11', 15, 245.87, 'Debit', 'Loan Payment'),
  (302, 13, '2026-03-12', 11, 131.77, 'Credit', 'Shopping'),
  (303, 13, '2026-03-16', 14, 237.48, 'Debit', 'Dining'),
  (304, 13, '2026-03-17', 12, 252.63, 'Debit', 'Dining'),
  (305, 13, '2026-03-17', 16, 124.49, 'Debit', 'Transfer'),
  (306, 13, '2026-03-19', 22, 138.69, 'Debit', 'Travel'),
  (307, 13, '2026-03-20', 17, 183.34, 'Credit', 'Dining'),
  (308, 13, '2026-03-21', 10, 277.22, 'Debit', 'Shopping'),
  (309, 13, '2026-03-27', 17, 191.62, 'Debit', 'Travel'),
  (310, 13, '2026-03-28', 12, 309.82, 'Debit', 'Loan Payment'),
  (311, 13, '2026-04-02', 13, 210.6, 'Debit', 'Transfer'),
  (312, 13, '2026-04-05', 13, 258.89, 'Debit', 'Dining'),
  (313, 13, '2026-04-06', 10, 255.47, 'Credit', 'ATM Withdrawal'),
  (314, 13, '2026-04-07', 14, 309.5, 'Debit', 'Travel'),
  (315, 13, '2026-04-18', 9, 189.68, 'Credit', 'Utilities'),
  (316, 13, '2026-04-20', 5, 234.29, 'Debit', 'Loan Payment'),
  (317, 13, '2026-04-21', 12, 118.92, 'Debit', 'Travel'),
  (318, 13, '2026-04-27', 20, 206.11, 'Debit', 'Utilities'),
  (319, 13, '2026-05-01', 14, 248.15, 'Credit', 'Loan Payment'),
  (320, 13, '2026-05-08', 8, 240.8, 'Debit', 'Dining'),
  (321, 13, '2026-05-16', 15, 324.64, 'Debit', 'Groceries'),
  (322, 13, '2026-05-16', 9, 181.3, 'Debit', 'ATM Withdrawal'),
  (323, 13, '2026-05-17', 10, 85.96, 'Debit', 'Shopping'),
  (324, 13, '2026-05-17', 11, 233.8, 'Debit', 'Shopping'),
  (325, 13, '2026-05-25', 16, 266.07, 'Credit', 'Utilities'),
  (326, 13, '2026-05-26', 10, 211.12, 'Debit', 'Groceries'),
  (327, 13, '2026-05-31', 10, 211.32, 'Credit', 'Travel'),
  (328, 13, '2026-06-01', 14, 126.19, 'Credit', 'Travel'),
  (329, 13, '2026-06-01', 13, 123.13, 'Debit', 'Transfer'),
  (330, 13, '2026-06-03', 20, 73.76, 'Debit', 'Utilities'),
  (331, 13, '2026-06-07', 19, 155.37, 'Debit', 'Shopping'),
  (332, 13, '2026-06-08', 6, 139.6, 'Credit', 'Loan Payment'),
  (333, 13, '2026-06-09', 14, 111.09, 'Debit', 'Travel'),
  (334, 13, '2026-06-10', 13, 240.64, 'Credit', 'Shopping'),
  (335, 13, '2026-06-10', 19, 177.31, 'Debit', 'Groceries'),
  (336, 13, '2026-06-12', 16, 198.43, 'Debit', 'Transfer'),
  (337, 13, '2026-06-19', 10, 94.54, 'Credit', 'Shopping'),
  (338, 13, '2026-06-19', 12, 302.4, 'Credit', 'Transfer'),
  (339, 13, '2026-06-25', 14, 144.08, 'Debit', 'Dining'),
  (340, 13, '2026-06-29', 8, 103.49, 'Debit', 'Travel'),
  (341, 14, '2026-03-03', 16, 59.33, 'Debit', 'Loan Payment'),
  (342, 14, '2026-03-06', 15, 226.75, 'Credit', 'Travel'),
  (343, 14, '2026-03-08', 11, 83.62, 'Credit', 'Dining'),
  (344, 14, '2026-03-12', 11, 378.35, 'Debit', 'Transfer'),
  (345, 14, '2026-03-16', 17, 171.63, 'Debit', 'Groceries'),
  (346, 14, '2026-03-16', 13, 183.63, 'Debit', 'Groceries'),
  (347, 14, '2026-03-21', 10, 73.83, 'Debit', 'Shopping'),
  (348, 14, '2026-03-23', 13, 190.33, 'Debit', 'Shopping'),
  (349, 14, '2026-03-24', 11, 191.33, 'Credit', 'Shopping'),
  (350, 14, '2026-04-03', 14, 203.93, 'Debit', 'Loan Payment'),
  (351, 14, '2026-04-09', 11, 222.06, 'Debit', 'Transfer'),
  (352, 14, '2026-04-11', 14, 33.24, 'Credit', 'Loan Payment'),
  (353, 14, '2026-04-16', 17, 304.93, 'Debit', 'Travel'),
  (354, 14, '2026-04-23', 20, 153.45, 'Credit', 'Shopping'),
  (355, 14, '2026-04-24', 11, 205.66, 'Debit', 'Travel'),
  (356, 14, '2026-05-01', 16, 275.96, 'Debit', 'Transfer'),
  (357, 14, '2026-05-02', 11, 299.84, 'Debit', 'Dining'),
  (358, 14, '2026-05-03', 19, 159.96, 'Debit', 'Shopping'),
  (359, 14, '2026-05-04', 19, 249.03, 'Debit', 'Dining'),
  (360, 14, '2026-05-05', 14, 253.34, 'Debit', 'Shopping'),
  (361, 14, '2026-05-06', 11, 342.13, 'Debit', 'Groceries'),
  (362, 14, '2026-05-08', 14, 255.2, 'Credit', 'Loan Payment'),
  (363, 14, '2026-05-20', 8, 113.79, 'Debit', 'Travel'),
  (364, 14, '2026-05-30', 16, 202.86, 'Debit', 'Groceries'),
  (365, 14, '2026-06-01', 16, 259.18, 'Credit', 'ATM Withdrawal'),
  (366, 14, '2026-06-01', 18, 50.75, 'Debit', 'Travel'),
  (367, 14, '2026-06-04', 18, 71.85, 'Credit', 'Loan Payment'),
  (368, 14, '2026-06-05', 16, 231.09, 'Debit', 'Utilities'),
  (369, 14, '2026-06-08', 17, 241.37, 'Credit', 'Groceries'),
  (370, 14, '2026-06-17', 11, 313.19, 'Debit', 'Shopping'),
  (371, 14, '2026-06-19', 19, 321.4, 'Debit', 'Groceries'),
  (372, 14, '2026-06-26', 14, 188.5, 'Debit', 'Utilities'),
  (373, 15, '2026-03-08', 6, 233.1, 'Debit', 'Dining'),
  (374, 15, '2026-03-16', 16, 295.67, 'Debit', 'Transfer'),
  (375, 15, '2026-03-25', 13, 333.7, 'Debit', 'Travel'),
  (376, 15, '2026-04-14', 15, 250.03, 'Debit', 'Dining'),
  (377, 15, '2026-04-26', 14, 142.32, 'Debit', 'ATM Withdrawal'),
  (378, 15, '2026-04-27', 20, 245.64, 'Debit', 'Utilities'),
  (379, 15, '2026-04-28', 12, 212.13, 'Debit', 'ATM Withdrawal'),
  (380, 15, '2026-04-29', 14, 142.84, 'Debit', 'Loan Payment'),
  (381, 15, '2026-05-01', 10, 30.06, 'Debit', 'Dining'),
  (382, 15, '2026-05-03', 14, 191.15, 'Debit', 'Transfer'),
  (383, 15, '2026-05-17', 12, 204.64, 'Debit', 'Dining'),
  (384, 15, '2026-05-18', 17, 143.8, 'Debit', 'Loan Payment'),
  (385, 15, '2026-05-22', 15, 291.28, 'Debit', 'Travel'),
  (386, 15, '2026-05-26', 11, 307.96, 'Debit', 'Groceries'),
  (387, 15, '2026-05-28', 8, 335.27, 'Debit', 'Travel'),
  (388, 15, '2026-06-02', 11, 185.46, 'Debit', 'Dining'),
  (389, 15, '2026-06-05', 12, 297.55, 'Debit', 'Groceries'),
  (390, 15, '2026-06-09', 13, 378.0, 'Debit', 'Transfer'),
  (391, 15, '2026-06-10', 10, 358.29, 'Debit', 'Transfer'),
  (392, 15, '2026-06-29', 15, 397.23, 'Credit', 'Travel'),
  (393, 16, '2026-03-03', 16, 285.92, 'Debit', 'ATM Withdrawal'),
  (394, 16, '2026-03-11', 13, 207.48, 'Debit', 'Loan Payment'),
  (395, 16, '2026-03-13', 20, 210.09, 'Debit', 'Loan Payment'),
  (396, 16, '2026-03-15', 14, 107.65, 'Debit', 'Dining'),
  (397, 16, '2026-03-21', 18, 237.7, 'Debit', 'ATM Withdrawal'),
  (398, 16, '2026-03-22', 13, 278.26, 'Debit', 'Dining'),
  (399, 16, '2026-04-02', 9, 267.11, 'Debit', 'Dining'),
  (400, 16, '2026-04-05', 15, 282.23, 'Debit', 'Travel');
select * from customers;
select * from accounts;
select * from loans;
select * from transactions;

#--data clening 
select transaction_id, count(*)
from transactions
group by transaction_id
having count(*)>1;

select t.transaction_id,t.account_id
from transactions t
left join accounts a on t.account_id=a.account_id
where a.account_id is null;

select a.account_id,a.customer_id
from accounts a
left join customers c on a.customer_id=c.customer_id
where c.customer_id is null;

select transaction_id,amount
from transactions
where amount<=0;

select transaction_id,transaction_hour
from transactions 
where transaction_hour < 0 or transaction_hour > 23;

select customer_id,credit_score
from customers
where credit_score < 300 or credit_score > 850;

create or replace view account_txn_summary as 
select
  account_id,
  count(*)             as txn_count,
  round(avg(amount),2) as avg_amount,
  round(max(amount),2) as max_amount
from transactions
group by account_id;
# transaction pattern

SELECT
    account_id,
    transaction_id,
    transaction_date,
    amount,
    LAG(amount) OVER (PARTITION BY account_id ORDER BY transaction_date, transaction_id) AS prev_amount,
    ROUND(
        amount - LAG(amount) OVER (PARTITION BY account_id ORDER BY transaction_date, transaction_id),
        2
    ) AS amount_change
FROM transactions
ORDER BY account_id, transaction_date;

WITH txn_with_avg AS (
    SELECT
        t.*,
        AVG(amount) OVER (PARTITION BY account_id) AS account_avg_amount
    FROM transactions t
)
SELECT
    account_id,
    transaction_id,
    transaction_date,
    transaction_hour,
    amount,
    ROUND(account_avg_amount, 2) AS account_avg_amount,
    ROUND(amount / NULLIF(account_avg_amount, 0), 1) AS times_average
FROM txn_with_avg
WHERE amount >= 5 * account_avg_amount
ORDER BY times_average DESC;

WITH ranked AS (
    SELECT
        t.*,
        NTILE(10) OVER (PARTITION BY account_id ORDER BY amount) AS decile
    FROM transactions t
)
SELECT account_id, transaction_id, transaction_date, transaction_hour, amount, category
FROM ranked
WHERE decile = 10
  AND transaction_hour BETWEEN 0 AND 5
ORDER BY amount DESC;

WITH lead_calc AS (
    SELECT
        account_id,
        transaction_id,
        transaction_date,
        amount,
        LEAD(amount) OVER (
            PARTITION BY account_id ORDER BY transaction_date, transaction_id
        ) AS next_amount,
        LEAD(transaction_date) OVER (
            PARTITION BY account_id ORDER BY transaction_date, transaction_id
        ) AS next_date
    FROM transactions
)
SELECT *
FROM lead_calc
WHERE amount > 200 AND next_amount > 200
ORDER BY account_id, transaction_date;

SELECT
    t1.account_id,
    t1.transaction_date,
    t1.amount,
    (
        SELECT ROUND(SUM(t2.amount), 2)
        FROM transactions t2
        WHERE t2.account_id = t1.account_id
          AND t2.transaction_date BETWEEN
              DATE_SUB(t1.transaction_date, INTERVAL 6 DAY) AND t1.transaction_date
    ) AS rolling_7day_total
FROM transactions t1
ORDER BY t1.account_id, t1.transaction_date;
#-risk analysis 
WITH ranked AS (
    SELECT *, NTILE(100) OVER (ORDER BY amount) AS percentile
    FROM transactions
)
SELECT account_id, transaction_id, transaction_date, amount, category
FROM ranked
WHERE percentile = 100
ORDER BY amount DESC;

WITH acc_stats AS (
    SELECT
        account_id,
        COUNT(*)                                             AS txn_count,
        ROUND(AVG(amount), 2)                                AS avg_amount,
        MAX(amount)                                           AS max_amount,
        SUM(CASE WHEN transaction_hour BETWEEN 0 AND 5 THEN 1 ELSE 0 END) AS odd_hour_txns
    FROM transactions
    GROUP BY account_id
),
spike_flags AS (
    SELECT account_id, COUNT(*) AS spike_count
    FROM (
        SELECT t.*, AVG(amount) OVER (PARTITION BY account_id) AS acct_avg
        FROM transactions t
    ) x
    WHERE amount >= 5 * acct_avg
    GROUP BY account_id
)
SELECT
    a.account_id,
    a.txn_count,
    a.avg_amount,
    a.max_amount,
    a.odd_hour_txns,
    COALESCE(s.spike_count, 0) AS spike_count,
    CASE
        WHEN COALESCE(s.spike_count, 0) >= 1 AND a.odd_hour_txns >= 1 THEN 'High'
        WHEN COALESCE(s.spike_count, 0) >= 1 OR a.odd_hour_txns >= 2 THEN 'Medium'
        ELSE 'Low'
    END AS risk_level
FROM acc_stats a
LEFT JOIN spike_flags s ON a.account_id = s.account_id
ORDER BY risk_level, a.max_amount DESC;

SELECT
    CASE
        WHEN c.credit_score < 580 THEN 'Poor (<580)'
        WHEN c.credit_score < 670 THEN 'Fair (580-669)'
        WHEN c.credit_score < 740 THEN 'Good (670-739)'
        ELSE 'Excellent (740+)'
    END AS credit_band,
    COUNT(*) AS total_loans,
    SUM(CASE WHEN l.status = 'Defaulted' THEN 1 ELSE 0 END) AS defaults,
    ROUND(100.0 * SUM(CASE WHEN l.status = 'Defaulted' THEN 1 ELSE 0 END) / COUNT(*), 2) AS default_rate_pct
FROM loans l
JOIN customers c ON l.customer_id = c.customer_id
GROUP BY credit_band
ORDER BY default_rate_pct DESC;
#--reporting summary 
SELECT
    ROUND(SUM(principal_amount), 2) AS total_defaulted_principal,
    COUNT(*) AS defaulted_loan_count
FROM loans
WHERE status = 'Defaulted';

WITH spike_flags AS (
    SELECT account_id, COUNT(*) AS spike_count, MAX(amount) AS largest_spike
    FROM (
        SELECT t.*, AVG(amount) OVER (PARTITION BY account_id) AS acct_avg
        FROM transactions t
    ) x
    WHERE amount >= 1 * acct_avg
    GROUP BY account_id
)
SELECT
    c.customer_id,
    c.customer_name,
    sf.account_id,
    sf.spike_count,
    sf.largest_spike
FROM spike_flags sf
JOIN accounts a ON sf.account_id = a.account_id
JOIN customers c ON a.customer_id = c.customer_id
ORDER BY sf.largest_spike DESC;

SELECT
    date_format('%Y-%m', transaction_date) AS txn_month,   
    COUNT(*) AS txn_count,
    ROUND(SUM(amount), 2) AS total_volume
FROM transactions
GROUP BY txn_month
ORDER BY txn_month;

SELECT
    category,
    COUNT(*) AS txn_count,
    ROUND(SUM(amount), 2) AS total_volume
FROM transactions
GROUP BY category
ORDER BY total_volume DESC;

WITH acc_stats AS (
    SELECT account_id,
           SUM(CASE WHEN transaction_hour BETWEEN 0 AND 5 THEN 1 ELSE 0 END) AS odd_hour_txns
    FROM transactions GROUP BY account_id
),
spike_flags AS (
    SELECT account_id, COUNT(*) AS spike_count
    FROM (SELECT t.*, AVG(amount) OVER (PARTITION BY account_id) AS acct_avg FROM transactions t) x
    WHERE amount >= 5 * acct_avg
    GROUP BY account_id
),
risk AS (
    SELECT
        a.account_id,
        CASE
            WHEN COALESCE(s.spike_count, 0) >= 1 AND a.odd_hour_txns >= 1 THEN 'High'
            WHEN COALESCE(s.spike_count, 0) >= 1 OR a.odd_hour_txns >= 2 THEN 'Medium'
            ELSE 'Low'
        END AS risk_level
    FROM acc_stats a
    LEFT JOIN spike_flags s ON a.account_id = s.account_id
)
SELECT risk_level, COUNT(*) AS account_count
FROM risk
GROUP BY risk_level
ORDER BY CASE risk_level WHEN 'High' THEN 1 WHEN 'Medium' THEN 2 ELSE 3 END;


