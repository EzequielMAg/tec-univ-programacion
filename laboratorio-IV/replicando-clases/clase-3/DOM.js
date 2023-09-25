/* let headBoard = document.getElementById("cabecera");
console.log(headBoard);

console.log(headBoard.innerHTML);

let paragraph = document.getElementById("parrafo1");
console.log(paragraph);

console.log(paragraph.innerHTML);
console.log(paragraph.outerHTML);

//modifico el parrafoo
paragraph.innerHTML = "HOLAAAAAAAAAAA!!"


//Otra forma de acceder 
let paragraphs = document.getElementsByTagName("p");
console.log(`Hay ${paragraphs.length} parrafos`);

paragraphs[2].innerHTML = "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAA!"

let redElements = document.getElementsByClassName("rojo");
console.log(redElements);
console.log("Cantidad de elementos aplicando la clase rojo ->  "+redElements.length);


let redParagrahs = document.querySelectorAll("p.rojo");
console.log(redParagrahs);
console.log("Hay "+redParagrahs.length+" parrafos rojos"); */


/* let form = document.forms["formulario"];
console.log(form);


let inputSurname = form["apellido"];
console.log(inputSurname);

console.log(inputSurname.getAttribute("type"));
inputSurname.setAttribute("type", "text");
console.log(inputSurname.getAttribute("type"));



inputSurname.setAttribute("placeholder", "Ingrese su apellido");


form["nombre"].setAttribute("placeholder", "Ingrese su nombre"); */


/* let inputPrueba = document.getElementById("inputPrueba");
inputPrueba.className = "prueba";
inputPrueba.type = "color";
inputPrueba.value = "#123456";

console.log(inputPrueba);



let inputFile = document.getElementById("inputFile");
inputFile.type = "file";
inputFile.accept = "image/png, image/jpeg, video/mp4";

console.log(inputFile); */


// Conseguimos la referencia del ELEMENTO  ----------------------------
/* 
const contenedor = document.querySelector(".contenedor");

//Creamos un elemento "li"
const item = document.createElement("li");

//Creamos contenido, un objeto TEXT
const textItem = document.createTextNode("Item 1");

//Agregamos el nodo text al LI
item.appendChild(textItem);

//Agregamos el elemento LI al contenedor, ELEMENTO DIV. Tenemos la referencia
contenedor.appendChild(item); */
// ------------------------------------------------------------
/* 
const fragment = document.createDocumentFragment();

for (let i = 2; i <= 5; i++) {
    const item2 = document.createElement("li");
    const textItem2 = document.createTextNode("Item "+ i);  //(`Item ${i}`);
    item2.appendChild(textItem2);
    fragment.appendChild(item2);
}

contenedor.appendChild(fragment);
console.log(fragment);
 */
// ------------------------------------------------------------
/* 
const contenedorNodos = document.querySelector(".contNodos");
console.log(contenedorNodos);

const primerNodo = contenedorNodos.firstChild;
console.log(primerNodo);

const ultimoNodo = contenedorNodos.lastChild;
console.log(ultimoNodo);

console.log(contenedorNodos.lastElementChild);

console.log(contenedorNodos.parentElement);
console.log(contenedorNodos.children);
console.log(contenedorNodos.childNodes); */
// ------------------------------------------------------------
//* FUNCIONES  ------------------------------------------------
// #region
function cambiarColor() {
    let paragraph = document.getElementById("parrafo2");

    paragraph.style.color == "red" ? paragraph.style.color = "blue" : paragraph.style.color = "red";
}

function cambiarImagen() {
    let imagen = document.getElementById("imagen");
    console.log("hola")
    let linkImgJS = "http://globalmentoring.com.mx/imagenes/javascript.png";
    let linkImgHTML = "http://globalmentoring.com.mx/imagenes/html5.png";

    imagen.src === linkImgJS ? imagen.src = linkImgHTML : imagen.src = linkImgJS;

}

function cambiarTitulo(elemento) {

    let contenido = "Bienvenido a la otra pagina";
    const nuevoContenido = "Bienvenido cambiado";

    elemento.innerHTML = (elemento.innerHTML === contenido) ? nuevoContenido : contenido;
    console.log("hola");
}


function rojo(elemento) {
    elemento.style.color = "red";
}

function azul(elemento) {
    elemento.style.color = "blue";
}
// #endregion


//* EVENT LISTENER  -------------------------------------------
//Agregando un escuchador de eeventos al elemento que tiene id="pelicula"
document.getElementById("pelicula").addEventListener("focus", function (evento) {

    evento.target.style.background = "blue";
    document.getElementById("parrafo").innerHTML = "Otro parrafo!!!";
})

document.getElementById("pelicula").addEventListener("blur", function (evento) {

    evento.target.style.background = "white";
})











