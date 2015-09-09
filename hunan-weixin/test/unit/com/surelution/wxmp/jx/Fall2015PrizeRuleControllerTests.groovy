package com.surelution.wxmp.jx



import org.junit.*
import grails.test.mixin.*

@TestFor(Fall2015PrizeRuleController)
@Mock(Fall2015PrizeRule)
class Fall2015PrizeRuleControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/fall2015PrizeRule/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.fall2015PrizeRuleInstanceList.size() == 0
        assert model.fall2015PrizeRuleInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.fall2015PrizeRuleInstance != null
    }

    void testSave() {
        controller.save()

        assert model.fall2015PrizeRuleInstance != null
        assert view == '/fall2015PrizeRule/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/fall2015PrizeRule/show/1'
        assert controller.flash.message != null
        assert Fall2015PrizeRule.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/fall2015PrizeRule/list'

        populateValidParams(params)
        def fall2015PrizeRule = new Fall2015PrizeRule(params)

        assert fall2015PrizeRule.save() != null

        params.id = fall2015PrizeRule.id

        def model = controller.show()

        assert model.fall2015PrizeRuleInstance == fall2015PrizeRule
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/fall2015PrizeRule/list'

        populateValidParams(params)
        def fall2015PrizeRule = new Fall2015PrizeRule(params)

        assert fall2015PrizeRule.save() != null

        params.id = fall2015PrizeRule.id

        def model = controller.edit()

        assert model.fall2015PrizeRuleInstance == fall2015PrizeRule
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/fall2015PrizeRule/list'

        response.reset()

        populateValidParams(params)
        def fall2015PrizeRule = new Fall2015PrizeRule(params)

        assert fall2015PrizeRule.save() != null

        // test invalid parameters in update
        params.id = fall2015PrizeRule.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/fall2015PrizeRule/edit"
        assert model.fall2015PrizeRuleInstance != null

        fall2015PrizeRule.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/fall2015PrizeRule/show/$fall2015PrizeRule.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        fall2015PrizeRule.clearErrors()

        populateValidParams(params)
        params.id = fall2015PrizeRule.id
        params.version = -1
        controller.update()

        assert view == "/fall2015PrizeRule/edit"
        assert model.fall2015PrizeRuleInstance != null
        assert model.fall2015PrizeRuleInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/fall2015PrizeRule/list'

        response.reset()

        populateValidParams(params)
        def fall2015PrizeRule = new Fall2015PrizeRule(params)

        assert fall2015PrizeRule.save() != null
        assert Fall2015PrizeRule.count() == 1

        params.id = fall2015PrizeRule.id

        controller.delete()

        assert Fall2015PrizeRule.count() == 0
        assert Fall2015PrizeRule.get(fall2015PrizeRule.id) == null
        assert response.redirectedUrl == '/fall2015PrizeRule/list'
    }
}
