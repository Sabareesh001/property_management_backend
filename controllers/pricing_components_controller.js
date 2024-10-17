const prisma = require("../model/prisma")

exports.getAllPricingComponentTypes = async(req,res)=>{
    try {
   const result = await prisma.master_pricing_component_types.findMany({
    where:{
        is_active:true
      }
   });
        res.send(result);
    } catch (error) {
        res.status(500).send(error.message || 'Couldnt fetch Pricing Component Types');
     }
} 


