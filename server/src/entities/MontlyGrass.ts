import { IsNotEmpty } from "class-validator";
import { Column, Entity, ManyToOne, PrimaryGeneratedColumn } from "typeorm";
import { Member } from "./Member";

@Entity({ name: "montlyGrass" })
export class MontlyGrass {
  @PrimaryGeneratedColumn()
  id: number;

  @IsNotEmpty()
  @Column()
  @ManyToOne(() => Member, (member) => member.id)
  userId: number;

  @IsNotEmpty()
  @Column()
  date: string;

  @IsNotEmpty()
  @Column()
  degree: number;
}
