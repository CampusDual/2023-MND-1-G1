import { Component, Injector, OnInit, ViewChild} from '@angular/core';
import { OFormComponent,OntimizeService} from "ontimize-web-ngx";
import { FormControl, FormGroup, Validators } from "@angular/forms";
import { ActivatedRoute, Router } from "@angular/router";

@Component({
  selector: 'app-register',
  templateUrl: './register.component.html',
  styleUrls: ['./register.component.css']
})
export class RegisterComponent implements OnInit {
  protected service: OntimizeService;
  protected showPassword = false;
  respMessage: string = '';
  errorEmail:string; 
  errorPassword:string; 
  @ViewChild('registryForm', {static:false})  oForm: OFormComponent; 
  loginForm: FormGroup = new FormGroup({});
  userCtrl: FormControl = new FormControl("", Validators.required);
  pwdCtrl: FormControl = new FormControl("", Validators.required);
  nameCtrl: FormControl = new FormControl("", Validators.required);
  lastnameCtrl: FormControl = new FormControl("", Validators.required);
  emailCtrl: FormControl = new FormControl("", Validators.required);
  constructor(protected injector: Injector) { 
    this.service = this.injector.get(OntimizeService);
  }

  ngOnInit() {
    const conf = this.service.getDefaultServiceConfiguration("app");
    this.service.configureService(conf);
    this.loginForm.addControl("username", this.userCtrl);
    this.loginForm.addControl("password", this.pwdCtrl);
    this.loginForm.addControl("name", this.nameCtrl);
    this.loginForm.addControl("lastname", this.lastnameCtrl);
    this.loginForm.addControl("email", this.emailCtrl);

  }

  togglePasswordVisibility() {
    this.showPassword = !this.showPassword;
  }

 register() {
    const userData = {
      USER_: this.loginForm.get('username').value,
      PASSWORD: this.loginForm.get('password').value,
      NAME: this.loginForm.get('name').value,
      SURNAME:  this.loginForm.get('lastname').value, 
      EMAIL: this.loginForm.get('email').value
  };
  const isUserDataValid = Object.keys(userData).every(key => userData[key] != null && userData[key].length > 0);
  const isPasswordValid = userData.PASSWORD.length > 8;
  const isEmailValid = /^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(userData.EMAIL);
  this.errorEmail = isEmailValid ? "" :  "ERROR_FORMAT_EMAIL"; 
  this.errorPassword = isPasswordValid ? "": "ERROR_LENGTH_PASSWORD"; 
  if(isUserDataValid && isPasswordValid && isEmailValid){
    this.service.insert(userData, "register").subscribe({
      next: (resp)=>{
        this.respMessage = 'Registro realizado';
      }, 
      error: (error)=> {
        if(error.status===409){
          this.respMessage = error.error; 
          console.error(error.error);
        }else {
          this.respMessage = error.error; 
          console.error(error.error);
      }
      }
    }); 

  }
    
    
  
  }


}
