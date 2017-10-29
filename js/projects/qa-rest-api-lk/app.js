var express = require("express");
var app = express();
var routes = require("./routes");

// only need json parser
// is a function that will return middleware that we can add to our rout
var jsonParser = require("body-parser").json;
var logger = require("morgan");

app.use(logger("dev"));
// which will be available on req.body
app.use(jsonParser());

app.use("/questions", routes);

var mongoose = require("mongoose");

// 27017 is the default port for mongodb
mongoose.connect("mongodb://localhost:27017/qa");

db.on("error", function(err){
  console.error("connection error: ", err);
  // all database communication goes here
});



// only fires the error the first time it occurs
db.once("open", function(){
  console.log("db connection successful");
});

// will immit db events
var db = mongoose.connection;


// catch 404 and forward to error handler
app.use(function(req, res, next){
  var error = new Error("Not Found");
  error.status = 404;
  next(error);
});


// Error handler
// express knows this is an error handler and not middleware
// bc there are 4 parameters
app.use(function(err, req, res, next){
  res.status(err.status || 500);
  res.json({
    error: {
      message: err.message
    }
  });
});









// // express adds query parameters to the
// app.use(function(req, res, next){
//   console.log("first piece of middleware");
//   // add value to req object by adding a property
//   // value will be accessible in next middleware function

//   req.greeting = "hello call 2";
//   // get localhost:3000/?color=green
//   console.log("the leaves on the tree are: ", req.query.color);
//   next();
// });
// var jsonCheck = function(req, res, next){
//   if (req.body){
//     console.log("The sky is", req.body.color);
//   } else {
//     console.log("There is no body property");
//   }
//   req.body;
//   next();
// };

// app.use("/different/:id", function(req, res, next){
//   console.log("second piece of middleware id: ", req.params.id);
//   console.log(req.greeting);
//   next();
// });




// port to serve the app on
var port = process.env.PORT || 3000;


// start server and listen on the port we set up above
// accepts a callback, will be executed once the server has begun to listen for requests
app.listen(port, function(){
  console.log("Express server is listening on port: ", port);
});


// request from user of the app
// response to client
// next, what to do when complete

// when express calls the function (which is a parameter to "use",
// it passes in 3 arguments)

// next is called by the middleware once the work has been finished
// if next isn't called, the req/res cycle will not finish
// applies middle ware to all routes

// pass control from one middleware function to the next
// call "next()"

// mongodb holds data in entities called documents