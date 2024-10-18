const prisma = require("../model/prisma");

exports.getAllUnits = async (req, res) => {
  try {
    const result = await prisma.property_units.findMany({
      include: {
        primary_pricing: true,
        secondary_pricing: true,
        one_time_cost_pricing: true,
        refundables_pricing: true,
        inventory_pricing: true,
        parking_pricing: true,
        companies:true
      },
      where:{
        is_active:true
      }
    });

    const formattedResult = result.map(unit => {
      // Convert decimal strings to floats
      const convertDecimalToFloat = (pricing) => {
        if (!pricing) return pricing;
        return {
          ...pricing,
          uom_value: parseFloat(pricing.uom_value),
          maximum: pricing.maximum ? parseFloat(pricing.maximum) : null,
          minimum: pricing.minimum ? parseFloat(pricing.minimum) : null,
          recommended: pricing.recommended ? parseFloat(pricing.recommended) : null,
          discount: pricing.discount ? parseFloat(pricing.discount) : null,
          item_unit_price: pricing.item_unit_price ? parseFloat(pricing.item_unit_price) : null,
        };
      };
    
      // Convert image_list string into an array
      const imageListArray = unit.image_list ? unit.image_list.split(",") : [];

      return {
        ...unit,
        area_in_sqft: parseFloat(unit.area_in_sqft),  // Convert area_in_sqft to float
        primary_pricing: convertDecimalToFloat(unit.primary_pricing),
        secondary_pricing: convertDecimalToFloat(unit.secondary_pricing),
        one_time_cost_pricing: convertDecimalToFloat(unit.one_time_cost_pricing),
        refundables_pricing: convertDecimalToFloat(unit.refundables_pricing),
        inventory_pricing: convertDecimalToFloat(unit.inventory_pricing),
        parking_pricing: convertDecimalToFloat(unit.parking_pricing),
        image_list: imageListArray, 
        amenities:[],
        utilities:[]
      };
    });

    if (formattedResult?.length === 0) {
      throw { statusCode: 500, response: { message: 'No property units found' } };
    }

    res.send(formattedResult);
  } catch (error) {
    console.log(error);
    res.status(error.statusCode || 500).send(error.response || { message: "Couldn't fetch property units" });
  }
};
