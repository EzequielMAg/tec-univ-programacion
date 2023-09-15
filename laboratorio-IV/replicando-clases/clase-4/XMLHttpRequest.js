
let datosJson;
let xhr = new XMLHttpRequest();

/* xhr.open('GET', "persona.json", true); */
xhr.open('GET', "https://rickandmortyapi.com/api/character/2", true);

xhr.responseType = 'json';

xhr.onload = function(){
   
    if(xhr.status === 200){
        datosJson = xhr.response;
        let texto = document.getElementById("nombre");
        texto.textContent = datosJson.name;
    } 
    else{
        console.log("Se maneja el error");
    }

}

xhr.send();


