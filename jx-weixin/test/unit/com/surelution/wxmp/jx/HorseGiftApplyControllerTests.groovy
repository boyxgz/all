package com.surelution.wxmp.jx



import org.junit.*
import grails.test.mixin.*

@TestFor(HorseGiftApplyController)
@Mock(HorseGiftApply)
class HorseGiftApplyControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/horseGiftApply/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.horseGiftApplyInstanceList.size() == 0
        assert model.horseGiftApplyInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.horseGiftApplyInstance != null
    }

    void testSave() {
        controller.save()

        assert model.horseGiftApplyInstance != null
        assert view == '/horseGiftApply/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/horseGiftApply/show/1'
        assert controller.flash.message != null
        assert HorseGiftApply.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/horseGiftApply/list'

        populateValidParams(params)
        def horseGiftApply = new HorseGiftApply(params)

        assert horseGiftApply.save() != null

        params.id = horseGiftApply.id

        def model = controller.show()

        assert model.horseGiftApplyInstance == horseGiftApply
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/horseGiftApply/list'

        populateValidParams(params)
        def horseGiftApply = new HorseGiftApply(params)

        assert horseGiftApply.save() != null

        params.id = horseGiftApply.id

        def model = controller.edit()

        assert model.horseGiftApplyInstance == horseGiftApply
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/horseGiftApply/list'

        response.reset()

        populateValidParams(params)
        def horseGiftApply = new HorseGiftApply(params)

        assert horseGiftApply.save() != null

        // test invalid parameters in update
        params.id = horseGiftApply.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/horseGiftApply/edit"
        assert model.horseGiftApplyInstance != null

        horseGiftApply.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/horseGiftApply/show/$horseGiftApply.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        horseGiftApply.clearErrors()

        populateValidParams(params)
        params.id = horseGiftApply.id
        params.version = -1
        controller.update()

        assert view == "/horseGiftApply/edit"
        assert model.horseGiftApplyInstance != null
        assert model.horseGiftApplyInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/horseGiftApply/list'

        response.reset()

        populateValidParams(params)
        def horseGiftApply = new HorseGiftApply(params)

        assert horseGiftApply.save() != null
        assert HorseGiftApply.count() == 1

        params.id = horseGiftApply.id

        controller.delete()

        assert HorseGiftApply.count() == 0
        assert HorseGiftApply.get(horseGiftApply.id) == null
        assert response.redirectedUrl == '/horseGiftApply/list'
    }
}
