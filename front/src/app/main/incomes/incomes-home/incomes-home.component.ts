import { Component, OnInit } from "@angular/core";
import { BreakpointObserver, Breakpoints } from '@angular/cdk/layout';
import { distinctUntilChanged, tap } from 'rxjs/operators';
import { DiscreteBarChartConfiguration, OChartComponent } from "ontimize-web-ngx-charts";
import { Expression, FilterExpressionUtils } from "ontimize-web-ngx";
import { ViewChildren, QueryList, ViewChild } from "@angular/core";

@Component({
  selector: "app-incomes-home",
  templateUrl: "./incomes-home.component.html",
  styleUrls: ["./incomes-home.component.css"],
})
export class IncomesHomeComponent implements OnInit {
  @ViewChildren("incomeTable") incomeTable: QueryList<any>;
  @ViewChild("discreteBar", { static: false }) discreteBar: OChartComponent;

  Breakpoints = Breakpoints;
  currentBreakpoint: string = '';

  readonly breakpoint$ = this.breakpointObserver
    .observe([Breakpoints.Small,Breakpoints.Medium])
    .pipe(
      tap(value => console.log(value)),
      distinctUntilChanged()
    );

  public selected = {};
  public date = [];
  sharedDataObject: { data: any[] } | null = { data: [] };
  protected chartParameters: DiscreteBarChartConfiguration;
  showChart: boolean = true;

  constructor(private breakpointObserver: BreakpointObserver) { }

  ngOnInit() {
    // Obtener el tamaño inicial de la pantalla al cargar la página
    this.currentBreakpoint = this.breakpointObserver.isMatched(Breakpoints.Medium)
    ? Breakpoints.Medium
    : this.breakpointObserver.isMatched(Breakpoints.Large)
      ? Breakpoints.Large
      : Breakpoints.Small;

    this.breakpoint$.subscribe(() =>
      this.breakpointChanged()
    );
  }

  private breakpointChanged() {
    if (this.breakpointObserver.isMatched(Breakpoints.Medium)) {
      this.currentBreakpoint = Breakpoints.Medium;
    } else if (this.breakpointObserver.isMatched(Breakpoints.Small)) {
      this.currentBreakpoint = Breakpoints.Small;
    }
  }

  clearFilters(event) {
    this.incomeTable.first.reloadData();
  }

  getValue() {
    return this.selected;
  }
  getImagePath(categoryId: string): string {
    console.log('categoryId:', categoryId);
  
    switch (categoryId.toString()) {
      case '1':
        return '../assets/images/suscripciones.png';
      case '2':
        return '../assets/images/gasolina.png';
      default:
        return '../assets/images/no-image.png'; 
    }
  }

  public createFilter(values: Array<{ attr; value }>): Expression {
    let filters: Array<Expression> = [];
    values.forEach((fil) => {
      if (fil.value) {
        if (fil.attr === "date_range2") {
          filters.push(
            FilterExpressionUtils.buildExpressionMoreEqual(
              "MOV_DATE",
              fil.value.startDate
            )
          );
          filters.push(
            FilterExpressionUtils.buildExpressionLessEqual(
              "MOV_DATE",
              fil.value.endDate
            )
          );
        }

        if (fil.attr === "CA_ID" && fil.value.length > 0) {
          let valueArray = Array.from(fil.value);
          if (valueArray.length > 1) {
            let filterExpressions = valueArray.map((value) =>
              FilterExpressionUtils.buildExpressionEquals("CA_ID", value)
            );
            let filterExpression = filterExpressions.reduce((exp1, exp2) =>
              FilterExpressionUtils.buildComplexExpression(
                exp1,
                exp2,
                FilterExpressionUtils.OP_OR
              )
            );
            filters.push(filterExpression);
          } else {
            filters.push(
              FilterExpressionUtils.buildExpressionEquals(
                "CA_ID",
                valueArray[0]
              )
            );
          }
        }
      }
    });

    if (filters.length > 0) {
      const filterExpression = filters.reduce((exp1, exp2) =>
        FilterExpressionUtils.buildComplexExpression(
          exp1,
          exp2,
          FilterExpressionUtils.OP_AND
        )
      );
      return filterExpression;
    } else {
      return null;
    }
  }

  public dataFiltered(event) {
    this.sharedDataObject = { data: event };
    console.log(this.sharedDataObject);

    if (event.length === 0) {
      this.showChart = false;
    } else {
      this.showChart = true;
    }
  }
}
