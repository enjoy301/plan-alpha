import { MontlySchedule } from "./../entities/MontlySchedule";
import { Member } from "../entities/Member";
import { InsertResult, Repository } from "typeorm";
import { MysqlDataSource } from "../database";
import { Service } from "typedi";

@Service()
export class MonthRepository extends Repository<MontlySchedule> {
  public async getMonth(userId: number, startDate: string, endDate: string) {
    console.log(startDate, endDate);

    return MysqlDataSource.createQueryBuilder(MontlySchedule, "montlySchedule")
      .select([
        "montlySchedule.title",
        "montlySchedule.startDatetime",
        "montlySchedule.endDatetime",
      ])
      .where("montlySchedule.userId = :userId", { userId })
      .andWhere("montlySchedule.startDatetime >= :startDate", {
        startDate,
      })
      .andWhere("montlySchedule.endDatetime < :endDate", {
        endDate,
      })
      .getMany();
  }

  public async createMonth(body: any) {
    return MysqlDataSource.createQueryBuilder(MontlySchedule, "montlySchedule")
      .insert()
      .into(MontlySchedule)
      .values({
        userId: body.userId,
        title: body.title,
        startDatetime: body.startDatetime,
        endDatetime: body.endDatetime,
      })
      .execute();
  }
}
