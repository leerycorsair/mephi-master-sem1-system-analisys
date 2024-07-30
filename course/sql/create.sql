CREATE TABLE users (
  id bigserial NOT NULL,
  username varchar (30) NOT NULL,
  login varchar (30) NOT NULL,
  PASSWORD varchar (30) NOT NULL,
  email varchar (50) NOT NULL,
  PRIMARY KEY (id)
);

CREATE TYPE roles_t AS enum(
  'administrator',
  'moderator',
  'student',
  'teacher',
  'psychologist'
);

CREATE TABLE roles (
  id bigserial NOT NULL,
  name roles_t NOT NULL,
  PRIMARY KEY (id)
);

CREATE TABLE users_roles (
  id bigserial NOT NULL,
  user_id bigint NOT NULL,
  role_id bigint NOT NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (user_id) REFERENCES users (id) ON DELETE CASCADE,
  FOREIGN KEY (role_id) REFERENCES roles (id) ON DELETE CASCADE
);

CREATE TYPE format_t AS enum('face-to-face', 'distance', 'hybrid');

CREATE TYPE degree_t AS enum('bachelor', 'master', 'graduate', 'specialty');

CREATE TABLE programs (
  id bigserial NOT NULL,
  name varchar (30) NOT NULL,
  code varchar (20) NOT NULL,
  format format_t NOT NULL,
  degree degree_t NOT NULL,
  PRIMARY KEY (id)
);

CREATE TABLE students (
  id bigserial NOT NULL,
  first_name varchar (30) NOT NULL,
  middle_name varchar (30),
  last_name varchar (30) NOT NULL,
  datebirth date NOT NULL,
  email varchar (50) NOT NULL,
  phonenumber varchar (20) NOT NULL,
  student_card_number varchar (50) NOT NULL,
  personal_file_number varchar (50) NOT NULL,
  program_id bigint NOT NULL,
  user_id bigint NOT NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (user_id) REFERENCES users (id) ON DELETE CASCADE,
  FOREIGN KEY (program_id) REFERENCES programs (id) ON DELETE CASCADE
);

CREATE TABLE teachers (
  id bigserial NOT NULL,
  first_name varchar (30) NOT NULL,
  middle_name varchar (30),
  last_name varchar (30) NOT NULL,
  datebirth date NOT NULL,
  email varchar (50) NOT NULL,
  phonenumber varchar (20) NOT NULL,
  departament varchar (255) NOT NULL,
  user_id bigint NOT NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (user_id) REFERENCES users (id) ON DELETE CASCADE
);

CREATE TABLE psychologists (
  id bigserial NOT NULL,
  first_name varchar (30) NOT NULL,
  middle_name varchar (30),
  last_name varchar (30) NOT NULL,
  datebirth date NOT NULL,
  email varchar (50) NOT NULL,
  phonenumber varchar (20) NOT NULL,
  licence varchar (30) NOT NULL,
  web_page varchar (255),
  expertise varchar (255) NOT NULL,
  user_id bigint NOT NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (user_id) REFERENCES users (id) ON DELETE CASCADE
);

CREATE TABLE documents (
  id bigserial NOT NULL,
  doc_type varchar (30) NOT NULL,
  link varchar (255) NOT NULL,
  user_id bigint NOT NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (user_id) REFERENCES users (id) ON DELETE CASCADE
);

CREATE TYPE season_t AS enum('autumn', 'spring');

CREATE TABLE groups (
  id bigserial NOT NULL,
  name varchar (30) NOT NULL,
  year bigint NOT NULL,
  season season_t NOT NULL,
  supervisor_id bigint,
  president_id bigint,
  PRIMARY KEY (id),
  FOREIGN KEY (supervisor_id) REFERENCES users (id) ON DELETE CASCADE,
  FOREIGN KEY (president_id) REFERENCES users (id) ON DELETE CASCADE
);

CREATE TABLE groups_students (
  id bigserial NOT NULL,
  group_id bigint NOT NULL,
  student_id bigint NOT NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (group_id) REFERENCES groups (id) ON DELETE CASCADE,
  FOREIGN KEY (student_id) REFERENCES students (id) ON DELETE CASCADE
);

CREATE TYPE test_type_t AS enum('psychological', 'educational');

CREATE TYPE result_type_t AS enum('auto', 'manual');

CREATE TABLE tests (
  id bigserial NOT NULL,
  name varchar (255) NOT NULL,
  test_type test_type_t NOT NULL,
  result_type result_type_t NOT NULL,
  deadline date NOT NULL,
  duration INTERVAL NOT NULL,
  description text,
  creator_id bigint NOT NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (creator_id) REFERENCES users (id) ON DELETE CASCADE
);

CREATE TYPE q_type_t AS enum('single', 'multiple', 'open');

CREATE TABLE questions (
  id bigserial NOT NULL,
  serial_number bigint NOT NULL,
  description text NOT NULL,
  q_type q_type_t NOT NULL,
  answers varchar(255) [],
  q_key varchar (255),
  PRIMARY KEY (id)
);

CREATE TABLE tests_questions (
  id bigserial NOT NULL,
  test_id bigint NOT NULL,
  question_id bigint NOT NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (test_id) REFERENCES tests (id) ON DELETE CASCADE,
  FOREIGN KEY (question_id) REFERENCES questions (id) ON DELETE CASCADE
);

CREATE TYPE r_status_t AS enum('to-be-checked', 'to-be-confirmed', 'ready');

CREATE TABLE tresults (
  id bigserial NOT NULL,
  mark varchar (30),
  COMMENT text,
  r_status r_status_t NOT NULL,
  test_id bigint NOT NULL,
  respondent_id bigint NOT NULL,
  assessor_id bigint NOT NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (test_id) REFERENCES tests (id) ON DELETE CASCADE,
  FOREIGN KEY (respondent_id) REFERENCES users (id) ON DELETE CASCADE,
  FOREIGN KEY (assessor_id) REFERENCES users (id) ON DELETE CASCADE
);

CREATE TABLE answers (
  id bigserial NOT NULL,
  body text,
  tresult_id bigint NOT NULL,
  question_id bigint NOT NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (tresult_id) REFERENCES tresults (id) ON DELETE CASCADE,
  FOREIGN KEY (question_id) REFERENCES questions (id) ON DELETE CASCADE
);

CREATE TABLE attachments (
  id bigserial NOT NULL,
  link varchar (255) NOT NULL,
  answer_id bigint NOT NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (answer_id) REFERENCES answers (id) ON DELETE CASCADE
);

CREATE TABLE subjects (
  id bigserial NOT NULL,
  name varchar (255) NOT NULL,
  PRIMARY KEY (id)
);

CREATE TYPE s_format_t AS enum('pass', 'credit');

CREATE TABLE subjects_groups (
  id bigserial NOT NULL,
  subject_id bigint NOT NULL,
  group_id bigint NOT NULL,
  teacher_id bigint NOT NULL,
  s_format s_format_t NOT NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (subject_id) REFERENCES subjects (id) ON DELETE CASCADE,
  FOREIGN KEY (group_id) REFERENCES groups (id) ON DELETE CASCADE,
  FOREIGN KEY (teacher_id) REFERENCES teachers (id) ON DELETE CASCADE
);

CREATE TABLE tests_subjects (
  id bigserial NOT NULL,
  test_id bigint NOT NULL,
  subject_id bigint NOT NULL,
  FOREIGN KEY (test_id) REFERENCES tests(id) ON DELETE CASCADE,
  FOREIGN KEY (subject_id) REFERENCES subjects (id) ON DELETE CASCADE
);