import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { SidebarComponent } from './sidebar/sidebar.component';
import { GenericSectionComponent } from './generic-section/generic-section.component';
import { SharedRoutingModule } from './shared-routing.module';
import { FooterComponent } from './footer/footer.component';
import { NavbarComponent } from './navbar/navbar.component';


@NgModule({
  declarations: [
    SidebarComponent,
    GenericSectionComponent,
    FooterComponent,
    NavbarComponent,
  ],
  imports: [
    CommonModule,

    //* acabo de cometer un error grave y casi me vuelvo loco jjaja por suerte lo pude resolver rapidamente
    //* El error fue aqui puse un componente, cuando en realidad va en los exports...
    //* y me tiraba un error get not 404 y en el inspeccionador: "Error: Maximum call stack size exceeded"
    //SharedRoutingModule,  //Por ahora lo cmento, ya que pospongo el trabajo con rutas por el momento
                                // y porque me estab atiurando errores en el inspeccionador.
  ],
  exports: [
    FooterComponent,
    GenericSectionComponent,
    NavbarComponent,
  ]
})
export class SharedModule { }
