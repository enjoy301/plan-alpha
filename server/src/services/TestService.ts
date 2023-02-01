import { Inject, Service } from "typedi";
import { TestRepository } from "../repositories/TestRepository";

@Service()
export class TestService {
  @Inject()
  private testRepository: TestRepository;

  public async getTests() {
    const tests = await this.testRepository.getTests();
    return tests;
  }

  public async createTest(body: any) {
    const test = await this.testRepository.createTest(body.title);
    return test;
  }
}
