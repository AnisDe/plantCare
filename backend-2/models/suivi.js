const mongoose  =require('mongoose')
const Schema  =mongoose.Schema

const suiviSchema = new Schema({
    name:{
        type : String
    },

    description :{
        type : String,
   
    },
   
    photo : [{
        type :String

    }],
    etat : {
        type :String

    },
    
} , {timestamps: true}

)




const suivi = mongoose.model('suivi',suiviSchema)
module.exports = suivi