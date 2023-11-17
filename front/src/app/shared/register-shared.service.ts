import { Injectable } from "@angular/core";
import { BehaviorSubject, Observable } from "rxjs";

@Injectable({
  providedIn: "root",
})
export class RegisterSharedService {
  private errorEmail = new BehaviorSubject<string>("");
  private errorPassword = new BehaviorSubject<string>("");
  private errorBoth = new BehaviorSubject<string>("");

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
  setErrorBoth(both: string) {
    this.errorBoth.next(both);
  }

  getErrorBoth(): Observable<string> {
    return this.errorBoth.asObservable();
  }
}
