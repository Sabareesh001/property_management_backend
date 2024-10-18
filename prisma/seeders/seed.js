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

const createMasterPricingBasedOn = async()=>{
      await prisma.master_pricing_based_on.createMany({
            data:[
                  {
                        id:1,
                        name:"Monthly"
                  },
                  {
                        id:2,
                        name:"Total"
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
            pricing_based_on:1,
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

const createPropertyUnits = async (
      companyId,
      primary_pricing,
      secondary_pricing,
      one_time_cost_pricing,
      refundables_pricing,
      inventory_pricing,
      parking_pricing
    ) => {
      try {
        // Create the property unit
        const result = await prisma.property_units.create({
          data: {
            name: "Jumeriah Golf Estate",
            unit_id: "UNT-1234",
            address: "Rubix Apartment, K Tower, Floor 1",
            company: companyId,
            beds: 2,
            baths: 2,
            bhk: 2,
            area_in_sqft: 2000,
            main_image: "https://www.freise-rechtsanwaelte.de/wp-content/uploads/2016/09/MietundWohnungseigentumsrecht-1.jpg",
            image_list: "https://photos.zillowstatic.com/fp/015ed0c398bb9156fabd3088d39c4155-cc_ft_768.webp,https://photos.zillowstatic.com/fp/015ed0c398bb9156fabd3088d39c4155-cc_ft_768.webp,https://photos.zillowstatic.com/fp/015ed0c398bb9156fabd3088d39c4155-cc_ft_768.webp,https://photos.zillowstatic.com/fp/015ed0c398bb9156fabd3088d39c4155-cc_ft_768.webp,https://photos.zillowstatic.com/fp/015ed0c398bb9156fabd3088d39c4155-cc_ft_768.webp,https://photos.zillowstatic.com/fp/015ed0c398bb9156fabd3088d39c4155-cc_ft_768.webp,https://photos.zillowstatic.com/fp/015ed0c398bb9156fabd3088d39c4155-cc_ft_768.webp,https://photos.zillowstatic.com/fp/015ed0c398bb9156fabd3088d39c4155-cc_ft_768.webp",
            primary_pricing_id: primary_pricing,
            secondary_pricing_id: secondary_pricing,
            one_time_cost_pricing_id: one_time_cost_pricing,
            refundables_pricing_id: refundables_pricing,
            inventory_pricing_id: inventory_pricing,
            parking_pricing_id: parking_pricing
          }
        });
    
        // Create amenities and utilities
        const amenities = await createAmenities();
        const utilities = await createUtilities();
    
        // Helper function to associate amenities with the property unit
        const property_unit_amenities = async (unitId, amenityId) => {
          await prisma.property_unit_amenities.create({
            data: {
              property_unit_id: unitId,
              amenity_id: amenityId
            }
          });
        };
    
        // Associate amenities with the property unit
        for (const amenity of amenities) {
          await property_unit_amenities(result.id, amenity.id);
        }
    
        // Helper function to associate utilities with the property unit
        const property_unit_utilities = async (unitId, utilityId) => {
          await prisma.property_unit_utilities.create({
            data: {
              property_unit_id: unitId,
              utility_id: utilityId
            }
          });
        };
    
        // Associate utilities with the property unit
        for (const utility of utilities) {
          await property_unit_utilities(result.id, utility.id);
        }
    
        console.log("Property unit created successfully:", result);
      } catch (error) {
        console.error("Error creating property unit:", error);
      }
    };
    
    const createAmenities = async () => {
      try {
        const amenities = [
          {
            name: "Swimming Pool",
            image: "https://5.imimg.com/data5/SELLER/Default/2024/2/383004961/CI/WW/XZ/1938594/frp-swimming-pools.jpeg",
            price:20.00,
            start_date:new Date(),
            end_date:new Date()
          },
          {
            name: "Tennis Court",
            image: "https://img.olympics.com/images/image/private/t_s_pog_staticContent_hero_xl_2x/f_auto/primary/weyzoz6o394sxfkbest9",
            price:40.00,
            start_date:new Date(),
            end_date:new Date()
          }
        ];
        
        const createdAmenities = await Promise.all(amenities.map(amenity => 
          prisma.amenities.create({ data: amenity })
        ));
        return createdAmenities; // Return created amenities
      } catch (error) {
        console.error("Error creating amenities:", error);
        return []; // Return an empty array on error
      }
    };
    
    const createUtilities = async () => {
      try {
        const utilities = [
          {
            name: "Parking Lot",
            image: "https://parkinglogix.com/wp-content/uploads/2022/07/parking-lot-facebook-1200x600.jpg",
            price:15.00,
            start_date:new Date(),
            end_date:new Date()
          },
          {
            name: "Electricity",
            image: "https://group.met.com/media/omvoe0f3/electricity.jpg?anchor=center&mode=crop&width=1920&rnd=133293326643000000&mode=max&upscale=false",
            price:25.00,
            start_date:new Date(),
            end_date:new Date()
          }
        ];
        
        const createdUtilities = await Promise.all(utilities.map(utility => 
          prisma.utilities.create({ data: utility })
        ));
        return createdUtilities; // Return created utilities
      } catch (error) {
        console.error("Error creating utilities:", error);
        return []; // Return an empty array on error
      }
    };
    


createUsers();
createMasterRevenueType();
createMasterPricingComponentTypes();
createMasterComponentsBasedOn();
createMasterPricingBasedOn();
createMasterGroups();
createCompany();
