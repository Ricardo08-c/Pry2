"use strict";
exports.__esModule = true;
exports.changeitController = void 0;
var changeitdata_1 = require("./changeitdata");
var changeitController = /** @class */ (function () {
    function changeitController() {
    }
    changeitController.prototype.getInstance = function () {
        if (changeitController.instance == null) {
            changeitController.instance = new changeitdata_1.changeitData();
            return changeitController.instance;
        }
        return changeitController.instance;
    };
    return changeitController;
}());
exports.changeitController = changeitController;
