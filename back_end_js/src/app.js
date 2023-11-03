import express from 'express';
import connection from './adapters/mongodb/connection.js';
import serverConfig from './adapters/express/server.js';
import mongoose from 'mongoose';


const app = express();


// ? we use this to connect to the server 
serverConfig(app).startServer();

// ? we use this to connect to the database
connection(mongoose).connectToMongo();