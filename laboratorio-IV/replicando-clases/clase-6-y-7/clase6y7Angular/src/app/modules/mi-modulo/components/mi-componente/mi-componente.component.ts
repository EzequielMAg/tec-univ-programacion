import { Component } from '@angular/core';
import { MiServicioService } from '../../../../data/mi-servicio.service';
import { Character } from '../../../../core/character.interface';

@Component({
  selector: 'app-mi-componente',
  templateUrl: './mi-componente.component.html',
  styles: [
  ]
})
export class MiComponenteComponent {

  //* ESTE SERIA EL COMPONENTE PADREE....................................

  public datoDelPadre1: string = 'soy un dato del componente padre!'

  public datoDelPadre2: string = 'Mi nombre es Ezequiel Mamani!'

  public arregloDelPadre: string[] = ['DatoDelArregloPadrePos0', 'DatoDelArregloPadrePos1'];

  public arregloParaNavbar: string[] = ['HOME', 'PRODUCTOS', 'NOSOTROS', 'CONTACTO'];

  //* Para ngIf
  public flag = true;

  public desaparecerLandingPage() {
    this.flag = false;
  }

  public aparecerLandingPage() {
    this.flag = true;
  }

  //* PARA ATRAPAR LO QUE EMITA EL COMPONENTE HIJO
  public atributoRecibidor: string = 'sin data';

  public metodoRecibidor(data: string): void {
    this.atributoRecibidor = data;
  }

  //* El constructor deberia estar despues de los atributos SI, pero bue... Lo dejo por orden de los temas
  //* dados maso menos :v
  //* SERVICIOS........
  constructor(private miServicio: MiServicioService) {}

  // Este metodo es para pasarle la data del servicio a otros componentes.
  // Por ejemplo al componente del file 'characters-table'
  get characters(): Character[] {
    return this.miServicio.arrayCharacters;
  }

  //* Agarra el objeto Character, que seria el nuevo personaje submiteado, desde el componente hijo: add-character
  nuevoPersonajeEmitido(newCharacter: Character): void {
    this.miServicio.agregarPersonaje(newCharacter);
  }

  //* Agarra el id del personaje a elimitar, enviado desde el componente hijo: characters-table
  idEmitido(idPersonaje: number): void {
    this.miServicio.eliminarPersonaje(idPersonaje);
  }

}
