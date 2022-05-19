const mongoose  =require('mongoose')
const Schema  =mongoose.Schema

const plantSchema = new Schema({
    name:{
        type : String
    },

    description :{
        type : String,
   
    },
   
    photo : {
        type :String

    },
    user: {
        type: mongoose.Schema.Types.ObjectId,
        ref: "use"
      },
      comments: [{
        type: mongoose.Schema.Types.ObjectId,
        ref: "Comment"
      }],
} , {timestamps: true}

)




const Plant = mongoose.model('plant',plantSchema)
module.exports = Plant