let xhr = new XMLHttpRequest();
let datosJson;

xhr.open('GET', "https://rickandmortyapi.com/api/character/2", true);
xhr.responseType = 'json';

xhr.onload = function () {
    if (xhr.status === 200) {

        datosJson = xhr.response;
        let texto = document.getElementById("nombre");
        texto.textContent = datosJson.name;

        let img = document.getElementById("imagen");
        console.log(datosJson.image);
        img.setAttribute("src", datosJson.image);

    }
    else {
        console.log("Se maneja el error");
    }
}

xhr.send();
