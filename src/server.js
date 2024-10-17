const prisma =  require('../model/prisma.js');
const express =  require('express');
const dotenv = require('dotenv');
const userRoutes =  require('../routes/users_routes.js');

dotenv.config();
const app = express();
app.use('/api',userRoutes);  
app.listen(process.env.PORT,()=>{
    console.log(`server is listening to port ${process.env.PORT}`)
})