-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/RBqk78
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE "MainTable" (
    "id" INT   NOT NULL,
    "mt_column1" INT   NOT NULL,
    "mt_column2" INT   NOT NULL,
    CONSTRAINT "pk_MainTable" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "OneToOne" (
    "id" INT   NOT NULL,
    "mt_id" INT   NOT NULL,
    "oto_column1" INT   NOT NULL,
    "oto_column2" INT   NOT NULL,
    CONSTRAINT "pk_OneToOne" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "OneToMany" (
    "id" INT   NOT NULL,
    "mt_id" INT   NOT NULL,
    "otm_column1" INT   NOT NULL,
    "otm_column2" INT   NOT NULL,
    CONSTRAINT "pk_OneToMany" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "MainTable2" (
    "id" INT   NOT NULL,
    "mt2_column1" INT   NOT NULL,
    "mt2_column2" INT   NOT NULL,
    CONSTRAINT "pk_MainTable2" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "ManyToMany" (
    "id" INT   NOT NULL,
    "mt_id" INT   NOT NULL,
    "mt2_id" INT   NOT NULL,
    CONSTRAINT "pk_ManyToMany" PRIMARY KEY (
        "id"
     )
);

ALTER TABLE "OneToOne" ADD CONSTRAINT "fk_OneToOne_mt_id" FOREIGN KEY("mt_id")
REFERENCES "MainTable" ("id");

ALTER TABLE "OneToMany" ADD CONSTRAINT "fk_OneToMany_mt_id" FOREIGN KEY("mt_id")
REFERENCES "MainTable" ("id");

ALTER TABLE "ManyToMany" ADD CONSTRAINT "fk_ManyToMany_mt_id" FOREIGN KEY("mt_id")
REFERENCES "MainTable" ("id");

ALTER TABLE "ManyToMany" ADD CONSTRAINT "fk_ManyToMany_mt2_id" FOREIGN KEY("mt2_id")
REFERENCES "MainTable2" ("id");

-- Added this last line to enforce only one record representing a 3NF with 2 FKs
CREATE UNIQUE INDEX "ui_ManyToMany" ON "ManyToMany"("mt_id","mt2_id");

-- Added the line below to enforce a 1-1 relationship
CREATE UNIQUE INDEX "ui_OneToOne" ON "OneToOne"("mt_id");
