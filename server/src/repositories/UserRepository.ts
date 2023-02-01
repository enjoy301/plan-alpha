import { Member } from "../entities/Member";
import { InsertResult, Repository } from "typeorm";
import { MysqlDataSource } from "../database";
import { Service } from "typedi";

@Service()
export class UserRepository extends Repository<Member> {
  public async getUser(id: number) {
    return MysqlDataSource.createQueryBuilder(Member, "member")
      .where("member.id = :id", { id })
      .getOne();
  }

  public async createUser(body: any) {
    return MysqlDataSource.createQueryBuilder(Member, "member")
      .insert()
      .into(Member)
      .values({
        name: body.name,
      })
      .execute();
  }
}
