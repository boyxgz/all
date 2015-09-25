package com.surelution.wxmp.jx



import org.junit.*
import grails.test.mixin.*

@TestFor(TokenController)
@Mock(Token)
class TokenControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/token/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.tokenInstanceList.size() == 0
        assert model.tokenInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.tokenInstance != null
    }

    void testSave() {
        controller.save()

        assert model.tokenInstance != null
        assert view == '/token/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/token/show/1'
        assert controller.flash.message != null
        assert Token.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/token/list'

        populateValidParams(params)
        def token = new Token(params)

        assert token.save() != null

        params.id = token.id

        def model = controller.show()

        assert model.tokenInstance == token
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/token/list'

        populateValidParams(params)
        def token = new Token(params)

        assert token.save() != null

        params.id = token.id

        def model = controller.edit()

        assert model.tokenInstance == token
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/token/list'

        response.reset()

        populateValidParams(params)
        def token = new Token(params)

        assert token.save() != null

        // test invalid parameters in update
        params.id = token.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/token/edit"
        assert model.tokenInstance != null

        token.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/token/show/$token.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        token.clearErrors()

        populateValidParams(params)
        params.id = token.id
        params.version = -1
        controller.update()

        assert view == "/token/edit"
        assert model.tokenInstance != null
        assert model.tokenInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/token/list'

        response.reset()

        populateValidParams(params)
        def token = new Token(params)

        assert token.save() != null
        assert Token.count() == 1

        params.id = token.id

        controller.delete()

        assert Token.count() == 0
        assert Token.get(token.id) == null
        assert response.redirectedUrl == '/token/list'
    }
}
