package com.surelution.wxmp.jx



import org.junit.*
import grails.test.mixin.*

@TestFor(Fall2015VoucherController)
@Mock(Fall2015Voucher)
class Fall2015VoucherControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/fall2015Voucher/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.fall2015VoucherInstanceList.size() == 0
        assert model.fall2015VoucherInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.fall2015VoucherInstance != null
    }

    void testSave() {
        controller.save()

        assert model.fall2015VoucherInstance != null
        assert view == '/fall2015Voucher/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/fall2015Voucher/show/1'
        assert controller.flash.message != null
        assert Fall2015Voucher.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/fall2015Voucher/list'

        populateValidParams(params)
        def fall2015Voucher = new Fall2015Voucher(params)

        assert fall2015Voucher.save() != null

        params.id = fall2015Voucher.id

        def model = controller.show()

        assert model.fall2015VoucherInstance == fall2015Voucher
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/fall2015Voucher/list'

        populateValidParams(params)
        def fall2015Voucher = new Fall2015Voucher(params)

        assert fall2015Voucher.save() != null

        params.id = fall2015Voucher.id

        def model = controller.edit()

        assert model.fall2015VoucherInstance == fall2015Voucher
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/fall2015Voucher/list'

        response.reset()

        populateValidParams(params)
        def fall2015Voucher = new Fall2015Voucher(params)

        assert fall2015Voucher.save() != null

        // test invalid parameters in update
        params.id = fall2015Voucher.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/fall2015Voucher/edit"
        assert model.fall2015VoucherInstance != null

        fall2015Voucher.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/fall2015Voucher/show/$fall2015Voucher.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        fall2015Voucher.clearErrors()

        populateValidParams(params)
        params.id = fall2015Voucher.id
        params.version = -1
        controller.update()

        assert view == "/fall2015Voucher/edit"
        assert model.fall2015VoucherInstance != null
        assert model.fall2015VoucherInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/fall2015Voucher/list'

        response.reset()

        populateValidParams(params)
        def fall2015Voucher = new Fall2015Voucher(params)

        assert fall2015Voucher.save() != null
        assert Fall2015Voucher.count() == 1

        params.id = fall2015Voucher.id

        controller.delete()

        assert Fall2015Voucher.count() == 0
        assert Fall2015Voucher.get(fall2015Voucher.id) == null
        assert response.redirectedUrl == '/fall2015Voucher/list'
    }
}
