//QUERY PARAMETERS -> los podemos ir concatenando despues de la barrita y ? separados por &
//BODY PARAMETERS

//Cuando hacemos un POST tenemos que mandar un objeto, el objeto a crear.

let datosJson;

fetch("https://api.example.com/create", {

    method: 'POST',
    body: JSON.stringify( {  //Aca con stringify, se esta onviertiendo un valor JS en un objeto JSON
        nombre: "Agustin Lopez",
        edad: 24,
        esEstudiante: true,
        direccion: {
            calle: "Calle falsa 123",
            ciudad: "Mar del Plata"
        },
        telefonos: [
            2254411162,
            2254403462
        ]
    }),
    headers:{
        'Content-Type': 'application/json' //Esto es para indicarle que le paso los datos en formato JSON
    }
});

// Entonces, en este caso, dentro del segundo parametro del fetch, le estoy mandando 3 cosas:
// 1) El metodo POST
// 2) El cuerpo, que seria el objeto
// 3) el header


