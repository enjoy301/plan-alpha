import { DataSource } from "typeorm";
import { env } from "./env";

export const MysqlDataSource = new DataSource({
  type: "mysql",
  host: env.db.host,
  port: env.db.port,
  username: env.db.username,
  password: env.db.password,
  database: env.db.database,
  migrations: [],
  entities: [__dirname + "/entities/*{.ts,.js}"],
  synchronize: true,
});
