const express = require('express')
const  router = express.Router()


const suivirout  = require('../controllers/suiviController')


const upload    = require('../middleware/upload')

 
router.post('/store',upload.array('photo'), suivirout.store)
router.get('/show',suivirout.index)
router.get('/fetchAll',suivirout.fetchAll)
router.get('/fetchbyid',suivirout.fetchbyid)


module.exports= router  