const { Given, When, Then } = require('@wdio/cucumber-framework');

const CalculatorPage = require('../pageobjects/calculator-page')
const common = require('../pageobjects/common');
const Tesseract = require('tesseract.js');


Given(/^I am on calculator page$/, async () => {
    await CalculatorPage.open()
    await CalculatorPage.waitForCanvas()
})

When(/^I (add|subtract|multiply|divide) (.*) and (.*)$/, async (operation, num1, num2) => {
    switch (operation) {
        case 'add': operation = '+'; break;
        case 'subtract': operation = '-'; break;
        case 'multiply': operation = '*'; break;
        case 'divide': operation = '/'; break;
    }
    await CalculatorPage.enterKey(num1)
    await CalculatorPage.enterKey(operation)
    await CalculatorPage.enterKey(num2)
    await CalculatorPage.enterKey('=')
})

Then(/^I expect result to be (.*)$/, async (expectedResult) => {
    await CalculatorPage.canvas.saveScreenshot('e2e/screenshots/calc_result.png')
    var actualResult;

    await common.sliceScreenshot()

    await Tesseract.recognize(
        'e2e/screenshots/section-5.png',
        'eng',
    ).then(({ data: { text } }) => {
        actualResult = text.trim()
    })

    await expect(String(actualResult)).toEqual(expectedResult)
})

When(/^I key-in (.*) (\d+) times$/, async (num1, nth_times) => {
    for (i = 0; i < nth_times; i++) {
        await CalculatorPage.enterKey(num1)
    }
})

When(/^I enter (.*)$/, async (key) => {
    await CalculatorPage.enterKey(key)
})

