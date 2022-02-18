

const Page = require('./page');

/**
 * sub page containing specific selectors and methods for a specific page
 */
class Common extends Page {
    async sliceScreenshot() {
        var imageToSlices = require('image-to-slices');
        imageToSlices.configure({
            clipperOptions: {
                canvas: require('canvas')
            }
        });

        var imageToSlices = require('image-to-slices');

        var lineXArray = [45, 110];
        var lineYArray = [60, 630];
        var source = 'e2e/screenshots/calc_result.png';

        await imageToSlices(source, lineXArray, lineYArray, {
            saveToDir: 'e2e/screenshots/'
        }, function () {
        });
    }
}

module.exports = new Common();
