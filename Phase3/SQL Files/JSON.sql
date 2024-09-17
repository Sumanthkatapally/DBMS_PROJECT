-- Create the database if it doesn't exist

CREATE DATABASE IF NOT EXISTS Phase3;

USE Phase3;

-- Creating a table
CREATE TABLE json_demo_table (
    json_data JSON, 
    description VARCHAR(100)
);

-- Inserting JSON data type values into the table

-- Direct Insertion of JSON object
INSERT INTO json_demo_table(json_data, description) 
VALUES ('{"key1":"value1","key2":"value2"}', 'Direct JSON object insertion');


INSERT INTO json_demo_table(json_data, description) 
VALUES ('[3, "string1"]', 'Direct JSON array insertion');

-- JSON object insertion using JSON_OBJECT() function
INSERT INTO json_demo_table(json_data, description) 
VALUES (JSON_OBJECT("key3", "value3", "key4", "value4"), 'Insertion using JSON_OBJECT()');

-- JSON array insertion using JSON_ARRAY() function
INSERT INTO json_demo_table(json_data, description) 
VALUES (JSON_ARRAY("string2", 3, '{"key5":"value5","key6":"value6"}'), 'Insertion using JSON_ARRAY()');

-- Array inside JSON object
INSERT INTO json_demo_table(json_data, description) 
VALUES ('{"key1":["string3", 6], "key2":"value2"}', 'Nested JSON: array in object');

-- Display the contents of the table
SELECT * FROM json_demo_table;


-- Merging JSON documents

SELECT JSON_MERGE_PRESERVE(json_data, '[1, 2]'),JSON_MERGE_PRESERVE('[1, 2]', json_data),JSON_MERGE_PRESERVE(json_data, '{"keymerge":"valuemerge"}'),JSON_MERGE_PRESERVE('{"keymerge":"valuemerge"}', json_data), -- Using JSON_MERGE_PRESERVE() for array merging and preserving values
JSON_MERGE_PATCH(json_data, '[1, 2]'),JSON_MERGE_PATCH('[1, 2]', json_data),JSON_MERGE_PATCH(json_data, '{"keymerge":"valuemerge"}'),JSON_MERGE_PATCH('{"keymerge":"valuemerge"}', json_data) -- Using JSON_MERGE_PATCH() for merging with replacement
FROM json_demo_table;

-- JSON Functions

-- Appending integer element into an array at index 1
SELECT json_data, JSON_ARRAY_APPEND(json_data, '$[1]', 1) 
FROM json_demo_table;

-- Inserting integer element into an array at index 0
SELECT JSON_ARRAY_INSERT(json_data, '$[0]', 1) 
FROM json_demo_table;

-- Calculating the storage size of JSON objects
SELECT json_data, JSON_STORAGE_SIZE(json_data) 
FROM json_demo_table;

-- Determining the type of JSON elements
SELECT json_data, JSON_TYPE(json_data) 
FROM json_demo_table;

-- Getting the length of JSON elements (array length or number of key-value pairs in object)
SELECT json_data, JSON_LENGTH(json_data) 
FROM json_demo_table;

-- Validating JSON objects (returns 1 if valid, 0 otherwise)
SELECT JSON_VALID('string'), JSON_VALID('"string1"');

-- Search and selection within JSON documents

-- Using JSON_EXTRACT() to search for values by key
SELECT 
    json_data,
    JSON_EXTRACT(json_data, '$.key1'),
    JSON_EXTRACT(json_data, '$[0].key1')  -- arrays with objects at index 0
FROM json_demo_table;

-- JSON_INSERT(): Inserting a new key-value pair into the JSON object
SELECT 
    json_data, 
    JSON_INSERT(json_data, '$.keynew', 'newval') 
FROM json_demo_table;


-- JSON_REMOVE(): Removing an element from an array or object
SELECT 
    json_data, 
    JSON_REMOVE(json_data, '$[0]')  -- Remove the first element of the array
FROM json_demo_table;

-- JSON_REPLACE(): Replace value of object with key as key1 with val3
SELECT 
    json_data, 
    JSON_REPLACE(json_data, '$.key1', 'val3') 
FROM json_demo_table;

-- JSON_SET(): Set object with key 'key1' as 'val3'
SELECT 
    json_data, 
    JSON_SET(json_data, '$.key1', 'val3') 
FROM json_demo_table;

