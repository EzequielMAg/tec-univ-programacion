import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';

/* import { AppRoutingModule } from './app-routing.module'; */
import { AppComponent } from './app.component';
import { MiModuloModule } from './modules/mi-modulo/mi-modulo.module';

@NgModule({
  declarations: [
    AppComponent,
  ],
  imports: [
    BrowserModule,
    /* AppRoutingModule, */
    MiModuloModule,
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }
