import { Injectable } from '@nestjs/common';
import { User as UserProps } from '../models';
import { User } from '../../database/entities/user.entity';
import { InjectRepository } from '@nestjs/typeorm';
import { Repository } from 'typeorm';

@Injectable()
export class UsersService {
  constructor(
    @InjectRepository(User)
    private readonly userRepository: Repository<User>,
  ) {}

  async findOne(userName: string): Promise<UserProps> {
    return await this.userRepository.findOne({
      where: {
        name: userName,
      },
    });
  }

  async createOne({ name, password }: UserProps): Promise<UserProps> {
    const user = this.userRepository.create({ name, password });
    return await this.userRepository.save(user);
  }
}
