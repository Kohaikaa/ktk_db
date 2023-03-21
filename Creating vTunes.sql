DROP DATABASE IF EXISTS vTunes;
CREATE DATABASE vTunes;
USE vTunes;

CREATE TABLE playlists
(
    PlaylistId INTEGER PRIMARY KEY AUTO_INCREMENT NOT NULL,
    Name VARCHAR(120) not NULL
);

CREATE TABLE media_types
(
    MediaTypeId INTEGER PRIMARY KEY AUTO_INCREMENT NOT NULL,
    Name VARCHAR(120)
);

CREATE TABLE artists
(
    ArtistId INTEGER PRIMARY KEY AUTO_INCREMENT NOT NULL,
    Name VARCHAR(120)
);

CREATE TABLE genres
(
    GenreId INTEGER PRIMARY KEY AUTO_INCREMENT NOT NULL,
    Name VARCHAR(120)
);


CREATE TABLE employees
(
    EmployeeId INTEGER PRIMARY KEY AUTO_INCREMENT NOT NULL,
    LastName VARCHAR(20)  NOT NULL,
    FirstName VARCHAR(20)  NOT NULL,
    Title VARCHAR(30),
    ReportsTo INTEGER,
    BirthDate DATETIME,
    HireDate DATETIME,
    Address VARCHAR(70),
    City VARCHAR(40),
    State VARCHAR(40),
    Country VARCHAR(40),
    PostalCode VARCHAR(10),
    Phone VARCHAR(24),
    Fax VARCHAR(24),
    Email VARCHAR(60),
    FOREIGN KEY (ReportsTo) REFERENCES employees (EmployeeId)
);

CREATE TABLE customers
(
    CustomerId INTEGER PRIMARY KEY AUTO_INCREMENT NOT NULL,
    FirstName VARCHAR(40)  NOT NULL,
    LastName VARCHAR(20)  NOT NULL,
    Company VARCHAR(80),
    Address VARCHAR(70),
    City VARCHAR(40),
    State VARCHAR(40),
    Country VARCHAR(40),
    PostalCode VARCHAR(10),
    Phone VARCHAR(24),
    Fax VARCHAR(24),
    Email VARCHAR(60)  NOT NULL,
    SupportRepId INTEGER,
    FOREIGN KEY (SupportRepId) REFERENCES employees (EmployeeId)
);

CREATE TABLE invoices
(
    InvoiceId INTEGER PRIMARY KEY AUTO_INCREMENT NOT NULL,
    CustomerId INTEGER  NOT NULL,
    InvoiceDate DATETIME  NOT NULL,
    BillingAddress VARCHAR(70),
    BillingCity VARCHAR(40),
    BillingState VARCHAR(40),
    BillingCountry VARCHAR(40),
    BillingPostalCode VARCHAR(10),
    Total NUMERIC(10,2)  NOT NULL,
    FOREIGN KEY (CustomerId) REFERENCES customers (CustomerId)
);


CREATE TABLE albums
(
    AlbumId INTEGER PRIMARY KEY AUTO_INCREMENT NOT NULL,
    Title VARCHAR(160)  NOT NULL,
    ArtistId INTEGER  NOT NULL,
    FOREIGN KEY (ArtistId) REFERENCES artists (ArtistId)
);

CREATE TABLE tracks
(
    TrackId INTEGER PRIMARY KEY AUTO_INCREMENT NOT NULL,
    Name VARCHAR(200)  NOT NULL,
    AlbumId INTEGER,
    MediaTypeId INTEGER  NOT NULL,
    GenreId INTEGER,
    Composer VARCHAR(220),
    Milliseconds INTEGER  NOT NULL,
    Bytes INTEGER,
    UnitPrice NUMERIC(10,2)  NOT NULL,
    FOREIGN KEY (AlbumId) REFERENCES albums (AlbumId),
    FOREIGN KEY (GenreId) REFERENCES genres (GenreId),
    FOREIGN KEY (MediaTypeId) REFERENCES media_types (MediaTypeId)
);

CREATE TABLE playlist_track
(
    PlaylistId INTEGER  NOT NULL,
    TrackId INTEGER  NOT NULL,
    CONSTRAINT PK_PlaylistTrack PRIMARY KEY  (PlaylistId, TrackId),
    FOREIGN KEY (PlaylistId) REFERENCES playlists (PlaylistId),
    FOREIGN KEY (TrackId) REFERENCES tracks (TrackId)
);

CREATE TABLE invoice_items
(
    InvoiceLineId INTEGER PRIMARY KEY AUTO_INCREMENT NOT NULL,
    InvoiceId INTEGER  NOT NULL,
    TrackId INTEGER  NOT NULL,
    UnitPrice NUMERIC(10,2)  NOT NULL,
    Quantity INTEGER  NOT NULL,
    FOREIGN KEY (InvoiceId) REFERENCES invoices (InvoiceId),
    FOREIGN KEY (TrackId) REFERENCES tracks (TrackId)
);

