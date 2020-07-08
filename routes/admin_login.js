
const express = require('express');
const mysql = require('mysql');
const router = express.Router();
const db = require('../conn/conn');

router.get('/admin',function(req,res){

    
        var username= req.body.username;
        var password = req.body.password;
        db.query('SELECT * FROM admin_reg WHERE username = ?',[username], function (error, results, fields) {
        if (error) {

          res.send({
            "code":400,
            "failed":"error ocurred"
          })
        }else{
         
          if(results.length >0){
            if(results[0].password == password){
                
                var username = req.body.username
                db.query('select * from admin_reg where username = ?',[username], function(err, results, fields){  
                    return res.send(results)
                })
            }
            else{
              res.send({
                "code":204,
                "success":"Username and password does not match"
                  });
            }
          }
          else{
            res.send({
              "code":204,
              "success":"Username does not exist"
               });
          }
        }
    });

})


module.exports = router ;