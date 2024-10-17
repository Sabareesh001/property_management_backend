const express = require('express');
const router = express.Router();
const propertyUnitController = require('../controllers/property_units_controller.js')
router.get('/property-units',propertyUnitController.getAllUnits);

module.exports = router; 