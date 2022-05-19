const express = require('express')
const  router = express.Router()


const AuthController  = require('../controllers/AuthController')
 
router.post('/register',AuthController.register)
router.post('/login',AuthController.login)
router.post("/reEnvoyerConfirmationEmail", AuthController.reEnvoyerConfirmationEmail);
router.get("/confirmation/:token", AuthController.confirmation);
router.post("/motDePasseOublie", AuthController.motDePasseOublie);
router.put("/changerMotDePasse", AuthController.changerMotDePasse);
router.get("/getByToken/:token", AuthController.getByToken);

module.exports= router