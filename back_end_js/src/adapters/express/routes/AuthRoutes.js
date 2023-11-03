export default function authRouter(express){
    const router = express.Router();

    router.route('/login').post(controller.loginuser);

    return router;
}