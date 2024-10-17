const prisma =  require('../../model/prisma.js');

const createUsers = async()=>{
      await prisma.users.create({data:{name:"Sabareesh",mobile_no:"9888888888",email:"sabareesh.cs22@bitsathy.ac.in",created_at:new Date(),is_active:true}})
}

const createMasterRevenueType =  async()=>{
      await prisma.master_revenue_types.createMany({data:[
            {
                  name:'Lease'
            },
            {
                  name:'Sales'
            },
            {
                  name:'Manage'
            },
            {
                  name:'Stay'
            }
      ]})
}

const createMasterPricingComponentTypes = async() =>{
      await prisma.master_pricing_component_types.createMany({data:[
            {
                  name:'Pricing Component'
            },
      ]})
}

const createMasterGroups = async()=>{
      await prisma.master_tax_groups.createMany({
            data:[
                  {
                        name:"GST"
                  }
            ]
      })
}

const createMasterComponentsBasedOn = async()=>{
      await prisma.master_components_based_ons.createMany({
            data:[
                  {
                        id:1,
                        name:"Amount"
                  },
                  {
                        id:2,
                        name:"UOM"
                  }
            ]
      })
}

const createCompany = async()=>{
     const result =  await prisma.companies.create({data:{
            name:"Jumeriah Estate"
      }})
     const companyId = result.id;
     createPrimaryPricing(companyId);
}

const createPrimaryPricing = async(company_id)=>{
    const primary_pricing =   await prisma.primary_pricing.create({data:{
            revenue_type:1,
            pricing_component:1,
            tax_group:1,
            component_based_on:1,
            uom_value:2000,
            maximum:190,
            minimum:100,
            recommended:150,
            discount:0.00
      }})

      const secondary_pricing =   await prisma.secondary_pricing.create({data:{
            revenue_type:1,
            pricing_component:1,
            tax_group:1,
            component_based_on:1,
            uom_value:200,
            discount:0.00
      }})

      const one_time_cost_pricing =   await prisma.one_time_cost_pricing.create({data:{
            revenue_type:1,
            pricing_component:1,
            tax_group:1,
            component_based_on:1,
            uom_value:200,
            discount:0.00
      }})
 
      const refundables_pricing =   await prisma.refundables_pricing.create({data:{
            revenue_type:1,
            pricing_component:1,
            tax_group:1,
            component_based_on:1,
            uom_value:2000,
            discount:0.00
      }})
        
      const inventory_pricing =   await prisma.inventory_pricing.create({data:{
            revenue_type:1,
            pricing_component:1,
            tax_group:1,
            component_based_on:1,
            item_unit_price:100,
            quantity:10,
            discount:0.00
      }})

      const parking_pricing =   await prisma.parking_pricing.create({data:{
            revenue_type:1,
            pricing_component:1,
            tax_group:1,
            component_based_on:1,
            is_changable:true,
            uom_value:100,
            discount:0.00
      }})
      createPropertyUnits(company_id,primary_pricing.id,secondary_pricing.id,one_time_cost_pricing.id,refundables_pricing.id,
            inventory_pricing.id,parking_pricing.id
      );
}

const createPropertyUnits = async(companyId,primary_pricing,secondary_pricing,one_time_cost_pricing
      ,refundables_pricing,inventory_pricing,parking_pricing
)=>{
      await prisma.property_units.createMany({
            data:[
                  {
                        name:"Jumeriah Golf Estate",
                        unit_id:"UNT-1234",
                        address:"Rubix Apartment, K Tower, Floor 1",
                        company:companyId,
                        beds:2,
                        baths:2,
                        bhk:2,
                        area_in_sqft:2000,
                        main_image:"https://www.freise-rechtsanwaelte.de/wp-content/uploads/2016/09/MietundWohnungseigentumsrecht-1.jpg",
                        image_list:"https://photos.zillowstatic.com/fp/015ed0c398bb9156fabd3088d39c4155-cc_ft_768.webp,https://photos.zillowstatic.com/fp/015ed0c398bb9156fabd3088d39c4155-cc_ft_768.webp,https://photos.zillowstatic.com/fp/015ed0c398bb9156fabd3088d39c4155-cc_ft_768.webp,https://photos.zillowstatic.com/fp/015ed0c398bb9156fabd3088d39c4155-cc_ft_768.webp,https://photos.zillowstatic.com/fp/015ed0c398bb9156fabd3088d39c4155-cc_ft_768.webp,https://photos.zillowstatic.com/fp/015ed0c398bb9156fabd3088d39c4155-cc_ft_768.webp,https://photos.zillowstatic.com/fp/015ed0c398bb9156fabd3088d39c4155-cc_ft_768.webp",
                        primary_pricing_id:primary_pricing,
                        secondary_pricing_id:secondary_pricing,
                        one_time_cost_pricing_id:one_time_cost_pricing,
                        refundables_pricing_id:refundables_pricing,
                        inventory_pricing_id:inventory_pricing,
                        parking_pricing_id:parking_pricing
                  }
            ]
      })
}


createUsers();
createMasterRevenueType();
createMasterPricingComponentTypes();
createMasterGroups();
createMasterComponentsBasedOn();
createCompany();
