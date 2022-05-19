const suivi   = require('../models/suivi')




const store = (req, res, next)=>{

    console.log(
        req.body.name
)
console.log(
    req.body.description
)
console.log(
    req.body.etat
)
console.log(
    req.files
)


    let suiv = new suivi({
        name: req.body.name,
        description:req.body.description,
        etat:req.body.etat,
    })

    for (var i = 0; i < req.files.length; i++) {
        suiv.photo[i]= req.files[i]["filename"]
    }
    suiv.save()
    .then(suiv=>{
      console.log(' plant add with succes ! ')
       return res.json({
          

            name: suiv.name,
            description : suiv.description,
            etat : suiv.etat,
            photo : suiv.photo


        })
    })


    .catch(error =>{
        console.log('user erreur2')
        res.json({
            message :'An error with adding suivi!'
        })
    })


}


const index = async (req, res) => {

    var suivy;
    if (req.body._id) {
        suivy = await suiv.findById(req.body._id)
    } else {
        suivy = await suiv.find()
    }

    res.send({ suivy })
}
const fetchAll = async (req, res) => {

    let suivy = await suivi.find()

    res.send({ suivy })
}
const fetchbyid = async (req, res) => {

    suivy = await suivi.findById(req.body.id)

    res.send(suivy)
}
module.exports={
    store,index,fetchAll,fetchbyid
}