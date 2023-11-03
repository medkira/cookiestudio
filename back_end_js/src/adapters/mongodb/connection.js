export default function connection(mongoose){
  function connectToMongo(){
    mongoose
    .createConnection("mongodb://127.0.0.1:27017/cookieStudio")
    .on("open", () => {
      console.log("MongoDb Connected");
    })
    .on("error", () => {
      console.log("MongoDb connection error");
    });
  }

  return {
    connectToMongo,
  };
}





// import mongoose from "mongoose";

// const connection = mongoose
//   .createConnection("mongodb://127.0.0.1:27017/cookieStudio")
//   .on("open", () => {
//     console.log("MongoDb Connected");
//   })
//   .on("error", () => {
//     console.log("MongoDb connection error");
//   });

// export default connection;