const express = require('express');
const app = express();
const port = 3000;
const cors = require('cors');
app.use(cors());

// 👇 This is required to parse JSON bodies
app.use(express.json());

// Import your routes for authentication
const authRoutes = require('./api/auth'); // Make sure your path matches the file location

// Use the routes in the app
app.use('/api/auth', authRoutes); // Routes for signup and login

// Start server
app.listen(port, () => {
  console.log(`Server running at http://localhost:${port}`);
});
