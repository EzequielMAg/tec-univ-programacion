// Objeto creado por Microsoft y fue adoptado por Google, Mozilla y Apple etc
//* Nos proporciona una forma facil de obtener informacion de una URL, sin tener que recargar la pagina completa
// Es decir, al hacer una peticion, no tenemos que recargar la pagina para que aparezcan los datos, es como en tiempo real
// Y puede recibir cualquier tipo de dato, ya sea XML, HTTP, etc..
let xhr = new XMLHttpRequest();

// Los datos que me traigo a través de la API, los tengo que parsear a JSON
let datosJson;

// Este ojbeto "xhr" tiene un metodo llamado "open", que iniciliza una solicitud, recien creada o reinicializa una existente
// Como parametros, recibe el metodo de la solcitud que se va a realizar, la URL o el nombre del archivo .json y por ultimo, 
// si es un metodo asincrono o no
/* xhr.open('GET', "persona.json", true); */
xhr.open('GET', "https://rickandmortyapi.com/api/character/2", true);

xhr.responseType = 'json';

xhr.onload = function () {

    if (xhr.status === 200) {
        datosJson = xhr.response;
        let texto = document.getElementById("nombre");
        texto.textContent = datosJson.name;
    }
    else {
        console.log("Se maneja el error");
    }

}

// Si no opnemos esto la solicitud no se va a enviar
xhr.send();


