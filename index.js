import express from 'express';
const app = express();

app.get('/check', (req, res) => {
  const { text } = req.query;
  if (!text) return res.status(400).json({ error: 'Missing text parameter' });
  
  const cleaned = text.toLowerCase().replace(/[^a-z0-9]/g, '');
  const reversed = cleaned.split('').reverse().join('');
  const isPalindrome = cleaned === reversed;
  
  res.json({ input: text, cleaned, isPalindrome });
});

app.listen(3007, () => console.log('Palindrome Checker API on port 3007'));
