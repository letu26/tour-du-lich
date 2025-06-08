import { Router } from "express";
import * as controller from "../controller/user.controller";

const router: Router = Router();

router.post("/login", controller.login);
router.post("/register", controller.register);
router.get("/getuser", controller.getUser);
router.post("/editUser/:id", controller.editUser);
router.delete("/deluser/:id", controller.delUser);

export const userRouter: Router = router;