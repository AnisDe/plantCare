const { error } = require('console')
const { response } = require('express')


const Shopp = require('../models/shopp')


const add= async (req, res) => {

    const { name,description,prix} = req.body;
    const{avatar}=req.file.filename;
    console.log(
        req.body.name
    )
    console.log(
        req.body.description
    )
    console.log(
        req.body.prix
    )
    console.log(
        req.file.filename
    )

    let nouvelleshop = new Shopp({});

    nouvelleshop.name = name;
    nouvelleshop.description = description;
    nouvelleshop.prix = prix;
    nouvelleshop.photo = req.file.filename;
    console.log (
        nouvelleshop
    )
  
    
    nouvelleshop.save();

    res.status(201).send({ message: "success", shopp: nouvelleshop });
}
   
const recuperershopp = async (req, res) => {

    var shopp;
    if (req.body._id) {
        shopp = await Shopp.findById(req.body._id)
    } else {
        shopp = await Shopp.find()
    }

    res.status(201).send({ message: "success", shopp: shopp });
}

module.exports ={
    add,recuperershopp
 }