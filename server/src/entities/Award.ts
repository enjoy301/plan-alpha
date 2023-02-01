import { IsNotEmpty, IsOptional } from "class-validator";
import {
  Column,
  CreateDateColumn,
  Entity,
  PrimaryGeneratedColumn,
  UpdateDateColumn,
} from "typeorm";

@Entity({ name: "award" })
export class Award {
  @PrimaryGeneratedColumn()
  id: number;

  @IsNotEmpty()
  @Column()
  title: string;

  @IsNotEmpty()
  @Column()
  content: string;
}
