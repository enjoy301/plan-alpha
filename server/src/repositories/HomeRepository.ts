import { InsertResult, Repository } from "typeorm";
import { MysqlDataSource } from "../database";
import { Service } from "typedi";
import { Schedule } from "../entities/Schedule";

@Service()
export class HomeRepository extends Repository<Schedule> {
  public async getSchedule(query: any) {
    return MysqlDataSource.createQueryBuilder(Schedule, "schedule")
      .select(["schedule.date", "schedule.content"])
      .where("schedule.userId = :userId", { userId: query.userId })
      .andWhere("schedule.date = :date", { date: query.date })
      .getOne();
  }

  public async getSchedules(limit: number) {
    return MysqlDataSource.createQueryBuilder(Schedule, "schedule")
      .select(["schedule.date", "schedule.content"])
      .orderBy("schedule.date", "DESC")
      .limit(limit)
      .getMany();
  }

  public async createSchedule(body: any, content: string) {
    return MysqlDataSource.createQueryBuilder(Schedule, "schedule")
      .insert()
      .into(Schedule)
      .values({
        userId: body.userId,
        date: body.date,
        content: content,
      })
      .execute();
  }

  public async createMockSchedule(body: any) {
    return MysqlDataSource.createQueryBuilder(Schedule, "schedule")
      .insert()
      .into(Schedule)
      .values({
        userId: body.userId,
        date: body.date,
        content: body.content,
      })
      .execute();
  }

  public async deleteSchedule(body: any) {
    return MysqlDataSource.createQueryBuilder(Schedule, "schedule")
      .delete()
      .from(Schedule)
      .where("schedule.userId = :userId", { userId: body.userId })
      .andWhere("schedule.date = :date", { date: body.date })
      .execute();
  }
}
