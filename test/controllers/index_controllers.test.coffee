request = require 'supertest'
app = require '../../server.js'
should = require 'should'


describe 'Test action getHelloWorld', () ->
  it 'test success', (done) ->
    request(app)
      .get('/gethelloworld')
      .end (err, res) ->
        res.status.should.equal 200
        res.text.should.equal 'Hello world'
        done()