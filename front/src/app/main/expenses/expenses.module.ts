import { NgModule } from "@angular/core";
import { CommonModule } from "@angular/common";
import { OntimizeWebModule } from "ontimize-web-ngx";
import { ExpensesRoutingModule } from "./expenses-routing.module";
import { ExpensesHomeComponent } from "./expenses-home/expenses-home.component";
import { ExpensesNewComponent } from "./expenses-new/expenses-new.component";
import { OChartModule } from 'ontimize-web-ngx-charts';
import { SharedModule } from "src/app/shared/shared.module";
import { ExpensesChartComponent } from './expenses-chart/expenses-chart.component';
import { DatePipe } from '@angular/common';
import { FormsModule } from "@angular/forms";


@NgModule({
  declarations: [ExpensesHomeComponent, ExpensesNewComponent, ExpensesChartComponent],
  imports: [
      CommonModule, 
      SharedModule,
      OntimizeWebModule,
      ExpensesRoutingModule,
      OChartModule, 
      FormsModule
    ],
  exports: [
    ExpensesChartComponent
  ], 
  providers:[DatePipe]
})
export class ExpensesModule {}
