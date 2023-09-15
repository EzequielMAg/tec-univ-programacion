
class Persona{

    static contadorPersonas = 0;
    _pais = "Argentina";    //De esta forma estoy inicializando el valor al atributo
    
    //Con poner los atributos en el constructor es suficiente. Ahi no estoy inicializando ningun valor tambien
    constructor(nombre, edad, dni){
        this._nombre = nombre;
        this._edad = edad;
        this._dni = dni;
        Persona.contadorPersonas++;
    }

    //#region GETTERS AND SETTERS 
    get nombre(){
        return this._nombre;
    }
    set nombre(nombre){
        this._nombre = nombre;
    }
    
    get edad(){
        return this._edad;
    }
    set edad(edad){
        this._edad = edad;
    }
    
    get dni(){
        return this._dni;
    }
    set dni(dni){
        this._dni = dni;
    }
    //#endregion
    
    datos(){ return `${this.nombre}, ${this.edad}, ${this.dni}`}

    toString(){
        return this.datos();
    }

    static saludar(){
        console.log("Hola soy una persona");
    }

    equals(otraPersona){
        return this._dni == otraPersona.dni;
    }
}

Persona.saludar();

let persona = new Persona("Eze", 23, 41_068_807);
console.log(persona);
console.log(persona.nombre);    //Estoy usando el get. Es una buena practica, por mas que sean atributos publicos :v


persona.nombre = "Federico";    //Estoy usando el setter
console.log(persona.datos());

console.log(persona.toString());


//Creamos a otra persona
let persona2 = new Persona("Eze", 23, 41_068_807);

//Comparo a las dos personas
console.log(persona.equals(persona2));

Persona.ciudad = "Mar del Plata";
console.log(persona2);

//CREANDO UNA CLASE CON HERENCIA
class Empleado extends Persona{
 
    constructor(nombre, edad, dni, sueldo){
        super(nombre, edad, dni);
        this._sueldo = sueldo;
    }

    get sueldo(){
        return this._sueldo;
    }
    set sueldo(sueldo){
        this._sueldo = sueldo;
    }

    datos(){
        return `${super.datos()}, ${this._sueldo}`;
    }

    toString(){
        return this.datos();
    }
}

let empleado = new Empleado("Tomas", 22, "12345678", 150000);
console.log(empleado);

if(empleado instanceof Empleado){
    console.log("Es una instancia de la clase Empleado");
}

if(empleado instanceof Persona){
    console.log("Es una instancia de la clase padre Persona, porque es hija");
}

if(empleado instanceof Object){
    console.log("Es una instancia de Object tambien");
}
