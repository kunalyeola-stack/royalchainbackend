import { kafka } from './kafka.client';

export const producer = kafka.producer();

export const connectProducer = async (): Promise<void> => {

    await producer.connect();

    console.log('Kafka Producer Connected');
};

export const publishMessage = async (
    topic: string,
    data: any
): Promise<void> => {

    await producer.send({
        topic,
        messages: [
            {
                value: JSON.stringify(data),
            },
        ],
    });

    console.log(`Message Published To ${topic}`);
};