import { Component, Injector, OnInit } from "@angular/core";
import { MatDialog } from "@angular/material/dialog";
import { ActivatedRoute, Router } from "@angular/router";
import { OntimizeService } from "ontimize-web-ngx";
import { ExpensesNewComponent } from "../expenses/expenses-new/expenses-new.component";

@Component({
  selector: "home",
  templateUrl: "./home.component.html",
  styleUrls: ["./home.component.css"],
})
export class HomeComponent implements OnInit {
  protected service: OntimizeService;
  public balance: number;
  public expenseBalance: number;
  public incomeBalance: number;
  public MONTHLY_BALANCE: string = "MONTHLY_BALANCE";
  public TOTAL_BALANCE: string = "TOTAL_BALANCE";
  public TOTAL_EXPENSE: string = "TOTAL_EXPENSE";
  public TOTAL_INCOME: string = "TOTAL_INCOME";
  servicePath = "/balances";
  //public MONTHLY_BALANCE: string = "MONTHLY_BALANCE";
  //servicePath = "/balances";
  httpOptions: any;
  constructor(
    private router: Router,
    private actRoute: ActivatedRoute,
    protected injector: Injector,
    public dialog: MatDialog
  ) {
    this.service = this.injector.get(OntimizeService);
  }

  ngOnInit() {
    this.queryBalance();
    this.queryExpenseBalance();
    this.queryIncomeBalance();
  }

  queryBalance() {
    const filter = {};
    const columns = ["user_", "balance"];
    this.service.query(filter, columns, "balance").subscribe((resp) => {
      if (resp.code === 0) {
        this.getBalance(resp.data);
      }
    });
  }
  queryExpenseBalance() {
    const filter = {};
    const columns = [ "user_", "expenseBalance"];
    this.service.query(filter, columns, "totalExpensesForCurrentMonth").subscribe((resp) => {
      if (resp.code === 0) {
        this.getExpenseBalance(resp.data);
      }
    });
  }
  queryIncomeBalance() {
    const filter = {};
    const columns = ["user_", "incomeBalance"];
    this.service.query(filter, columns, "totalIncomesForCurrentMonth").subscribe((resp) => {
      if (resp.code === 0) {
        this.getIncomeBalance(resp.data);
      }
    });
  }
  getBalance(data: { balance: number }[]) {
    this.balance = data[0].balance;
  }
  getExpenseBalance(data: { expenseBalance: number }[]) {
    if (data[0] === undefined) {
      this.expenseBalance = 0;
    } else {
      this.expenseBalance = data[0].expenseBalance;
    }
  }
  // getExpenseBalance(data: { expenseBalance: number }[]) {

  //   this.expenseBalance = data[0].expenseBalance || 0;

  // }
  getIncomeBalance(data: { incomeBalance: number }[]) {
    if (data[0] === undefined) {
      this.incomeBalance = 0;
    } else {
      this.incomeBalance = data[0].incomeBalance;
    }
  }

  protected configureService() {
    const conf = this.service.getDefaultServiceConfiguration("movements");
    this.service.configureService(conf);
  }

  navigate() {
    this.router.navigate(["../", "login"], { relativeTo: this.actRoute });
  }

  buttonExpenses() {
    this.dialog.open(ExpensesNewComponent, {
      width: "fit-content",
      height: "580px",
    });
    /*  this.router.navigate(["../../expenses", "new"], {
      relativeTo: this.actRoute,
    });*/
  }
  buttonIncomes() {
    this.router.navigate(["../../incomes", "new"], {
      relativeTo: this.actRoute,
    });
  }
}
