var express = require("express");
var router = express.Router();
var Question = require("./models").Question;


// express allows us to trigger a handler whenever a url param is present
// express router method called "param"
// preload the question document so it will be available on any matching routes
// "id" is a placeholder for the value of "questionID" w/i param hash
router.param("questionId", function(req,res,next,id){
  Question.findById(req.params.questionId, function(err, doc){
    if(err) return next(err);
    if(!doc) {
      err = new Error("Nothing Found");
      err.status = 404;
      return next(err);
    }
    req.question = doc;
    return next();
  });
});

router.param("answerId", function(req,res,next,id){
  // sub-documents method called "id" (from mongoose)
  // will find the answer with that id
  req.answer = req.question.answers.id(id);
  if(!req.answer) {
    err = new Error("Nothing Found");
    err.status = 404;
    return next(err);
  }
  next();
});

// GET /questions
// route for questions collection
router.get("/", function(req, res){
  // send json response to client
  res.json({response: "you sent me a GET request"});

});

// POST /questions
// route for creating questions
// second param is called "route handler"
// router.post("/", function(req, res){
//   res.json({
//     response: "you sent me a POST request",
//     body: req.body
//   });
// });

router.post("/", function(req, res, next){
  var question = new Question(req.body);
  question.save(function(err, question){
    if(err) return next(err);
    // status 201, the document was saved successfully
    res.status(201);
    res.json(question);
  });
});


router.get("/", function(req, res, next){
  // "null" meaning we want full documents, not partial
  // without passing a callback, find will return a query builder (not actually complete the query)
  // modify the query, then execute the builder and pass in the callback
  Question.find({})
    .sort({createdAt: -1})
    .exec(function(err, questions){
      if(err) return next(err);
      res.json(questions);
  });
});

// router.post("/", function(req, res){
//   res.json({
//     response: "you sent me a POST request",
//     body: req.body
//   });
// });


// GET /questions/:id
// route for specific question
router.get("/:quetionId", function(req, res, next){
  res.json(req.question);
});


// POST /questions/:quetionId
// route for creating an answer
// router.post("/:quetionId/answers", function(req, res){
//   // send json response to client
//   res.json({
//     response: "you sent me a POST request to /answers",
//     questionId: req.params.questionId,
//     body: req.body
//   });
// });

// POST /questions/:quetionId/answers
router.post("/:quetionId/answers", function(req, res, next){
  req.questions.answers.push(req.body);
  req.question.save(function(err, question){
    if(err) return next(err);
    // status 201, the document was saved successfully
    res.status(201);
    res.json(question);
  });
});


// PUT /questions/:quetionId/answer/:answer_id
router.put("/:quetionId/answers/:answerId", function(req, res){
  req.answer.update(res.body, function(err, result){
    if(err) return next(err);
    res.json(result);
  });
});


// DELETE /questions/:quetionId/answer/:answer_id
// delete an answer
router.delete("/:quetionId/answers/:answerId", function(req, res){
  req.answer.remove(function(err){
    req.question.save(function(err, question){
      if(err) return next(err);
      res.json(question);
    });
  });
});


// POST  /questions/:quetionId/answer/:answer_id/vote-up
// POST  /questions/:quetionId/answer/:answer_id/vote-down
// create a vote

// you can pass in as many anonymous functions as you would like,
// express will allow us to add any number of callback functions
// and it will execute them sequentially

// when using multiple, remember that you need to add the "next" function
// add an function to catch any incorrect voting params
router.post("/:questionId/answers/:answerId/vote-:direction",
  function(req, res, next){
    if(req.params.direction.search(/^(up|down)$/) === -1){
      var err = new Error("Not Found");
      err.status = 404;
      next(err);
    } else {
      next();
    }
  },
  function(req, res){
  res.json({
    response: "you sent me a POST request to vote-" + req.params.direction,
    questionId: req.params.questionId,
    answerId: req.params.answerId,
    vote: req.params.direction
  });
});

// express will return error handling that isn't in JSON



module.exports = router;