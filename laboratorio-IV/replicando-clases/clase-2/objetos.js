
const variableObjeto = {

    _nombre: "Ezequiel",
    _apellido: "Mamani",

    mascota: {
        nombre: "Scooby",
        edad: 5
    },

    items: [
        { id: 1, nombre: "item 1", price: 30 },
        { id: 2, nombre: "item 1", price: 50 },
        { id: 3, nombre: "item 1", price: 60 }
    ],

    saludar: function () {
        console.log("Hola soy " + this._nombre + " " + this._apellido);
    },


    set nombre(nuevoNombre) {
        this._nombre = nuevoNombre;
    },

    get nombre() {
        return this._nombre;
    },

    set apellido(nuevoApellido) {
        this._apellido = nuevoApellido;
    },

    get apellido() {
        return this._apellido;
    }

};

/// -------------------------------------------------------------
//* FUNCION CONSTRUCTORA PROTOTIPICA  -------------------------------------------------
//Creo el constructor con los atributos
function Animal(nombre) {
    this.nombre = nombre;
}

//*Asi le agrego un metodo a la clase, AL PROTOTIPO DE LA CLASE  ----------------------
//Prototype es una propiedad de mi objeto, que funciona como mecanisco de herencia y me indica 
//todos los prototipos anteriores hasta llegar a mi
Animal.prototype.saludar = function () {
    console.log("Hola soy " + this.nombre);
}

//Creo una instancia
let perro = new Animal("Scooby");

console.log(perro);
perro.saludar();

//Creo otra instancia
let gato = new Animal("Negra");
gato.saludar();

//Aca le agregue un metodo a la INSTANCIA. Otros objetos de tipo ANIMAL no van a conocer tal metodo.
/* gato.maullar = function () {
    console.log("MIAU!");
} 

gato.maullar();*/

let otroGato = new Animal("Chinita");
otroGato.saludar();
//otroGato.maullar(); //ERROR -> objetos.js:74 Uncaught TypeError: otroGato.maullar is not a function at objetos.js:74:10

///* creamos otra clase, que va a heredar de animal ----------------------
function Gato(nombre, color) {

    //Aca se esta llamando al cosntructor de Animal. Si llamariamos a otro metodo, xej, saludar -> Animal.saluda.call
    Animal.call(this, nombre);
    this.color = color;
}

//* De esta forma digo que gato HEREDA de ANIMAL ----------------------
Gato.prototype = Object.create(Animal.prototype);

Gato.prototype.maullar = function() {
    console.log("MIAU!");
}

const gato2 = new Gato("Coco", "Atrigrado");
console.log(gato2);

let perro2 = new Animal("Jack");


/// -------------------------------------------------------------
/* console.log(variableObjeto);
console.log(variableObjeto.nombre); //Aca se esta usando el get

variableObjeto.nombre = "Adrian Mateo";  //Aca se esta usando el set
console.log(variableObjeto.nombre); //Aca se esta usando el get

console.log("-----------------------");
variableObjeto._nombre = "nuevo nombre";    //Igualmente se puede acceder diractamente al atributo :v
console.log(variableObjeto._nombre);        //Idem coment anterior
console.log(variableObjeto.nombre); //Aca se esta usando el get

console.log("-----------------------");
//* Otra forma de acceder a un atributo. Serviria si el objeto no tiene un get
console.log(variableObjeto["_nombre"]);
console.log(variableObjeto["_apellido"]);

console.log("-----------------------");
variableObjeto.saludar();

variableObjeto.mascota.nombre = "Shaggy";
console.log(variableObjeto.mascota);

console.log("-----------------------");
const objeto2 = variableObjeto;
console.log(objeto2 == variableObjeto);
console.log(objeto2 === variableObjeto);

console.log("-----------------------");
console.log(2 == "2");      // Se compara el valor
console.log(2 === "2");     // Se compara el tipo y el valor. Es una comparacion mas estricta

console.log("-----------------------");
const objeto3 = {... objeto2};      //Aca se esta copiando el objeto. La referencia es distinta.
console.log(objeto2 == objeto3);
console.log(objeto2 === objeto3);


console.log("-----------------------");
//* ---------------  DESTRUCTURACION DE OBJETO  ---------------
const {_nombre: dato1, _apellido: dato2} = variableObjeto;  //Busca en el objeto los atributos con el mismo nombre,
                                                            //y los guarda en otras variables con otros nombres -> dato1 y dato2
console.log(dato1);
console.log(dato2); */


//* ---------------  AGREGANDO UN ATRIBUTO AL OBJETO  ---------------
/* variableObjeto.ciudad = "Mar del Plata"; //Una forma de agregar un atirbuto que no existe
variableObjeto["edad"] = 5;
console.log(variableObjeto);

//* ---------------  RECORRIENDO LOS ATRIBUTOS DE UN OBJETO  ---------------
for(const atributo in variableObjeto){
    console.log("Nombre del atributo: " + atributo);
    console.log("Valor: " + variableObjeto[atributo] + "\n");
}

//* ---------------  ELIMINANDO UN ATRIBUTO  ---------------
delete variableObjeto.ciudad;
console.log(variableObjeto);

//* ---------------  PASAR TODOS LOS ATRIBUTOS DE UN OBJETO A UN ARRAY  ---------------
let objetoArray = Object.values(variableObjeto);
console.log(objetoArray);
console.table(objetoArray);

//* ---------------  CREANDO CONSTRUCTOR PERSONA  ---------------
function Persona(nombre, apellido, dni){
    this.nombre = nombre;
    this.apellido = apellido;
    this.dni = dni;

    this.saludar = function(){
        console.log("Hola soy " + this.nombre);
    }
}

const person1 = new Persona("Adrian Mateo", "Mamani", 55_685_475);
console.log(person1);
person1.saludar();

Persona.prototype.direccion = "Calle falsa 123";//Agrego un atributo
 */


//Creo el constructor con los atributos
/* function Animal(nombre){
    this.nombre = nombre;
}

//*Creo un metodo
//*tengo que pasar por prototype, por que estoy agregando el metodo al prototipo
Animal.prototype.saludar = function(){
    console.log("Hola soy " + this.nombre);
}

//*Creo una instancia:
const perro = new Animal("Scooby");

console.log(perro);
perro.saludar();


//*Creo un constructor para objetos GATO
//*Estoy aplicando HERENCIA
function Gato(nombre, color){
    Animal.call(this, nombre);
    this.color = color;
}

//*De esta forma estoy diciendo que GATO herede de ANIMAL, seria como el extends de java
Gato.prototype = Object.create(Animal.prototype);

//*Le agrego un metodo a gato
Gato.prototype.maullar = function(){
    console.log("Miau");
}

//*Instancio un gato
const gato = new Gato("Coco", "Atigrada");
console.log(gato); */