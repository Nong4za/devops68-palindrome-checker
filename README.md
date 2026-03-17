# Palindrome Checker API

Check if text is a palindrome.

## Endpoint

### GET `/check`

**Parameters:**
- `text` (required): Text to check

**Example Request:**
```
http://localhost:3007/check?text=racecar
```

**Example Response:**
```json
{
  "input": "racecar",
  "cleaned": "racecar",
  "isPalindrome": true
}
```
