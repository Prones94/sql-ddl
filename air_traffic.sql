-- Drop and create the database
DROP DATABASE IF EXISTS air_traffic;
CREATE DATABASE air_traffic;

\c air_traffic

-- Airlines Table
CREATE TABLE airlines (
    airline_id SERIAL PRIMARY KEY,
    name TEXT NOT NULL
);

-- Countries Table
CREATE TABLE countries (
    country_id SERIAL PRIMARY KEY,
    name TEXT NOT NULL
);

-- Cities Table
CREATE TABLE cities (
    city_id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    country_id INT NOT NULL,
    FOREIGN KEY (country_id) REFERENCES countries(country_id)
);

-- Flights Table
CREATE TABLE flights (
    flight_id SERIAL PRIMARY KEY,
    airline_id INT NOT NULL,
    from_city_id INT NOT NULL,
    to_city_id INT NOT NULL,
    departure TIMESTAMP NOT NULL,
    arrival TIMESTAMP NOT NULL,
    FOREIGN KEY (airline_id) REFERENCES airlines(airline_id),
    FOREIGN KEY (from_city_id) REFERENCES cities(city_id),
    FOREIGN KEY (to_city_id) REFERENCES cities(city_id)
);

-- Tickets Table
CREATE TABLE tickets (
    ticket_id SERIAL PRIMARY KEY,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL,
    seat TEXT NOT NULL,
    flight_id INT NOT NULL,
    FOREIGN KEY (flight_id) REFERENCES flights(flight_id)
);

-- Insert into Airlines Table
INSERT INTO airlines (name)
VALUES
('United'),
('British Airways'),
('Delta'),
('TUI Fly Belgium'),
('Air China'),
('American Airlines'),
('Avianca');

-- Insert into Countries Table
INSERT INTO countries (name)
VALUES
('United States'),
('Japan'),
('United Kingdom'),
('Mexico'),
('France'),
('Morocco'),
('UAE'),
('China');

-- Insert into Cities Table
INSERT INTO cities (name, country_id)
VALUES
('Washington DC', 1),
('Seattle', 1),
('Tokyo', 2),
('London', 3),
('Los Angeles', 1),
('Las Vegas', 1),
('Mexico City', 4),
('Paris', 5),
('Casablanca', 6),
('Dubai', 7),
('Beijing', 8),
('New York', 1),
('Charlotte', 1),
('Cedar Rapids', 1),
('Chicago', 1),
('New Orleans', 1);

-- Insert into Flights Table
INSERT INTO flights (airline_id, from_city_id, to_city_id, departure, arrival)
VALUES
(1, 1, 2, '2018-04-08 09:00:00', '2018-04-08 12:00:00'),
(2, 3, 4, '2018-12-19 12:45:00', '2018-12-19 16:15:00'),
(3, 5, 6, '2018-01-02 07:00:00', '2018-01-02 08:03:00'),
(3, 2, 7, '2018-04-15 16:50:00', '2018-04-15 21:00:00'),
(4, 8, 9, '2018-08-01 18:30:00', '2018-08-01 21:50:00'),
(5, 10, 11, '2018-10-31 01:15:00', '2018-10-31 12:55:00'),
(1, 12, 13, '2019-02-06 06:00:00', '2019-02-06 07:47:00'),
(6, 14, 15, '2018-12-22 14:42:00', '2018-12-22 15:56:00'),
(6, 13, 16, '2019-02-06 16:28:00', '2019-02-06 19:18:00'),
(7, 13, 16, '2019-01-20 19:30:00', '2019-01-20 22:45:00');

-- Insert into Tickets Table
INSERT INTO tickets (first_name, last_name, seat, flight_id)
VALUES
('Jennifer', 'Finch', '33B', 1),
('Thadeus', 'Gathercoal', '8A', 2),
('Sonja', 'Pauley', '12F', 3),
('Jennifer', 'Finch', '20A', 4),
('Waneta', 'Skeleton', '23D', 5),
('Thadeus', 'Gathercoal', '18C', 6),
('Berkie', 'Wycliff', '9E', 7),
('Alvin', 'Leathes', '1A', 8),
('Berkie', 'Wycliff', '32B', 9),
('Cory', 'Squibbes', '10D', 10);
