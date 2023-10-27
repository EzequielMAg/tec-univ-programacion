import { Component, EventEmitter, Input, Output } from '@angular/core';

@Component({
  selector: 'shared-generic-section',
  templateUrl: './generic-section.component.html',
})
export class GenericSectionComponent {


  //* PARA RECIBIR DATA DESDE UN COMPONENTE PADRE...................
  @Input()
  public variableDelComponenteHijo: string = 'mundo!';

  @Input()
  public variableDelComponenteHijo2: string =  'hola';


  //* PARA PASAR DATA DESDE UN COMPONENTE HIJO HACIA UN COMPONENTE PADRE.......
  @Output()
  public emitidor: EventEmitter<string> = new EventEmitter();

  public infoDelComponenteHijo: string = 'infoDelComponenteHijo';

  emitirInfo() {
    this.emitidor.emit(this.infoDelComponenteHijo);
  }

  public emitirInfoVacia() {
    this.emitidor.emit('');
  }

}
