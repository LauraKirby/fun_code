var express = require("express");
var router = express.Router();
var Question = require("./models").Question;

router.param("qID", function(req,res,next,id){
  Question.findById(id, function(err, doc){
    if(err) return next(err);
    if(!doc) {
      err = new Error("Not Found");
      err.status = 404;
      return next(err);
    }
    req.question = doc;
    return next();
  });
});

GET /questions
Route for questions collection
sort for most recent first
router.get("/", function(req, res, next){
  Question.find({})
        .sort({createdAt: -1})
        .exec(function(err, questions){
          if(err) return next(err);
          res.json(questions);
        });
});

// router.get("/", function(req, res){
//   Question.find({}, function(err, questions){
//     res.json(questions);
//    });
// });

// POST /questions
// Route for creating questions
router.post("/", function(req, res, next){
  var question = new Question(req.body);
  question.save(function(err, question){
    if(err) return next(err);
    res.status(201);
    res.json(question);
  });
});

// GET /questions/:id
// Route for specific questions
router.get("/:qID", function(req, res, next){
  res.json(req.question);
});


// PUT /questions/:qID/answers/:aID
// Edit a specific answer
router.put("/:qID", function(req, res){
  req.question.update(req.body, function(err, result){
    if(err) return next(err);
    res.json(result);
  });
});

// DELETE /questions/:qID
// Delete a specific question
router.delete("/:qID", function(req, res){
  req.question.remove(function(err){
    if(err) return next(err);
    res.json({});
  });
});


module.exports = router;
















