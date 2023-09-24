//! Ejercicios introductorios a JavaScript
function printByConsole(string) {
    console.log(string);
}

function printByAlert(string) {
    alert(string);
}


//* 1- Recibir una edad y mostrar si es mayor de edad o no.
let userInput;
/*
userInput = parseInt(prompt("Ingrese su edad: ")); 
if(userInput >= 18 && userInput<120) {
   alert("Es mayor de edad!");
} 
else if(userInput > 0 && userInput<18){
   alert("NO es mayor de edad!");
}
else {
   alert("Ingrese un valor valido!");
} */


//* 2- Recibir una nota y mostrar su calificación correspondiente.
//Iba a encararlo por aca, pero no me gusto.. demasiado largo
//Tambien me gusto la idea de hacerlo con un arreglo. Con el switch de + abajo: evito declarar variables y usar memoria
/*  
if(userInput >= 9 && userInput <= 10) {
} 
else if(userInput === 7 || userInput == 8){
    alert("Notable!");
}
else if(userInput == 6){
    alert("Sobresaliente!");
}  */

//*rta
/*
userInput = parseInt(prompt("Ingrese su nota: "));
switch (userInput) {
    case 0:
    case 1:
    case 2:
        alert("Muy deficiente!");
        break;
    case 3:
    case 4:
        alert("Insuficiente!");
        break;
    case 5:
        alert("Suficiente!");
        break;
    case 6:
        alert("Bien!");
        break;
    case 7:
    case 8:
        alert("Notable!");
        break;
    case 9:
    case 10:
        alert("Sobresaliente!");
        break;
    default:
        alert("Ingrese un valor valido!");
        break;
} */


//* 3- Realiza un script que pida por teclado 3 edades y 3 nombres e indique el nombre del mayor.
/* function User(name, age) {
    this.name = name || 0;
    this.age = age | 0;
}

function searchOlderUser(arrayUsers) {
    //Busco el de mayor edad
    let olderUser = arrayUsers[0];

    for (let i = 1; i < arrayUsers.length; i++) {
        if (arrayUsers[i].age > olderUser.age) {
            olderUser = arrayUsers[i];
        }
    }

    return olderUser;
}

function requestThreeUsers() {
    let arrayUsers = [];
    for (let i = 0; i < 3; i++) {
        let nameEntered = prompt(`Ingrese el ${i + 1}° nombre:`);
        let ageEntered = parseInt(prompt(`Ingrese la edad de ${nameEntered}:`));

        /// arrayUsers[i] = new User(nameEntered, ageEntered);
        arrayUsers.push(new User(nameEntered, ageEntered));
    }

    return arrayUsers;
}

let arrayUsers = []; //Declaro un arreglo vacio

///Creo y agrego 3 elementos USER al arreglo de usuarios
arrayUsers.push(new User("Ezequiel", 26));
arrayUsers.push(new User("Florencia", 25));
arrayUsers.push(new User("Adrian", 4));

///Pedir las edades y nombres por teclado y agregarlos al arreglo
///arrayUsers = requestThreeUsers();
console.log(arrayUsers);

///Encontrar el usuario de mayor edad
///Con una funcion tradicional
let olderUser = searchOlderUser(arrayUsers);  

///Con una funcion de arreglos -> reduce(). 
///Esta FN permite comparar cada elemento del arreglo y mantener un acumulador(prev) que contiene el usuario con la edad mayor hasta el momento.
///prev se inicializa con el primer objeto del arreglo
//*let olderUser = arrayUsers.reduce((prev, current) => (current.age > prev.age) ? current : prev);


console.log(`El usuario de mayor edad es ${olderUser.name} y tiene ${olderUser.age} años`);
alert(`El usuario de mayor edad es ${olderUser.name} y tiene ${olderUser.age} años`);


///Ejemplo simple con reduce()
// let numeros = [1, 2, 3, 4, 5];
// let suma = numeros.reduce((acumulador, numero) => acumulador + numero, 0); //Se inicializo con 0 -> acumulador = 0
// console.log(suma); // Resultado: 15 (1 + 2 + 3 + 4 + 5) */


//* 4- Realiza un script que pida un texto y lo muestre en mayúsculas.
/* userInput = prompt("Ingresar texto:");
alert(userInput.toUpperCase());
console.log(userInput); */


//* 5- Realiza un script que escriba una pirámide del 1 al 30 de la siguiente forma :
// 1
// 22
// 333
// 4444
// 55555
/* 
const correctPrintingNumbers = (i) => (i <= 10) ? i : (i % 2 !== 0 ) ? i+1: i; //Arraow function con doble ternario.

function printPyramidNumbers() {
    let string = "";
    for (let i=1; i<31; i++) {
        console.log(string.padStart(i, `${i}`));
    }
}

function printCorrectedPyramidNumbers() {
    let string = "";
    for (let i=1; i<31; i++) {
        console.log(string.padStart(correctPrintingNumbers(i), `${i}`));
    }
}

printPyramidNumbers();
printCorrectedPyramidNumbers(); */

//* 6- Realiza un script que escriba los números del 1 al 500, que indique cuáles son múltiplos de 4 y de 9.
///Primera solucion
/* for(let i=1; i<501; i++) {
    if((i % 4) == 0 && (i % 9) == 0) {
        console.log(`${i} -> es multiplo de 4 y 9`);
    }
    else if((i % 4) == 0) {
        console.log(`${i} -> es multiplo de 4`);
    }
    else if((i % 9) == 0) {
        console.log(`${i} -> es multiplo de 9`);
    }
    else {
        console.log(`${i}`);
    }
} */

///Solucion mas modularizada
/* function isMultiple(number, divider) {
    return number % divider === 0;
}

for(let i=1; i<501; i++) {
    let message = `${i}`

    if(isMultiple(i, 4) && isMultiple(i, 9)) {
        message += " -> es multiplo de 4 y 9";
    }
    else if(isMultiple(i, 4)) {
        message += " -> es multiplo de 4";
    }
    else if(isMultiple(i, 9)) {
        message += " -> es multiplo de 9";
    }
 
    console.log(message)
} */


//* 7- Realiza un script que pida números hasta que se ingrese 0. Si no es un número
//* deberá indicarse con un «alert» y seguir pidiendo. Al salir con 0 deberá indicarse la
//* suma total de los números introducidos.
//#region
///Primera solucion, "simple", con FN reduce() sin pedir datos y sin cortar en 0
let inputNumbers = ["asd", 1, "hola", 2, 'b', 3, 4, 5, 'a', 23.2];

// let result = inputNumbers.reduce((prev, current) => (Number.isInteger(current)) ? prev += current : prev, 0);
// console.log(result);

///Segunda solucion, simple y tradicional, sin pedir datos y cortando la suma con el 0
// function addIntegerValuesFromArray(array) {
//     let totalSum = 0;
//     for (let value of inputNumbers) {
//         if (value === 0) {
//             break;
//         }

//         if (Number.isInteger(value)) {
//             totalSum += value;
//         }
//     }

//     return totalSum;
// }
// let totalSum = addIntegerValuesFromArray(inputNumbers);
// printByConsole(totalSum);

//* RTA del ejercicio. Tercera solucion.
// let totalSum = 0;
// let inputValue = 0;

// printByAlert("SUMA DE NUMEROS ENTEROS. \nPara cortar el ingreso de numeros, ingrese 0 (cero)");
// do {
//     inputValue = (inputValue == 0) ? Number.parseInt(prompt("Ingrese un numero entero:")) : Number.parseInt(prompt("Ingrese otro numero entero:"));

//     while(isNaN(inputValue)) {
//         alert("INGRESE UN NUMERO VALIDO!");
//         inputValue = Number.parseInt(prompt("Ingrese un numero entero:"));
//     }

//     totalSum += inputValue;
// } while(inputValue != 0);

// printByAlert(`La suma total de todos los valores entros ingresados es -> ${totalSum}`);
//#endregion


//* 8- Realiza un script que pida cadenas de texto hasta que se ingrese “fin”. Al salir
//* con “fin” deben mostrarse todas las cadenas concatenadas con un guión (-).
/* let finalString = "";
let inputValue = "";

printByAlert("CONCATENACION DE PALABRAS. \nPara cortar el ingreso de palabras, ingrese \"fin\"");
do {
    inputValue = (inputValue === "") ? prompt("Ingrese una palabra:") : prompt("Ingrese otra palabra:");
    finalString = (finalString === "" && inputValue!=="fin") ? finalString.concat(inputValue) : finalString.concat("-").concat(inputValue);
} while(inputValue !== "fin");

finalString = finalString.replace("-fin", '');

if(finalString === "") {
    printByAlert("NO SE INGRESO NINGUNA PALABRA!");
} else {

    printByAlert(`La concatenacion total de todos las palabras ingresados es -> ${finalString}`);
} */

/* // EJEMPLO DE CHAT GPT, ESTA GENIAL
///Cadena original
var cadenaOriginal = "Esto es una cadena de ejemplo con palabras para eliminar, jajaja eliminar xD, eliminar xDDD.";

/// Palabra o expresión a eliminar
var palabraAEliminar = "eliminar ";

/// Utiliza una expresión regular para buscar la palabra o expresión y eliminarla
var nuevaCadena = cadenaOriginal.replace(new RegExp(palabraAEliminar, 'g'), '');
console.log(nuevaCadena); */


//* 9- Realiza un script que cuente el número de vocales que tiene un texto.
/* function countVowels(string) {
    let amountVowels = 0;

    for(let i=0; i<string.length; i++) {
        if(isVowel(string[i])) {
            amountVowels++;
        }
    }

    return amountVowels;
}

function isVowel(letter) {
    let vowelsArray = ['a', 'e', 'i', 'o', 'u'];
    return vowelsArray.includes(letter.toLowerCase());
}

let text = "HolA Eze!";
printByConsole(`El texto tiene ${countVowels(text)} vocales`); */


//* 10- Realiza un script que pida una cadena de texto y la devuelva al revés.
//* Ej: si tecleo “buenas” deberá mostrar “saneub”
/* // userInput = prompt("Ingrese una cadena de texto:");

// Convertir la cadena en un array de caracteres, invertir el orden y unirlos nuevamente en una cadena
// let reverseString = userInput.split('').reverse().join('');
// alert("La cadena invertida es: " + reverseString);

let array = [1, 2, 3, 4, 5, "HOLA"];

let string = array.reverse().join(""); 
console.log(string);

string = array.reverse().toString();//Este metodo le agrega comas automaticamente
console.log(string);
console.log(typeof string); */

//* 11- Crea un programa que calcule el área de un círculo. Pide al usuario que ingrese
//* el radio y muestra el resultado.
/* function calculateCircleArea(radius) {
    return Math.PI * radius ** 2;
    // return Math.PI * Math.pow(userInput, 2);
}

alert("CALCULO DEL AREA DE UN CIRCULO");
userInput = Number.parseInt(prompt("Ingrese el radio"));

//Bucle infinito mientras no ingrese un numero. Validacion.
while (isNaN(userInput) && userInput!=0) {
    alert("INGRESE UN NUMERO VALIDO!");
    userInput = Number.parseInt(prompt("Ingrese un numero entero:"));
}

if(userInput !== 0) {
    let circleArea = calculateCircleArea(userInput);
    alert(`Radio ingresado -> ${userInput} \nArea del circulo  -> ${circleArea}`);
} else {
    alert("FIN DEL SCRIPT!");
} */


//* 12- Crea un programa que verifique si un número ingresado por el usuario es
//* positivo, negativo o cero.
/* userInput = 0;

do {
    (userInput === 0) ? 0 : alert("ERROR! INGRESE UN NUMERO!");
    userInput = Number.parseInt(prompt("Ingrese un numero:"));
} while (isNaN(userInput));

if (userInput < 0) {
    console.log("ES NEGATIVO!");
} else if (userInput > 0) {
    console.log("ES POSITIVO!");
} else {
    console.log("ES CERO!");
} */


//* 13- Crea un programa que tome un arreglo de nombres ingresados por el usuario
//* y muestre la lista ordenada alfabéticamente.
/* let namesArray = []; //["Omar", "Ezequiel", "Adrian", "Florencia"];

do {
    userInput = prompt("Ingrese un nombre");

    while (!isNaN(Number.parseInt(userInput))) {
        alert("ERROR! INGRESE UN NOMBRE!");
        userInput = prompt("NOMBRE");
    }

    if(userInput != null) {
        namesArray.push(userInput);

        if (namesArray.length === 0) {
            userInput = prompt("Desea ingresar otro? \nIngrese 'SI' para continuar, o cualquier tecla para salir");
        } else {
            userInput = prompt("Desea ingresar otro?");
        }
    }

    if (userInput != null) { //Si es que toca cancelar, se manda null
        userInput = userInput.toUpperCase();
    }
} while (userInput === "SI");
console.log("-> " + userInput);

if(userInput === null)
    alert("FIN DEL SCRIPT");

namesArray.sort();
console.log(namesArray); */


//* 14- Crea un programa que encuentre el número más pequeño y el más grande en
//* un arreglo de números ingresados por el usuario.
/* function maxNumberFromArray(array) {
    let largestValue = array[0];

    for(let i=1; i<array.length; i++) {
        if(array[i] > largestValue) {
            largestValue = array[i];
        }
    }

    return largestValue;
}

function minNumberFromArray(array) {
    let smallestValue = array[0];

    for(let i=1; i<array.length; i++) {
        if(array[i] < smallestValue) {
            smallestValue = array[i];
        }
    }

    return smallestValue;
}

let array = [1, 4, 2, -11, 10, 3, 6, 9];

console.log(`Valor mas grande -> ${maxNumberFromArray(array)}`);
console.log(`Valor mas pequeño -> ${minNumberFromArray(array)}`); */

//* 15- Crea un programa que tome una frase ingresada por el usuario y cuente
//* cuántas palabras contiene.
userInput = prompt("Ingrese una frase");
console.log(userInput.length);

///Tambien funcion con numeros :v
// let num = "12345670";
// console.log(num.length);
