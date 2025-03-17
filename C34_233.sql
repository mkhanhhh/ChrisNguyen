
-- Question-A
-- Table Creation (Incomplete and Erroneous - please fix the errors and complete this section)
-- DROP TABLE IF EXISTS Customer, Category, Promotion, Chocolate, Review, Discount;

CREATE TABLE Promotion (
    PromotionID CHAR(3) PRIMARY KEY,
    PromotionName VARCHAR(50),
    PromotionDiscount DECIMAL(4,1)
);

CREATE TABLE Category (
    CategoryID CHAR(5) PRIMARY KEY,
    CategoryName VARCHAR(50),
    CategoryDesc VARCHAR(200)
);

CREATE TABLE Chocolate (
    ChocolateID CHAR(6) PRIMARY KEY,
    ChocolateName VARCHAR(50),
    ChocolateDesc VARCHAR(200),
    ChocolatePrice DECIMAL (5, 2),
    ChocolateWeight INT,
    CategoryID CHAR(5),
    FOREIGN KEY (CategoryID) REFERENCES Category(CategoryID)
);

CREATE TABLE Discount (
    PromotionID CHAR(3),
    ChocolateID CHAR(6),
    StartDate DATETIME,
    EndDate DATETIME,
    PRIMARY KEY (PromotionID, ChocolateID),
    FOREIGN KEY (PromotionID) REFERENCES Promotion(PromotionID),
    FOREIGN KEY (ChocolateID) REFERENCES Chocolate(ChocolateID)
);

CREATE TABLE Customer (
    CustomerID CHAR(6) PRIMARY KEY,
    CustonerName VARCHAR(70),
    CustomerEmail VARCHAR(100),
    CustomerPhNum VARCHAR(32)
);
CREATE TABLE Review (
    ReviewID CHAR(6) PRIMARY KEY,
    ReviewRating INT,
    ReviewComment VARCHAR(255),
    ReviewDate DATETIME,
    CustomerID CHAR(6),
    ChocolateID CHAR(6),
    FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID),
    FOREIGN KEY (ChocolateID) REFERENCES Chocolate(ChocolateID)
);
-- Once successfully implemented, these insert statements should work.

INSERT INTO Promotion VALUES ('P01', "Opening Sale", 50.0);
INSERT INTO Promotion VALUES ('P02', "Valentine's Special", 30.0);
INSERT INTO Promotion VALUES ('P03', "Easter Bonanza", 40.0);
INSERT INTO Promotion VALUES ('P04', "Black Friday Sale", 60.0);
INSERT INTO Promotion VALUES ('P05', "Summer Delight", 25.0);

INSERT INTO Category VALUES ('CAT01', "Ecuador Single Origin", "Cocoa beans from a single Ecuadorian source");
INSERT INTO Category VALUES ('CAT02', "Venezuelan Criollo", "Criollo cocoa from Venezuela");
INSERT INTO Category VALUES ('CAT03', "Milk Chocolate", "Classic milk chocolate");
INSERT INTO Category VALUES ('CAT04', "Flavored Bars", "Chocolate bars with unique flavors like mint and coffee");
INSERT INTO Category VALUES ('CAT05', "Luxury Truffles", "Handcrafted premium truffles");
INSERT INTO Chocolate VALUES ('CHOC13', "Dark Chocolate Tablet", "Small, bite sized dark chocolate tablets", 17.99, 80, 'CAT01');
INSERT INTO Chocolate VALUES ('CHOC14', "Milk Chocolate Bar", "Classic milk chocolate bar", 9.99, 100, 'CAT03');
INSERT INTO Chocolate VALUES ('CHOC15', "Mint Chocolate Bar", "Refreshing mint-flavored chocolate", 12.99, 85, 'CAT04');
INSERT INTO Chocolate VALUES ('CHOC16', "Hazelnut Truffle", "Premium chocolate with hazelnut", 24.99, 50, 'CAT05');
INSERT INTO Chocolate VALUES ('CHOC17', "Venezuelan Dark", "Rich dark chocolate from Venezuela", 19.99, 75, 'CAT02');
INSERT INTO Chocolate VALUES ('CHOC18', "Brazilian Dark", "White chocolate with strawberry flavour", 29.99, 75, 'CAT03');
INSERT INTO Chocolate VALUES ('CHOC19', "BungBia Vang", "Chocolate with beer flavour", 15.99, 100, 'CAT04');
INSERT INTO Chocolate VALUES ('CHOC20', "White Chocolate Bar", "Classic white chocolate bar", 14.99, 90, 'CAT03');
INSERT INTO Chocolate VALUES ('CHOC21', "Coffee Infused Chocolate", "Chocolate bar infused with coffee flavor", 18.99, 85, 'CAT04');
INSERT INTO Chocolate VALUES ('CHOC22', "Venezuelan Dark 85%", "85% dark chocolate from Venezuela", 21.99, 75, 'CAT02');

INSERT INTO Discount VALUES ('P01', 'CHOC13', '2023-02-01 08:00:00', '2023-02-02 18:00:00');
INSERT INTO Discount VALUES ('P02', 'CHOC14', '2023-02-14 08:00:00', '2023-02-14 18:00:00');
INSERT INTO Discount VALUES ('P03', 'CHOC15', '2023-04-04 08:00:00', '2023-04-05 18:00:00');
INSERT INTO Discount VALUES ('P04', 'CHOC16', '2023-11-24 00:00:00', '2023-11-25 23:59:59');
INSERT INTO Discount VALUES ('P05', 'CHOC17', '2023-06-21 08:00:00', '2023-06-21 18:00:00');
INSERT INTO Discount VALUES ('P02', 'CHOC18', '2023-07-01 08:00:00', '2023-07-02 18:00:00');
INSERT INTO Discount VALUES ('P03', 'CHOC19', '2023-09-04 08:00:00', '2023-09-05 18:00:00');
INSERT INTO Discount VALUES ('P04', 'CHOC21', '2023-10-11 08:00:00', '2023-10-12 18:00:00');
INSERT INTO Customer VALUES ('CUS145', "Jon Snow", "j.snow@notreal.com",  "90861923");
INSERT INTO Customer VALUES ('CUS146', "Arya Stark", "a.stark@notreal.com", "90862543");
INSERT INTO Customer VALUES ('CUS147', "Tyrion Lannister", "t.lannister@notreal.com", "90864573");
INSERT INTO Customer VALUES ('CUS148', "Daenerys Targaryen", "d.targaryen@notreal.com", "90865234");
INSERT INTO Customer VALUES ('CUS149', "Sansa Stark", "s.stark@notreal.com", "90862987");

INSERT INTO Review VALUES ('REV131', 8, "A delicious milk chocolate", '2023-02-02 13:22:54', 'CUS145','CHOC13');
INSERT INTO Review VALUES ('REV132', 9, "Delicious milk chocolate bar!", '2023-02-14 12:45:00', 'CUS146', 'CHOC13');
INSERT INTO Review VALUES ('REV133', 7, "Minty and refreshing, but a bit too sweet", '2023-04-05 10:30:00', 'CUS147', 'CHOC15');
INSERT INTO Review VALUES ('REV134', 10, "Best hazelnut truffle ever!", '2023-11-25 15:45:00', 'CUS148', 'CHOC16');
INSERT INTO Review VALUES ('REV135', 5, "Rich and bold Venezuelan dark chocolate", '2023-06-21 14:10:00', 'CUS149', 'CHOC15');
INSERT INTO Review VALUES ('REV136', 9, "The best dark chocolate!", '2023-07-21 11:15:00', 'CUS146', 'CHOC17');
INSERT INTO Review VALUES ('REV137', 8, "Unique and bold flavor", '2023-06-18 16:00:00', 'CUS147', 'CHOC19');
INSERT INTO Review VALUES ('REV138', 6, "Slightly bitter but still good", '2023-04-01 09:20:00', 'CUS148', 'CHOC22');
-- Please ensure you INSERT atleast 5 records for every table and add it below

-- Question-B
/* Explain in simple words what each query does and make sure you comment it

-- An example of an answer to a Query

/ This query prints the names of all chocolates /
*/
-- Query 1: A query involving a single table with one condition. Insert your answer below
SELECT *
FROM Review
WHERE ReviewRating > 7;
-- This query prints all the chocolates that have a rating greater than 7

-- Query 2: A query involving a single table with two conditions, with one of the conditions that uses a wild card operator. Insert your answer below
SELECT ChocolateID, ChocolateDesc
FROM Chocolate
WHERE ChocolatePrice > 15.5
AND ChocolateName LIKE '%B%';
-- This query prints all Chocolate IDs and their corresponding descriptions that have a price greater than %15.50 and have a 'B' present in their name

-- Query 3: A query involving a join between at least two tables with an order by clause. Insert your answer below
SELECT ChocolateName, ReviewRating, ChocolatePrice
FROM Chocolate, Category, Review
WHERE Chocolate.CategoryID=Category.CategoryID
AND Chocolate.ChocolateID=Review.ChocolateID
AND ReviewRating>7
ORDER BY ReviewRating DESC;
-- this query prints the names, prices and review ratings of chocolates that recieved a rating greater than 7 in descending order


-- Query 4: A query involving a single table with an aggregate and group by function. Insert your answer below
SELECT Chocolate.ChocolateID, AVG(ReviewRating) AS 'Overall Rating'
FROM Chocolate, Review
WHERE Chocolate.ChocolateID=Review.ChocolateID
GROUP BY Chocolate.ChocolateID;
-- this query prints the IDs of chocolates that recieved reviews, as well as the average ratings for them