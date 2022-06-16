import chai from 'chai';
import getRate from '../../src/service/get_rate.service';

const expect = chai.expect;

describe('service/get_rate', function () {
    context('getRate()', function () {
        it('should get all the existing rates from the db', async function () {
            const rates = await getRate();
            const rateKey = rates.length - 1;
            expect(rates).to.be.an('array');
            expect(rates[rateKey]).to.be.an('object');
            expect(rates[rateKey].min).to.be.a('number');
            expect(rates[rateKey].max).to.be.a('number');
            expect(rates[rateKey].rate).to.be.a('number');
        });
    });
});