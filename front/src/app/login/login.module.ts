import { NgModule } from "@angular/core";
import { OntimizeWebModule } from "ontimize-web-ngx";

import { SharedModule } from "../shared/shared.module";
import { LoginRoutingModule } from "./login-routing.module";
import { LoginComponent } from "./login.component";
import { TermsComponent } from "./terms/terms.component";
import { RegisterComponent } from "../register/register.component";
@NgModule({
  imports: [SharedModule, OntimizeWebModule, LoginRoutingModule],
  declarations: [LoginComponent, TermsComponent, RegisterComponent],
})
export class LoginModule {}
