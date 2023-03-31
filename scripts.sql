
CREATE TYPE "type_Corses" AS ENUM (
  'programing',
  'disangUXUI',
  'front_end',
  'back_end'
);

CREATE TABLE "Users" (
  "id" INT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
  "Name" varchar,
  "Email" varchar,
  "Password" varchar,
  "Age" int
);

-- Aquí creamos el tipo de datos "level_courses"
CREATE TYPE "level_courses" AS ENUM (
  'beginner',
  'intermediate',
  'advanced'
);

CREATE TABLE "Courses" (
  "id" INT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
  "Title" varchar,
  "Description" varchar,
  "Level" "level_courses", -- utilizamos el tipo de datos "level_courses" aquí
  "Teacher" varchar,
  "id_categories" int
);

CREATE TABLE "Course_Video" (
  "id" INT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
  "Title" varchar,
  "Url" text,
  "corses_id" int
);

CREATE TABLE "Categories" (
  "id" INT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
  "Name" "type_Corses",
  "user_id" int
);

ALTER TABLE "Course_Video" ADD FOREIGN KEY ("corses_id") REFERENCES "Courses" ("id");

ALTER TABLE "Categories" ADD FOREIGN KEY ("user_id") REFERENCES "Users" ("id");

ALTER TABLE "Courses" ADD FOREIGN KEY ("id_categories") REFERENCES "Categories" ("id");



INSERT INTO "Users" (
  "Name",
  "Email",
  "Password",
  "Age"
) VALUES (
  'Hernan Martines',
  'hernan.martinez@academlo.com',
  'Nodejs',
  23
), (
  'Luis Sanchez',
  'Luis.Sanchez@academlo.com',
  'React',
  25
), (
  'Diana Mejia',
  'Diana.Mejia@academlo.com',
  'HTML',
  20
);

insert into "Courses" (
  "Title",
  "Description",
  "Level",
  "Teacher"
) values (
 'Denojs',
 'manejo basico de denojs',
 'beginner',
 'midudev'
),(
 'Nestjs',
 'manejo basico e intermedio de Nestjs',
 'intermediate',
 'midudev corses'
),(
 'react',
 'manejo advanced de Reactjs',
 'intermediate',
 'midudev corses'
);
 insert into "Categories" (
  "Name" 
 ) values (
 'programing'
 ),(
 'disangUXUI'
 ),(
 'front_end'
 ),(
 'back_end'
 );

insert into "Course_Video"  (
 "Title" ,
 "Url"
) values ( 
'utorial Desde Cero de DENO',
 'https://www.youtube.com/watch?v=KsgDQL6jj2M&t=836s'
),(
'Curso de Next.js 13 desde cero',
'https://www.youtube.com/watch?v=tA-_vAz9y78&t=315s'
),(
'React Hooks - Curso para Principiantes [ Fundamentos Reactjs ]',
'https://www.youtube.com/watch?v=mOz5eNcEHu4'
);

