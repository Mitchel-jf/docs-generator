import RESPONSE from '../../src/helpers/@response.helper';
import chai from 'chai';
let expect = chai.expect;

describe('src/@response', () => {

    describe('RESPONSE.setResponse(key, value)', () => {
        it("should add 'key' and 'value' as an object pair to RESPONSE.response", () => {
            RESPONSE.setResponse('key', 'value');
            expect(RESPONSE.response).to.have.property('key', 'value');
        });
    });

    describe('RESPONSE.passed(data)', () => {
        it("should return an object with these properties: code, data, and success", () => {
            let result = RESPONSE.passed({ 'foo': 'bar' });
            expect(result).to.have.property('code', 200);
            expect(result).to.have.property('success', true);
            expect(result).to.have.deep.property('data', { 'foo': 'bar' });
            expect(result).to.not.have.property('key', 'value');
        });
    });

    describe('RESPONSE.failed(errors)', () => {
        it("should return an object with these properties: code,data, and success", () => {
            let result = RESPONSE.failed({ 'foo': 'bar' });
            expect(result).to.have.property('code', 400);
            expect(result).to.have.deep.property('data', { message: 'Unable to perform operation', errors: { 'foo': 'bar' } });
            expect(result).to.have.property('success', false);
        });
    });

    describe('RESPONSE.notFound(errors)', () => {
        it("should return an object with these properties: code,data, and success", () => {
            let result = RESPONSE.notFound({ 'foo': 'bar' });
            expect(result).to.have.property('code', 404);
            expect(result).to.have.deep.property('data', { message: 'URL not found', errors: { 'foo': 'bar' } });
            expect(result).to.have.property('success', false);
        });
    });

    describe('RESPONSE.failedServer(errors)', () => {
        it("should return an object with these properties: code,data, and success", () => {
            let result = RESPONSE.failedServer({ 'foo': 'bar' });
            expect(result).to.have.property('code', 500);
            expect(result).to.have.deep.property('data', { message: 'Error from server', errors: 'check your log' });
            expect(result).to.have.property('success', false);
        });
    });
});