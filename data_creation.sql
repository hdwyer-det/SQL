-- database: d:\OneDrive - NSW Department of Education\11 SW\VSCode\HomeLaptop\SQL\data_source.db

-- We need to create data in publishers and developers first
-- This is because the data in games has foreign keys to those tables

INSERT INTO Publishers
  (Publisher_ID, Name)
VALUES
  (1, "Siny"),
  (2, "Electronic Arms"),
  (3, "Triangle Enix");

INSERT INTO Developers
  (Developer_ID, First_Name, Last_Name)
VALUES
  (1, "Hideo", "Kijomi"),
  (2, "Syd", "Myer"),
  (3, "Will", "Right");

INSERT INTO Games
  (ID, Name, Release_Date, Cost, Quantity_Sold, Retail_Price, Publisher_ID, Developer_ID)
VALUES
  (1, "Subnautica", '2024-01-10', 100000, 5000, 75.99, 1, 1),
  (2, "Mario Kart", '2024-02-10', 50000, 500000, 45, 1, 1),
  (3, "Zelda", '2000-01-10', 300000, 1000000, 99.99, 1, 2),
  (4, "Baldur's Gate 3", '2022-01-15', 1000000, 500000, 125, 2, 1),
  (5, "ICO", '2015-01-10', 200000, 650000, 35.99, 2, 3),
  (6, "Portal 2", '2016-01-10', 500000, 2500000, 15, 3, 3);


  -- This insert statement will fail as the there is no developer with ID 99
INSERT INTO Games
  (ID, Name, Release_Date, Cost, Quantity_Sold, Retail_Price, Publisher_ID, Developer_ID)
VALUES
  (7, "My Cool Game", '2025-06-23', 1000, 0, 12, 1, 99);
