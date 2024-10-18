const prisma = require("../model/prisma.js");
const express = require("express");
const cors = require("cors");
const dotenv = require("dotenv");
const userRoutes = require("../routes/users_routes.js");
const propertyUnitRoutes = require("../routes/property_unit_routes.js");
const revenueTypeRoutes = require("../routes/revenue_type_routes.js");
const pricingComponentTypeRoutes = require("../routes/pricing_component_types_routes.js");
const taxGroupRoutes = require("../routes/tax_group_routes.js");
const componentBasedOnTypesRoutes = require("../routes/component_based_on_type_routes.js");
const pricingBasedOnTypesRoutes = require("../routes/pricing_based_on_type_routes.js");
const amenitiesRoutes = require("../routes/amenities_routes.js");
const utilitiesRoutes = require("../routes/utilities_routes.js");
const quotationRoutes = require("../routes/quotation_routes.js");
dotenv.config();
const app = express();
app.use(cors());
app.use(express.json());
app.use(
  "/api",
  userRoutes,
  propertyUnitRoutes,
  revenueTypeRoutes,
  pricingComponentTypeRoutes,
  taxGroupRoutes,
  componentBasedOnTypesRoutes,
  pricingBasedOnTypesRoutes,
  amenitiesRoutes,
  utilitiesRoutes,
  quotationRoutes
);
app.listen(process.env.PORT, () => {
  console.log(`server is listening to port ${process.env.PORT}`);
});
