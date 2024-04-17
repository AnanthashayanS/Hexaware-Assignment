-- Creation of the Virtual_Art_Gallery database
CREATE DATABASE Virtual_Art_Gallery;

-- Usage of the Virtual_Art_Gallery database
USE Virtual_Art_Gallery;

-- Creation of Artist Table
CREATE TABLE Artist (
    ArtistID INT PRIMARY KEY,
    Name VARCHAR(50),
    Biography TEXT,
    BirthDate DATE,
    Nationality VARCHAR(50),
    Website VARCHAR(255),
    ContactInformation VARCHAR(50)
);

-- Creation of Artwork table
CREATE TABLE Artwork (
    ArtworkID INT PRIMARY KEY,
    Title VARCHAR(70),
    Description TEXT,
    CreationDate DATE,
    Medium VARCHAR(100),
    ImageURL VARCHAR(255),
    ArtistID INT,
    FOREIGN KEY (ArtistID)
        REFERENCES Artist (ArtistID)
);

-- Creation of User table
CREATE TABLE User (
    UserID INT PRIMARY KEY,
    Username VARCHAR(50),
    Password VARCHAR(50),
    Email VARCHAR(255),
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    DateOfBirth DATE,
    ProfilePicture VARCHAR(255)
);

-- Creation of User_Favorite_Artwork table(JUNCTIONTABLE)
CREATE TABLE User_Favorite_Artwork (
    UserID INT,
    ArtworkID INT,
    FOREIGN KEY (UserID)
        REFERENCES User (UserID),
    FOREIGN KEY (ArtWorkID)
        REFERENCES Artwork (ArtworkID)
);

-- Creation of gallery table
CREATE TABLE Gallery (
    GalleryID INT PRIMARY KEY,
    Name VARCHAR(50),
    Description TEXT,
    Location VARCHAR(100),
    Curator INT,
    OpeningHours VARCHAR(255),
    FOREIGN KEY (Curator) REFERENCES Artist(ArtistID)
);

-- Creation of Artwork_Gallery junction table
CREATE TABLE Artwork_Gallery (
    ArtworkID INT,
    GalleryID INT,
    FOREIGN KEY (ArtworkID)
        REFERENCES Artwork (ArtworkID),
    FOREIGN KEY (GalleryID)
        REFERENCES Gallery (GalleryID)
);

-- Insertion of sample data into Artist table 
INSERT INTO Artist 
VALUES
(1,'Leonardo da Vinci', 'Leonardo di ser Piero da Vinci was an Italian polymath of the High Renaissance who is widely considered one of the most diversely talented individuals ever to have lived. He was born on April 15, 1452, in Vinci, Italy.', '1452-04-15', 'Italian', 'https://en.wikipedia.org/wiki/Leonardo_da_Vinci', 'contact@leonardodavinci.com'),
(2, 'Frida Kahlo', 'Frida Kahlo de Rivera was a Mexican painter known for her many portraits, self-portraits, and works inspired by the nature and artifacts of Mexico.', '1907-07-06', 'Mexican', 'https://en.wikipedia.org/wiki/Frida_Kahlo', 'contact@fridakahlo.com'),
(3, 'Georgia O Keeffe', 'Georgia Totto O Keeffe was an American artist best known for her paintings of enlarged flowers, New York skyscrapers, and New Mexico landscapes.', '1887-11-15', 'American', 'https://en.wikipedia.org/wiki/Georgia_O%27Keeffe', 'contact@georgiaokeeffe.com'),
(4, 'Gustav Klimt', 'Gustav Klimt was an Austrian symbolist painter and one of the most prominent members of the Vienna Secession movement.', '1862-07-14', 'Austrian', 'https://en.wikipedia.org/wiki/Gustav_Klimt', 'contact@gustavklimt.com'),
(5, 'Edvard Munch', 'Edvard Munch was a Norwegian painter and printmaker whose intensely evocative treatment of psychological themes built upon some of the main tenets of late 19th-century Symbolism.', '1863-12-12', 'Norwegian', 'https://en.wikipedia.org/wiki/Edvard_Munch', 'contact@edvardmunch.com'),
(6, 'Katsushika Hokusai', 'Katsushika Hokusai was a Japanese artist, ukiyo-e painter and printmaker of the Edo period.', '1760-10-31', 'Japanese', 'https://en.wikipedia.org/wiki/Hokusai', 'contact@hokusai.com'),
(7, 'Alphonse Mucha', 'Alphonse Maria Mucha was a Czech painter, illustrator, and graphic artist, living in Paris during the Art Nouveau period.', '1860-07-24', 'Czech', 'https://en.wikipedia.org/wiki/Alphonse_Mucha', 'contact@alphonsemucha.com'),
(8,'Vincent van Gogh', 'Vincent Willem van Gogh was a Dutch Post-Impressionist painter who is among the most famous and influential figures in the history of Western art. He was born on March 30, 1853, in Zundert, Netherlands.', '1853-03-30', 'Dutch', 'https://en.wikipedia.org/wiki/Vincent_van_Gogh', 'contact@vincentvangogh.com');

select * from artist;

-- Insertion of sample data into Artwork table
-- Artworks for Leonardo da Vinci
INSERT INTO Artwork 
VALUES
(1, 'The Last Supper', 'The Last Supper is a late 15th-century mural painting by Leonardo da Vinci depicting the Last Supper of Jesus with his disciples.', '1498-01-01', 'Fresco', 'https://en.wikipedia.org/wiki/The_Last_Supper_(Leonardo)', 1),
(2, 'Vitruvian Man', 'The Vitruvian Man is a drawing created by Leonardo da Vinci circa 1490. It is accompanied by notes based on the work of the architect Vitruvius.', '1490-01-01', 'Ink on Paper', 'https://en.wikipedia.org/wiki/Vitruvian_Man', 1),
(3, 'The Two Fridas', 'The Two Fridas is a painting by Frida Kahlo that depicts two versions of Kahlo seated together. One is wearing a European dress while the other is wearing a Tehuana costume.', '1939-01-01', 'Oil on Canvas', 'https://en.wikipedia.org/wiki/The_Two_Fridas', 2),
(4, 'Blue and Green Music', 'Blue and Green Music is a painting by Georgia O Keeffe that reflects her feelings about music through visual art, using flowing shapes and shades of blue and green.', '1921-01-01', 'Oil on Canvas', 'https://en.wikipedia.org/wiki/Blue_and_Green_Music', 3),
(5, 'The Kiss', 'The Kiss is a painting by Gustav Klimt, and is his most famous work. It depicts a couple embracing, their bodies entwined in elaborate robes decorated in a style influenced by the contemporary Art Nouveau movement.', '1907-01-01', 'Oil and Gold Leaf on Canvas', 'https://en.wikipedia.org/wiki/The_Kiss_(Klimt)', 4),
(6, 'The Scream', 'The Scream is an iconic painting by Edvard Munch depicting a figure with an agonized expression against a blood red sky. It is one of the worlds most famous paintings.', '1893-01-01', 'Oil, Tempera, and Pastel on Cardboard', 'https://en.wikipedia.org/wiki/The_Scream', 5),
(7, 'The Great Wave off Kanagawa', 'The Great Wave off Kanagawa is a woodblock print by the Japanese ukiyo-e artist Hokusai. It was published sometime between 1829 and 1833 during the Edo period as the first print in Hokusais series Thirty-six Views of Mount Fuji.', '1831-01-01', 'Woodblock Print', 'https://en.wikipedia.org/wiki/The_Great_Wave_off_Kanagawa', 6),
(8, 'The Seasons', 'The Seasons is a series of four artworks by Alphonse Mucha, representing spring, summer, autumn, and winter in a series of panels filled with lush florals and beautiful women, reflecting the Art Nouveau style.', '1896-01-01', 'Color Lithograph', 'https://en.wikipedia.org/wiki/The_Seasons_(Mucha)', 7),
(9, 'Irises', 'Irises is one of several paintings of irises by the Dutch artist Vincent van Gogh, and one of a series of paintings he made at the Saint Paul-de-Mausole asylum in Saint-Rémy-de-Provence, France.', '1889-01-01', 'Oil on Canvas', 'https://en.wikipedia.org/wiki/Irises_(painting)', 8);

select *  from artwork;

-- Insertion of sample data into User table
INSERT INTO User
VALUES
(1,'Ananthashayan S', 'Ananth123', 'ananthashayan@gmail.com', 'Ananthashayan', 'S', '2002-08-11', '/path/to/profile_pictures/Ananth.jpg'),
(2,'Vinakayak_Mahadev', 'VM@123', 'vinayak@gmail.com', 'Vinayak', 'Mahadev', '2003-04-09', '/path/to/profile_pictures/Vinayak.jpg'),
(3,'Suni_Kumar', 'SunilK123', 'Sunil@gmail.com', 'Sunil', 'Kumar', '2002-12-17', '/path/to/profile_pictures/sunil.jpg'),
(4,'abdul_mariam', 'Abdul@123', 'abdul@gmail.com', 'Abdul', 'Mariam', '2000-01-20', '/path/to/profile_pictures/abdul.jpg'),
(5,'Sasi_Priya', 'Priya123', 'PriyaSasi@gmail.com', 'Sasi', 'Priya', '2000-01-17', '/path/to/profile_pictures/priya.jpg'),
(6,'John_Durairaj', 'JD@123', 'JDurai@gmail.com', 'John', 'Durairaj', '1996-09-07', '/path/to/profile_pictures/durai.jpg'),
(7,'Tushar_Despande', 'TDespande123', 'Despande@gmail.com', 'Tushar', 'Deshpande', '1997-12-21', '/path/to/profile_pictures/Tushardespande.jpg'),
(8,'Ashwin_Raj', 'AshwinRaj123', 'AshwinRaj@gmail.com', 'Ashwin', 'Raj', '1990-07-03', '/path/to/profile_pictures/Ashwin.jpg'),
(9,'Neha_Sharma', 'nehasharma123', 'nehaSharma@gmail.com', 'Neha', 'Sharma', '1995-02-18', '/path/to/profile_pictures/Neha.jpg');

select * from User; 

-- Insertion of sample data into User_Favorite_Artwork table
INSERT INTO User_Favorite_Artwork (UserID, ArtworkID)
VALUES
(1,1),
(1,2),
(1,3),
(2,4),
(2,5),
(2,7),
(3,6),
(4,6),
(4,7),
(5,8),
(5,1),
(5,3),
(6,9),
(6,5),
(7,3),
(8,3),
(8,9),
(9,4),
(9,7),
(9,1);

select * from User_Favorite_Artwork;D
SELECT * FROM artwork;

-- Insertion of sample data into gallery table
INSERT INTO Gallery (GalleryID, Name, Description, Location, Curator, OpeningHours)
VALUES
  (1, 'Metropolitan Museum of Art', 'One of the largest and finest art museums in the world, known for its encyclopedic collection from all cultures and time periods.', 'New York City, USA', 1, 'Tuesday-Saturday: 10:00 AM - 5:00 PM'),
  (2, 'Van Gogh Museum', 'The world\'s largest collection of artworks by Vincent van Gogh, including The Starry Night.', 'Amsterdam, Netherlands', 8, 'Daily: 9:00 AM - 6:00 PM'),
  (3, 'National Gallery of Modern Art', 'Premier art museum in India, showcasing modern and contemporary Indian art.', 'New Delhi, India', 2, 'Monday-Friday: 10:00 AM - 5:00 PM'),
  (4, 'Art Institute of Chicago', 'Major museum in Chicago known for its collection of Impressionist, Post-Impressionist, and American art.', 'Chicago, Illinois, USA', 3, 'Thursday-Tuesday: 11:00 AM - 5:00 PM'),
  (5, 'The Dali Museum', 'Museum dedicated to the works of Salvador Dalí, showcasing his surrealist masterpieces.', 'Figueres, Spain', 7, 'Monday-Friday: 9:00 AM - 7:00 PM'),
  (6, 'Victoria and Albert Museum', 'World\'s largest museum of decorative arts and design, showcasing a vast collection from all over the world.', 'London, United Kingdom', 5, 'Daily: 10:00 AM - 5:30 PM '),
  (7, 'Museo Nacional del Prado', 'Spain\'s national museum of art, showcasing Spanish and European art from the 14th to the 19th centuries.', 'Madrid, Spain', 4, 'Tuesday-Saturday: 10:00 AM - 8:00 PM'),
  (8, 'The Getty Center', 'Art museum showcasing European, Asian, and American art from various periods.', 'Los Angeles, California, USA', 2, 'Tuesday-Sunday: 10:00 AM - 5:30 PM'),
  (9, 'Rijksmuseum', 'National museum of the Netherlands, housing a vast collection of Dutch Golden Age art, including Rembrandt\'s Night Watch.', 'Amsterdam, Netherlands', 6, 'Daily: 9:00 AM - 5:00 PM'),
  (10, 'Louvre Museum', 'One of the world\'s largest and most famous museums, known for its vast collection of artworks, including the Mona Lisa.', 'Paris, France', 1, 'Monday-Friday: 9:00 AM - 6:00 PM');

SELECT * FROM Gallery;

-- Insertion of sample data into Artwork_Gallery table
INSERT INTO Artwork_Gallery (ArtworkID, GalleryID) VALUES
(1,1),
(2,1),
(9,2),
(3,3),
(4,4),
(8,5),
(6,6),
(5,7),
(3,8),
(7,9),
(1,10),
(2,10);
select * from Artwork_Gallery;


