CREATE TEMPORARY TABLE temp_table_1 (group_name varchar, students_amount int);

INSERT INTO
    temp_table_1(group_name, students_amount)
VALUES
    ('М23-504', 11),
    ('М23-514', 17),
    ('М23-524', 7),
    ('М23-534', 17),
    ('М22-514', 16),
    ('М22-524', 13),
    ('М22-564', 6);

SELECT
    *
FROM
    temp_table_1;