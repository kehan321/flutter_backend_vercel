// api/chat.js

// const messages = [
//     { id: 1, sender: "Alice", message: "Hi there!" },
//     { id: 2, sender: "Bob", message: "Hello!" },
//     { id: 3, sender: "Alice", message: "How are you?" },
//   ];
  
//   module.exports = (req, res) => {
//     if (req.method === "GET") {
//       res.status(200).json(messages);
//     } else {
//       res.status(405).json({ error: "Method Not Allowed" });
//     }
//   };
  


// 2

//   https://skillbuddy-1jq2veal8-kehan321s-projects.vercel.app/api

// module.exports = (req, res) => {
//     res.status(200).json({ message: "Hello from Vercel Serverless Backend! alright" });
//   };




// 3



// const messages = [
//     { id: 1, sender: "Alice", message: "Hi there!" },
//     { id: 2, sender: "Bob", message: "Hello!" },
//     { id: 3, sender: "Alice", message: "How are you?" },
//   ];
  
//   module.exports = (req, res) => {
//     if (req.method === "GET") {
//       // Handle CORS if your Flutter app is on a different domain
//       res.setHeader("Access-Control-Allow-Origin", "*");
//       res.setHeader("Access-Control-Allow-Methods", "GET");
//       res.setHeader("Access-Control-Allow-Headers", "Content-Type");
  
//       res.status(200).json(messages);
//     } else {
//       res.status(405).json({ error: "Method Not Allowed" });
//     }
//   };
  
  



// 4


// Import required modules
const express = require('express');
const jwt = require('jsonwebtoken');
const cors = require('cors');

// Initialize the app
const app = express();
const PORT = process.env.PORT || 3000;

// Use CORS for cross-origin requests
app.use(cors());

// Sample data (messages)
const messages = [
  { id: 1, sender: "Alice", message: "Hi there!" },
  { id: 2, sender: "Bob", message: "Hello!" },
  { id: 3, sender: "Alice", message: "How are you?" }
];

// Middleware to check for Bearer Token
const authenticate = (req, res, next) => {
  const token = req.header('Authorization')?.replace('Bearer ', ''); // Extract token from Authorization header

  if (!token) {
    return res.status(401).send({ error: 'Authentication required' });
  }

  try {
    // Random secret key generated
    const secretKey = 'df7f5a3dcbcd4b078f7421d193597d6f7a163b839fa6c0a9a10f3a9b8308c778'; // Random secret key
    const decoded = jwt.verify(token, secretKey); // Verify the token
    req.user = decoded; // Attach decoded user info to the request object
    next(); // Pass to the next middleware or route handler
  } catch (e) {
    res.status(401).send({ error: 'Invalid token' });
  }
};

// Route to get messages (protected)
app.get('/api/messages', authenticate, (req, res) => {
  res.status(200).json(messages);
});

// Route to generate a token (for testing purposes)
app.get('/api/token', (req, res) => {
  // Generate a token (use your own secret key)
  const secretKey = 'df7f5a3dcbcd4b078f7421d193597d6f7a163b839fa6c0a9a10f3a9b8308c778'; // Random secret key
  const token = jwt.sign({ user: 'testUser' }, secretKey, { expiresIn: '1h' });
  res.json({ token });
});

// Start the server
app.listen(PORT, () => {
  console.log(`Server running on port ${PORT}`);
});


// Start the server
app.listen(PORT, () => {
  console.log(`Server running on port ${PORT}`);
});
