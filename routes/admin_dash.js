const express = require('express');
const mysql = require('mysql');
const router = express.Router();
const db = require('../conn/conn');


// view all applications infor

router.get('/allApplications', function(require,response){

    db.query("SELECT * from applicantinfo", function(error,results,fields){
        if(error) throw error;
        else
        {
            return response.send({results});
        }
    });
    
});

// view for  application for particular  student
router.get('/viewApplicantinfo/:idno', (req, res) => {

    let idno ={idno:req.body.idno}
 
   db.query('SELECT * FROM applicantinfo WHERE idno = ?',[idno], (error, results,fields) => {
       if(error) throw error;
       res.send({results});
   });
});


// view total applications 

router.get('/TotalApplicants', function(req,res){
    db.query("SELECT count(idno) AS totApplicants from applicantinfo",function(error,results,fields){
        if(error)throw error
        else{
          return res.send({'total Applicants':results})
        }
    })
})

// Accept and Decline application

// DEcline and view all the declined applicants
router.put('/DeclineApplication',(req ,res)=>{

    let idno= req.body.idno
    db.query('UPDATE idno  SET appl_status = 0 where idno=  "'+idno+'"',(error,results,fields)=>
   {
     if(error) throw error
  else 
    {
     db.query('select * from applicantinfo where appl_status = 0',function (error, results, fields){
           return res.send({results})
  
           })
        }
       })
    });
  
// Accept applications

router.put('/AcceptAppl',(req ,res)=>{

    let idno = req.body.idno
    db.query('UPDATE applicantinfo  SET appl_status = 1 where idno =  "'+idno+'"',(error,results,fields)=>
    {
   if(error) throw error
  
  else 
  {
  db.query('select * from applicantinfo where appl_status = 1 ',function (error, results, fields){
      return res.send({results})
  
     })
     }
    }  
   )
});

  // view total number of declined orders
  router.get('/declinedApp',(req,res)=>{
    db.query('SELECT count(idno) AS totAppl from applicantinfo where appl_status = 0 ',(error,results,fields)=>{
      if(error)throw error
      else{
        return res.send({'number of declined applicantions :':results})
      }
    })
  })

  // view number of Accepted applications
  router.get('/AcceptedApp',(req,res)=>{
    db.query('SELECT count(idno) AS totalApplication from applicantinfo where appl_status = 1 ',(error,results,fields)=>{
      if(error)throw error
      else{
        return res.send({'number of Accepted applications :':results})
      }
    })
  })


module.exports = router;
