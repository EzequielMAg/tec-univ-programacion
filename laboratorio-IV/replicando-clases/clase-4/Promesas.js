//El primer parametro se va a ejcutar cuando se resuelve y la segunda cuando se rechace

/* let promesa = new Promise(function(resolve, reject){
    let condition = true;

    if(condition){
        resolve("Se resolvio correctamente");
    }
    else{
        reject("Ocurrio un error");
    }
});  

// promesa.them(exito => console.log(exito));

let promesa2 = new Promise((resolve) => {

    console.log("Inicio de la promesa");
    //resolve("Promesa con tomeout")
}); */

//Retorna una promesa
/* async function miFuncion(){
    return "Saludos desde mi funcion con promesa";
}

miFuncion().then(valor => console.log(valor));

async function funcionAsyncronaAwait(){

}
 */


async function  asyncConcurrente(){
    let promesa1 = setTimeout(() => resolve("Hello", 4000));
    let promesa2 = setTimeout(() => resolve("World", 2000));

    const[dato1, dato2] = await Promise.all(promesa1. promesa2);

    console.log(dato + " " + datos2);
}

asyncConcurrente();