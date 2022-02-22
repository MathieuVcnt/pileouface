drop table if exists users;
drop table if exists score;

CREATE TABLE users(
login text,
passwd text,
CONSTRAINT pk_users PRIMARY KEY (login)
);

INSERT INTO users values ("Paul","Paul");
INSERT INTO users values ("Test", "Test");


CREATE TABLE score(
sno serial,
login text,
dat date,
score int,
CONSTRAINT pk_score PRIMARY KEY (sno),
CONSTRAINT fk_score_users FOREIGN KEY (login) REFERENCES users(login)
); 

