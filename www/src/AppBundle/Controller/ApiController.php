<?php


namespace AppBundle\Controller;


use AppBundle\Model\CustomerModel;
use Nelmio\ApiDocBundle\Annotation\Model;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\Routing\Annotation\Route;
use Swagger\Annotations as SWG;

class ApiController
{
    /**
     * @Route("/api/registration", methods={"POST"})
     * @SWG\Response(
     *     response=200,
     *     description="Register Customer",
     *     @SWG\Schema(
     *         type="boolean",
     *     )
     * )
     * @SWG\Parameter(
     *     name="body",
     *          in="body",
     *          description="JSON Payload",
     *          required=true,
     *          format="application/json",
     *          @SWG\Schema(
     *              type="object",
     *              @SWG\Property(property="title", type="string", example="Mr"),
     *              @SWG\Property(property="firstname", type="string", example="Bob"),
     *              @SWG\Property(property="lastname", type="string", example="Jones"),
     *              @SWG\Property(property="street", type="string", example="Domkloster 4"),
     *              @SWG\Property(property="zip", type="string", example="50668"),
     *              @SWG\Property(property="email", type="string", example="test@test.com"),
     *              @SWG\Property(property="city", type="string", example="Köln"),
     *              @SWG\Property(property="country", type="string", example="FR"),
     *              @SWG\Property(property="phone", type="string", example="34343243243"),
     *              @SWG\Property(property="password", type="string", example="MyMasterPass1234"),
     *          )
     * )
     * @return JsonResponse
     */
    public function registerAction(Request $request)
    {
        $data = json_decode($request->getContent());
        try {
            (new CustomerModel())->register($data);
        } catch (\Exception $e) {
            return new JsonResponse($e->getCode(), 422);
        }

        return new JsonResponse('success', 200);
    }
}
