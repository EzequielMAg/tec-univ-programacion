import { Component, EventEmitter, Input, Output } from '@angular/core';
import { Character } from 'src/app/core/character.interface';

@Component({
  selector: 'characters-table',
  templateUrl: './characters-table.component.html',
  styles: [
  ]
})
export class CharactersTableComponent {

  @Input()
  public arregloCharacters: Character[] = [];

  //* De esta forma se comunica este componente con el padre, para enviarle que personaje eliminar
  //* Segun en cual se hizo clic en la tabla, se agarra ese ID y se le envia tal atributo

  @Output()
  public variableEmitidora: EventEmitter<number> = new EventEmitter();

  public emitirIdPersonajeAEliminar(idPersonaje: number) {
    this.variableEmitidora.emit( idPersonaje );
  }


}
