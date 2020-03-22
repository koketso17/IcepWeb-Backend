const express = require('express');
const router = express.Router();
const mysql = require('mysql');
const  db = require('../conn/conn');


        router.post('/web_posts', function(req, res){  
            var post = {
                
                "posters" : req.body.posters
                
            };
        
            if(!post){
                res.send({
                    code : 400,
                    message : "FALSE"
                })
            }
        
            var myQuery = "INSERT INTO web_posts SET ?";
            db.query(myQuery, [post], function(err, results, fields){
                if(err){
                    
                    res.send({
                        data : err,
                        code : 400,
                        message : "Error sending report..."
                    }); 
                }else{
                    var posters = req.body.posters
                    db.query('select * from web_posts where posters = ?',posters, function(err, results, fields){
                        
                 
                    return res.send(results)
                })
            }
            });
        
        })
module.exports = router;