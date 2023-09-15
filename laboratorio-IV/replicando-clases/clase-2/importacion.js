import { clientesArreglo } from "./Clientes.js";

console.log(clientesArreglo);


//! Uso del map -> recorrer un arreglo y generar otro arreglo con elementos predefinidos
const nombres = clientesArreglo.map( (cliente) => cliente.nombre);
console.log(nombres);


const items = clientesArreglo.map( (cliente) => {

    return cliente.items.map( (item) => {return item.producto})
    
});
console.log(items);

// ---------- MAP ----------
const items2 = clientesArreglo.map( (cliente) => {
    
    return cliente.items;
    
});
console.log(items2);

// ---------- FIND ----------
const clienteId2 = clientesArreglo.find( (cliente) => {
    return cliente.id == 2;
});
console.log(clienteId2);

// ---------- FILTER ----------
const mayores = clientesArreglo.filter( (cliente) => {
    return cliente.edad >= 20;
});
console.log(mayores);

const nombresClientesMayores = clientesArreglo.filter( (cliente) => {
    return cliente.edad >= 20;
}).map((cliente) => {return cliente.nombre});
console.log(nombresClientesMayores);

