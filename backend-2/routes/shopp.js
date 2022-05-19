const express = require('express')
const  router = express.Router()



const Shoppy  = require('../controllers/shoppController')

const upload    = require('../middleware/upload')

 
// router.post('/add',upload.single('photo'), Medic.add)
// router.get('/aff', Medic.Show)
router.post('/ajou',upload.single('photo'),Shoppy.add)
router.get('/show', Shoppy.recuperershopp)


module.exports= router