import { Component, Input } from '@angular/core';

@Component({
  selector: 'shared-footer',
  templateUrl: './footer.component.html',
  styles: [
  ]
})
export class FooterComponent {

  @Input()
  public atributoFooter1: string = 'atributoFooter1';

  @Input()
  public atributoFooter2: string = 'atributoFooter2';
}
