const express       = require('express');
const path          = require('path')
const app           = express()
const multer        = require('multer')    
const db            = require('../conn/conn'); 
const bodyParser    = require("body-parser");
const DIR           = './uploads';

 
let storage = multer.diskStorage({
    destination: function (req, file, callback) {
      callback(null, DIR);
    },
    filename: function (req, file, cb) {
      cb(null, file.fieldname + '-' + Date.now() + path.extname(file.originalname));
    }
});

let upload = multer({storage: storage});

app.use(bodyParser.urlencoded({ extended: false }));
app.use(bodyParser.json());

app.post('/upload_file',upload.single('file') ,function (req, res) {
   
          var message = "Error! in image upload."
          if (!req.file) {
                console.log("No file received");
                message = "Error! in document upload."
                res.send({message: message, status:'danger'});
        } else{
              
            console.log('file received');
            var sql = `INSERT INTO file_uploads (name, type, size) VALUES ('${req.file.filename}','${req.file.mimetype}','${req.file.size});`;
      
              
            message = "Successfully! uploaded";
            res.send({message: message, status:'success'});
       
            }
      });

module.exports = app ;