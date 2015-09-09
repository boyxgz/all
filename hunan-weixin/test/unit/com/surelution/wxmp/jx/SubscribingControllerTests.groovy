package com.surelution.wxmp.jx



import org.junit.*
import grails.test.mixin.*

@TestFor(SubscribingController)
@Mock(Subscribing)
class SubscribingControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/subscribing/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.subscribingInstanceList.size() == 0
        assert model.subscribingInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.subscribingInstance != null
    }

    void testSave() {
        controller.save()

        assert model.subscribingInstance != null
        assert view == '/subscribing/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/subscribing/show/1'
        assert controller.flash.message != null
        assert Subscribing.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/subscribing/list'

        populateValidParams(params)
        def subscribing = new Subscribing(params)

        assert subscribing.save() != null

        params.id = subscribing.id

        def model = controller.show()

        assert model.subscribingInstance == subscribing
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/subscribing/list'

        populateValidParams(params)
        def subscribing = new Subscribing(params)

        assert subscribing.save() != null

        params.id = subscribing.id

        def model = controller.edit()

        assert model.subscribingInstance == subscribing
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/subscribing/list'

        response.reset()

        populateValidParams(params)
        def subscribing = new Subscribing(params)

        assert subscribing.save() != null

        // test invalid parameters in update
        params.id = subscribing.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/subscribing/edit"
        assert model.subscribingInstance != null

        subscribing.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/subscribing/show/$subscribing.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        subscribing.clearErrors()

        populateValidParams(params)
        params.id = subscribing.id
        params.version = -1
        controller.update()

        assert view == "/subscribing/edit"
        assert model.subscribingInstance != null
        assert model.subscribingInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/subscribing/list'

        response.reset()

        populateValidParams(params)
        def subscribing = new Subscribing(params)

        assert subscribing.save() != null
        assert Subscribing.count() == 1

        params.id = subscribing.id

        controller.delete()

        assert Subscribing.count() == 0
        assert Subscribing.get(subscribing.id) == null
        assert response.redirectedUrl == '/subscribing/list'
    }
}
