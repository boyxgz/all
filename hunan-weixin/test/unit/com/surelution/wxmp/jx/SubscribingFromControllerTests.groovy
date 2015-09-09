package com.surelution.wxmp.jx



import org.junit.*
import grails.test.mixin.*

@TestFor(SubscribingFromController)
@Mock(SubscribingFrom)
class SubscribingFromControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/subscribingFrom/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.subscribingFromInstanceList.size() == 0
        assert model.subscribingFromInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.subscribingFromInstance != null
    }

    void testSave() {
        controller.save()

        assert model.subscribingFromInstance != null
        assert view == '/subscribingFrom/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/subscribingFrom/show/1'
        assert controller.flash.message != null
        assert SubscribingFrom.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/subscribingFrom/list'

        populateValidParams(params)
        def subscribingFrom = new SubscribingFrom(params)

        assert subscribingFrom.save() != null

        params.id = subscribingFrom.id

        def model = controller.show()

        assert model.subscribingFromInstance == subscribingFrom
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/subscribingFrom/list'

        populateValidParams(params)
        def subscribingFrom = new SubscribingFrom(params)

        assert subscribingFrom.save() != null

        params.id = subscribingFrom.id

        def model = controller.edit()

        assert model.subscribingFromInstance == subscribingFrom
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/subscribingFrom/list'

        response.reset()

        populateValidParams(params)
        def subscribingFrom = new SubscribingFrom(params)

        assert subscribingFrom.save() != null

        // test invalid parameters in update
        params.id = subscribingFrom.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/subscribingFrom/edit"
        assert model.subscribingFromInstance != null

        subscribingFrom.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/subscribingFrom/show/$subscribingFrom.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        subscribingFrom.clearErrors()

        populateValidParams(params)
        params.id = subscribingFrom.id
        params.version = -1
        controller.update()

        assert view == "/subscribingFrom/edit"
        assert model.subscribingFromInstance != null
        assert model.subscribingFromInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/subscribingFrom/list'

        response.reset()

        populateValidParams(params)
        def subscribingFrom = new SubscribingFrom(params)

        assert subscribingFrom.save() != null
        assert SubscribingFrom.count() == 1

        params.id = subscribingFrom.id

        controller.delete()

        assert SubscribingFrom.count() == 0
        assert SubscribingFrom.get(subscribingFrom.id) == null
        assert response.redirectedUrl == '/subscribingFrom/list'
    }
}
