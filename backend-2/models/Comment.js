const mongoose = require("mongoose")

const CommentSchema = new mongoose.Schema(
  {
    description: { type: String },
    date: {
      type: Date,
      default: Date.now
    },
    User : {
      type : mongoose.Schema.Types.ObjectId, 
      ref: "use"
    },
    post : {
      type : mongoose.Schema.Types.ObjectId, 
      ref: "plante"
    },

  },
  {
    timestamps: { currentTime: () => Date.now() },
  }
)
module.exports = mongoose.model("Comment", CommentSchema)