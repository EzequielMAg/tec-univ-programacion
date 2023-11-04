import { Injectable } from '@angular/core';
import { Character } from 'src/app/core/interfaces';

@Injectable({ providedIn: 'root' })
export class MiServicioService {


  public arrayCharacters: Character[] = [
      {
        "id": 1,
        "full_name": "Rick Sanchez",
        "age": "70",
        "about": "Cynical, alcoholic, mad scientist"
      },
      {
        "id": 2,
        "full_name": "Morty Smith",
        "age": "14",
        "about": "Timid, easily influenced, loyal"
      },
      {
        "id": 3,
        "full_name": "Summer Smith",
        "age": "17",
        "about": "Rebellious, self-centered, adventurous"
      },
      {
        "id": 4,
        "full_name": "Beth Smith",
        "age": "34",
        "about": "Intelligent, hard-working, insecure"
      },
      {
        "id": 5,
        "full_name": "Jerry Smith",
        "age": "34",
        "about": "Incompetent, weak-willed, insecure"
      },
      {
        "id": 6,
        "full_name": "Abadango Cluster Princess",
        "age": "Unknown",
        "about": "Abadango royalty"
      },
      {
        "id": 7,
        "full_name": "Abradolf Lincler",
        "age": "Unknown",
        "about": "Genetic experiment"
      },
      {
        "id": 8,
        "full_name": "Adjudicator Rick",
        "age": "Unknown",
        "about": "Council of Ricks member"
      },
      {
        "id": 9,
        "full_name": "Agency Director",
        "age": "Unknown",
        "about": "Government official"
      },
      {
        "id": 10,
        "full_name": "Alan Rails",
        "age": "Unknown",
        "about": "Ghost train conductor"
      }
  ];

  private idUltimoPersonaje: number = this.arrayCharacters[this.arrayCharacters.length - 1].id;


  constructor() { }

  agregarPersonaje(newCharacter: Character): void {

    // Asigno id, segun el id del ultimo personaje que este en el array, y le sumo 1.
    newCharacter.id = ++this.idUltimoPersonaje;

    //Para ver en la consola lo que se mando
    console.log("Personaje agregado en el servicio: ");;
    console.log(newCharacter);

    this.arrayCharacters.push(newCharacter);
  }

  eliminarPersonaje(id: number): void {

    this.arrayCharacters = this.arrayCharacters.filter(character => character.id !== id);
    console.log("DENTRO DEL SERVICIO: ID ELIMINADO → " + id);
  }

}
