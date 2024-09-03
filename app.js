var express=require("express");
var bodyParser=require("body-parser");
//const User = require("./model/details"); 
const mongoose = require('mongoose');
mongoose.connect('mongodb://127.0.0.1:27017/gfg');
var db=mongoose.connection;
db.on('error', console.log.bind(console, "connection error"));
db.once('open', function(callback){
	console.log("connection succeeded");
})
// User.js 
const Schema = mongoose.Schema 
var details = new Schema({ 
	name: { 
		type: String 
	}, 
  email:{
    type:String
  },
	password: { 
		type: String 
	},
  phone:{
    type:Number
  }
}) 

var User = mongoose.model('details', details)

var app=express()


app.use(bodyParser.json());
app.use(express.static('public'));
app.use(bodyParser.urlencoded({
	extended: true
}));

app.post('/signup', function(req,res){
	var name = req.body.uname;
	var email =req.body.email;
	var pass = req.body.pwd;
	var gender =req.body.gender;

	var data = {
		"name": name,
		"email":email,
		"password":pass,
		"Gender":gender,
	}
db.collection('details').insertOne(data,function(err, collection){
		if (err) throw err;
		console.log("Record inserted Successfully");
			
	});
		
	return res.redirect('account.html');
})

app.post("/login", async function(req, res){
	var user = await User.findOne({ name: req.body.uname,password:req.body.pwd}); 
	console.log(user); 
    try { 
        // check if the user exists 
        if (user) { 
            res.redirect("main.html"); 
          } 
		  else { 
          res.status(400).json({ error: "User doesn't exist" }); 
        } 
      } 
	  catch (error) { 
        res.status(400).json({ error }); 
      } 
}); 
app.get("/account.html", isLoggedIn, function (req, res) { 
    res.redirect("account.html"); 
}); 

app.get('/',function(req,res){
res.set({
	'Access-control-Allow-Origin': '*'
	});
return res.redirect('main.html');
}).listen(3000)

function isLoggedIn(req, res, next) { 
    if (req.isAuthenticated()) return next(); 
    res.redirect("/account.html"); 
} 
console.log("server listening at port 3000");