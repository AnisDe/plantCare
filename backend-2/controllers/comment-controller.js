let Comment = require("../models/Comment")
const Plant = require("../models/plante")
const Post = require("../models/plante")
const users = require("../models/Users")
const { use } = require("../routes/comment-route")

exports.recupererCommentParPost = async (req, res) => {
  res.send(
    await Comment.find({
      post: req.body.post,
    }).populate("User post"),
  )
}

exports.recupererComment = async (req, res) => {
    var comm
    comm = await Plant.findById(ID = req.body._id).populate("comments")
    res.status(200).send({ message: "success", com: comm })
}

exports.addComment = async (req, res) => {
  console.log(req.body)
  const { description, user, post } = req.body

  const nouveauComment = new Comment()
  nouveauComment.description = description
  nouveauComment.user = user
  nouveauComment.post = post

  await Plant.findOneAndUpdate(
    { _id: post },
    {
      $push: {
        comments: [nouveauComment._id],
      },
    }
  )

  await users.findOneAndUpdate(
    { _id: user },
    {
      $push: {
        comments: [nouveauComment._id],
      },
    }
  )

  nouveauComment.save()

  res.status(200).send({ message: "success", comment: nouveauComment })
}

exports.editComment = async (req, res) => {
  const { _id, description } = req.body

  let comment = await Comment.findOneAndUpdate(
    { _id: _id },
    {
      $set: {
        description: description,
      },
    }
  )
  res.status(200).send({ message: "success", comment: comment })
}

exports.deleteComment = async (req, res) => {
  const comment = await Comment.findById(req.body._id).remove()
  res.status(200).send({ message: "success", comment: comment })
}

exports.deleteAllComment = async (req, res) => {
  Comment.remove({}, function (err, comment) {
    if (err) {
      return handleError(res, err)
    }
    return res.status(204).send({ message: "Aucun element" })
  })
}
