const express = require('express');
const router = express.Router();
const componentBasedOnTypesController = require('../controllers/component_based_on_types_controller.js')

router.get('/component-based-on-types',componentBasedOnTypesController.getAllComponentBasedOnTypes);

module.exports = router; 