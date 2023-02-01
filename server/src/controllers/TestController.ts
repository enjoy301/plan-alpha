import { Response } from "express";
import { Body, Get, HttpCode, JsonController, Post } from "routing-controllers";
import { Inject, Service } from "typedi";
import { TestService } from "../services/TestService";

@Service()
@JsonController()
export class TestController {
  @Inject()
  private testService: TestService;

  @HttpCode(200)
  @Get("/test")
  public async getAll() {
    const posts = await this.testService.getTests();
    return posts;
  }

  @HttpCode(200)
  @Post("/test")
  public async create(@Body() body: any) {
    const posts = await this.testService.createTest(body);
    console.log(posts);
    return "wow";
  }
}
