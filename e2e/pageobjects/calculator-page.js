

const Page = require('./page');

/**
 * sub page containing specific selectors and methods for a specific page
 */
class CalculatorPage extends Page {
    /**
     * define selectors using getter methods
     */
    get canvas() {
        return $('canvas#canvas');
    }

    /**
     * overwrite specific options to adapt it to page object
     */
    open() {
        return super.open('https://www.online-calculator.com/html5/online-calculator/index.php?v=10');
    }

    async waitForCanvas() {

        await browser.waitUntil(
            async () => (await this.canvas.isDisplayed === true,
            {
                timeout: 5000,
            }
            ))
    }

    async enterKey(key) {
        await browser.keys(key)
        await browser.pause(100)
    }
}

module.exports = new CalculatorPage();
