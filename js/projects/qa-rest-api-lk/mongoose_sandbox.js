

// listen for error
// fires the error each time it occurs
db.on("error", function(err){
  console.error("connection error: ", err);
  // all database communication goes here
});



// only fires the error the first time it occurs
db.once("open", function(){
  var Schema = mongoose.Schema;
  var AnimalSchema = new Schema({
    // add default value
    type: {type: String, default: "goldfish" },
    size: String,
    color: String,
    mass: Number,
    name: String
  });


// save has a prehook
// pre save hook, before item is saved, this will be called
// AnimalSchema.pre
  AnimalSchema.pre("save", function(next){
    if(this.mass > 1000)
  });

  // use animal schema to create a mongoose object called a model
  // will create and save Animal objects
  // will map to the Mongo collection in the database
  // "Animal" will be pluralized


  // create static method on Animal Schema
  AnimalSchema.statics.findSize = function(size, callback){
    // this == Animal
    return this.find({size: size}, callback);
  };

  // create an instance method
  AnimalSchema.methods.findSameColor = function(callback){
    // this == document
    return this.model("Animal").find({color:this.color});
  };

  var Animal = mongoose.model("Animal", AnimalSchema);


  // create Animal document
  // use the constructor function
  // created in app memory
  var elephant = new Animal({
    type: "elephant",
    size: "big",
    color: "gray",
    mass: "6000",
    name: "Lawrence"
  });

  // save all items after remove is complete
  Animal.remove({}, function(err){
    if (err) console.error("Remove Failed.", err);
    // Animals collection is made only once an Animal is created
    // pass in a callback, where "close" db will be called
    elephant.save(function(err){
      if (err) console.error("Save Failed.", err);
      animal.save(function(err){
        if(err)console.error("Save Failed", err);
        animals = Animal.find({});
        elephant = Animal.findOne({type: animals[0].findSameColor});

        // only call db.close after save is complete
        // done communicating with db
        // pass a callback to "close" to log when db has closed
        db.close(function(){
          console.log("db closed");
        });
      });
    });
  });

  // create new generic animal
  var animal = new Animal({}); //Goldfish


});



