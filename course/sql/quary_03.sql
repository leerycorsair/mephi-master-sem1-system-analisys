CREATE TEMPORARY TABLE temp_table_3 (
    test_name varchar,
    deadline date,
    description varchar
);

INSERT INTO
    temp_table_3(test_name, deadline, description)
VALUES
    (
        'Основы Программирования - ч.2',
        '2023-10-11',
        'Этот тест оценивает ваши знания в работе с файлами и классами'
    ),
    (
        'Основы Программирования - ч.1',
        '2023-09-07',
        'Этот тест оценивает ваши знания в основах программирования, включая базовые концепции, синтаксис и структуры данных'
    ),
    (
        'Математическая Логика',
        '2023-11-09',
        'Измерьте свои знания в продвинутых математических темах, включая дифференциальные уравнения, теорию чисел и комплексный анализ.'
    ),
    (
        'Введение в искусственный интеллект - ч. 1',
        '2023-12-13',
        'Узнайте, насколько хорошо вы разбираетесь в основах искусственного интеллекта, включая машинное обучение, нейронные сети и алгоритмы.'
    );

SELECT
    *
FROM
    temp_table_3
ORDER BY
    deadline;