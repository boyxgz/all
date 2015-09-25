package com.surelution.wxmp.jx



import org.junit.*
import grails.test.mixin.*

@TestFor(WheelPrizeController)
@Mock(WheelPrize)
class WheelPrizeControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/wheelPrize/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.wheelPrizeInstanceList.size() == 0
        assert model.wheelPrizeInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.wheelPrizeInstance != null
    }

    void testSave() {
        controller.save()

        assert model.wheelPrizeInstance != null
        assert view == '/wheelPrize/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/wheelPrize/show/1'
        assert controller.flash.message != null
        assert WheelPrize.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/wheelPrize/list'

        populateValidParams(params)
        def wheelPrize = new WheelPrize(params)

        assert wheelPrize.save() != null

        params.id = wheelPrize.id

        def model = controller.show()

        assert model.wheelPrizeInstance == wheelPrize
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/wheelPrize/list'

        populateValidParams(params)
        def wheelPrize = new WheelPrize(params)

        assert wheelPrize.save() != null

        params.id = wheelPrize.id

        def model = controller.edit()

        assert model.wheelPrizeInstance == wheelPrize
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/wheelPrize/list'

        response.reset()

        populateValidParams(params)
        def wheelPrize = new WheelPrize(params)

        assert wheelPrize.save() != null

        // test invalid parameters in update
        params.id = wheelPrize.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/wheelPrize/edit"
        assert model.wheelPrizeInstance != null

        wheelPrize.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/wheelPrize/show/$wheelPrize.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        wheelPrize.clearErrors()

        populateValidParams(params)
        params.id = wheelPrize.id
        params.version = -1
        controller.update()

        assert view == "/wheelPrize/edit"
        assert model.wheelPrizeInstance != null
        assert model.wheelPrizeInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/wheelPrize/list'

        response.reset()

        populateValidParams(params)
        def wheelPrize = new WheelPrize(params)

        assert wheelPrize.save() != null
        assert WheelPrize.count() == 1

        params.id = wheelPrize.id

        controller.delete()

        assert WheelPrize.count() == 0
        assert WheelPrize.get(wheelPrize.id) == null
        assert response.redirectedUrl == '/wheelPrize/list'
    }
}
