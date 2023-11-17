import { Injectable } from "@angular/core";
import { BehaviorSubject, Observable } from "rxjs";

@Injectable({
  providedIn: "root",
})
export class RegisterSharedService {
  private errorEmail = new BehaviorSubject<string>("");
  private errorPassword = new BehaviorSubject<string>("");
  private errorBoth = new BehaviorSubject<string>("");
  private showSandwitch = new BehaviorSubject<boolean>(false);

  setErrorEmail(email: string) {
    this.errorEmail.next(email);
  }

  getErrorEmail(): Observable<string> {
    return this.errorEmail.asObservable();
  }

  setErrorPassword(password: string) {
    this.errorPassword.next(password);
  }

  getErrorPassword(): Observable<string> {
    return this.errorPassword.asObservable();
  }
  setErrorBoth(errorBoth: string) {
    this.errorBoth.next(errorBoth);
  }

  getErrorBoth(): Observable<string> {
    return this.errorBoth.asObservable();
  }

  setShowSandwitch(showSandwitch: boolean) {
    this.showSandwitch.next(showSandwitch);
    console.log(showSandwitch);
  }

  getShowSandwitch(): Observable<boolean> {
    return this.showSandwitch.asObservable();
  }
}
