var mongoose = require("mongoose");
var Schema = mongoose.Schema;

var QuestionSchema = new Schema({
  text: String,
  createdAt: {type: Date, default: Date.now},
});

// create instance method:
QuestionSchema.method("update", function(updates, callback) {
  Object.assign(this, updates, {updatedAt: new Date()});
  this.save(callback);
});

var Question = mongoose.model("Question", QuestionSchema);





module.exports.Question = Question;