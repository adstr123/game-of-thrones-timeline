var express = require('express');
var router = express.Router();
var sqlite3 = require('sqlite3').verbose();
var path = require('path');

// Open db connection
var db = new sqlite3.Database(path.join(__dirname, '..', 'db', 'got.db'), sqlite3.OPEN_READONLY, (err) => {
	if (err) {
		console.log(__filename);
		console.log('Error connecting to got.db');
		console.error(err.message);
	}
	else {
		console.log('Connected to got.db');
	}
});

/* GET characters listing. */
router.get('/:HouseID', (req, res, next) => {
	console.log('Getting Character list for house with id ' + req.params.HouseID)
	var characters = db.all('SELECT * FROM Characters WHERE HouseID=?', req.params.HouseID, function (err, results, fields) {
		if (err) {
			console.log('Error retrieving Characters list')
		}
		console.log("Character list retrieved, Express is attempting to convert to JSON: " + results);
		console.log("Express is attempting to send response to React");
		return res.send(JSON.stringify(results));
		res.end();
		db.close();
	});
});

module.exports = router;
