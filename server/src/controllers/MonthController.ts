import { Response } from "express";
import {
  Body,
  Get,
  HttpCode,
  JsonController,
  Param,
  Post,
  QueryParams,
} from "routing-controllers";
import { Inject, Service } from "typedi";
import { MonthService } from "../services/MonthService";

@Service()
@JsonController()
export class MonthController {
  @Inject()
  private monthService: MonthService;

  @HttpCode(200)
  @Get("/month/:date")
  public async getMonth(
    @Param("date") date: string,
    @QueryParams() userId: number
  ) {
    const months = await this.monthService.getMonth(date, userId);
    return months;
  }

  @HttpCode(201)
  @Post("/month")
  public async createMonth(@Body() body: any) {
    const month = await this.monthService.createMonth(body);
    return month;
  }
}
