--DROP TABLES IN CASE THEY EXIST
DROP TABLE IF EXISTS price_history;
DROP TABLE IF EXISTS reviews;
DROP TABLE IF EXISTS orders;
DROP TABLE IF EXISTS buyers;
DROP TABLE IF EXISTS buyer_types;
DROP TABLE IF EXISTS produce_listings;
DROP TABLE IF EXISTS farmers; 
DROP TABLE IF EXISTS provinces; 
DROP TABLE IF EXISTS categories; 
DROP TABLE IF EXISTS order_statuses;

-- Create province table
CREATE TABLE provinces(
    province_id INT PRIMARY KEY IDENTITY(1,1),
    province_name VARCHAR(150) NOT NULL UNIQUE
);
-- Create categories table
CREATE TABLE categories (
    category_id INT PRIMARY KEY IDENTITY(1,1),
    category_name VARCHAR(50) NOT NULL
);
-- Create buyer_types table
CREATE TABLE buyer_types (
    buyer_type_id INT PRIMARY KEY IDENTITY(1,1),
    type_name VARCHAR(50) NOT NULL
);
-- Create Order_statuses table
CREATE TABLE order_statuses (
    status_id INT PRIMARY KEY IDENTITY(1,1),
    status_name VARCHAR(50) NOT NULL
);

CREATE TABLE farmers(
    farmer_id INT PRIMARY KEY IDENTITY(1,1),
    full_name VARCHAR(150) NOT NULL, 
    email VARCHAR(255) NOT NULL UNIQUE,
    phone_number CHAR(10) NOT NULL,
    farm_name VARCHAR(200) NOT NULL,
    location VARCHAR(200) NOT NULL, 
    province_id INT REFERENCES provinces(province_id),
    rating DECIMAL(3,2) DEFAULT 0.00 CHECK (rating BETWEEN 0 AND 5),
    is_verified BIT DEFAULT 0,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP 
);

CREATE TABLE produce_listings(
    listing_id INT PRIMARY KEY IDENTITY(1,1),
    farmer_id INT NOT NULL REFERENCES farmers(farmer_id),
    product_name VARCHAR(200) NOT NULL CHECK (LEN(product_name) >= 3),
    category_id INT NOT NULL REFERENCES categories(category_id),
    price_per_kg DECIMAL(10,2) NOT NULL CHECK (price_per_kg > 0),
    quantity_kg DECIMAL(10,2) NOT NULL CHECK (quantity_kg > 0),
    is_available BIT DEFAULT 1,
    harvest_date DATE NOT NULL,
    date_listed DATETIME DEFAULT CURRENT_TIMESTAMP, 
    description VARCHAR(500) NULL
);

CREATE TABLE buyers(
    buyer_id INT PRIMARY KEY IDENTITY(1,1),
    full_name VARCHAR(200) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE,
    phone_number VARCHAR(20) NOT NULL,
    buyer_type_id INT REFERENCES buyer_types(buyer_type_id),
    location VARCHAR(200) NOT NULL,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE orders (
    order_id INT PRIMARY KEY IDENTITY(1,1),
    buyer_id INT NOT NULL REFERENCES buyers(buyer_id),
    listing_id INT NOT NULL REFERENCES produce_listings(listing_id),
    status_id INT NOT NULL REFERENCES order_statuses(status_id),
    quantity_ordered DECIMAL(10, 2) NOT NULL CHECK (quantity_ordered > 0),
    total_price DECIMAL(12, 2) NOT NULL,
    order_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    collection_date DATETIME NULL,                
    notes VARCHAR(500) NULL
);

CREATE TABLE reviews (
    review_id INT PRIMARY KEY IDENTITY(1,1),
    buyer_id INT NOT NULL REFERENCES buyers(buyer_id),
    farmer_id INT NOT NULL REFERENCES farmers(farmer_id),
    order_id INT NOT NULL REFERENCES orders(order_id),
    rating TINYINT NOT NULL CHECK (rating BETWEEN 1 AND 5),
    comment VARCHAR(1000) NULL,
    date_posted DATETIME DEFAULT CURRENT_TIMESTAMP,
);

CREATE TABLE price_history (
    history_id INT PRIMARY KEY IDENTITY(1,1),
    listing_id INT NOT NULL REFERENCES produce_listings(listing_id),
    old_price DECIMAL(10, 2) NOT NULL,
    new_price DECIMAL(10, 2) NOT NULL,
    change_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    reason VARCHAR(255) NULL
);