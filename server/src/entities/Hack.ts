import { IsNotEmpty, IsOptional } from "class-validator";
import {
  Column,
  CreateDateColumn,
  Entity,
  ManyToOne,
  PrimaryGeneratedColumn,
  UpdateDateColumn,
} from "typeorm";
import { Member } from "./Member";

@Entity({ name: "hack" })
export class Hack {
  @PrimaryGeneratedColumn()
  id: number;

  @IsNotEmpty()
  @Column()
  @ManyToOne(() => Member, (member) => member.id)
  userId: number;

  @IsOptional()
  @Column()
  title: string;

  @IsNotEmpty()
  @Column({ type: "datetime" })
  endDatetime: Date;
}
