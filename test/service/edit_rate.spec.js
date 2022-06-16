import chai from 'chai';
import editRate from '../../src/service/edit_rate.service';
import getRate from '../../src/service/get_rate.service';
import { btcRate } from '../config.spec';

const expect = chai.expect;

describe('service/edit_rate', function () {
    context('editRate({rateKey, min, max, rate })', function () {
        it('should edit an existing rate from the db', async function () {
            let rates = await getRate();
            let rateKey = rates.length - 1;
            const msg = await editRate({ rateKey, ...btcRate });
            expect(msg).to.be.a('string');
            expect(msg).to.equal('New rate edited successfully');
        });
    });
});