const express   = require('express')
const mongoose  = require('mongoose')
const morgan    = require('morgan')
const bodyParser = require('body-parser')
const config = require("./config.json");

const userRoute = require ('./routes/users')
const AuthRoute = require  ('./routes/auth')
const plantrout = require  ('./routes/plantrout')
const Shopy = require  ('./routes/shopp')
const Comment = require  ('./routes/comment-route')
const suivi = require  ('./routes/suivi')


mongoose.connect(config.database,{useNewUrlParser : true , useUnifiedTopology:true})
const db  = mongoose.connection

db.on('error',(err) =>{
    console.log(err)
} )

db.once('open', ()=> {
    console.log('DB Connection Estabblished !')
})



const app=express()

app.use(morgan('dev'))
app.use(bodyParser.urlencoded({extended : true}))
app.use(bodyParser.json())
app.use('/uploads', express.static('uploads'))

const PORT = process.env.PORT || 3000

app.listen(PORT,  ()=> {
    console.log(`server is running on port ${PORT}`)
})


app.use('/api/users',userRoute)
app.use('/api',AuthRoute)
app.use('/plant',plantrout)
app.use('/shop',Shopy)
app.use('/api/Comment',Comment)
app.use('/suiv',suivi)

