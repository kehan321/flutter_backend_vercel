// const express = require('express');
// const router = express.Router();

// let users = []; // Replace this with a real database

// // Signup route
// router.post('/signup', (req, res) => {
//   const { name, email, password } = req.body;

//   // Server-side validation
//   if (!name || !email || !password) {
//     return res.status(400).json({ error: 'Name, email, and password are required.' });
//   }

//   // Email validation
//   const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
//   if (!emailRegex.test(email)) {
//     return res.status(400).json({ error: 'Invalid email format.' });
//   }

//   // Password validation
//   if (password.length < 6) {
//     return res.status(400).json({ error: 'Password must be at least 6 characters long.' });
//   }

//   // Check if user already exists
//   const userExists = users.find(u => u.email === email);
//   if (userExists) {
//     return res.status(409).json({ error: 'User already exists.' });
//   }

//   // Create new user
//   users.push({ name, email, password });
//   res.status(201).json({ message: 'User created successfully.' });
// });

// // Login route
// router.post('/login', (req, res) => {
//   const { email, password } = req.body;

//   if (!email || !password) {
//     return res.status(400).json({ error: 'Email and password are required.' });
//   }

//   const user = users.find(u => u.email === email && u.password === password);
//   if (!user) {
//     return res.status(401).json({ error: 'Invalid credentials.' });
//   }

//   res.status(200).json({ message: 'Login successful.', user });
// });




// // GET route to check all users
// router.get('/users', (req, res) => {
//   if (users.length === 0) {
//     return res.status(404).json({ error: 'No users found.' });
//   }
//   res.status(200).json({ users });
// });

// module.exports = router;


const express = require('express');
const router = express.Router();
const bcrypt = require('bcryptjs'); // For password hashing

let users = []; // In-memory users, replace with a database in production
let todos = []; // In-memory todos

// Signup route
router.post('/signup', async (req, res) => {
  const { name, email, password } = req.body;

  // Server-side validation
  if (!name || !email || !password) {
    return res.status(400).json({ error: 'Name, email, and password are required.' });
  }

  // Email validation
  const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
  if (!emailRegex.test(email)) {
    return res.status(400).json({ error: 'Invalid email format.' });
  }

  // Password validation
  if (password.length < 6) {
    return res.status(400).json({ error: 'Password must be at least 6 characters long.' });
  }

  // Check if user already exists
  const userExists = users.find(u => u.email === email);
  if (userExists) {
    return res.status(409).json({ error: 'User already exists.' });
  }

  // Hash the password before storing it
  const hashedPassword = await bcrypt.hash(password, 10);

  // Create new user
  users.push({ name, email, password: hashedPassword });
  res.status(201).json({ message: 'User created successfully.' });
});

// Login route
router.post('/login', async (req, res) => {
  const { email, password } = req.body;

  if (!email || !password) {
    return res.status(400).json({ error: 'Email and password are required.' });
  }

  const user = users.find(u => u.email === email);
  if (!user) {
    return res.status(401).json({ error: 'Invalid credentials.' });
  }

  // Compare the provided password with the stored hashed password
  const isMatch = await bcrypt.compare(password, user.password);
  if (!isMatch) {
    return res.status(401).json({ error: 'Invalid credentials.' });
  }

  res.status(200).json({ message: 'Login successful.', user });
});

// Add Todo Item
router.post('/api/todo', (req, res) => {
    const { email, todoItem } = req.body;
  
    // Check if the request body is correct
    console.log(req.body); // This will log the received data
  
    const user = users.find(u => u.email === email);
    if (!user) {
      return res.status(404).json({ error: 'User not found.' });
    }
  
    todos.push({ email, todoItem });
    
    // Return the updated list of todos
    const userTodos = todos.filter(todo => todo.email === email);
    res.status(200).json({ todos: userTodos, message: 'Todo added successfully.' });
  });
  
  
  // Fetch Todos
  router.get('/api/todos', (req, res) => {
    const { email } = req.query;
    const userTodos = todos.find(t => t.email === email);
  
    if (userTodos) {
      res.status(200).json({ todos: userTodos.items });
    } else {
      res.status(404).json({ error: 'No todos found for this user' });
    }
  });
  
// GET route to check all users
router.get('/users', (req, res) => {
  if (users.length === 0) {
    return res.status(404).json({ error: 'No users found.' });
  }
  res.status(200).json({ users });
});

module.exports = router;
