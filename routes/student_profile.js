const express = require('express');
const mysql = require('mysql');
const router = express.Router();
const db = require('../conn/conn');

//get student profile

router.get('/student_profile', function(req, res){

    const email = req.body.email;

    var myQuery = "SELECT * FROM register ";
    

    db.query (myQuery, [email], function(err, results){
        if(err){
            
            res.send({
                code : 400,
                message : err
            })
        }else{
            
            
            res.send({results

            })
         }
    })
});

module.exports = router ;