CREATE TEMPORARY TABLE temp_table_2 (document_type varchar, link varchar);

INSERT INTO
    temp_table_2(document_type, link)
VALUES
    ('Паспорт', 'document_link.com/2fnka9'),
    ('СНИЛС', 'document_link.com/3kbbsf'),
    ('Аттестат', 'document_link.com/k15mx1'),
    ('Автомобильные права', 'document_link.com/2z1fs1'),
    ('Военные билет', 'document_link.com/ksdsg1'),
    ('Социальная карта', 'document_link.com/loasf8'),
    ('Договор о проживании в общежитии', 'document_link.com/zxasf8'),
    ('Медицинский полис', 'document_link.com/prmvxz');

SELECT
    *
FROM
    temp_table_2;