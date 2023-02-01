import { MonthRepository } from "./../repositories/MonthRepository";
import { Inject, Service } from "typedi";

@Service()
export class MonthService {
  @Inject()
  private monthRepository: MonthRepository;

  public async getMonth(date: string, userId: number) {
    let startDate = new Date(date);
    startDate.setDate(1);
    let startDateStr = `${startDate.getFullYear()}-0${
      startDate.getMonth() + 1
    }-0${startDate.getDate()} 00:00:00`;

    let endDate = new Date(date);
    endDate.setMonth(endDate.getMonth() + 1);
    endDate.setDate(0);
    let endDateStr = `${endDate.getFullYear()}-0${
      endDate.getMonth() + 1
    }-${endDate.getDate()} 00:00:00`;

    console.log(1, startDate, endDate);

    const months = await this.monthRepository.getMonth(
      userId,
      startDateStr,
      endDateStr
    );
    return months;
  }

  public async createMonth(body: any) {
    const month = await this.monthRepository.createMonth(body);
    return month;
  }
}
