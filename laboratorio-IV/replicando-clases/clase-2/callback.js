
function miFuncion(callback){
    console.log("Desde miFucion");
    callback();
}

function saludar(){
    console.log("hola mundo!");
}

const funcCallback = function(){
    console.log("Hola desde mi funcion callback");
}


miFuncion(funcCallback);
miFuncion(saludar);


