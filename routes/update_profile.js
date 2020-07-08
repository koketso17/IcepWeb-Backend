const express = require('express');
const router = express.Router();
const mysql = require('mysql');
const  db = require('../conn/conn');

//Update profile
router.put('/update_profile',(req,res)=>{   

    let student = req.body;
    var sql = "SET @id = ?;SET @first_name = ?;SET @last_name = ?;SET @phone_no = ?;SET @email = ?;SET @password = ?;\
    CALL update_profile(@id,@first_name,@last_name,@phone_no,@email,@password);";

    db.query(sql,[student.id,student.first_name,student.last_name,student.phone_no,student.email,student.password],(err,rows,fields)=>{
        if(!err)
           res.send('Updated...');
        else
            console.log(err);
    })
    
});
module.exports = router ;