sub calculateTranslation(node as object) as object
    r = getUIResolution()
    b = node.boundingRect()

    x = r.width * 0.5
    y = (r.height - b.height) * 0.5

    translation = [x, y]

    return translation
end sub

function getUIResolution()
    di =createObject("roDeviceInfo")
    return di.getUIResolution()
    end function
