let xhr2 = new XMLHttpRequest();
let datosJson2;

xhr2.open('GET', "persona.json", true);
xhr2.responseType = 'json';

xhr2.onload = function () {
    datosJson2 = xhr2.response;

    if (xhr2.status === 200) {
        let texto = document.getElementById("nombre");
        texto.innerHTML = datosJson2.nombre;
        texto.innerHTML = datosJson2.nombre;
    }
    else {
        console.log("Se maneja el error");
    }
}

xhr2.send();