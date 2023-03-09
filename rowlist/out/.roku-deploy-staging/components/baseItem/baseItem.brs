sub init()
    m.poster = m.top.findNode("poster")
    m.poster. width =   320.853      
    m.poster. height =  180.48
end sub

sub onContentChange(event as object)
    itemContent = event.getData()
    m.poster.uri = itemContent.fhdPosterUrl
end sub