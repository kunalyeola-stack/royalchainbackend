import { Router } from "express";
import {gerUser} from "../controllers/user.controller"

const router = Router();

router.get('/', gerUser);

export default router;



