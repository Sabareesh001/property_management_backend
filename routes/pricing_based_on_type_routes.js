const express = require('express');
const router = express.Router();
const pricingBasedOnTypesController = require('../controllers/pricing_based_on_types_controller.js')

router.get('/pricing-based-on-types',pricingBasedOnTypesController.getAllPricingBasedOnTypes);

module.exports = router; 