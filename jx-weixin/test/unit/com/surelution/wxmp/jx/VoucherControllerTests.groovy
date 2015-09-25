package com.surelution.wxmp.jx



import org.junit.*
import grails.test.mixin.*

@TestFor(VoucherController)
@Mock(Voucher)
class VoucherControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/voucher/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.voucherInstanceList.size() == 0
        assert model.voucherInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.voucherInstance != null
    }

    void testSave() {
        controller.save()

        assert model.voucherInstance != null
        assert view == '/voucher/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/voucher/show/1'
        assert controller.flash.message != null
        assert Voucher.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/voucher/list'

        populateValidParams(params)
        def voucher = new Voucher(params)

        assert voucher.save() != null

        params.id = voucher.id

        def model = controller.show()

        assert model.voucherInstance == voucher
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/voucher/list'

        populateValidParams(params)
        def voucher = new Voucher(params)

        assert voucher.save() != null

        params.id = voucher.id

        def model = controller.edit()

        assert model.voucherInstance == voucher
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/voucher/list'

        response.reset()

        populateValidParams(params)
        def voucher = new Voucher(params)

        assert voucher.save() != null

        // test invalid parameters in update
        params.id = voucher.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/voucher/edit"
        assert model.voucherInstance != null

        voucher.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/voucher/show/$voucher.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        voucher.clearErrors()

        populateValidParams(params)
        params.id = voucher.id
        params.version = -1
        controller.update()

        assert view == "/voucher/edit"
        assert model.voucherInstance != null
        assert model.voucherInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/voucher/list'

        response.reset()

        populateValidParams(params)
        def voucher = new Voucher(params)

        assert voucher.save() != null
        assert Voucher.count() == 1

        params.id = voucher.id

        controller.delete()

        assert Voucher.count() == 0
        assert Voucher.get(voucher.id) == null
        assert response.redirectedUrl == '/voucher/list'
    }
}
