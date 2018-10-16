# OnlineMovieTicket
Java web lab assignment for Semester 7


### SQL queries for creating the database.

>>> create database onlinemovies;

>>> use onlinemovies;

>>> create table movies(movieCode varchar(10) primary key, movieName varchar(50), movieLang varchar(20));

>>> create table movieshows(movieCode varchar(10), movieTime varchar(10), movieDate varchar(30), movieSeats int(11));

>>> create table movietickets(ticketID varchar(50) primary key, ticketName varchar(50));

>>> /// No need for all the fields in the movietickets table.

