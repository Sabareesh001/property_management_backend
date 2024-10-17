const  {PrismaClient}  = require("@prisma/client");
const prisma = new PrismaClient();
module.exports =  prisma;

const checkConnection = async () => {
  try {  
    await prisma.$connect();
    console.log("Database Connected");
  } catch (error)  { 
    console.error("Failed to Connect to Database");
    throw("Failed to Connect to Database",error);
  }  
};

checkConnection();
