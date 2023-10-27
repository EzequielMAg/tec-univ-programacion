import { Component, Input } from '@angular/core';

@Component({
  selector: 'shared-navbar',
  templateUrl: './navbar.component.html',
  styles: [
  ]
})
export class NavbarComponent {

  @Input()
  public arregloNavBar: string[] = new Array<string>(4);

}
