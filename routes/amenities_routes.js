const express = require('express');
const router = express.Router();
const amenitiesController = require('../controllers//amenities_controller.js')

router.get('/amenities-by-property-id',amenitiesController.getAmenitiesByPropertyUnitId);

module.exports = router; 