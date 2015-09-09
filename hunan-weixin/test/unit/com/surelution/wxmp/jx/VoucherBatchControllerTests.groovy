package com.surelution.wxmp.jx



import org.junit.*
import grails.test.mixin.*

@TestFor(VoucherBatchController)
@Mock(VoucherBatch)
class VoucherBatchControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/voucherBatch/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.voucherBatchInstanceList.size() == 0
        assert model.voucherBatchInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.voucherBatchInstance != null
    }

    void testSave() {
        controller.save()

        assert model.voucherBatchInstance != null
        assert view == '/voucherBatch/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/voucherBatch/show/1'
        assert controller.flash.message != null
        assert VoucherBatch.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/voucherBatch/list'

        populateValidParams(params)
        def voucherBatch = new VoucherBatch(params)

        assert voucherBatch.save() != null

        params.id = voucherBatch.id

        def model = controller.show()

        assert model.voucherBatchInstance == voucherBatch
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/voucherBatch/list'

        populateValidParams(params)
        def voucherBatch = new VoucherBatch(params)

        assert voucherBatch.save() != null

        params.id = voucherBatch.id

        def model = controller.edit()

        assert model.voucherBatchInstance == voucherBatch
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/voucherBatch/list'

        response.reset()

        populateValidParams(params)
        def voucherBatch = new VoucherBatch(params)

        assert voucherBatch.save() != null

        // test invalid parameters in update
        params.id = voucherBatch.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/voucherBatch/edit"
        assert model.voucherBatchInstance != null

        voucherBatch.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/voucherBatch/show/$voucherBatch.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        voucherBatch.clearErrors()

        populateValidParams(params)
        params.id = voucherBatch.id
        params.version = -1
        controller.update()

        assert view == "/voucherBatch/edit"
        assert model.voucherBatchInstance != null
        assert model.voucherBatchInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/voucherBatch/list'

        response.reset()

        populateValidParams(params)
        def voucherBatch = new VoucherBatch(params)

        assert voucherBatch.save() != null
        assert VoucherBatch.count() == 1

        params.id = voucherBatch.id

        controller.delete()

        assert VoucherBatch.count() == 0
        assert VoucherBatch.get(voucherBatch.id) == null
        assert response.redirectedUrl == '/voucherBatch/list'
    }
}
