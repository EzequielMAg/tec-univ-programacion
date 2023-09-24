//! Guia 2: Objetos y clases.
//* 1- Crear un objeto y mostrar propiedades. 
//* Crea un objeto que represente a una persona con propiedades como nombre, edad y profesión. Luego, muestra estas propiedades utilizando alert.
/* function Person(name, age, profession) {
    this.name = name;
    this.age = age;
    this.profession = profession;
}

function printPersonByAlert(person) {
    alert(`NOMBRE: ${person.name}, EDAD: ${person.age}, PROFESIÓN: ${person.profession}`)
}

let person1 = new Person(); //Todos los atributos son undefined. Ya que no fueron inicializados/pasados por parametro.
let person2 = new Person("Ezequiel");
let person3 = new Person("Florencia", 25, "Estudiante");

// printPersonByAlert(person1);
// printPersonByAlert(person2);
// printPersonByAlert(person3);

console.log(person1);
console.log(person2);
console.log(person3);

//OBJETOS LITERALES
const person = {
    name: "Ezequiel",
    surname: "Mamani",
    age: 25,
    profession: "student"
}
console.log(person);
 */


//* 2- Clase de Libro
//* Crea una clase llamada "Libro" que tenga propiedades como título, autor y año de publicación. 
//* Crea un método que muestre la información del libro en un formato legible
//* Utiliza prompts para obtener la información del usuario.
//* Crea una instancia de la clase y muestra la información utilizando alert.
class Book {

    static bookCounter = 0;

    constructor(title = "sin-asignar", author = "sin-asignar", year = null) {
        this._title = title;
        this._author = author;
        this._year = year;

        this._price = null;
        Book.bookCounter++;
    }

    //#region GETTERS AND SETTERS
    get title() {
        return this._title;
    }
    set title(newTitle) {
        this._title = newTitle;
    }

    get author() {
        return this._author;
    }
    set author(newAutor) {
        this._author = newAutor;
    }

    get year() {
        return this._year;
    }
    set year(newYear) {
        this._year = newYear;
    }

    get price() {
        return this._price;
    }
    set price(newPrice) {
        this._price = newPrice;
    }
    //#endregion

    toString() {
        return `TITULO: ${this._title} \nAUTOR: ${this._author} \nAÑO DE PUBLICACIÓN: ${this._year} \nPRECIO: ${this._price}`
    }

}
//----------------------------------------------------
// let book = new Book("hola123", "mua", 2023);
// console.log(book);

// console.log(book.author); //Accediento mediante el GETTER

// book.author = "YO!";      //Usando el SETTER  
// console.log(book.author);

// alert(book.toString());

//----------------------------------------------------
/* alert("CARGANDO UN LIBRO A LA B. D.");

let title = prompt("TITULO");
let author = prompt("AUTOR");
let year = prompt("AÑO DE PUBLICACIÓN");
let price = prompt("PRECIO");

let newBook = new Book(title, author, year);
newBook.price = price;
alert(newBook.toString()); */


//* 3- Crear una Clase y sus Métodos
//* Utiliza la clase generada en el punto 1 añadiendo los siguientes metodos:
//* constructor(nombre, edad, profesión): Inicializa el nombre, la edad de la persona y su profesión.
//* saludar(): Muestra un saludo en un alert que incluya el nombre y la edad de la persona.
//* Luego, crea una instancia de la clase Persona utilizando los datos proporcionados
//* por el usuario a través de prompts y muestra el saludo utilizando el método saludar().
/* class Person{
    constructor(name, age, profession = "estudiante") {
        this._name = name || "Ezequiel";
        this._age = age || 25;
        this._profession = profession;
    }

    //#region GETTERS AND SETTERS
    get name() {
        return this._name;
    }
    set name(newName) {
        this._name = newName;
    }

    get age() {
        return this._age;
    }
    set age(newAge) {
        this._age = newAge;
    }

    get profession() {
        return this._profession;
    }
    set profession(profession) {
        this._profession = profession;
    }
    //#endregion

    saludar() {
        alert(`Hola, mi nombre es ${this._name}, tengo ${this._age} años y soy ${this._profession}`);
    }
}

let person = new Person();
console.log(person); //Se muestran los datos por default, inicializados en el constructor, ya que no se paso ningun argumento.

 alert("CARGANDO UNA PERSONA A LA B. D.");
person.name = prompt("NOMBRE");
person.age = prompt("EDAD");
person.profession = prompt("PROFESION");
person.saludar();
 */


//* 4- Herencia con Superhéroes
//* Crea una clase base llamada Superheroe con los siguientes métodos:
//* constructor(nombre, poder): Inicializa el nombre y el poder del superhéroe.
//* presentarse(): Muestra un alert con el nombre del superhéroe y su poder.
//* Crea una clase que herede de Superheroe llamada Villano con un método adicional:
//* constructor(nombre, poder, plan): Inicializa el nombre, poder y plan del villano.
//* amenazar(): Muestra un alert con el plan del villano.
//* Crea instancias de ambas clases utilizando datos ingresados por el usuario a través
//* de prompts y muestra sus presentaciones y amenazas respectivas.
/* class SuperHero {
    constructor(name, power) {
        this._name = name || "Iron-Man";
        this._power = power || "volar, super fuerza y resistencia";
    }

    introduceOneself() {
        alert(`Soy ${this._name} y mis poderes son: ${this._power}`);
    }

    //#region GETTERS AND SETTERS
    get name() {
        return this._name;
    }
    set name(newName) {
        this._name = newName;
    }

    get power() {
        return this._power;
    }
    set power(newPower) {
        this._power = newPower;
    }
        //#endregion
}

class Villain extends SuperHero {
    constructor(name = "Thanos", power = "super fuerza", plan = "destruir la mitad del universo") {
        super(name, power);
        this._plan = plan;
    }

    threaten() {
        alert(`Mi plan es ${this._plan}!!! JÁ-JA-JA-JA-JA-JAAA!!`);
    }

    get plan() {
        return this._plan;
    }
    set plan(newPlan) {
        this._plan = newPlan;
    }
}

let superHero = new SuperHero();
let villain = new Villain();
console.log(superHero); //Se muestran los datos por default, inicializados en el constructor, ya que no se paso ningun argumento.
console.log(villain); 

alert("CARGANDO UN SUPER HEROE A LA B. D.");
superHero.name = prompt("NOMBRE");
superHero.power = prompt("PODER");

alert("CARGANDO UN VILLANO LA B. D.");
villain.name = prompt("NOMBRE");
villain.power = prompt("PODER");
villain.plan = prompt("PLAN");

superHero.introduceOneself();
villain.threaten(); */


//* 5- Gestión de Libros
//* Utiliza la clase generada en el punto 1 añadiendo los siguientes metodos:
//* constructor(titulo, autor, año de publicación): Inicializa el título, el autor del libro y el
//* año en se lanzó el libro.
//* mostrarDetalles(): Muestra un alert con los detalles del libro.
//* Crea una clase que herede de Libro llamada LibroDigital con un método adicional:
//* constructor(titulo, autor, año de publicación, formato): Inicializa el título, autor, año en que lanzó y formato del libro digital.
//* mostrarFormato(): Muestra un alert con el formato del libro digital.
//* Permite al usuario ingresar información sobre un libro físico y un libro digital a través
//* de prompts y muestra sus detalles y formatos respectivos utilizando los métodos correspondientes.
/* Book.prototype.showDetails = function () {
    alert(this.toString());
};

let book = new Book();
console.log(book);
//book.mostrarDetalles();

class DigitalBook extends Book {
    constructor(
        title = "La fábrica de tiempo",
        author = "Martina Rua y Pablo M. Fernández",
        year = "2017",
        format = "EPUB") {

        super(title, author, year);
        this._format = format;
    }

    get format() {
        return this._format;
    }
    set format(newFormat) {
        this._format = newFormat;
    }

    showFormat() {
        alert(`El formato de este libro DIGITAL es --> ${this._format}`);
    }
}

alert("CARGANDO UN LIBRO (fisico) A LA B. D.");
let book2 = new Book();
book2.title = prompt("TITULO");
book2.author = prompt("AUTOR");
book2.year = prompt("AÑO DE PUBLICACIÓN");
book2.price = prompt("PRECIO");

alert("CARGANDO UN LIBRO DIGITAL A LA B. D.");
let digitalBook = new DigitalBook();
digitalBook.title = prompt("TITULO");
digitalBook.author = prompt("AUTOR");
digitalBook.year = prompt("AÑO DE PUBLICACIÓN");
digitalBook.price = prompt("PRECIO");
digitalBook.format = prompt("FORMATO");

book2.showDetails();
digitalBook.showDetails();
digitalBook.showFormat(); */


//* 6- Map para nombres en mayúsculas
//* Crea un array de nombres y utiliza el método map para convertir todos los nombres a mayúsculas. 
//* Luego, muestra los nombres en mayúsculas utilizando alert.
/* 
let namesArray = ["Ezequiel", "Florencia", "Adrian", "Omar", "Lisa"];
let appercaseNamesArray = namesArray.map(name => name.toUpperCase());

console.log(appercaseNamesArray);
alert(appercaseNamesArray.join("\n")); */


//* 7- Encontrar un número en un array
//* Crea un array de números y utiliza el método find para buscar un número específico
//* ingresado por el usuario utilizando un prompt. Si el número se encuentra, muestra un mensaje utilizando alert.
/* 
function searchNumber(numberToSearch, numbersArray) {
    
    let numberFound = false;
    let result = numbersArray.find(value => value === numberToSearch);
    
    if(result === numberToSearch)
        numberFound = true;

    return  numberFound;
}

let numbersArray = [99, 1, 45, -19, 81, -123, 0, 7, 2, 11, 123];
//console.log(searchNumber(99, numbersArray));
let userInput = Number.parseInt(prompt("Ingrese un numero a buscar"));

if(searchNumber(userInput, numbersArray)) {
    alert("NUMERO ENCONTRADO!");
} else {
    alert("NUMERO NO ENCONTRADO!");
} */


//* 8- Filtrar números pares
//* Crea un array de números y utiliza el método filter para obtener un nuevo array que
//* contenga solo los números pares. Muestra los números pares utilizando alert.
/* 
let numbersArray = [99, 1, 45, -190, 81, -124, 0, 74, 2, 118, 123];

let arrayEvenNumbers = numbersArray.filter(value => value % 2 === 0);


console.log(arrayEvenNumbers);
alert(arrayEvenNumbers.join("\n")); */


