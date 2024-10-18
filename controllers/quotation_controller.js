const prisma = require("../model/prisma");

exports.createQuotation = async (req, res) => {
  console.log(req.body);
  const reqData = req.body;

  try {
    const quotation = await prisma.quotations.create({
      data: {
        user_id: reqData?.user_id,
        lease_end_date: reqData.quotation_details.lease_end_date,
        lease_start_date: reqData.quotation_details.lease_start_date,
        rent_start_date: reqData.quotation_details.rent_start_date,
        grace_period: reqData.quotation_details.grace_period,
      },
    });
    for (const data of reqData.unitsData) {
      try {
        const quoted_pricings = await prisma.$transaction([
          prisma.quoted_primary_pricing.create({ data: data?.primary_pricing }),
          prisma.quoted_secondary_pricing.create({
            data: data?.secondary_pricing,
          }),
          prisma.quoted_one_time_cost_pricing.create({
            data: data?.one_time_cost_pricing,
          }),
          prisma.quoted_refundables_pricing.create({
            data: data?.refundables_pricing,
          }),
          prisma.quoted_inventory_pricing.create({
            data: data?.inventory_pricing,
          }),
          prisma.quoted_parking_pricing.create({ data: data?.parking_pricing }),
          prisma.quoted_property_units.create({
            data: {
              property_id: data.id,
              primary_pricing_id: null,
              secondary_pricing_id: null,
              one_time_cost_pricing_id: null,
              refundables_pricing_id: null,
              inventory_pricing_id: null,
              parking_pricing_id: null,
            },
          }),
        ]);

        const updatedQuotedUnits = await prisma.quoted_property_units.update({
          where: { id: quoted_pricings[6].id },
          data: {
            primary_pricing_id: quoted_pricings[0].id,
            secondary_pricing_id: quoted_pricings[1].id,
            one_time_cost_pricing_id: quoted_pricings[2].id,
            refundables_pricing_id: quoted_pricings[3].id,
            inventory_pricing_id: quoted_pricings[4].id,
            parking_pricing_id: quoted_pricings[5].id,
          },
        });

        const amenityEntryData =
          data.amenities.map((amenity) => {
            return {
              quoted_property_unit_id: quoted_pricings[6].id,
              amenity_id: amenity.id,
              is_free: amenity.isFree,
            };
          }) || [];

        const utilitiesEntryData =
          data.utilities.map((utility) => {
            return {
              quoted_property_unit_id: quoted_pricings[6]?.id,
              utility_id: utility?.id,
              is_free: utility.isFree,
            };
          }) || [];

        await prisma.$transaction([
          prisma.quoted_property_unit_amenities.createMany({
            data: amenityEntryData,
          }),
          prisma.quoted_property_unit_utilities.createMany({
            data: utilitiesEntryData,
          }),
          prisma.quotation_quoted_properties.create({
            data: {
              quoted_property_id: quoted_pricings[6]?.id,
              original_property_id: data?.id,
              quotation_id : quotation.id
            },
          }),
        ]);

        console.log(
          "Transaction successful:",
          quoted_pricings,
          updatedQuotedUnits
        );
      } catch (error) {
        console.error("Transaction failed:", error);
      }
    }

    res.send("Done");
  } catch (error) {
    console.log(error);
    res
      .status(error.statusCode || 500)
      .send(error.response || "Couldn’t post Quotations");
  }
};
