import { Response } from "express";
import {
  Body,
  Get,
  HttpCode,
  JsonController,
  Param,
  Post,
} from "routing-controllers";
import { Inject, Service } from "typedi";
import { UserService } from "../services/UserService";

@Service()
@JsonController()
export class HomeController {
  @Inject()
  private userService: UserService;

  @HttpCode(200)
  @Get("/user/:id")
  public async getUser(@Param("id") id: number) {
    const user = await this.userService.getUser(id);
    return user;
  }

  @HttpCode(201)
  @Post("/user")
  public async createUser(@Body() body: any) {
    const user = await this.userService.createUser(body);
    return user;
  }
}
