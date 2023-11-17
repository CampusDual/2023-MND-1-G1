import {
  Component,
  ElementRef,
  EventEmitter,
  Injector,
  OnInit,
  Output,
  ViewChild,
  AfterViewInit,
} from "@angular/core";
import { OntimizeService } from "ontimize-web-ngx";
import { FormControl, FormGroup, Validators } from "@angular/forms";
import { RegisterSharedService } from "../shared/register-shared.service";
import { ActivatedRoute, Router } from "@angular/router";
import confetti from "canvas-confetti";
@Component({
  selector: "app-register",
  templateUrl: "./register.component.html",
  styleUrls: ["./register.component.css"],
})
export class RegisterComponent implements OnInit, AfterViewInit {
  protected service: OntimizeService;
  protected showPassword = false;
  @Output() volverLogin = new EventEmitter<void>();

  respMessage: string = "";
  public errorEmail: string; //! ERROR DE MAIL
  public errorPassword: string; //! ERROR DE PASS
  public errorBoth: string; //! ERROR DE AMBOS
  public showSandwitch: boolean = false;
  @ViewChild("registryForm", { static: false }) Form: ElementRef;

  loginForm: FormGroup = new FormGroup({});
  userCtrl: FormControl = new FormControl("", Validators.required);
  pwdCtrl: FormControl = new FormControl("", Validators.required);
  nameCtrl: FormControl = new FormControl("", Validators.required);
  lastnameCtrl: FormControl = new FormControl("", Validators.required);
  emailCtrl: FormControl = new FormControl("", Validators.required);

  constructor(
    protected injector: Injector,
    private registerService: RegisterSharedService
  ) {
    this.service = this.injector.get(OntimizeService);
  }
  ngAfterViewInit(): void {}

  ngOnInit() {
    const conf = this.service.getDefaultServiceConfiguration("app");
    this.service.configureService(conf);
    this.loginForm.addControl("username", this.userCtrl);
    this.loginForm.addControl("password", this.pwdCtrl);
    this.loginForm.addControl("name", this.nameCtrl);
    this.loginForm.addControl("lastname", this.lastnameCtrl);
    this.loginForm.addControl("email", this.emailCtrl);
  }
  volverAlLogin() {
    this.showSandwitch = false;
    this.registerService.setShowSandwitch(this.showSandwitch);
    this.clearValidatorsAndResetForm();
    this.volverLogin.emit();
  }
  private clearValidatorsAndResetForm() {
    [
      this.userCtrl,
      this.pwdCtrl,
      this.nameCtrl,
      this.lastnameCtrl,
      this.emailCtrl,
    ].forEach((control) => {
      control.clearValidators();
      control.updateValueAndValidity();
    });

    this.loginForm.reset();
  }
  togglePasswordVisibility() {
    this.showPassword = !this.showPassword;
  }

  confetti() {
    this.throwConfetti();
    this.volverAlLogin();
  }

  throwConfetti() {
    confetti({
      particleCount: 250,
      spread: 120,
    });
  }

  register() {
    const userData = {
      USER_: this.loginForm.get("username").value,
      PASSWORD: this.loginForm.get("password").value,
      NAME: this.loginForm.get("name").value,
      SURNAME: this.loginForm.get("lastname").value,
      EMAIL: this.loginForm.get("email").value,
    };
    [
      this.userCtrl,
      this.pwdCtrl,
      this.nameCtrl,
      this.lastnameCtrl,
      this.emailCtrl,
    ].forEach((control) => {
      control.setValidators([Validators.required]); // Establecer validador requerido
      control.updateValueAndValidity();
    });

    const isUserDataValid = Object.keys(userData).every(
      (key) => userData[key] != null && userData[key].length > 0
    );
    const isPasswordValid = userData.PASSWORD.length > 7;
    const isEmailValid = /^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(userData.EMAIL);
    this.errorEmail = isEmailValid ? "" : "ERROR_FORMAT_EMAIL";
    this.errorPassword = isPasswordValid ? "" : "ERROR_LENGTH_PASSWORD";

    if (isUserDataValid && isPasswordValid && isEmailValid) {
      this.service.insert(userData, "register").subscribe({
        next: (resp) => {
          this.respMessage = "Registro realizado";
          this.Form.nativeElement.reset();
          this.showSandwitch = false;
          this.confetti();
        },
        error: (error) => {
          console.log(error);
          if (error.status === 409) {
            this.respMessage = error.error;
            console.error(error.error);
          } else {
            this.respMessage = error.error;
            console.error(error.error);
          }
        },
      });
    } else {
      this.registerService.setErrorEmail(this.errorEmail);
      this.registerService.setErrorPassword(this.errorPassword);
    }
  }
}
