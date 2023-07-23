-- Active: 1688969187484@@127.0.0.1@3306

CREATE DATABASE taldio_backend DEFAULT CHARACTER SET = 'utf8mb4';

USE taldio_backend;

CREATE TABLE
    jobs (
        id int(11) AUTO_INCREMENT PRIMARY KEY,
        title varchar(100) NOT NULL,
        level varchar(100) NOT NULL,
        type VARCHAR(100) NOT NULL,
        jobdesc TEXT,
        minimum_qualification TEXT,
        minimum_experience VARCHAR(100),
        skills TEXT,
        benefits TEXT
    );

INSERT INTO
    jobs (
        title,
        level,
        type,
        jobdesc,
        minimum_qualification,
        minimum_experience,
        skills,
        benefits
    )
VALUES (
        'Software Engineer',
        'manajer/asisten manajer',
        'full-time',
        'Software Engineer',
        'S1',
        '3',
        'Programming;Problem Solving',
        'Health Insurance;Flexible Work Hours'
    ), (
        'Data Analyst',
        'pegawai non-manajemen & non-supervisor',
        'contract',
        'Data Analyst',
        'D3',
        '2',
        'Data Analysis;Excel',
        'Paid Time Off;Training and Development Opportunities'
    ), (
        'Marketing Manager',
        'ceo/gm/direktur/manajer senior',
        'full-time',
        'Marketing Manager',
        'S1',
        '5',
        'Marketing Strategy;Team Management',
        'Company Car;Performance Bonuses'
    ), (
        'Sales Executive',
        'supervisor/koordinator',
        'full-time',
        'Sales Executive',
        'SMK',
        '2',
        'Sales Techniques;Customer Relationship Management',
        'Commission;Paid Sick Leave'
    ), (
        'Graphic Designer',
        'pegawai non-manajemen & non-supervisor',
        'temporary',
        'Graphic Designer',
        'D3',
        '1',
        'Adobe Creative Suite;Typography',
        'Remote Work;Free Snacks at Office'
    ), (
        'HR Coordinator',
        'manajer/asisten manajer',
        'contract',
        'HR Coordinator',
        'D3',
        '3',
        'Recruitment;Employee Onboarding',
        '401(k) Retirement Plan;Health and Wellness Programs'
    ), (
        'Accountant',
        'manajer/asisten manajer',
        'full-time',
        'Accountant',
        'S1',
        '4',
        'Financial Reporting;Budgeting',
        'Flexible Spending Accounts;Gym Membership'
    ), (
        'Content Writer',
        'supervisor/koordinator',
        'part-time',
        'Content Writer',
        'S1',
        '1',
        'Content Creation;SEO',
        'Remote Work;Paid Parental Leave'
    ), (
        'Customer Service Representative',
        'pegawai non-manajemen & non-supervisor',
        'full-time',
        'Customer Service Representative',
        'SMK',
        '2',
        'Communication Skills;Problem Solving',
        'Employee Discounts;Career Advancement Opportunities'
    ), (
        'Project Manager',
        'ceo/gm/direktur/manajer senior',
        'full-time',
        'Project Manager',
        'S1',
        '5',
        'Project Planning;Risk Management',
        'Paid Vacation;Stock Options'
    ), (
        'IT Intern',
        'lulusan baru/pengalaman kerja kurang dari 1 tahun',
        'internship',
        'IT Intern',
        'D3',
        '1',
        'Troubleshooting;Network Administration',
        'Training Provided;Flexible Hours'
    ), (
        'Executive Assistant',
        'manajer/asisten manajer',
        'full-time',
        'Executive Assistant',
        'S1',
        '4',
        'Calendar Management;Administrative Support',
        'Paid Time Off;Professional Development Allowance'
    ), (
        'Finance Analyst',
        'supervisor/koordinator',
        'temporary',
        'Finance Analyst',
        'S1',
        '3',
        'Financial Modeling;Data Analysis',
        'Bonuses;Remote Work Options'
    ), (
        'Social Media Specialist',
        'pegawai non-manajemen & non-supervisor',
        'full-time',
        'Social Media Specialist',
        'D3',
        '2',
        'Social Media Management;Content Creation',
        'Flexible Work Hours;Paid Holidays'
    ), (
        'Marketing Intern',
        'lulusan baru/pengalaman kerja kurang dari 1 tahun',
        'internship',
        'Marketing Intern',
        'D3',
        '1',
        'Market Research;Content Writing',
        'Internship Stipend;Mentorship Program'
    ), (
        'Office Coordinator',
        'manajer/asisten manajer',
        'temporary',
        'Office Coordinator',
        'S1',
        '3',
        'Office Management;Event Planning',
        'Casual Dress Code;Paid Sick Days'
    ), (
        'Software Developer',
        'manajer/asisten manajer',
        'full-time',
        'Software Developer',
        'S1',
        '4',
        'Web Development;Database Management',
        'Health Insurance;Retirement Plan'
    ), (
        'Sales Associate',
        'pegawai non-manajemen & non-supervisor',
        'part-time',
        'Sales Associate',
        'SMK',
        '1',
        'Sales Techniques;Customer Service',
        'Employee Discounts;Flexible Schedule'
    ), (
        'HR Manager',
        'ceo/gm/direktur/manajer senior',
        'full-time',
        'HR Manager',
        'S1',
        '5',
        'HR Strategy;Performance Management',
        'Generous Paid Time Off;Employee Wellness Programs'
    ), (
        'IT Support Specialist',
        'supervisor/koordinator',
        'full-time',
        'IT Support Specialist',
        'D3',
        '2',
        'Technical Troubleshooting;Help Desk Support',
        '401(k) Plan;Paid Maternity/Paternity Leave'
    );