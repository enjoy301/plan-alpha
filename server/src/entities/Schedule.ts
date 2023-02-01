import { IsNotEmpty } from "class-validator";
import { Column, Entity, ManyToOne, PrimaryGeneratedColumn } from "typeorm";
import { Member } from "./Member";

@Entity({ name: "schedule" })
export class Schedule {
  @PrimaryGeneratedColumn()
  id: number;

  @IsNotEmpty()
  @Column()
  @ManyToOne(() => Member, (member) => member.id)
  userId: number;

  @IsNotEmpty()
  @Column({ type: "date" })
  date: Date;

  @IsNotEmpty()
  @Column("varchar", { length: 10000 })
  content: string;
}
