let datosJson;


fetch('persona.json', {method: 'GET'})
.then(resp => resp.json())
.then(salida => {

    datosJson = salida;
});






























