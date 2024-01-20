// Function to generate a code verifier and compute code challenge
async function generateCode() {
  const length = 128; // Length of the code verifier
  const charset = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
  let codeVerifier = '';
  
  // Generate code verifier
  for (let i = 0; i < length; i++) {
    const randomIndex = Math.floor(Math.random() * charset.length);
    codeVerifier += charset[randomIndex];
  }

  // Compute code challenge from code verifier using SHA-256
  const encoder = new TextEncoder();
  const data = encoder.encode(codeVerifier);
  const hashedData = await crypto.subtle.digest('SHA-256', data);
  const codeChallenge = btoa(String.fromCharCode.apply(null, new Uint8Array(hashedData)))
    .replace(/\+/g, '-').replace(/\//g, '_').replace(/=/g, '');

  // Return JSON object containing code verifier and code challenge
  return { "Code Verifier": codeVerifier, "Code Challenge": codeChallenge };
}

// Example usage
generateCode()
  .then(result => {
    console.log(JSON.stringify(result)); // Logs the JSON object
    return result; // Return the JSON object if needed
  })
  .catch(err => console.error('Error generating code:', err));
