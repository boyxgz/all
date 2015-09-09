package com.surelution.wxmp.jx



import org.junit.*
import grails.test.mixin.*

@TestFor(VoucherPaymentChannelController)
@Mock(VoucherPaymentChannel)
class VoucherPaymentChannelControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/voucherPaymentChannel/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.voucherPaymentChannelInstanceList.size() == 0
        assert model.voucherPaymentChannelInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.voucherPaymentChannelInstance != null
    }

    void testSave() {
        controller.save()

        assert model.voucherPaymentChannelInstance != null
        assert view == '/voucherPaymentChannel/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/voucherPaymentChannel/show/1'
        assert controller.flash.message != null
        assert VoucherPaymentChannel.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/voucherPaymentChannel/list'

        populateValidParams(params)
        def voucherPaymentChannel = new VoucherPaymentChannel(params)

        assert voucherPaymentChannel.save() != null

        params.id = voucherPaymentChannel.id

        def model = controller.show()

        assert model.voucherPaymentChannelInstance == voucherPaymentChannel
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/voucherPaymentChannel/list'

        populateValidParams(params)
        def voucherPaymentChannel = new VoucherPaymentChannel(params)

        assert voucherPaymentChannel.save() != null

        params.id = voucherPaymentChannel.id

        def model = controller.edit()

        assert model.voucherPaymentChannelInstance == voucherPaymentChannel
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/voucherPaymentChannel/list'

        response.reset()

        populateValidParams(params)
        def voucherPaymentChannel = new VoucherPaymentChannel(params)

        assert voucherPaymentChannel.save() != null

        // test invalid parameters in update
        params.id = voucherPaymentChannel.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/voucherPaymentChannel/edit"
        assert model.voucherPaymentChannelInstance != null

        voucherPaymentChannel.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/voucherPaymentChannel/show/$voucherPaymentChannel.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        voucherPaymentChannel.clearErrors()

        populateValidParams(params)
        params.id = voucherPaymentChannel.id
        params.version = -1
        controller.update()

        assert view == "/voucherPaymentChannel/edit"
        assert model.voucherPaymentChannelInstance != null
        assert model.voucherPaymentChannelInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/voucherPaymentChannel/list'

        response.reset()

        populateValidParams(params)
        def voucherPaymentChannel = new VoucherPaymentChannel(params)

        assert voucherPaymentChannel.save() != null
        assert VoucherPaymentChannel.count() == 1

        params.id = voucherPaymentChannel.id

        controller.delete()

        assert VoucherPaymentChannel.count() == 0
        assert VoucherPaymentChannel.get(voucherPaymentChannel.id) == null
        assert response.redirectedUrl == '/voucherPaymentChannel/list'
    }
}
