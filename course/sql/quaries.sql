-- Получить количество студентов магистратуры, обучающихся в группах по заданной учебной программе.
SELECT
    g.name AS group_name,
    count (*) AS students_amount
FROM
    students s
    JOIN groups_students gs ON s.id = gs.student_id
    JOIN groups g ON g.id = gs.id
    JOIN programs p ON s.program_id = p.id
WHERE
    p.name = 'Программная инженерия'
    AND p.format = 'master'
GROUP BY
    g.name;

-- Получить список документов заданного пользователя
SELECT
    document_type AS document_type,
    link AS link
FROM
    documents d
WHERE
    d.user_id = 5;

-- Получить список тестов, за которые ответственнен преподаватель
-- и по которым есть непроверенные работы.
SELECT
    DISTINCT t.name AS test_name,
    t.deadline AS deadline,
    t.description AS description
FROM
    tests t
    JOIN users u ON t.creator_id = u.id
    JOIN teachers tch ON u.id = t.user_id
    JOIN tresults tr ON tr.test_id = t.id
WHERE
    tch.first_name = 'Сергей'
    AND tch.middle_name = 'Викторович'
    AND tch.last_name = 'Демченко'
    AND tr.r_status = 'to-be-checked'
ORDER BY
    t.deadline;

-- Получить контактные данные психолога
SELECT
    p.first_name || ' ' || p.middle_name || ' ' || p.last_name AS full_name,
    p.phonenumber AS phone_number,
    p.email AS email,
    p.web_page AS web_page
FROM
    psychologists p
WHERE
    p.first_name = 'Игорь'
    AND p.middle_name = 'Владимирович'
    AND p.last_name = 'Стольников';

-- Получить приложение, которые прикрепил пользователь к заданному ответу
SELECT
    a.id AS answer_id,
    att.link AS link
FROM
    answers a
    JOIN attachments att ON a.id = attachments.id
WHERE
    a.id = 27;
    