const prisma = require("../model/prisma")

exports.getAllTaxGroups = async(req,res)=>{
    try {
   const result = await prisma.master_tax_groups.findMany({
    where:{
        is_active:true
      }
   });
        res.send(result);
    } catch (error) {
        res.status(500).send(error.message || 'Couldnt fetch Tax Groups');
     }
} 


