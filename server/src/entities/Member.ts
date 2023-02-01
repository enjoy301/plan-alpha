import { IsNotEmpty, IsOptional } from "class-validator";
import {
  Column,
  CreateDateColumn,
  Entity,
  ManyToOne,
  PrimaryGeneratedColumn,
  UpdateDateColumn,
} from "typeorm";

@Entity({ name: "member" })
export class Member {
  @PrimaryGeneratedColumn()
  id: number;

  @IsOptional()
  @Column({ default: 0 })
  age: number;

  @IsNotEmpty()
  @Column()
  name: string;

  @IsOptional()
  @Column({ nullable: true })
  provider: string;

  @IsOptional()
  @Column({ nullable: true })
  providerId: string;

  @IsOptional()
  @Column({ default: 0 })
  reportScore: number;

  @IsOptional()
  @Column({ default: 0 })
  totalHackCount: number;

  @IsOptional()
  @Column({ default: 0 })
  totalScheduleDay: number;
}
