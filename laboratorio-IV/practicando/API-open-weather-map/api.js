const url = 'https://open-weather-map27.p.rapidapi.com/weather';

const options = {
	method: 'GET',
	headers: {
		'X-RapidAPI-Key': '6043f3f1c0msh971bf7d38535479p1e2812jsnc9112e5e3c8b',
		'X-RapidAPI-Host': 'open-weather-map27.p.rapidapi.com'
	}
};

try {
	const response = await fetch(url, options);
	const result = await response.text();
	console.log(result);
} catch (error) {
	console.error(error);
}