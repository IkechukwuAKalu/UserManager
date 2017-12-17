var mongoose = require('mongoose');
mongoose.connect(process.env.DB_URL, { useMongoClient: true });

mongoose.connection.once('open', () => {
    console.log('Datbase connected...');
}).on('error', (err) => {
    console.log(`Error occured while connecting to database: ${err}`);
})