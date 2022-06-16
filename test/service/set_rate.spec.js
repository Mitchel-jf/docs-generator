import chai from 'chai';
import setRate from "../../src/service/set_rate.service";
import { btcRate } from '../config.spec';

const expect = chai.expect;

describe('service/set_rate', function () {
    context('setRate({ min, max, rate })', function () {
        it('should add or create a new rate in the db', async function () {
            const msg = await setRate(btcRate);
            expect(msg).to.be.a('string');
            expect(msg).to.equal('New rate set successfully');
        });
    });
});
