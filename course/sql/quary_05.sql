CREATE TEMPORARY TABLE temp_table_5 (answer_id int, link varchar);

INSERT INTO
    temp_table_5(answer_id, link)
VALUES
    ('27', 'attachments.university.ru/opa133'),
    ('27', 'attachments.university.ru/va234f'),
    ('27', 'attachments.university.ru/jlsdk2');

SELECT
    *
FROM
    temp_table_5;