const prisma = require("../model/prisma")

exports.getAllUsers = async(req,res)=>{
    try {
   const result = await prisma.users.findMany();
        res.send(result);
    } catch (error) {
        res.status(500).send(error.message || 'Couldnt fetch Users');
     }
} 

exports.getUserById = async(req,res) =>{
    const id = req.params.id;
    try {
        if(!id){
            throw({statusCode:400,response:{message:'Invalid User Id'}})
        }
        const result = await prisma.users.findUnique({where:{
            id: id
        }})
        if(!result){
            throw({statusCode:400,response:{message:'Invalid User Id'}})
        }
        res.send(result);
    } catch (error) {
        res.status(error.statusCode || 500).send(error.response || {message:"Coundn't fetch User"});
    }
}

