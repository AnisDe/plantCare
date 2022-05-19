const Plant   = require('../models/plante')




const store = (req, res, next)=>{

    console.log(
        req.body.name
)
console.log(
    req.body.description
)

console.log(
    req.file.filename
)


    let plant = new Plant({
        name: req.body.name,
        description:req.body.description,
        photo : req.file.filename

     
       
    
    })
    plant.save()
    .then(plant=>{
      console.log(' plant add with succes ! ')
       return res.json({
          

            name: plant.name,
            description : plant.description,
            photo : plant.photo


        })
    })


    .catch(error =>{
        console.log('user erreur2')
        res.json({
            message :'An error with adding plnat!'
        })
    })


}


const index = async (req, res) => {

    var planti;
    if (req.body._id) {
        planti = await Plant.findById(req.body._id)
    } else {
        planti = await Plant.find()
    }

    res.send({ planti })
}

module.exports={
    store,index
}