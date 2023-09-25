 /* console.log("Hola mundo");

let numero = 20;
console.log(typeof numero); //number */

/* //practica propia
let dato;
console.log(typeof dato); //undefined (tipo de dato primitivo, 1)

dato = 17.5;
console.log(typeof dato); //number (2)

dato = "dato";
console.log(typeof dato); //String (3)

dato = true;
console.log(typeof dato); //boolean (4)

dato = 20n;
console.log(typeof dato); //bigint (5)

dato = Symbol(20);
console.log(typeof dato); //symbol (6)
//fin practica propia */

/* console.log(5000000 == 5_000_000);  *///true //JS me permite separar los numeros con guiones para mejor lectura (igual q en java)


// >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> 
/* console.log("El numero 5 es finito? -> " + Number.isFinite(5)); //true
console.log(Number.isFinite(Infinity)); //false
console.log(Number.isInteger(7)); //true
console.log(Number.isInteger(7.7)); //false
console.log("Numero entero seguro? -> " + Number.isSafeInteger(9_007_199_254_740_991)); */ //true //valor limite, cambiar el ultimo 1, por 2, da false


//! >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>  SIMBOLOS  >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
/* let simbolo = Symbol("Soy un simbolo"); //Creo un simbolo
let simbolo2 = Symbol("Soy un simbolo");
console.log(simbolo == simbolo2); //false

let simbolo3 = Symbol.for("Soy un simbolo2");
let simbolo4 = Symbol.for("Soy un simbolo2");
console.log(simbolo3 == simbolo4); //true

console.log(simbolo); //Symbol(Soy un simbolo)
console.log(Symbol.keyFor(simbolo)); //undefined

console.log(Symbol.keyFor(simbolo3)); //Soy un simbolo2 */


// >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
/* let obj = {}; //Objeto vacio
let nombre = Symbol("Identifico el nombre de la persona");

obj[nombre] = "Juan";
console.log(obj[nombre]);
console.log(obj); */


// >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
/* let variable;
console.log(variable); //undefined

variable = null;
console.log(variable); //null

let resultado = 0/0; 
console.log(resultado); //NaN
console.log(1/0); //Infinity

console.log(parseInt("hola")); //NaN
console.log(0/"hola"); //NaN */

// >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
/* let texto = "Hola " + "soy " + "Ezequiel"; //Concatenacion de strings con el +
console.log(texto); //Hola soy Ezequiel

texto = "Hola " + "soy " + "Ezequiel " + 2 + 3; 
console.log(texto); //Hola soy Ezequiel 23

texto = "Hola " + "soy " + "Ezequiel " + (2 + 3); //De esta forma priorizo la suma, separo las operaciones
console.log(texto); //Hola soy Ezequiel 5


//*Templates literales(?)
let nombre = "Ezequiel";
texto = "Hola soy " + nombre;
console.log(texto);

texto = "nada";
console.log(texto);

texto = `Hola soy ${nombre}`; //Tiene que ser si o si con este tipo de comillas simples inclinadas -> ALT + 96
console.log(texto); 

console.log(isNaN(5)); */


//* >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
/* let userImput = prompt("Ingrese un numero: "); //Muestra una ventana para ingresar algun valor/dato con el msje pasado por parametro
console.log(typeof userImput); // String

userImput = parseFloat(userImput);
console.log(typeof userImput); //number
console.log(userImput); 

let result = userImput * 3;
alert("El resultado es: " + result); */


//! >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>  UNICODE  >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
/* console.log("\u{0096}"); // z
console.log("\u{26a1}"); // z */

//! >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>  STRINGS  >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
/* let cadena = "Cadena de prueba";
console.log(cadena.concat(" --------")); //Retorna la cadena concatenada con lo pasado por parametro
console.log(cadena); // Aca se puede ver que luego de usar el metodo anterior, NO se modifico el String original

console.log(cadena.startsWith("Ca"));   //true //Me dice si el String COMIENZA con lo que le pase por parametro. ES CASE SENSITIVE
console.log(cadena.startsWith("ca"));   //false
console.log(cadena.endsWith("prueba")); //true //Me dice si el String TERMINA con lo que le pase por parametro. ES CASE SENSITIVE
console.log(cadena.endsWith("Prueba")); //false
console.log(cadena.includes("dena"));   //true //Me dice si el String CONTIENE lo que le pase por parametro
console.log(cadena.includes("deNa"));   //false

console.log(cadena.toLowerCase()); //Retorna la cadena toda transformada en minuscula
console.log(cadena.toUpperCase()); //Retorna la cadena toda transformada en MAYUSCULA

console.log(cadena.indexOf("de")); //Retorna la pos (1ra aparicion) desde donde arranca la cadena pasada x param. Si hay +de1, retorna el 1ro
console.log(cadena.indexOf("!")); //Si no la encuentra retorna -1.

console.log(cadena.length); //Retorna la longitud de la cadena
console.log(cadena.lastIndexOf("a"));  //Retorna la posicion (de la ultima aparicion) desde donde arranca la cadena pasada por parametro


console.log(cadena.replace("Ca", "??")); //*Busca lo pasado en el primer parametro, y reemplaza esos caract. por el 2do parametro.
                                         //*Si no lo encuentra, retorna la cadena sin modificaciones. Y reemplaza solo la 1ra vez q encuentra.
console.log(cadena.replace("CA", "??")); //*aca compruebo q CASE SENSITIVE, y que retorna el string sin modificaciones

let arreglo = cadena.split(" "); //Me separa la cadena segun lo pasado por parametro. Y retorna un arreglo de Strings con cada parte separada                                         
console.log(arreglo);

console.log(cadena.substring(0, 8)); //Recorta la cadena entre las posiciones pasadas por parametro y lo retorna, sin incluir caracter limite.

//*DE TODOS LOS ANTERIORES METODOS, NINGUNO MODIFICA EL STRING ORIGINAL
console.log("Cadena original -> " + cadena);*/


//! >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>  ARREGLOS  >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
let comidas = ["Pizza", "Hamburguesa", "Milanesa", "Pancho", "Ensalada", "Polenta"];
console.log(comidas);   //muestra el arreglo de strings
/* console.log(typeof comidas);    //es de tipo -> OBJECT

console.log(comidas[0]); //pizza
console.log(comidas.length); //longitud del arreglo -> 6

console.log(comidas.indexOf("Pancho")); // posiciona de donde encuentra lo pasado x parametro -> 3

//* ----------- Agregando elementos -----------------------------------------------
comidas.push("ñoquis"); //Agrega un elemento al final del arreglo
comidas.push = "ASADO"; //Con CHATGPT aprendi que esto esta MAL, estariamos sobreescribiendo el metodo push, luego ya no podremos usarlo
                        //para agregar nuevos valores al arreglo, ya que le estamos asignando un String.
comidas.unshift = "ASADO"; //Idem
comidas.unshift("Asado");   //Agrega un elemento al principio del arreglo
console.log(comidas); */

//* ----------- Eliminando elementos -----------------------------------------------
/* comidas.pop();  //Elimino el ultimo elemento
console.log(comidas)

comidas.shift();    //Elimino el primer elemento
console.log(comidas) */

//* ----------- Ordenamiento del arreglo --------------------------------------------
/* comidas.sort(); //Ordena alfabeticamente
console. log();

comidas.reverse(); //Ordena alfabeticamente pero invertido
console. log(); */

//* ----------- Eliminar elementos segun un indice ----------------------------------
/* comidas.splice(2);  //Elimina desde el elemento de indice 2 inclusive y en adelante
console.log(comidas);
 */
/* comidas.splice(2, 3); //Elimina desde el indice pasado como 1er parametro, y cant total de elementos segun el 2do parametro
console.log(comidas); */

//* ----------- Retorna una string con todos los elementos de un arreglo ------------
/* let cadena = comidas.join("; "); //Separa cada elemento con lo pasado por parametro. Metodo contrario a split de un String
console.log(cadena);

let cadena2 = comidas.join("\n");
console.log(cadena2); */

//* ----------- Recorrer un arreglo -------------------------------------------------
/* for(const comida of comidas) { //Es igual que un foreach en java
    console.log(comida); // Se usa const en lugar de let porque no se va a modificar el valor de la variable.
}   //En cada iteracion no se asigna un nuevo valor, sino que se redeclara.

for(const comida in comidas) {// Con in se obtiene el índice de cada elemento del array.
    console.log(comida);
}

for(const i in comidas) {
    console.log(comidas[i]);
} */

//console.log(comidas[2]); //Asi muestro un elemento particular segun el indice por la consola.. Como siempre

//! ----------- Destructuracion de un arreglo -------------------------------------------------
/* let comidas2 = ["Pizza", "Hamburguesa", "Milanesa"];

const [a,b,c] = comidas2;
const [ ,d,e] = comidas2;
const [f, ,g] = comidas2;
const [h,i, ] = comidas2;
const [z, ...resto] = comidas2;


console.log("----------------------- ");
console.log(a);
console.log(b);
console.log(c);


console.log("----------------------- ");
console.log(d);
console.log(e);

console.log("----------------------- ");
console.log(f);
console.log(g);


console.log("----------------------- ");
console.log(h);
console.log(i);

console.log("----------------------- ");
console.log(z);
console.log(resto); */


//! >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>  SET  >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
//Los tipos de datos set no guardan datos repetidos, Guardan estructuras de datos de valores unicos.
/* const set = new Set([1, 2, "hola", "chau", true, 2, "hola", "moto", true, false]);

console.log(set);
console.log(set.has("moto")); //De esta forma verifico si existe un elemento dentro del set, retorna TRUE si existe o sino FALSE

set.add(3); //Agrego un elemento al set
console.log(set);

set.add(1);
console.log(set);

let arreglo = Array.from(set);
console.log(arreglo);

arreglo.push("hola");
console.log(arreglo); */


//! >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>  MAP  >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
/* //*Creo un map
const map = new Map();

//*Asigno elementos al map -> clave-valor
map.set("Nombre", "Nahuel");
map.set("Nombre1", "Ezequiel");
map.set("Nombre", "Florencia"); //Si uso la misma llave para agregar un nuevo elemento, piso el valor anterior asociado a la misma llave
map.set("Nombre2", "Adrian");

//*Muestro los elementos del map
console.log(map.get("Nombre"));
console.log(map.get("Nombre1"));
console.log(map.get("Nombre"));
console.log(map.get("Nombre2"));

console.log(map.size); //Tamaño del map

console.log(map.has("Nombre")); //Verifico si existe esa llave 

//*Pasar un map a un arreglo
let mapFromArray = Array.from(map);
console.log(mapFromArray);
console.table(mapFromArray);
 */


// >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>  FUNCIONES  >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
function miFuncion(a){
   console.log(a);
}

miFuncion("Hola JavaScript!!!");



// ----------- Funciones anonimas ----------------------------------
const miFuncion2 = function (a){console.log(a);}
miFuncion2("Hola mundo!!!");

// ----------- Funciones lambda o flecha ----------------------------------
const miFuncion3 = (a) => console.log(a);

const add = (a=0, b=0) => a + b; //La FN lambda retorna la suma a+b. No hace falta poner return, ya q no hay mas lineas de codigo q agregar.
                                 //Tambien los parametros estan inicializados en 0. Si falta un parametro cuando se invoca, toma ese valor.
                                 //Si esta FN flecha tiene cuerpo, mas de una linea, debo usar {}, y si retorna algo si o si poner el return   
console.log(add(5, 2));





