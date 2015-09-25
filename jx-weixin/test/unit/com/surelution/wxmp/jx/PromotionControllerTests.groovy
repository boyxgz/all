package com.surelution.wxmp.jx



import org.junit.*
import grails.test.mixin.*

@TestFor(PromotionController)
@Mock(Promotion)
class PromotionControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/promotion/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.promotionInstanceList.size() == 0
        assert model.promotionInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.promotionInstance != null
    }

    void testSave() {
        controller.save()

        assert model.promotionInstance != null
        assert view == '/promotion/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/promotion/show/1'
        assert controller.flash.message != null
        assert Promotion.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/promotion/list'

        populateValidParams(params)
        def promotion = new Promotion(params)

        assert promotion.save() != null

        params.id = promotion.id

        def model = controller.show()

        assert model.promotionInstance == promotion
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/promotion/list'

        populateValidParams(params)
        def promotion = new Promotion(params)

        assert promotion.save() != null

        params.id = promotion.id

        def model = controller.edit()

        assert model.promotionInstance == promotion
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/promotion/list'

        response.reset()

        populateValidParams(params)
        def promotion = new Promotion(params)

        assert promotion.save() != null

        // test invalid parameters in update
        params.id = promotion.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/promotion/edit"
        assert model.promotionInstance != null

        promotion.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/promotion/show/$promotion.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        promotion.clearErrors()

        populateValidParams(params)
        params.id = promotion.id
        params.version = -1
        controller.update()

        assert view == "/promotion/edit"
        assert model.promotionInstance != null
        assert model.promotionInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/promotion/list'

        response.reset()

        populateValidParams(params)
        def promotion = new Promotion(params)

        assert promotion.save() != null
        assert Promotion.count() == 1

        params.id = promotion.id

        controller.delete()

        assert Promotion.count() == 0
        assert Promotion.get(promotion.id) == null
        assert response.redirectedUrl == '/promotion/list'
    }
}
