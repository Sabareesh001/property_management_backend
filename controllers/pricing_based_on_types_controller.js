const prisma = require("../model/prisma")

exports.getAllPricingBasedOnTypes = async(req,res)=>{
    try {
   const result = await prisma.master_pricing_based_on.findMany({
    where:{
        is_active:true
      }
   });
        res.send(result);
    } catch (error) {
        res.status(500).send(error.message || 'Couldnt fetch Component Based On Types');
     }
} 


