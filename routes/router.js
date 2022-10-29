const router = require('express').Router();
const baseAuthentication = require('../util/auth.js');
const userController = require('../Controller/usersController.js');
const docController = require('../Controller/docController');
const multer = require('multer');

// GET Method

router.get("/healthz", (req, res) => {
    console.log("Api connected Successfully")
    res.sendStatus(200).json();
});

// POST Method

router.post("/v1/user", userController.createUser);

// GET Method (With Authentication)

router.get("/v1/user/:id", baseAuthentication() , userController.getUser);

// PUT Method

router.put("/v1/user/:id", baseAuthentication() , userController.updateUser);


const upload = multer({
    dest: 'uploads/'
})

router.post("/v1/document", baseAuthentication(), upload.single('file'), docController.updateUserDoc);

// Get Picture

router.get("/v1/document/:id", baseAuthentication(), docController.getUserDoc);

// Delete Picture

router.delete("/v1/document/:id", baseAuthentication(), docController.deleteUserDoc);

module.exports = router;
