-- database: d:\OneDrive - NSW Department of Education\11 SW\VSCode\HomeLaptop\SQL\data_source.db

-- Use the ▷ button in the top right corner to run the entire file.

SELECT * FROM "table-name";

CREATE TABLE Publishers (
    Publisher_ID INTEGER NOT NULL PRIMARY KEY,
    Name TEXT NOT NULL
);

CREATE TABLE Developers(
    Developer_ID INTEGER NOT NULL PRIMARY KEY,
    First_Name TEXT NOT NULL,
    Last_Name TEXT NOT NULL
);


CREATE TABLE Games (
    ID INTEGER NOT NULL PRIMARY KEY,
    Name TEXT NOT NULL,
    Release_Date DATE NOT NULL,
    Cost DECIMAL(12, 2) NOT NULL,
    Quantity_Sold INTEGER NOT NULL,
    Retail_Price DECIMAL(5,2),
    Publisher_ID INTEGER NOT NULL,
    Developer_ID INTEGER NOT NULL,
    FOREIGN KEY(Publisher_ID) REFERENCES Publishers(Publisher_ID),
    FOREIGN KEY(Developer_ID) REFERENCES Developers(Developer_ID)
);