module.exports = class ApiObject
    _validateTextFormat: (format) ->
        unless format in ["html", "text"]
            throw new Error("Format must be one of `html` or `text`")

    toApiObject : ->
        throw new Error("Object must implement toApiObject method")
