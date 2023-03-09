sub init()
    m.constants = {
        urlApikey :"https://gateway.marvel.com:443/v1/public/characters?ts=1&apikey=cf69a7f3384572e8819a8a4130af12ba&hash=3bb892d41a2b73e1e3307781ad2ef9d3"
        url : "https://gateway.marvel.com:443/v1/public/characters?apikey=" 
        imageUrl: "http://i.annihil.us/u/prod/marvel/i/mg/"
        apiKey: "cf69a7f3384572e8819a8a4130af12ba"

        'baseUrl: "https://api.themoviedb.org/3/trending/movie/week?api_key="
        'imageUrl: "https://image.tmdb.org/t/p/w500"
        'apiKey: "558e2410c2be44f6e971c2b2c8cf64d0"
    }

    m.top.functionName = "initHttpTask"
end sub

sub initHttpTask()
    print"Thread Task"
urlTransfer = createObject("roUrlTransfer")
urlTransfer.setCertificatesFile("common:/certs/ca-bundle.crt")
urlTransfer.initClientCertificates()
urlTransfer.setUrl(m.constants.urlApikey)
body=urlTransfer.getToString()

handleResponse(body)

end sub
sub handleResponse(body)
data = parseJson(body)
print data.data.results.count()
rows = 4
cols = 5

results = data.data.results
content = createObject("roSGNode","ContentNode")
    for j = 0 to rows -1
        rowContent = content.createChild("contentNode")
        for i = 0 to cols - 1   
        idx = j * cols + i
        result = results[idx]
        itemContent = rowContent.createChild("contentNode")
        itemContent.id = result.id
        itemContent.TextOverlayUL = result.name
        itemContent.description = result.description
        itemContent.fhdPosterUrl = result.thumbnail.path + "/portrait_xlarge.jpg"
       ' print itemContent
        end for
    end for

    response ={}
    response.content = content
    m.top.response = response
end sub