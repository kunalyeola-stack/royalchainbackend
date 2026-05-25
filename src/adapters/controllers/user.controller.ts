import { Request , Response } from "express";

export const gerUser = async (req: Request, resp: Response) =>{
    try {
        return resp.status(200).send("Success to deploy CICD")
    } catch (error) {
        return resp.status(400).
        send("sorry")
    }
}