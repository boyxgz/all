package com.surelution.wxmp.jx



import org.junit.*
import grails.test.mixin.*

@TestFor(DrawPrizeVoucherController)
@Mock(DrawPrizeVoucher)
class DrawPrizeVoucherControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/drawPrizeVoucher/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.drawPrizeVoucherInstanceList.size() == 0
        assert model.drawPrizeVoucherInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.drawPrizeVoucherInstance != null
    }

    void testSave() {
        controller.save()

        assert model.drawPrizeVoucherInstance != null
        assert view == '/drawPrizeVoucher/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/drawPrizeVoucher/show/1'
        assert controller.flash.message != null
        assert DrawPrizeVoucher.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/drawPrizeVoucher/list'

        populateValidParams(params)
        def drawPrizeVoucher = new DrawPrizeVoucher(params)

        assert drawPrizeVoucher.save() != null

        params.id = drawPrizeVoucher.id

        def model = controller.show()

        assert model.drawPrizeVoucherInstance == drawPrizeVoucher
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/drawPrizeVoucher/list'

        populateValidParams(params)
        def drawPrizeVoucher = new DrawPrizeVoucher(params)

        assert drawPrizeVoucher.save() != null

        params.id = drawPrizeVoucher.id

        def model = controller.edit()

        assert model.drawPrizeVoucherInstance == drawPrizeVoucher
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/drawPrizeVoucher/list'

        response.reset()

        populateValidParams(params)
        def drawPrizeVoucher = new DrawPrizeVoucher(params)

        assert drawPrizeVoucher.save() != null

        // test invalid parameters in update
        params.id = drawPrizeVoucher.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/drawPrizeVoucher/edit"
        assert model.drawPrizeVoucherInstance != null

        drawPrizeVoucher.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/drawPrizeVoucher/show/$drawPrizeVoucher.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        drawPrizeVoucher.clearErrors()

        populateValidParams(params)
        params.id = drawPrizeVoucher.id
        params.version = -1
        controller.update()

        assert view == "/drawPrizeVoucher/edit"
        assert model.drawPrizeVoucherInstance != null
        assert model.drawPrizeVoucherInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/drawPrizeVoucher/list'

        response.reset()

        populateValidParams(params)
        def drawPrizeVoucher = new DrawPrizeVoucher(params)

        assert drawPrizeVoucher.save() != null
        assert DrawPrizeVoucher.count() == 1

        params.id = drawPrizeVoucher.id

        controller.delete()

        assert DrawPrizeVoucher.count() == 0
        assert DrawPrizeVoucher.get(drawPrizeVoucher.id) == null
        assert response.redirectedUrl == '/drawPrizeVoucher/list'
    }
}
