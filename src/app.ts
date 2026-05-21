import express from 'express';
import cors from 'cors';
import helmet from 'helmet';
import morgan from 'morgan';
import { initializeDatabase } from './infrastructure/database/init-db';
// import { connectConsumer } from './infrastructure/kafka/consumer';
import { initializeKafka } from './infrastructure/kafka/kafka.initialize';
import { initializeRedis } from './infrastructure/redis/redis.client';

// import userRoutes from './adapters/routes/user.routes';

const app = express();

app.use(express.json());
app.use(cors());
app.use(helmet());
app.use(morgan('dev'));

// app.use('/api/users', userRoutes);


(async () => {
    initializeDatabase();
    await initializeKafka();
    await initializeRedis();
})

export default app;