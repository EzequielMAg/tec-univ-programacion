//FETCH: al igual que xhr, se utiliza para realizar solicitudes HTTP de manera asincronica
// Es una manera mas eficiente y limpia que XMNLHttpRequest 
//Recibe como parametro la URL del recurso que se quiere hace la solicitud y devuelve una promesa.

let datosJson;

// FETCH es de la WEB API
fetch('persona.json', {method: 'GET'})
.then(resp => resp.json()) //En caso positivo, recibo la promesa, osea me retorna el recurso y lo tengo que parsear a .json, tambien retorna otra cosa
.then(salida => {          // Aca agarro eso retornado 

    datosJson = salida;

    let texto = document.getElementById("nombre");
    texto.textContent = datosJson.nombre;
});


// En este caso, como estamos trabajando con un archivo .json nuestro, osea, sabemos lo que vamos a recibir
// en formato json, la linea 9 se puede borrar y andaria, ya que no hace falta parsearlo :v

// En la linea 9, se esta retornando una promesa, por eso usamos nuevamente el .then() en la linea siguiente