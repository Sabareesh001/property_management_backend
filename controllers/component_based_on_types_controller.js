const prisma = require("../model/prisma")

exports.getAllComponentBasedOnTypes = async(req,res)=>{
    try {
   const result = await prisma.master_components_based_ons.findMany({
    where:{
        is_active:true
      }
   });
        res.send(result);
    } catch (error) {
        res.status(500).send(error.message || 'Couldnt fetch Component Based On Types');
     }
} 


