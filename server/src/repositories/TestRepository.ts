import { InsertResult, Repository } from "typeorm";
import { MysqlDataSource } from "../database";
import { Test } from "../entities/Test";
import { Service } from "typedi";

@Service()
export class TestRepository extends Repository<Test> {
  public async getTests(): Promise<Test[]> {
    return MysqlDataSource.createQueryBuilder(Test, "test")
      .select(["test.id", "test.title"])
      .getMany();
  }

  public async createTest(title: string): Promise<InsertResult> {
    return MysqlDataSource.createQueryBuilder()
      .insert()
      .into(Test)
      .values({ title })
      .execute();
  }
}
