sub init()
    m.top.opacity = 0.5
    m.rectangle = m.top.findNode("rectangle")
    m.top.observeFieldScoped("focusedChild","onFocusChange")
end sub

sub onFocusChange(event as object)
    print "customItem: ", event.getNode(), m.top.hasFocus()
    if m.top.hasFocus()
        m.top.opacity = 1.0
        m.rectangle.color = "#5DEC74"
    else
        m.top.opacity = 0.5
        m.rectangle.color = "#FFFFFF"
    end if
end sub
