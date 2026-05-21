import { kafka } from './kafka.client';

export const consumer = kafka.consumer({
    groupId: 'backend-group',
});

export const connectConsumer = async (
    topic: string
): Promise<void> => {

    await consumer.connect();

    console.log('Kafka Consumer Connected');

    await consumer.subscribe({
        topic,
        fromBeginning: true,
    });

    console.log(`Subscribed To Topic: ${topic}`);

    await consumer.run({

        eachMessage: async ({
            topic,
            partition,
            message,
        }) => {

            console.log('--------------------------------');
            console.log('Topic:', topic);
            console.log('Partition:', partition);
            console.log(
                'Message:',
                message.value?.toString()
            );
            console.log('--------------------------------');
        },
    });
};