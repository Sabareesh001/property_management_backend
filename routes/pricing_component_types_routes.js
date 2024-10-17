const express = require('express');
const router = express.Router();
const pricingComponentTypesController = require('../controllers/pricing_components_controller.js')

router.get('/pricing-component-types',pricingComponentTypesController.getAllPricingComponentTypes);

module.exports = router; 