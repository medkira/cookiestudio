import express from 'express';
import connection from '../mongodb/connection.js';
const app = express();
const port = 3000; // You can use any port you prefer

app.get('/', (req, res) => {
  console.log("hi");

  res.send('Hello, Express we back!! :)');
});


app.listen(port, () => {
  console.log(`Server is running on http://localhost:${port}`);
});
