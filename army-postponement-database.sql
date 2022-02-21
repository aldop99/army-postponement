DROP TABLE IF EXISTS auth_user_role;
DROP TABLE IF EXISTS auth_role;
DROP TABLE IF EXISTS auth_user;
DROP TABLE IF EXISTS application;

CREATE TABLE auth_role (
  auth_role_id int(11) NOT NULL AUTO_INCREMENT,
  role_name varchar(255) DEFAULT NULL,
  role_desc varchar(255) DEFAULT NULL,
  PRIMARY KEY (auth_role_id)
);
INSERT INTO auth_role VALUES (1,'ADMIN','Has ultimate rights for everything.');
INSERT INTO auth_role VALUES (2,'CITIZEN','Has access to the website, after login to complete the army postponement form.');
INSERT INTO auth_role VALUES (3,'ARMY_EMPLOYEE','Has access to the website, after login to validate citizens form and send it to the army officer.');
INSERT INTO auth_role VALUES (4,'ARMY_OFFICER','This user has access to site, after login to approve citizens army postponement form.');

CREATE TABLE auth_user (
  auth_user_id int(11) NOT NULL AUTO_INCREMENT,
  first_name varchar(255) NOT NULL,
  last_name varchar(255) NOT NULL,
  father_name varchar(255) NOT NULL,
  mother_name varchar(255) NOT NULL,
  afm_number varchar(9)NOT NULL,
  amka_number varchar(11)NOT NULL,
  email varchar(255) NOT NULL,
  password varchar(255) NOT NULL,
  status varchar(255),
  PRIMARY KEY (auth_user_id)
);

CREATE TABLE auth_user_role (
  auth_user_id int(11) NOT NULL,
  auth_role_id int(11) NOT NULL,
  PRIMARY KEY (auth_user_id,auth_role_id),
  KEY FK_user_role (auth_role_id),
  CONSTRAINT FK_auth_user FOREIGN KEY (auth_user_id) REFERENCES auth_user (auth_user_id),
  CONSTRAINT FK_auth_user_role FOREIGN KEY (auth_role_id) REFERENCES auth_role (auth_role_id)
);

CREATE TABLE application (
    application_id int(11) NOT NULL AUTO_INCREMENT,
    first_name varchar(255) NOT NULL,
    last_name varchar(255) NOT NULL,
    father_name varchar(255) NOT NULL,
    mother_name varchar(255) NOT NULL,
    afm_number varchar(9)NOT NULL,
    amka_number varchar(11)NOT NULL,
    military_number varchar(11)NOT NULL,
    email varchar(255) NOT NULL,
    status varchar(255),
    PRIMARY KEY(application_id)
);

insert into auth_user (auth_user_id,first_name,last_name,father_name,mother_name,afm_number,amka_number,email,password,status) values (1,'Admin','Surname','Father','Mother','000000000','00000000000','admin@gmail.com','$2a$09$Oi5FNpIt8ThBT0TLnob8v.KZ2MEfs/ZbVepG5HsNwPQlzQEIdIWGK','VERIFIED'); #passw admin123
insert into auth_user (auth_user_id,first_name,last_name,father_name,mother_name,afm_number,amka_number,email,password,status) values (2,'Citizen','Surname','Father','Mother','000000000','00000000000','citizen@gmail.com','$2a$09$7BlBXtoLCcSvNMDp5lP2zOCn49RyQXtr1Y17OHUSOJ6vmNLnw9ewu','VERIFIED'); #passw citizen123
insert into auth_user (auth_user_id,first_name,last_name,father_name,mother_name,afm_number,amka_number,email,password,status) values (3,'Employee','Surname','Father','Mother','000000000','00000000000','employee@gmail.com','$2a$09$dA0KlN3JAnDy6R2N.UNsY.9Squr6V2nVLPJeMG8dz/C.pc.doooRC','VERIFIED'); #passw employee123
insert into auth_user (auth_user_id,first_name,last_name,father_name,mother_name,afm_number,amka_number,email,password,status) values (4,'Officer','Surname','Father','Mother','000000000','00000000000','officer@gmail.com','$2a$09$U00wMah53fOb2ksw0DAGE.tuicgaMWSp/nP8rFVzKUIJZLk4WXOC.','VERIFIED'); #passw officer123

insert into auth_user_role (auth_user_id, auth_role_id) values ('1','1');
insert into auth_user_role (auth_user_id, auth_role_id) values ('2','2');
insert into auth_user_role (auth_user_id, auth_role_id) values ('3','3');
insert into auth_user_role (auth_user_id, auth_role_id) values ('4','4');

INSERT INTO application(
application_id,first_name,last_name,father_name,mother_name,afm_number,amka_number,military_number,email,status) 
VALUES (1,'Citizen','Surname','Father','Mother','000000000','00000000000','00000000000','citizen@gmail.com','FOR_VALIDATION');
