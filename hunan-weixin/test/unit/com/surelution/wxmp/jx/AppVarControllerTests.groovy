package com.surelution.wxmp.jx



import org.junit.*
import grails.test.mixin.*

@TestFor(AppVarController)
@Mock(AppVar)
class AppVarControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/appVar/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.appVarInstanceList.size() == 0
        assert model.appVarInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.appVarInstance != null
    }

    void testSave() {
        controller.save()

        assert model.appVarInstance != null
        assert view == '/appVar/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/appVar/show/1'
        assert controller.flash.message != null
        assert AppVar.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/appVar/list'

        populateValidParams(params)
        def appVar = new AppVar(params)

        assert appVar.save() != null

        params.id = appVar.id

        def model = controller.show()

        assert model.appVarInstance == appVar
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/appVar/list'

        populateValidParams(params)
        def appVar = new AppVar(params)

        assert appVar.save() != null

        params.id = appVar.id

        def model = controller.edit()

        assert model.appVarInstance == appVar
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/appVar/list'

        response.reset()

        populateValidParams(params)
        def appVar = new AppVar(params)

        assert appVar.save() != null

        // test invalid parameters in update
        params.id = appVar.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/appVar/edit"
        assert model.appVarInstance != null

        appVar.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/appVar/show/$appVar.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        appVar.clearErrors()

        populateValidParams(params)
        params.id = appVar.id
        params.version = -1
        controller.update()

        assert view == "/appVar/edit"
        assert model.appVarInstance != null
        assert model.appVarInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/appVar/list'

        response.reset()

        populateValidParams(params)
        def appVar = new AppVar(params)

        assert appVar.save() != null
        assert AppVar.count() == 1

        params.id = appVar.id

        controller.delete()

        assert AppVar.count() == 0
        assert AppVar.get(appVar.id) == null
        assert response.redirectedUrl == '/appVar/list'
    }
}
