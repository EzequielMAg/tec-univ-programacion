import { Component, EventEmitter, Output } from '@angular/core';
import { Character } from 'src/app/core/character.interface';

@Component({
  selector: 'add-character',
  templateUrl: './add-character.component.html',
})
export class AddCharacterComponent {

  //* Aqui voy a guardar la info ingresada
  public character: Character = {
    id: 0,
    full_name: '',
    age: '',
    about: ''
  }

  @Output()
  public newCharacter: EventEmitter<Character> = new EventEmitter();

  emitCharacter():void {

    //Para no emitir el character al pepe, detecta q por lo menos tenga 1 letra de nombre
    if(this.character.full_name.length === 0) return;

    if(this.character.about.length === 0) {
      this.character.about = 'Unknown';
    }

    if(this.character.age.length === 0) {
      this.character.age = 'Unknown';
    }

    //Para ver en la consola lo que se mando
    console.log("Personaje emitido: ");;
    console.log(this.character);

    //Se emite el nuevo personaje
    this.newCharacter.emit(this.character);

    // Se reinician los valores del input
    this.character =  {
      id: 0,
      full_name: "",
      age: "",
      about: ""
    };
  }

}
