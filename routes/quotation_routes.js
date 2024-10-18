const express = require('express');
const router = express.Router();
const quotationController = require('../controllers/quotation_controller.js')

router.post('/quotation',quotationController.createQuotation);

module.exports = router; 