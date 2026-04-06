-- ex1
CREATE SCHEMA avaliacaocontinua;
GO
-- ex2
CREATE TABLE avaliacaocontinua.company (
    company_name VARCHAR(100) NOT NULL,
    city VARCHAR(100),
    CONSTRAINT PK_company PRIMARY KEY (company_name)
);

-- ex3
CREATE TABLE avaliacaocontinua.employee (
    person_name VARCHAR(100) NOT NULL,
    street VARCHAR(100),
    city VARCHAR(100),
    CONSTRAINT PK_employee PRIMARY KEY (person_name)
);

-- ex4
CREATE TABLE avaliacaocontinua.manages(
    person_name VARCHAR(100) NOT NULL,
    manager_name VARCHAR(100),
    CONSTRAINT PK_manages PRIMARY KEY (person_name)
)

-- ex5
CREATE TABLE avaliacaocontinua.works (
    person_name VARCHAR(100) NOT NULL,
    company_name VARCHAR(100) NOT NULL,
    salary DECIMAL(10,2),
    CONSTRAINT PK_works PRIMARY KEY (person_name)
);

-- ex6
ALTER TABLE avaliacaocontinua.works
ADD CONSTRAINT FK_works_employee 
FOREIGN KEY (person_name) REFERENCES avaliacaocontinua.employee(person_name)
ON UPDATE CASCADE
ON DELETE CASCADE;

-- ex7
ALTER TABLE avaliacaocontinua.works
ADD CONSTRAINT FK_works_company 
FOREIGN KEY (company_name) REFERENCES avaliacaocontinua.company(company_name)
ON UPDATE CASCADE
ON DELETE CASCADE;

-- ex8
ALTER TABLE avaliacaocontinua.manages
ADD CONSTRAINT FK_manages_employee 
FOREIGN KEY (person_name) REFERENCES avaliacaocontinua.employee(person_name)
ON UPDATE CASCADE 
ON DELETE CASCADE;