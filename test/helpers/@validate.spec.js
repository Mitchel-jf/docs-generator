import { isJson, isEmptyString } from '../../src/helpers/@isType.helper';
import chai from 'chai';
let expect = chai.expect;

describe('src/@helpers', () => {

    describe('isJson(str)', () => {

        it('it should return false for a wrong json string', () => {
            let result = isJson('-');
            expect(result).to.equal(false);
        });

        it('it should return true for a correct json string', () => {
            let result = isJson("{}");
            expect(result).to.equal(true);
        });
    });

    describe('isEmptyString(str)', () => {

        it('it should return false for a non-empty string', () => {
            let result = isEmptyString('not empty');
            expect(result).to.equal(false);
        });

        it('it should return true for an empty json string', () => {
            let result = isEmptyString("");
            expect(result).to.equal(true);
        });
    });
});