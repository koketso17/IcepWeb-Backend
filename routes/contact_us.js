
const express = require('express');
const mysql = require('mysql');
const router = express.Router();
const db = require('../conn/conn');
const  nodemailer = require('nodemailer');

router.post('/send',function(req, res){

    var transport = nodemailer.createTransport({
        service: 'Gmail',
        auth: {
                user: 'kktsmodise7@gmail.com',
                pass: '#19961117mds'
        }
    });
    
    var mailOption = {
        from: 'tyrusbeatzsa@gmail.com',
        to: 'kktsmodise7@gmail.com',
        subject: "Icep",
        text: 'Enquiries regarding ICEP'
    }
    
    transport.sendMail(mailOption,function(err, res, info){
        if(err){
            res.send({
                message: err,
                status: 400
    
            })
        }else{
            res.json({
                status:  200,
                message: "Thank you for contacting us. We'll reply you as soon as possible."
            })
        }
    })
})


module.exports = router ;
