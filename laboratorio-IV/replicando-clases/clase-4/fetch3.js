
//* PRIMER EJEMPLO: muestra una img en la pagina, segun el ID pasado en el URL. 
/* fetch("https://rickandmortyapi.com/api/character/30", { method: 'GET' })
    .then(resp => resp.json())
    .then(data => {          // Aca agarro eso retornado, EL PARSEO, si se resolvio bien 

        let imagen = document.getElementById("imagen");

        //Dos formas de hacer lo mismo -> asignar un valor a un atributo de un elemento HTML
        // imagen.src = data.image;
        imagen.setAttribute("src", data.image);
    }).catch(error => console.log("Error en el fetch -> " + error));
 */


//* SEGUNDO EJEMPLO: le pasamos un ID que no existe en la BD de la API... 
///Por lo que nos devuelve un error 404. En el siguiente ejemplo (3ER EJEMPLO) se trata el error correctamente con el if 
/* 
fetch("https://rickandmortyapi.com/api/character/3000", {method: 'GET'})
.then(resp => resp.json()) 
.then(data => {          // Aca agarro eso retornado, EL PARSEO, si se resolvio bien 

    let imagen = document.getElementById("imagen");
    
    //Dos formas de hacer lo mismo -> asignar un valor a un atributo de un elemento HTML
    // imagen.src = data.image;
    imagen.setAttribute("src", data.image);
}).catch(error => console.log("Error en el fetch -> " + error)); */


//* TERCER EJEMPLO: mejor codificiacion, por si sucede algo mal en el link, primero se chequea
/// si la respuesta HTTP no es exitosa usando !resp.ok, y si no es exitosa, 
/// arrojamos un error con el código de estado de la respuesta. Esto permitirá que el .catch maneje el error cuando 
/// la API responde con un código de estado no exitoso.
/* 
fetch("https://rickandmortyapi.com/api/character/3000", {method: 'GET'})
.then(resp => {
    
    if(!resp .ok) {
        throw new Error("Error en la solicitud " + resp.status);
    }
    
    return resp.json();
}) 
.then(data => {          // Aca agarro eso retornado, EL PARSEO, si se resolvio bien 

    let imagen = document.getElementById("imagen");
    imagen.setAttribute("src", data.image);
})
.catch(error => console.log("Error en el fetch -> " + error)); */  //Se ataja el error, y se muestra el msje...


//* CUARTO EJEMPLO: 

async function obtenerImagenPorID(id) {

    try{
        const url = `https://rickandmortyapi.com/api/character/${id}`;

        //El AWAIT espera la resolcion de una promesa
        const responseAPI = await fetch(url, {method: 'GET'});

        if(!responseAPI.ok) {
            throw new Error(`No se pudo obtener el objeto con ID ${id}`);
        }

        const data = await responseAPI.json();
        return data;
        
    } catch(error) {
        throw error;
    }
}

document.getElementById("juego").addEventListener("click", event =>{

    const random = Math.round(Math.random() * 826) + 1;

    obtenerImagenPorID(random).then( data => {

        let imagen = document.getElementById("imagen");
        imagen.setAttribute("src", data.image);

        console.log(data);
    });
});





