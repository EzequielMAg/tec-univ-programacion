// La promesa se instancia como cualquier objeto. Este constructor recibe un CALLBACK
// Este callback, tiene 2 parametros que tambien son CALBACKS. 
// El primer parametro se va a ejecutar cuando se resuelve y la segunda cuando se rechace
// Las funciones "resolve" y "reject" se les va a pasar UN SOLO PARAMETRO
let promise = new Promise(function (resolve, reject) {
    let condition = true;

    if (condition) {
        resolve("Se resolvio correctamente");
    }
    else {
        reject("Ocurrio un error");
    }
});

// La FN de RESOLVE se va a llamar a traves del .then()
// La FN de REJECT se va a llamar a traves del .catch()
//promise.then(exito => console.log(exito)).catch(error => console.log(error));


// -----------------------------------------------------------------------------------------------------
// let promise2 = new Promise(resolve => {

//     console.log("Inicio de la promesa");
//     // resolve("Promesa con timeout")

//     //Esta FN setTimeOut(), recibe por paramnetros, 1° una FN y 2° el tiempo del delay en mili-segundos
//     setTimeout(() => resolve("Promesa con timeout"), 3000);
//     console.log("Fin de la promesa")
// });

// promise2.then(mensaje => console.log(mensaje));


// -----------------------------------------------------------------------------------------------------
// let promise3 = new Promise((aceptado, rechazado) => {

//     let number = 5;

//     if(number % 2 === 0) {
//         aceptado("El numero es par");
//     }
//     else {
//         rechazado("El numero es impar");
//     }
// });

//promise3.then(mensaje => console.log(mensaje)).catch(error => console.log(error));


// -----------------------------------------------------------------------------------------------------
// Con el ASYNC, la FN va a retornar una promesa.
// async function miFuncion() {
//     return "Saludos desde mi funcion con promesa";
// }

// El retorno de la funcion asincronica, va a ser el parametro que le voy a pasar en el .then()
//miFuncion().then(valor => console.log(valor));


// -----------------------------------------------------------------------------------------------------
// Sabemos que tenemos distintas jerarquias de ejecucion de tareas.
// Nos podria interesar esperar que suceda o que se resuelva A, para que siga ejecutandose B.
async function functionAsynAwait() {

    let promesa = new Promise(resolve => {

        resolve("Promesa con await")
    });

    //console.log(await promesa);

    let mensaje = await promesa;
    console.log(mensaje);

}

//functionAsynAwait();
// Explicacion de lo anterior: AWAIT manda a llamar a la promesa y espera a que se resuelva
// Cuando usamos un await, nos estamos ahorrando un .then()

// Aca, entendemos que, una promesa nos devuelve un valor, cuando se resuelve

// -----------------------------------------------------------------------------------------------------
/* 
async function asyncConcurrente() {

    console.log("INICIO");
    let promesa1 = new Promise( resolve => {
        setTimeout( () => resolve("Hello"), 4000);
    });

    console.log(promesa1);
    let promesa2 = new Promise( resolve => {
        setTimeout( () => resolve("World"), 2000);
    });
    console.log(promesa2);
    
    // Esta FN va a recibir un arreglo de promesas como parametro y me asegura que todas las promesas se van a ejecutar al "mismo tiempo"
    // Va a retornar 2 promesas
    const [dato1, dato2] = await Promise.all([promesa1, promesa2]);
    
    console.log(promesa1);
    console.log(promesa2);
    
    console.log(dato1 + " " + dato2);
    console.log("FIN");
}

asyncConcurrente();  */