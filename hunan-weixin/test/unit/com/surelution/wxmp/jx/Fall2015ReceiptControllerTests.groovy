package com.surelution.wxmp.jx



import org.junit.*
import grails.test.mixin.*

@TestFor(Fall2015ReceiptController)
@Mock(Fall2015Receipt)
class Fall2015ReceiptControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/fall2015Receipt/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.fall2015ReceiptInstanceList.size() == 0
        assert model.fall2015ReceiptInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.fall2015ReceiptInstance != null
    }

    void testSave() {
        controller.save()

        assert model.fall2015ReceiptInstance != null
        assert view == '/fall2015Receipt/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/fall2015Receipt/show/1'
        assert controller.flash.message != null
        assert Fall2015Receipt.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/fall2015Receipt/list'

        populateValidParams(params)
        def fall2015Receipt = new Fall2015Receipt(params)

        assert fall2015Receipt.save() != null

        params.id = fall2015Receipt.id

        def model = controller.show()

        assert model.fall2015ReceiptInstance == fall2015Receipt
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/fall2015Receipt/list'

        populateValidParams(params)
        def fall2015Receipt = new Fall2015Receipt(params)

        assert fall2015Receipt.save() != null

        params.id = fall2015Receipt.id

        def model = controller.edit()

        assert model.fall2015ReceiptInstance == fall2015Receipt
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/fall2015Receipt/list'

        response.reset()

        populateValidParams(params)
        def fall2015Receipt = new Fall2015Receipt(params)

        assert fall2015Receipt.save() != null

        // test invalid parameters in update
        params.id = fall2015Receipt.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/fall2015Receipt/edit"
        assert model.fall2015ReceiptInstance != null

        fall2015Receipt.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/fall2015Receipt/show/$fall2015Receipt.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        fall2015Receipt.clearErrors()

        populateValidParams(params)
        params.id = fall2015Receipt.id
        params.version = -1
        controller.update()

        assert view == "/fall2015Receipt/edit"
        assert model.fall2015ReceiptInstance != null
        assert model.fall2015ReceiptInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/fall2015Receipt/list'

        response.reset()

        populateValidParams(params)
        def fall2015Receipt = new Fall2015Receipt(params)

        assert fall2015Receipt.save() != null
        assert Fall2015Receipt.count() == 1

        params.id = fall2015Receipt.id

        controller.delete()

        assert Fall2015Receipt.count() == 0
        assert Fall2015Receipt.get(fall2015Receipt.id) == null
        assert response.redirectedUrl == '/fall2015Receipt/list'
    }
}
