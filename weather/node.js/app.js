const express = require('express');
const axios = require('axios');
const app = express();
const apiKey = '3cd8222bc129c20f5da108a12ea5556a';

app.get('/weather', async (req, res) => {
  const { latitude, longitude } = req.query;

  try {
    const response = await axios.get(`https://api.openweathermap.org/data/2.5/weather?lat=${latitude}&lon=${longitude}&appid=${apiKey}`);
    const weatherData = {
      temperature: response.data.main.temp,
      description: response.data.weather[0].description,
      city: response.data.name,
      country: response.data.sys.country,
    };
    res.json(weatherData);
  } catch (error) {
    console.error(error);
    res.status(500).json({ message: 'Internal Server Error' });
  }
});

const port = process.env.PORT || 3000;
app.listen(port, () => {
  console.log(`Server is listening on port ${port}`);
});