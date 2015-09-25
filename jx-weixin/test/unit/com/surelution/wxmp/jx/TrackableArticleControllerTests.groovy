package com.surelution.wxmp.jx



import org.junit.*
import grails.test.mixin.*

@TestFor(TrackableArticleController)
@Mock(TrackableArticle)
class TrackableArticleControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/trackableArticle/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.trackableArticleInstanceList.size() == 0
        assert model.trackableArticleInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.trackableArticleInstance != null
    }

    void testSave() {
        controller.save()

        assert model.trackableArticleInstance != null
        assert view == '/trackableArticle/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/trackableArticle/show/1'
        assert controller.flash.message != null
        assert TrackableArticle.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/trackableArticle/list'

        populateValidParams(params)
        def trackableArticle = new TrackableArticle(params)

        assert trackableArticle.save() != null

        params.id = trackableArticle.id

        def model = controller.show()

        assert model.trackableArticleInstance == trackableArticle
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/trackableArticle/list'

        populateValidParams(params)
        def trackableArticle = new TrackableArticle(params)

        assert trackableArticle.save() != null

        params.id = trackableArticle.id

        def model = controller.edit()

        assert model.trackableArticleInstance == trackableArticle
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/trackableArticle/list'

        response.reset()

        populateValidParams(params)
        def trackableArticle = new TrackableArticle(params)

        assert trackableArticle.save() != null

        // test invalid parameters in update
        params.id = trackableArticle.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/trackableArticle/edit"
        assert model.trackableArticleInstance != null

        trackableArticle.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/trackableArticle/show/$trackableArticle.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        trackableArticle.clearErrors()

        populateValidParams(params)
        params.id = trackableArticle.id
        params.version = -1
        controller.update()

        assert view == "/trackableArticle/edit"
        assert model.trackableArticleInstance != null
        assert model.trackableArticleInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/trackableArticle/list'

        response.reset()

        populateValidParams(params)
        def trackableArticle = new TrackableArticle(params)

        assert trackableArticle.save() != null
        assert TrackableArticle.count() == 1

        params.id = trackableArticle.id

        controller.delete()

        assert TrackableArticle.count() == 0
        assert TrackableArticle.get(trackableArticle.id) == null
        assert response.redirectedUrl == '/trackableArticle/list'
    }
}
