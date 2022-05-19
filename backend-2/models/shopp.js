const mongoose  =require('mongoose')
const Schema  =mongoose.Schema

const shopSchema = new Schema({
    name:{
        type : String
    },

    description :{
        type : String,
   
    },
   
    photo : {
        type :String

    },
    prix : {
        type :String

    }
} , {timestamps: true})

const Shop = mongoose.model('shopp',shopSchema)
module.exports = Shop