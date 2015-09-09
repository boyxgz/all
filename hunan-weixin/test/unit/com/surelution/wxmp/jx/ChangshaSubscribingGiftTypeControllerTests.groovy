package com.surelution.wxmp.jx



import org.junit.*
import grails.test.mixin.*

@TestFor(ChangshaSubscribingGiftTypeController)
@Mock(ChangshaSubscribingGiftType)
class ChangshaSubscribingGiftTypeControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/changshaSubscribingGiftType/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.changshaSubscribingGiftTypeInstanceList.size() == 0
        assert model.changshaSubscribingGiftTypeInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.changshaSubscribingGiftTypeInstance != null
    }

    void testSave() {
        controller.save()

        assert model.changshaSubscribingGiftTypeInstance != null
        assert view == '/changshaSubscribingGiftType/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/changshaSubscribingGiftType/show/1'
        assert controller.flash.message != null
        assert ChangshaSubscribingGiftType.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/changshaSubscribingGiftType/list'

        populateValidParams(params)
        def changshaSubscribingGiftType = new ChangshaSubscribingGiftType(params)

        assert changshaSubscribingGiftType.save() != null

        params.id = changshaSubscribingGiftType.id

        def model = controller.show()

        assert model.changshaSubscribingGiftTypeInstance == changshaSubscribingGiftType
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/changshaSubscribingGiftType/list'

        populateValidParams(params)
        def changshaSubscribingGiftType = new ChangshaSubscribingGiftType(params)

        assert changshaSubscribingGiftType.save() != null

        params.id = changshaSubscribingGiftType.id

        def model = controller.edit()

        assert model.changshaSubscribingGiftTypeInstance == changshaSubscribingGiftType
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/changshaSubscribingGiftType/list'

        response.reset()

        populateValidParams(params)
        def changshaSubscribingGiftType = new ChangshaSubscribingGiftType(params)

        assert changshaSubscribingGiftType.save() != null

        // test invalid parameters in update
        params.id = changshaSubscribingGiftType.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/changshaSubscribingGiftType/edit"
        assert model.changshaSubscribingGiftTypeInstance != null

        changshaSubscribingGiftType.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/changshaSubscribingGiftType/show/$changshaSubscribingGiftType.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        changshaSubscribingGiftType.clearErrors()

        populateValidParams(params)
        params.id = changshaSubscribingGiftType.id
        params.version = -1
        controller.update()

        assert view == "/changshaSubscribingGiftType/edit"
        assert model.changshaSubscribingGiftTypeInstance != null
        assert model.changshaSubscribingGiftTypeInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/changshaSubscribingGiftType/list'

        response.reset()

        populateValidParams(params)
        def changshaSubscribingGiftType = new ChangshaSubscribingGiftType(params)

        assert changshaSubscribingGiftType.save() != null
        assert ChangshaSubscribingGiftType.count() == 1

        params.id = changshaSubscribingGiftType.id

        controller.delete()

        assert ChangshaSubscribingGiftType.count() == 0
        assert ChangshaSubscribingGiftType.get(changshaSubscribingGiftType.id) == null
        assert response.redirectedUrl == '/changshaSubscribingGiftType/list'
    }
}
