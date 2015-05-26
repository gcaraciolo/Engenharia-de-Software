// Get the packages we need
var express = require('express');

//read file
var fs = require('fs');

// Create our Express application
var app = express();

// Use environment defined port or 3000
var port = process.env.PORT || 3000;

// Create our Express router
var router = express.Router();

// Initial dummy route for testing
// http://localhost:8080/api
router.get('/', function(req, res) {
  res.json({ message: 'faca uma requisicao post!' });
});

router.post('/',function(req,res){
	var t = req.headers.t;
	t = parseInt(t);
	console.log("new request");
	switch(t) {
		case 1:
			res.json(require('./stubs/listarItens.json'));
		  	break;
		case 2:
			res.json(require('./stubs/listarDetalhes.json'));
	   	  	break;
	   	case 3:
			res.json(require('./stubs/detalharAcervo.json'));
	   		break;
		case 4:
			var matricula = req.headers.m;
			var senha = req.headers.s;
			if (matricula == '2012107995' && senha == '159753') {
				res.json(require('./stubs/login.json'));
			} else {
				res.json({message : 'error',
						  codResp : '-1'});
			}
			break;
		case 5:
			res.json(require('./stubs/renovacao.json'));
	   		break;
	   	case 6:
	   		res.json(require('./stubs/reserva.json'));
	   		break;
		default:
			res.json( {message : 'error' });
		  break;

	}
});


// Register all our routes with /api
app.use('/BibliotecaWeb/Service', router);

// Start the server
app.listen(port);
console.log('Insert beer on port ' + port);