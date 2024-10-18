const prisma = require("../model/prisma")

exports.getUtilitiesByPropertyUnitId = async(req, res) => {
    console.log(req.body);
    const propertyUnitId = req.query?.property_unit_id;

    try {
        if (!propertyUnitId) {
            throw { statusCode: 400, response: { message: "Invalid property unit id" } };
        }

        const result = await prisma.property_unit_utilities.findMany({
            where: {
                property_unit_id: propertyUnitId,
                is_active: true
            },
            select: {
                utilities: true
            }
        });

        // Convert price to float
        const formattedResult = result.map(item => ({
                ...item.utilities,
                price: parseFloat(item.utilities.price)}));

        res.send(formattedResult);
    } catch (error) {
        res.status(error.statusCode || 500).send(error.response || 'Couldn’t fetch Amenities');
    }
};


