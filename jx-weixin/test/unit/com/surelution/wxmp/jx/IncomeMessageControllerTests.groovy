package com.surelution.wxmp.jx



import org.junit.*
import grails.test.mixin.*

@TestFor(IncomeMessageController)
@Mock(IncomeMessage)
class IncomeMessageControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/incomeMessage/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.incomeMessageInstanceList.size() == 0
        assert model.incomeMessageInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.incomeMessageInstance != null
    }

    void testSave() {
        controller.save()

        assert model.incomeMessageInstance != null
        assert view == '/incomeMessage/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/incomeMessage/show/1'
        assert controller.flash.message != null
        assert IncomeMessage.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/incomeMessage/list'

        populateValidParams(params)
        def incomeMessage = new IncomeMessage(params)

        assert incomeMessage.save() != null

        params.id = incomeMessage.id

        def model = controller.show()

        assert model.incomeMessageInstance == incomeMessage
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/incomeMessage/list'

        populateValidParams(params)
        def incomeMessage = new IncomeMessage(params)

        assert incomeMessage.save() != null

        params.id = incomeMessage.id

        def model = controller.edit()

        assert model.incomeMessageInstance == incomeMessage
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/incomeMessage/list'

        response.reset()

        populateValidParams(params)
        def incomeMessage = new IncomeMessage(params)

        assert incomeMessage.save() != null

        // test invalid parameters in update
        params.id = incomeMessage.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/incomeMessage/edit"
        assert model.incomeMessageInstance != null

        incomeMessage.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/incomeMessage/show/$incomeMessage.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        incomeMessage.clearErrors()

        populateValidParams(params)
        params.id = incomeMessage.id
        params.version = -1
        controller.update()

        assert view == "/incomeMessage/edit"
        assert model.incomeMessageInstance != null
        assert model.incomeMessageInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/incomeMessage/list'

        response.reset()

        populateValidParams(params)
        def incomeMessage = new IncomeMessage(params)

        assert incomeMessage.save() != null
        assert IncomeMessage.count() == 1

        params.id = incomeMessage.id

        controller.delete()

        assert IncomeMessage.count() == 0
        assert IncomeMessage.get(incomeMessage.id) == null
        assert response.redirectedUrl == '/incomeMessage/list'
    }
}
