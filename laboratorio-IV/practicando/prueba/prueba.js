
//#region  PRIORIZACION: String o operacion matematica - concatenacion

/*  Prueba para ver que operacion prioriza js, como actua, y que valor guarda finalmente. */
// let cadena1 = 2 + 4 + "Juan";
// console.log(cadena1); 
/* console.log(typeof cadena1); */
/*  Aca al detectar un nro, luego el operador SUMA, realiza primero esa operacion -> 6.
    Luego al detectar el String, concatena el resultado de la suma al String      -> 6Juan*/


/* Ahora el mismo ejemplo pero al revés */
// let cadena2 = "Juan" + 2 + 4;
// console.log(cadena2); 
/* console.log(typeof cadena2); */
/*  Espera recibir el valor -> "Juan6", pero no.
    Aca JS primero detecto un String, luego detecto el operador "+" y el nro, asi lo concatena.
    Luego de nuevo, el "+" y el nro, y lo concatena nuevamente, quedado -> "Juan 24"*/


/* Para que priorice la suma, hay que separar con parentesis las operaciones */
// cadena2 = "Juan" + (2 + 4); /* En este caso, si se obtiene -> "Juan6" */
// console.log(cadena2); 
/* console.log(typeof cadena2); */
// #endregion

// #region VAR, es local dentro de una FN
/* Comprobacion de que, VAR, al declararla dentro de una funcion, es LOCAL, por lo tanto, no existe fuera de tal funcion */
/* function saludo() {
    console.log("Hola mundo");
    var hola = 25;
    console.log(hola);
}

saludo();
console.log(hola); */  // Uncaught ReferenceError: hola is not defined
//#endregion

// #region >>>>>>>>>>>>>>>>>>>>>>>>  PRACTICANDO ARREGLOS  >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

let marcasAutos = ["BMW", "Audi", "Mercedes Benz"];
console.log(marcasAutos);

// let bolsaGatos = [1, 2, 3, true, 7.7, "Flor"];
// console.log(bolsaGatos);
// console.log(bolsaGatos.indexOf("Flor"));

// marcasAutos.push("Ferrari");
// console.log(marcasAutos);

marcasAutos.push("VW", "Volvo", "Chetrolev");
console.log(marcasAutos);

// marcasAutos.unshift("Ferrari");
// console.log(marcasAutos);

// ----------- 
/* let stringMarcasAutos = marcasAutos.join(" - ");
console.log(stringMarcasAutos);

let nuevoArregloMarcasAutos = stringMarcasAutos.split(" - ")
console.log(nuevoArregloMarcasAutos);  */

// ----------- 
/* nuevoArregloMarcasAutos.splice(2, 2);
console.log(nuevoArregloMarcasAutos); 

const nuevo2 = nuevoArregloMarcasAutos.concat("fitito");
console.log(nuevo2); 

const nuevo3 = nuevo2.slice(1, 5);
console.log(nuevo3); 

nuevo3.splice(2, 1);
console.log(nuevo3); 
 */

// ----------- 
/* for(const dato of marcasAutos ) {
    console.log(dato);
}

console.log("--------------------------");
for(const dato in marcasAutos ) {
    console.log(dato);
}

console.log("--------------------------");
for(const i in marcasAutos ) {
    console.log(marcasAutos[i]);
}

console.log("--------------------------");
for(let i=0; i<marcasAutos.length; i++ ) {
    console.log(marcasAutos[i]);
}

console.log("--------------------------");
marcasAutos.forEach(dato => console.log("-> " + dato)); */



// const notebooks = ["HP", "Lenovo", "Dell", "Asus"];

// const productos = [...marcasAutos, ...notebooks, "MSI"]; // Crea un nuevo array con los elementos de los otros dos arrays.
// console.log(productos);
// #endregion

// #region >>>>>>>>>>>>>>>>>>>>>>>>  ESTRUCTURA DE DATOS SET  >>>>>>>>>>>>>>>
/* const set = new Set([1, 2, "hola", "HoLA", 3, true, 2, 4, true, "hola", 'A', 'A', 4, 1, false]);
let setFromArreglo = Array.from(set); // Convierte el set en un array.

console.log(setFromArreglo);

console.log(set);

console.log(set.has("hola"));

set.delete(3); // Elimina el elemento indicado del set.
console.log(set);

// set.clear(); // Elimina todos los elementos del set.
// console.log(set);
let arreglo1 = [1, 2, 3];
let punteroArreglo1 = arreglo1;
console.log("->" + punteroArreglo1);
let arreglo2 = [1, 2, 3];

set.add(arreglo1);
set.add(arreglo2);

set.add("---->" + punteroArreglo1);
console.log(set); */
// #endregion

// #region >>>>>>>>>>>>>>>>>>>>>>>>  FUNCIONES  >>>>>>>>>>>>>>>
// function miFuncion() {
//     console.log("Hola mundo");
// }

/* function sumar(num1, num2) {
    return num1 + num2;
}

function multiplicar(num1, num2) {
    return num1 * num2;
}

function mostrarPorConsola(mensaje) {
    console.log(mensaje);
}
 */

/* miFuncion();

let resultado = suma(3, 4);
mostrarPorConsola("El resultado de la suma es -> " + resultado);
mostrarPorConsola("El resultado de la suma es -> " + suma(3, 4)); */

// ------ FUNCIONES ANONIMAS
/* const fnAnonima = function () { 
    console.log("Hola! Soy una funcion anonima!")
} */

/* fnAnonima(); */

/* const myArrowFunction = texto => console.log("Hola! Soy una arrow function! " + texto);

myArrowFunction(":)");

const prueba = (a, b) => {
    console.log(a+b) 
    console.log(a-b)};

prueba(4, 2);

let miFuncion2 = fnAnonima;

miFuncion2();
fnAnonima();
miFuncion2 = myArrowFunction;
miFuncion2(":P"); */


/* function prueba(a, b, fnA, fnB) {
    
    fnB(fnA(a, b));
}

prueba(3, 2, sumar, mostrarPorConsola);
prueba(3, 2, multiplicar, mostrarPorConsola);
 */


// #endregion

