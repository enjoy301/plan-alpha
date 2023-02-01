import { IsNotEmpty, IsOptional } from "class-validator";
import {
  Column,
  CreateDateColumn,
  Entity,
  ManyToOne,
  OneToMany,
  PrimaryGeneratedColumn,
  UpdateDateColumn,
} from "typeorm";
import { Award } from "./Award";
import { Member } from "./Member";

@Entity({ name: "userAward" })
export class UserAward {
  @PrimaryGeneratedColumn()
  id: number;

  @IsNotEmpty()
  @Column()
  @ManyToOne(() => Member, (member) => member.id)
  userId: string;

  @IsNotEmpty()
  @Column()
  @ManyToOne(() => Award, (award) => award.id)
  awardId: string;

  @IsNotEmpty()
  @Column({ default: false })
  isMain: boolean;
}
