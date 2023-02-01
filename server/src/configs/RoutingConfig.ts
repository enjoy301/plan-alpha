export const routingControllerOptions = {
  cors: true,
  routePrefix: "/v1/api",
  controllers: [`${__dirname}/../controllers/*{.ts,.js}`],
  middlewares: [`${__dirname}/../middlewares/*{.ts,.js}`],
  interceptors: [`${__dirname}/../interceptors/*{.ts,.js}`],
  defaultErrorHandler: false,
};
