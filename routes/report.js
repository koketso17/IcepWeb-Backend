const express = require('express');
const router = express.Router();
const mysql = require('mysql');
const  db = require('../conn/conn');


        router.post('/r', function(req, res){  
            var post = {
                
                "student_no" : req.body.student_no,
                "report" : req.body.report,
                "report_date" : req.body.report_date
                
            };
        
            if(!post){
                res.send({
                    code : 400,
                    message : "FALSE"
                })
            }
        
            var myQuery = "INSERT INTO daily_reports SET ?";
            db.query(myQuery, [post], function(err, results, fields){
                if(err){
                    
                    res.send({
                        data : err,
                        code : 400,
                        message : "Error sending report..."
                    }); 
                }else{
                    var student_no = req.body.student_no
                    db.query('select * from daily_reports where student_no = ?',student_no, function(err, results, fields){
                        
                 
                    return res.send(results)
                })
            }
            });
        
        })
module.exports = router;