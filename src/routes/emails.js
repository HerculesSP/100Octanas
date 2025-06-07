var express = require("express");
var router = express.Router();
var emailController = require("../controllers/emailController");

router.get("/confirmarConta", function (req, res) {
    emailController.confirmarConta(req, res);
});


module.exports = router;