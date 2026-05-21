import { Kafka } from 'kafkajs';

export const kafka = new Kafka({
    clientId: 'backend-app',
    brokers: ['localhost:9092'],
});