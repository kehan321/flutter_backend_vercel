
// api/messages.js
// const express = require('express');
// const router = express.Router();

// let messages = [
//   { id: 1, sender: "Alice", message: "Hi there!" },
//   { id: 2, sender: "Bob", message: "Hello!" },
//   { id: 3, sender: "Alice", message: "How are you?" }
// ];

// // GET request handler
// router.get('/', (req, res) => {
//   res.status(200).json(messages);
// });

// // POST request handler
// router.post('/', (req, res) => {
//   const { sender, message } = req.body;

//   if (!sender || !message) {
//     return res.status(400).json({ error: 'Sender and message are required' });
//   }

//   const newMessage = {
//     id: Date.now(),
//     sender,
//     message
//   };

//   messages.push(newMessage);
//   res.status(201).json(messages);
// });

// module.exports = router;


const express = require('express');
const router = express.Router();

// In-memory "users" array for demo
let users = [];

// POST: Sign-Up route
router.post('/signup', (req, res) => {
  const { name, email, password } = req.body;

  let errors = {};

  if (!name || name.trim() === '') {
    errors.name = 'Name is required';
  }
  if (!email || email.trim() === '') {
    errors.email = 'Email is required';
  }
  if (!password || password.trim() === '') {
    errors.password = 'Password is required';
  }

  if (Object.keys(errors).length > 0) {
    return res.status(400).json({ errors });
  }

  const newUser = {
    id: Date.now(),
    name,
    email,
    password // Note: Don't store plain passwords in production!
  };

  users.push(newUser);
  return res.status(201).json({ message: 'User registered successfully', user: newUser });
});

module.exports = router;
