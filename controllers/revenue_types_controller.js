const prisma = require("../model/prisma")

exports.getAllRevenueTypes = async(req,res)=>{
    try {
   const result = await prisma.master_revenue_types.findMany({
    where:{
        is_active:true
      }
   });
        res.send(result);
    } catch (error) {
        res.status(500).send(error.message || 'Couldnt fetch Revenue Types');
     }
} 


