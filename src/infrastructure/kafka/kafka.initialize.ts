import {
    connectProducer,
} from './producer';

import {
    connectConsumer,
} from './consumer';

export const initializeKafka = async (): Promise<void> => {

    try {

        const TOPIC_NAME = 'test-topic';

        // Connect Producer
        await connectProducer();

        // Connect Consumer
        await connectConsumer(TOPIC_NAME);

        console.log('Kafka Initialized Successfully');

    } catch (error) {

        console.log('Kafka Initialization Error:', error);

        throw error;
    }
};