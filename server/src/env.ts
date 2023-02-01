require("dotenv").config({ path: __dirname + "/configs/.env" });

export const env = {
  app: {
    port: Number(process.env.PORT) || 3000,
    apiPrefix: process.env.API_PREFIX || "/api",
  },
  db: {
    host: process.env.DB_HOST,
    port: Number(process.env.DB_PORT),
    username: process.env.DB_USERNAME,
    password: process.env.DB_PASSWORD,
    database: process.env.DB_DATABASE,
  },
};
