import { UserRepository } from "./../repositories/UserRepository";
import { Inject, Service } from "typedi";

@Service()
export class UserService {
  @Inject()
  private userRepository: UserRepository;

  public async getUser(id: number) {
    const test = await this.userRepository.getUser(id);
    return test;
  }

  public async createUser(body: any) {
    const test = await this.userRepository.createUser(body);
    return test;
  }
}
