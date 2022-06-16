import chai from 'chai';
import deleteRate from '../../src/service/delete_rate.service';
import { btcRate } from '../config.spec';

const expect = chai.expect;

describe('service/delete_rate', function () {
    context('deleteRate({ min, max, rate })', function () {
        it('should delete an existing rate from the db', async function () {
            const msg = await deleteRate(btcRate);
            expect(msg).to.be.a('string');
            expect(msg).to.equal('rate deleted successfully');
        });
    });
});