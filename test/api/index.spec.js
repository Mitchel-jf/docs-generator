import chai from 'chai';
import chaiHttp from 'chai-http';
import app from '../../src/index';
import { btcRate, token } from '../config.spec';

chai.use(chaiHttp);
let expect = chai.expect;

describe('src/api/index', () => {

    let rates = [];

    context('POST /set/rate', () => {
        it('should respond with a 200 status code i.e a RESPONSE.passed object for a POST request', (done) => {
            chai.request(app)
                .post('/api/set/rate')
                .set('authtoken', token)
                .send(btcRate)
                .end((err, res) => {
                    let statusCode = res.status;
                    let data = res.body;
                    expect(statusCode).to.equal(200);
                    expect(data).to.be.an('object');
                    expect(data).to.have.property('code', 200);
                    expect(data).to.have.property('success', true);
                    done();
                });
        });
    });

    context('GET /get/rate', () => {
        it('should respond with a 200 status code i.e a RESPONSE.passed object for a GET request', (done) => {
            chai.request(app)
                .get('/api/get/rate')
                .set('authtoken', token)
                .send()
                .end((err, res) => {
                    let statusCode = res.status;
                    let data = res.body;
                    rates = data.data;
                    expect(statusCode).to.equal(200);
                    expect(data).to.be.an('object');
                    expect(data).to.have.property('code', 200);
                    expect(data).to.have.property('success', true);
                    expect(data.data).to.be.an('array');
                    done();
                });
        });
    });

    context('POST api/edit/rate', () => {
        it('should respond with a 200 status code i.e a RESPONSE.passed object for a POST request', (done) => {
            chai.request(app)
                .post('/api/edit/rate')
                .set('authtoken', token)
                .send({ rateKey: rates.length - 1, ...btcRate })
                .end((err, res) => {
                    let statusCode = res.status;
                    let data = res.body;
                    expect(statusCode).to.equal(200);
                    expect(data).to.be.an('object');
                    expect(data).to.have.property('code', 200);
                    expect(data).to.have.property('success', true);
                    expect(data.data).to.be.an('string');
                    done();
                });
        });
    });

    context('POST api/delete/rate', () => {
        it('should respond with a 200 status code i.e a RESPONSE.passed object for a POST request', (done) => {
            chai.request(app)
                .delete('/api/delete/rate')
                .set('authtoken', token)
                .send(btcRate)
                .end((err, res) => {
                    let statusCode = res.status;
                    let data = res.body;
                    expect(statusCode).to.equal(200);
                    expect(data).to.be.an('object');
                    expect(data).to.have.property('code', 200);
                    expect(data).to.have.property('success', true);
                    expect(data.data).to.be.an('string');
                    done();
                });
        });
    });
});
