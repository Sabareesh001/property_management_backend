const express = require('express');
const router = express.Router();
const utilitiesController = require('../controllers/utilities_controller.js')

router.get('/utilities-by-property-id',utilitiesController.getUtilitiesByPropertyUnitId);

module.exports = router; 