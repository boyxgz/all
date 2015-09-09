package com.surelution.wxmp.jx



import org.junit.*
import grails.test.mixin.*

@TestFor(RegisterPrizeController)
@Mock(RegisterPrize)
class RegisterPrizeControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/registerPrize/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.registerPrizeInstanceList.size() == 0
        assert model.registerPrizeInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.registerPrizeInstance != null
    }

    void testSave() {
        controller.save()

        assert model.registerPrizeInstance != null
        assert view == '/registerPrize/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/registerPrize/show/1'
        assert controller.flash.message != null
        assert RegisterPrize.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/registerPrize/list'

        populateValidParams(params)
        def registerPrize = new RegisterPrize(params)

        assert registerPrize.save() != null

        params.id = registerPrize.id

        def model = controller.show()

        assert model.registerPrizeInstance == registerPrize
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/registerPrize/list'

        populateValidParams(params)
        def registerPrize = new RegisterPrize(params)

        assert registerPrize.save() != null

        params.id = registerPrize.id

        def model = controller.edit()

        assert model.registerPrizeInstance == registerPrize
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/registerPrize/list'

        response.reset()

        populateValidParams(params)
        def registerPrize = new RegisterPrize(params)

        assert registerPrize.save() != null

        // test invalid parameters in update
        params.id = registerPrize.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/registerPrize/edit"
        assert model.registerPrizeInstance != null

        registerPrize.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/registerPrize/show/$registerPrize.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        registerPrize.clearErrors()

        populateValidParams(params)
        params.id = registerPrize.id
        params.version = -1
        controller.update()

        assert view == "/registerPrize/edit"
        assert model.registerPrizeInstance != null
        assert model.registerPrizeInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/registerPrize/list'

        response.reset()

        populateValidParams(params)
        def registerPrize = new RegisterPrize(params)

        assert registerPrize.save() != null
        assert RegisterPrize.count() == 1

        params.id = registerPrize.id

        controller.delete()

        assert RegisterPrize.count() == 0
        assert RegisterPrize.get(registerPrize.id) == null
        assert response.redirectedUrl == '/registerPrize/list'
    }
}
