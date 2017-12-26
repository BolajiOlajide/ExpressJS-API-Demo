var mongoose = require('mongoose');
var DB_URL = 'mongodb://@mongo:27017/usermanager';

mongoose.connect(DB_URL, { useMongoClient: true });