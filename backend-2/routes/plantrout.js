const express = require('express')
const  router = express.Router()


const plantecontro  = require('../controllers/plantecontro')


const upload    = require('../middleware/upload')

 
router.post('/store',upload.single('photo'), plantecontro.store)
router.get('/show',plantecontro.index)


module.exports= router  