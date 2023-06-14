CREATE DATABASE OnlineShop;

USE OnlineShop;

CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(255) NOT NULL,
    Description VARCHAR(500),
    Price DECIMAL(10, 2) NOT NULL,
    Category VARCHAR(50) NOT NULL
);

CREATE TABLE Inventory (
    ProductID INT PRIMARY KEY,
    Quantity INT NOT NULL,
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

CREATE TABLE Users (
    UserID INT PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Email VARCHAR(255) NOT NULL UNIQUE,
    Password VARCHAR(255) NOT NULL,
    SignupDate DATETIME NOT NULL
);

CREATE TABLE Transactions (
    TransactionID INT PRIMARY KEY,
    UserID INT,
    TransactionDate DATETIME NOT NULL,
    FOREIGN KEY (UserID) REFERENCES Users(UserID)
);

CREATE TABLE TransactionDetails (
    TransactionID INT,
    ProductID INT,
    Quantity INT NOT NULL,
    PRIMARY KEY (TransactionID, ProductID),
    FOREIGN KEY (TransactionID) REFERENCES Transactions(TransactionID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

CREATE TABLE ProductReviews (
    ReviewID INT PRIMARY KEY,
    ProductID INT,
    UserID INT,
    ReviewText VARCHAR(500),
    Rating INT NOT NULL,
    ReviewDate DATETIME NOT NULL,
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID),
    FOREIGN KEY (UserID) REFERENCES Users(UserID)
);

INSERT INTO Products(ProductID, ProductName, Description, Price, Category)
VALUES 
(1, 'Mystic Wand', 'Magical artifact with untold power.', 1500.99, 'Magic'),
(2, 'Elixir of Life', 'Rumored to grant eternal life.', 30000.50, 'Potions'),
(3, 'Silver Sword', 'Perfect for fighting supernatural beasts.', 800.75, 'Weapons'),
(4, 'Invisibility Cloak', 'Vanish from sight completely.', 2500.00, 'Clothing'),
(5, 'Flying Broomstick', 'Reach top speeds with this magical broom.', 750.50, 'Transportation'),
(6, 'Crystal Ball', 'See into the future.', 999.99, 'Divination'),
(7, 'Phoenix Feather Quill', 'Writes in elegant, everlasting script.', 25.00, 'Stationery'),
(8, 'Book of Shadows', 'An encyclopedia of ancient spells.', 1200.00, 'Books'),
(9, 'Dragon Egg', 'Hatch your own pet dragon. Species unknown.', 5000.00, 'Pets'),
(10, 'Self-Stirring Cauldron', 'Never manually stir your potions again.', 300.75, 'Potions'),
(11, 'Enchanted Map', 'This map never gets you lost.', 499.99, 'Navigation'),
(12, 'Spell-proof Scroll', 'Protected against unauthorized spells.', 40.00, 'Stationery');

INSERT INTO Inventory(ProductID, Quantity)
VALUES 
(1, 5),
(2, 2),
(3, 20),
(4, 10),
(5, 15),
(6, 8),
(7, 200),
(8, 30),
(9, 3),
(10, 15),
(11, 25),
(12, 100);

INSERT INTO Users(UserID, FirstName, LastName, Email, Password, SignupDate)
VALUES 
(1, 'Gandalf', 'The Grey', 'gandalf@email.com', 'password1', '2023-01-01 10:00:00'),
(2, 'Merlin', 'Emrys', 'merlin@email.com', 'password2', '2023-01-02 10:00:00'),
(3, 'Harry', 'Potter', 'harrypotter@email.com', 'password3', '2023-01-03 10:00:00'),
(4, 'Hermione', 'Granger', 'hermionegranger@email.com', 'password4', '2023-01-04 10:00:00'),
(5, 'Albus', 'Dumbledore', 'albusdumbledore@email.com', 'password5', '2023-02-01 10:00:00'),
(6, 'Morgana', 'Le Fay', 'morganalefay@email.com', 'password6', '2023-02-02 10:00:00'),
(7, 'Sabrina', 'Spellman', 'sabrinaspellman@email.com', 'password7', '2023-02-03 10:00:00'),
(8, 'Draco', 'Malfoy', 'dracomalfoy@email.com', 'password8', '2023-02-04 10:00:00'),
(9, 'Sirius', 'Black', 'siriusblack@email.com', 'password9', '2023-03-01 10:00:00'),
(10, 'Luna', 'Lovegood', 'lunalovegood@email.com', 'password10', '2023-03-02 10:00:00'),
(11, 'Severus', 'Snape', 'severussnape@email.com', 'password11', '2023-03-03 10:00:00'),
(12, 'Minerva', 'McGonagall', 'minervamcgonagall@email.com', 'password12', '2023-03-04 10:00:00');

INSERT INTO Transactions(TransactionID, UserID, TransactionDate)
VALUES 
(1, 1, '2023-01-05 10:00:00'),
(2, 2, '2023-01-06 10:00:00'),
(3, 3, '2023-01-07 10:00:00'),
(4, 4, '2023-01-08 10:00:00'),
(5, 5, '2023-02-05 10:00:00'),
(6, 6, '2023-02-06 10:00:00'),
(7, 7, '2023-02-07 10:00:00'),
(8, 8, '2023-02-08 10:00:00'),
(9, 9, '2023-03-05 10:00:00'),
(10, 10, '2023-03-06 10:00:00'),
(11, 11, '2023-03-07 10:00:00'),
(12, 12, '2023-03-08 10:00:00');

INSERT INTO TransactionDetails(TransactionID, ProductID, Quantity)
VALUES 
(1, 1, 1),
(1, 2, 1),
(2, 3, 2),
(3, 1, 1),
(3, 4, 1),
(4, 2, 1),
(4, 4, 1),
(5, 5, 1),
(5, 6, 1),
(6, 7, 3),
(7, 8, 1),
(7, 7, 2),
(8, 5, 1),
(8, 8, 1),
(9, 9, 1),
(9, 11, 1),
(10, 12, 5),
(11, 10, 2),
(11, 12, 3),
(12, 9, 1),
(12, 10, 1);

INSERT INTO ProductReviews(ReviewID, ProductID, UserID, ReviewText, Rating, ReviewDate)
VALUES 
(1, 1, 1, 'This wand is truly exceptional.', 5, '2023-01-05 12:00:00'),
(2, 2, 2, 'Feeling younger already!', 5, '2023-01-06 12:00:00'),
(3, 3, 3, 'Solid construction, handles well.', 4, '2023-01-07 12:00:00'),
(4, 4, 4, 'Perfectly invisible, but a bit itchy.', 4, '2023-01-08 12:00:00'),
(5, 5, 5, 'Magnificent speed, comfortable ride.', 5, '2023-02-05 12:00:00'),
(6, 6, 6, 'Seeing the future has never been clearer.', 4, '2023-02-06 12:00:00'),
(7, 7, 7, 'Writes smoothly, lovely feather.', 4, '2023-02-07 12:00:00'),
(8, 8, 8, 'A plethora of intriguing spells, excellent addition to my collection.', 5, '2023-02-08 12:00:00'),
(9, 9, 9, 'Hoping for a friendly dragon.', 5, '2023-03-05 12:00:00'),
(10, 10, 10, 'Makes potion brewing so much easier.', 4, '2023-03-06 12:00:00'),
(11, 11, 11, 'Useful for finding my way around Hogwarts.', 4, '2023-03-07 12:00:00'),
(12, 12, 12, 'Keeps my scrolls safe from prying eyes.', 5, '2023-03-08 12:00:00');
