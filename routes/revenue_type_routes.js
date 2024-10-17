const express = require('express');
const router = express.Router();
const revenueTypeController = require('../controllers/revenue_types_controller')

router.get('/revenue-types',revenueTypeController.getAllRevenueTypes);

module.exports = router; 