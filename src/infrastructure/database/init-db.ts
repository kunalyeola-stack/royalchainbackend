import 'reflect-metadata';
import { DataSource } from 'typeorm';
import dotenv from 'dotenv';
import { User } from './entities/User.entity';

dotenv.config();

export const AppDataSource = new DataSource({
    type: 'postgres',
    host: process.env.DB_HOST,
    port: Number(process.env.DB_PORT),
    username: process.env.DB_USERNAME,
    password: process.env.DB_PASSWORD,
    database: process.env.DB_DATABASE,
    schema: process.env.DB_SCHEMA,

    synchronize: false,
    logging: true,

    entities: [User],
    migrations: [],
    subscribers: [],
});

export const initializeDatabase = () => {
    try {
        AppDataSource.initialize()
        .then(() => {
            console.log("Database Connected Succesfully");
        })
        .catch((error) => {
            console.log("Database connection Error", error);
        })
    } catch (error) {
        console.log("Error", error)
    }
}