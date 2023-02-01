import { IsNotEmpty } from "class-validator";
import { Column, Entity, ManyToOne, PrimaryGeneratedColumn } from "typeorm";
import { Member } from "./Member";

@Entity({ name: "montlySchedule" })
export class MontlySchedule {
  @PrimaryGeneratedColumn()
  id: number;

  @IsNotEmpty()
  @Column()
  @ManyToOne(() => Member, (member) => member.id)
  userId: number;

  @IsNotEmpty()
  @Column()
  title: string;

  @IsNotEmpty()
  @Column({ type: "datetime" })
  startDatetime: Date;

  @IsNotEmpty()
  @Column({ type: "datetime" })
  endDatetime: Date;
}
