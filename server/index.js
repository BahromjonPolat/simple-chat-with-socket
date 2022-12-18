const express = require("express");
const cors = require("cors");
const mongoose = require("mongoose");
const authRoutes = require("./routes/auth");
const messageRoutes = require("./routes/messages");
const logger = require('morgan');
const app = express();
const socket = require("socket.io");
const { emit } = require("./models/messageModel");
require("dotenv").config();

app.use(logger('dev'));
app.use(cors());
app.use(express.json());

mongoose
  .connect('mongodb://127.0.0.1:27017', {
    useNewUrlParser: true,
    useUnifiedTopology: true,
  })
  .then(() => {
    console.log("DB Connetion Successfull");
  })
  .catch((err) => {
    console.log(err.message);
  });

app.use("/api/auth", authRoutes);
app.use("/api/messages", messageRoutes);

const server = app.listen(5000, () =>
  console.log(`Server started on ${5000}`)
);
const io = socket(server, {
  cors: {
    origin: "http://localhost:3000",
    credentials: true,
  },
});

global.onlineUsers = new Map();

io.on("connection", (socket) => {

  console.log('======== CONNECTED ===========');
  global.chatSocket = socket;
  socket.on("add-user", (userId) => {
    console.log(userId);
    onlineUsers.set(userId, socket.id);
  });

  socket.on("send-msg", (data) => {
    console.log(data.message);
    const sendUserSocket = onlineUsers.get(data.to);
    if (sendUserSocket) {
      socket.to(sendUserSocket).emit("msg-recieve", data.msg);
    }
  });
});
























// require("dotenv").config();
// const express = require("express");
// const cors = require("cors");
// const mongoose = require("mongoose");
// const authRoutes = require("./routes/auth");
// const messageRoutes = require("./routes/messages");
// const socket = require("socket.io");
// const app = express();
// const server = require('http').createServer(app);

// app.use(cors());
// app.use(express.json());

// mongoose
//   .connect(process.env.MONGO_URL, {
//     useNewUrlParser: true,
//     useUnifiedTopology: true,
//   })
//   .then(() => {
//     console.log("DB Connetion Successfull");
//   })
//   .catch((err) => {
//     console.log(err.message);
//   });

// app.use("/api/auth", authRoutes);
// app.use("/api/messages", messageRoutes);

// // const server = app.listen(process.env.PORT, () =>
// //   console.log(`Server started on ${process.env.PORT}`)
// // );
// const io = socket(server, {
//   // cors: {
//   //   origin: "http://localhost:3000",
//   //   credentials: true,
//   // },
// });

// server.listen(process.env.PORT, () =>{
//   console.log(`Server started on ${process.env.PORT}`)
// });

// global.onlineUsers = new Map();
// io.on("connection", (socket) => {
//   console.log(socket);
//   global.chatSocket = socket;
//   socket.on("add-user", (userId) => {
//     onlineUsers.set(userId, socket.id);
//   });

//   socket.on("send-msg", (data) => {
//     const sendUserSocket = onlineUsers.get(data.to);
//     if (sendUserSocket) {
//       socket.to(sendUserSocket).emit("msg-recieve", data.msg);
//     }
//   });
// });

