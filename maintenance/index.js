const express = require('express');
const app = express();
const port = process.env.APP_PORT || 8000;

app.get('/', (req, res) => res.send('<h1>Maintenance mode</h1>'));

app.listen(port, () => console.log(`Maintenance app listening on port ${port}!`));
