CREATE TEMPORARY TABLE temp_table_4 (
    full_name varchar,
    phone_number varchar,
    email varchar,
    web_page varchar
);

INSERT INTO
    temp_table_4(full_name, phone_number, email, web_page)
VALUES
    (
        'Игорь Владимирович Стольников',
        '+7-931-492-43-97',
        'igorstol@yandex.ru',
        'igorstolpsycho.ru'
    );

SELECT
    *
FROM
    temp_table_4;