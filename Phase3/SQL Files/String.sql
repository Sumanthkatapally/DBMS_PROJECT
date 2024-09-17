-- Drops database if already exists
Drop database if exists Phase3;

-- Creating and using database
CREATE DATABASE Phase3;

USE Phase3;

-- Table Creation

CREATE TABLE admin (
    username VARCHAR(50), -- variable length string
    age INT,
    location VARCHAR(100),
    email VARCHAR(100),
    profile_picture BLOB, -- Binary Large Objects (e.g., images)
    document VARBINARY(6555), -- variable length binary data (e.g., files)
    bio TEXT, -- TEXT can accomodate large text data
    status ENUM('Active', 'Inactive', 'Pending'), -- predefined set of values
    preferences SET('Email', 'SMS', 'Push Notification'), -- SET is used for a collection of values
    unique_id BINARY(16) -- fixed length binary data
);

-- Inserting data to table

INSERT INTO admin (username, age, location, email, profile_picture, document, bio, status, preferences, unique_id) 
VALUES (
    'Sumanth', 
    24, 
    'New York', 
    'sumanth@gmail.com', 
    '0x89504E470D0A1A0A0000000D49484452000000100000001008060000001F4FBD61', -- Example BLOB data 
    '0x255044462D312E350D0A25E2E3CFD30D0A312030206F626A0D0A3C3C2F4C656E6774682034', -- Example VARBINARY data 
    'Intro of sumanth', -- Example TEXT data
    'Active', -- Status ENUM
    'Email,SMS', -- Preferences SET
    UNHEX('4F6A1F8E9D6F4E8B8C9A8F2C5D4E6F7D') -- Example BINARY data 
);

INSERT INTO admin (username, age, location, email, profile_picture, document, bio, status, preferences, unique_id) 
VALUES (
    'Abhijeet', 
    24, 
    'New York', 
    'abhi@gmail.com', 
    '0x89504E470D0A1A0A0000000D49484452000000100000001008050000001F4FBD61', -- Example BLOB data 
    '0x255044462D312E350D0A25E2E3CFD30D0A312030206F626A0D0A2C3C2F4C656E6774682034', -- Example VARBINARY data 
    'Intro of Abhijeet', -- Example TEXT data
    'Pending', -- Status ENUM
    'Email', -- Preferences SET
    UNHEX('4F6A1F8E9D6F4E8B8C9A8F2C5D4E6F7D') -- Example BINARY data 
);

INSERT INTO admin (username, age, location, email, profile_picture, document, bio, status, preferences, unique_id) 
VALUES (
    'Sagar', 
    27, 
    'New York', 
    'sagar@gmail.com', 
    '0x89504E470D0A2A0A0000000D49484452000000100000001008050000001F4FBD61', -- Example BLOB data 
    '0x255044462D311E350D0A25E2E3CFD30D0A312030206F626A0D0A2C3C2F4C656E6774682034', -- Example VARBINARY data 
    'Intro of Sagar', -- Example TEXT data
    'Active', -- Status ENUM
    'SMS', -- Preferences SET
    UNHEX('4F6A1F8E9D6F4E8B8C9A8F2C5D4E6F7D') -- Example BINARY data 
);

-- String functions

SELECT username, LENGTH(username) AS username_length FROM admin; -- Length of string

SELECT username, LOWER(location) AS lower_location, UPPER(email) AS upper_email FROM admin; -- Converts the string to lower and upper case

SELECT CONCAT(username, ' : ', age) AS user_info FROM admin; -- Concatenates multiple strings together

SELECT username, SUBSTRING(email, 1, 5) AS email_part FROM admin; -- retrieves substring from string

SELECT username, INSTR(email, 'gmail') AS gmail_position FROM admin; -- finds the position of the first occurrence of a substring.

SELECT username, REPLACE(location, 'New York', 'NY') AS short_location FROM admin; -- replacing string

SELECT username, TRIM(both ' ' FROM bio) AS trimmed_bio FROM admin; -- removes spaces from the string


-- Search

SELECT * FROM admin WHERE email LIKE '%gmail%';

SELECT * FROM admin WHERE FIND_IN_SET('Email', preferences) > 0;
