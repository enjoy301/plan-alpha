import { IsNotEmpty, IsOptional } from "class-validator";
import {
  Column,
  CreateDateColumn,
  Entity,
  PrimaryGeneratedColumn,
  UpdateDateColumn,
} from "typeorm";

@Entity({ name: "test" })
export class Test {
  @PrimaryGeneratedColumn()
  id: string;

  @IsNotEmpty()
  @Column()
  title: string;
}
