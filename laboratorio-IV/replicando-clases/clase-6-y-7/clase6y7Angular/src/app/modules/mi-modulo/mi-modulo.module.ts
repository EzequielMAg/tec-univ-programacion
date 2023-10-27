import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { SharedModule } from 'src/app/shared/shared.module';

import { MiComponenteComponent } from './components/mi-componente/mi-componente.component';
import { CharactersTableComponent } from './components/characters-table/characters-table.component';
import { AddCharacterComponent } from './components/add-character/add-character.component';
import { LandingPageComponent } from './components/landing-page/landing-page.component';
import { FormsModule } from '@angular/forms';


@NgModule({
  declarations: [
    MiComponenteComponent,
    CharactersTableComponent,
    AddCharacterComponent,
    LandingPageComponent
  ],
  imports: [
    CommonModule,
    SharedModule,
    FormsModule,
  ],
  exports: [
    MiComponenteComponent,
  ]
})
export class MiModuloModule { }
