package com.surelution.wxmp.jx



import org.junit.*
import grails.test.mixin.*

@TestFor(PrizeAwardingController)
@Mock(PrizeAwarding)
class PrizeAwardingControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/prizeAwarding/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.prizeAwardingInstanceList.size() == 0
        assert model.prizeAwardingInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.prizeAwardingInstance != null
    }

    void testSave() {
        controller.save()

        assert model.prizeAwardingInstance != null
        assert view == '/prizeAwarding/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/prizeAwarding/show/1'
        assert controller.flash.message != null
        assert PrizeAwarding.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/prizeAwarding/list'

        populateValidParams(params)
        def prizeAwarding = new PrizeAwarding(params)

        assert prizeAwarding.save() != null

        params.id = prizeAwarding.id

        def model = controller.show()

        assert model.prizeAwardingInstance == prizeAwarding
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/prizeAwarding/list'

        populateValidParams(params)
        def prizeAwarding = new PrizeAwarding(params)

        assert prizeAwarding.save() != null

        params.id = prizeAwarding.id

        def model = controller.edit()

        assert model.prizeAwardingInstance == prizeAwarding
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/prizeAwarding/list'

        response.reset()

        populateValidParams(params)
        def prizeAwarding = new PrizeAwarding(params)

        assert prizeAwarding.save() != null

        // test invalid parameters in update
        params.id = prizeAwarding.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/prizeAwarding/edit"
        assert model.prizeAwardingInstance != null

        prizeAwarding.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/prizeAwarding/show/$prizeAwarding.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        prizeAwarding.clearErrors()

        populateValidParams(params)
        params.id = prizeAwarding.id
        params.version = -1
        controller.update()

        assert view == "/prizeAwarding/edit"
        assert model.prizeAwardingInstance != null
        assert model.prizeAwardingInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/prizeAwarding/list'

        response.reset()

        populateValidParams(params)
        def prizeAwarding = new PrizeAwarding(params)

        assert prizeAwarding.save() != null
        assert PrizeAwarding.count() == 1

        params.id = prizeAwarding.id

        controller.delete()

        assert PrizeAwarding.count() == 0
        assert PrizeAwarding.get(prizeAwarding.id) == null
        assert response.redirectedUrl == '/prizeAwarding/list'
    }
}
