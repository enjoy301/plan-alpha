import { data7 } from "./../data/data7";
import { data6 } from "./../data/data6";
import { data5 } from "./../data/data5";
import { data4 } from "./../data/data4";
import { data3 } from "./../data/data3";
import { data2 } from "./../data/data2";
import { data0 } from "../data/data0";
import { json, Response } from "express";
import {
  Body,
  Delete,
  Get,
  HttpCode,
  JsonController,
  Param,
  Post,
  QueryParams,
} from "routing-controllers";
import { Inject, Service } from "typedi";
import { HomeService } from "../services/HomeService";
import { data1 } from "../data/data1";

@Service()
@JsonController()
export class HomeController {
  @Inject()
  private homeService: HomeService;

  @HttpCode(200)
  @Get("/schedule")
  public async getSchedule(@QueryParams() query: any) {
    const schedule = await this.homeService.getSchedule(query);
    return schedule;
  }

  @HttpCode(200)
  @Post("/schedule")
  public async createSchedule(@Body() body: any) {
    const schedule = await this.homeService.createSchedule(body);
    return schedule;
  }

  @HttpCode(200)
  @Post("/mock/schedule")
  public async createMockSchedule(@Body() body: any) {
    const schedule = await this.homeService.createMockSchedule(body);
    return schedule;
  }

  @HttpCode(200)
  @Delete("/schedule")
  public async deleteSchedule(@Body() body: any) {
    const schedule = await this.homeService.deleteSchedule(body);
    return schedule;
  }

  @HttpCode(200)
  @Get("/mock/data")
  public async mockData() {
    await this.homeService.createMockSchedule({
      userId: 1,
      date: data0.date,
      content: JSON.stringify(data0),
    });

    await this.homeService.createMockSchedule({
      userId: 1,
      date: data1.date,
      content: JSON.stringify(data1),
    });

    await this.homeService.createMockSchedule({
      userId: 1,
      date: data2.date,
      content: JSON.stringify(data2),
    });

    await this.homeService.createMockSchedule({
      userId: 1,
      date: data3.date,
      content: JSON.stringify(data3),
    });

    await this.homeService.createMockSchedule({
      userId: 1,
      date: data4.date,
      content: JSON.stringify(data4),
    });

    await this.homeService.createMockSchedule({
      userId: 1,
      date: data5.date,
      content: JSON.stringify(data5),
    });

    await this.homeService.createMockSchedule({
      userId: 1,
      date: data6.date,
      content: JSON.stringify(data6),
    });

    await this.homeService.createMockSchedule({
      userId: 1,
      date: data7.date,
      content: JSON.stringify(data7),
    });

    return "OK";
  }
}
