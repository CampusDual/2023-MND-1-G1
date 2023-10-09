import { NgModule } from '@angular/core';
import { OntimizeWebModule } from 'ontimize-web-ngx';

import { SharedModule } from '../../shared/shared.module';
import { HomeRoutingModule } from './home-routing.module';
import { HomeComponent } from './home.component';
import { ExpensesModule } from '../expenses/expenses.module';
import { IncomesModule } from '../incomes/incomes.module';
import { OChartModule } from 'ontimize-web-ngx-charts';



@NgModule({
  imports: [
    SharedModule,
    OntimizeWebModule,
    HomeRoutingModule, 
    ExpensesModule,
    IncomesModule,
    OChartModule
    
  ],
  declarations: [
    HomeComponent
  ]
})
export class HomeModule { }
