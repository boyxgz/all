package com.surelution.wxmp.jx



import org.junit.*
import grails.test.mixin.*

@TestFor(ThirdpartTakingOnController)
@Mock(ThirdpartTakingOn)
class ThirdpartTakingOnControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/thirdpartTakingOn/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.thirdpartTakingOnInstanceList.size() == 0
        assert model.thirdpartTakingOnInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.thirdpartTakingOnInstance != null
    }

    void testSave() {
        controller.save()

        assert model.thirdpartTakingOnInstance != null
        assert view == '/thirdpartTakingOn/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/thirdpartTakingOn/show/1'
        assert controller.flash.message != null
        assert ThirdpartTakingOn.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/thirdpartTakingOn/list'

        populateValidParams(params)
        def thirdpartTakingOn = new ThirdpartTakingOn(params)

        assert thirdpartTakingOn.save() != null

        params.id = thirdpartTakingOn.id

        def model = controller.show()

        assert model.thirdpartTakingOnInstance == thirdpartTakingOn
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/thirdpartTakingOn/list'

        populateValidParams(params)
        def thirdpartTakingOn = new ThirdpartTakingOn(params)

        assert thirdpartTakingOn.save() != null

        params.id = thirdpartTakingOn.id

        def model = controller.edit()

        assert model.thirdpartTakingOnInstance == thirdpartTakingOn
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/thirdpartTakingOn/list'

        response.reset()

        populateValidParams(params)
        def thirdpartTakingOn = new ThirdpartTakingOn(params)

        assert thirdpartTakingOn.save() != null

        // test invalid parameters in update
        params.id = thirdpartTakingOn.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/thirdpartTakingOn/edit"
        assert model.thirdpartTakingOnInstance != null

        thirdpartTakingOn.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/thirdpartTakingOn/show/$thirdpartTakingOn.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        thirdpartTakingOn.clearErrors()

        populateValidParams(params)
        params.id = thirdpartTakingOn.id
        params.version = -1
        controller.update()

        assert view == "/thirdpartTakingOn/edit"
        assert model.thirdpartTakingOnInstance != null
        assert model.thirdpartTakingOnInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/thirdpartTakingOn/list'

        response.reset()

        populateValidParams(params)
        def thirdpartTakingOn = new ThirdpartTakingOn(params)

        assert thirdpartTakingOn.save() != null
        assert ThirdpartTakingOn.count() == 1

        params.id = thirdpartTakingOn.id

        controller.delete()

        assert ThirdpartTakingOn.count() == 0
        assert ThirdpartTakingOn.get(thirdpartTakingOn.id) == null
        assert response.redirectedUrl == '/thirdpartTakingOn/list'
    }
}
