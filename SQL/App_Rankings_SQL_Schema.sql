-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE "iOS_Apps" (
    "iOS_App_ID" INT   NOT NULL,
    "iOS_App_Name" VARCHAR(50)   NOT NULL,
    "Publisher_ID" INT   NOT NULL,
    CONSTRAINT "pk_iOS_Apps" PRIMARY KEY (
        "iOS_App_ID"
     )
);

CREATE TABLE "Publishers" (
    "Publisher_ID" INT   NOT NULL,
    "Publisher_Name" VARCHAR(50)   NOT NULL,
    CONSTRAINT "pk_Publishers" PRIMARY KEY (
        "Publisher_ID"
     )
);

CREATE TABLE "iOS_Daily_Rankings" (
    "iOS_Log_Num" SERIAL   NOT NULL,
    "iOS_Date" Date   NOT NULL,
    "iOS_Grossing_Rank" INT   NOT NULL,
    "iOS_Download_Rank" INT   NOT NULL,
    "iOS_App_ID" INT   NOT NULL,
    "Publisher_ID" INT   NOT NULL,
    CONSTRAINT "pk_iOS_Daily_Rankings" PRIMARY KEY (
        "iOS_Log_Num"
     )
);

CREATE TABLE "Android_Apps" (
    "Android_App_ID" INT   NOT NULL,
    "Android_App_Name" VARCHAR(50)   NOT NULL,
    "Publisher_ID" INT   NOT NULL,
    CONSTRAINT "pk_Android_Apps" PRIMARY KEY (
        "Android_App_ID"
     )
);

CREATE TABLE "Android_Daily_Rankings" (
    "Android_Log_Num" SERIAL   NOT NULL,
    "Android_Date" Date   NOT NULL,
    "Android_Grossing_Rank" INT   NOT NULL,
    "Android_Download_Rank" INT   NOT NULL,
    "Android_App_ID" INT   NOT NULL,
    "Publisher_ID" INT   NOT NULL,
    CONSTRAINT "pk_Android_Daily_Rankings" PRIMARY KEY (
        "Android_Log_Num"
     )
);

ALTER TABLE "iOS_Apps" ADD CONSTRAINT "fk_iOS_Apps_Publisher_ID" FOREIGN KEY("Publisher_ID")
REFERENCES "Publishers" ("Publisher_ID");

ALTER TABLE "iOS_Daily_Rankings" ADD CONSTRAINT "fk_iOS_Daily_Rankings_iOS_App_ID" FOREIGN KEY("iOS_App_ID")
REFERENCES "iOS_Apps" ("iOS_App_ID");

ALTER TABLE "iOS_Daily_Rankings" ADD CONSTRAINT "fk_iOS_Daily_Rankings_Publisher_ID" FOREIGN KEY("Publisher_ID")
REFERENCES "Publishers" ("Publisher_ID");

ALTER TABLE "Android_Apps" ADD CONSTRAINT "fk_Android_Apps_Publisher_ID" FOREIGN KEY("Publisher_ID")
REFERENCES "Publishers" ("Publisher_ID");

ALTER TABLE "Android_Daily_Rankings" ADD CONSTRAINT "fk_Android_Daily_Rankings_Android_App_ID" FOREIGN KEY("Android_App_ID")
REFERENCES "Android_Apps" ("Android_App_ID");

ALTER TABLE "Android_Daily_Rankings" ADD CONSTRAINT "fk_Android_Daily_Rankings_Publisher_ID" FOREIGN KEY("Publisher_ID")
REFERENCES "Publishers" ("Publisher_ID");

