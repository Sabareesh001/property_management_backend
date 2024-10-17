const express = require('express');
const router = express.Router();
const taxGroupsController = require('../controllers/tax_groups_controller.js')

router.get('/tax-groups',taxGroupsController.getAllTaxGroups);

module.exports = router; 